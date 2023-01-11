require 'rails_helper'

RSpec.describe 'Create Alert Mailer API' do
  context 'When there are alerts' do
    describe 'can POST a new alert mailer' do
      before :each do
        json_response = File.read('spec/fixtures/DO_NOT_DELETE/services/alerts_with_moderate_filter.json')
        stub_request(:get, 'https://api.weather.gov/alerts?zone=FLZ202&status=actual&severity=Severe,Extreme').to_return(
          status: 200, body: json_response
        )
        @user = create(:user)
        post api_v1_alert_mailer_path({ name: @user.name, email: @user.email })
      end

      let!(:alerts) { JSON.parse(response.body, symbolize_names: true) }

      it 'returns http status code 200' do
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end

      it 'returns alerts' do
        expect(alerts).to be_a Hash
        expect(alerts).to have_key(:data)
        expect(alerts[:data]).to eq('Current Alerts in Your Area')
      end

      context 'with valid parameters' do
        it 'creates a new User' do
          expect(User.last.name).to eq(@user.name)
          expect(User.last.email).to eq(@user.email)
        end
      end
    end
  end

  context 'When there are NO alert records' do
    before :each do
      json_response = File.read('spec/fixtures/DO_NOT_DELETE/services/no_current_alerts.json')
      stub_request(:get, 'https://api.weather.gov/alerts?zone=FLZ202&status=actual&severity=Severe,Extreme').to_return(
        status: 200, body: json_response
      )
      @user = create(:user)
      post api_v1_alert_mailer_path({ name: @user.name, email: @user.email })
    end

    let!(:alerts) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns http status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns no current alerts' do
      expect(alerts).to have_key(:data)
      expect(alerts[:data]).to eq('No Current Alerts')
    end
  end
end
