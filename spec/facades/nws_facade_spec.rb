require 'rails_helper'

RSpec.describe NwsFacade do
  it 'exists' do
    nws_facade = NwsFacade.new

    expect(nws_facade).to be_an_instance_of(NwsFacade)
  end

  describe 'Class Methods' do
    describe '#escambia_alerts' do
      describe 'When records exist' do
        it 'returns escambia alerts objects' do
          json_response = File.read('spec/fixtures/DO_NOT_DELETE/services/alerts_with_moderate_filter.json')
          stub_request(:get, 'https://api.weather.gov/alerts?zone=FLZ202&status=actual&severity=Severe,Extreme').to_return(
            status: 200, body: json_response
          )

          expect(NwsFacade.escambia_alerts).to be_an Array
          expect(NwsFacade.escambia_alerts.first.id).to eq('urn:oid:2.49.0.1.840.0.d46ad32f286d8a4eb947e76562ba5146d5315a03.001.2')
          expect(NwsFacade.escambia_alerts.first.areas_affected).to eq('Mobile Coastal; Baldwin Coastal; Escambia Coastal; Santa Rosa Coastal; Okaloosa Coastal')
          expect(NwsFacade.escambia_alerts.first.effective_at).to eq('Wednesday at 1:10pm, January 4, 2023')
          expect(NwsFacade.escambia_alerts.first.ends_at).to eq('Thursday at12:00pm, January 5, 2023')
          expect(NwsFacade.escambia_alerts.first.status).to eq('Actual')
          expect(NwsFacade.escambia_alerts.first.severity).to eq('Moderate')
          expect(NwsFacade.escambia_alerts.first.event).to eq('Rip Current Statement')
          expect(NwsFacade.escambia_alerts.first.description).to eq("* WHAT...For the High Rip Current Risk, dangerous rip currents.\n\n* WHERE...In Alabama, Mobile Coastal and Baldwin Coastal\nCounties. In Florida, Escambia Coastal, Santa Rosa Coastal and\nOkaloosa Coastal Counties.\n\n* WHEN...Through Thursday morning.\n\n* IMPACTS...Dangerous swimming and surfing conditions and\nlocalized beach erosion. Rip currents can sweep even the best\nswimmers away from shore into deeper water.\n\n* ADDITIONAL DETAILS...Surf heights have dropped to below advisory\ncriteria based on observations and beach reports, thus the High\nSurf Advisory has been cancelled. The HIGH rip current risk\nremains in effect through tomorrow morning.")
          expect(NwsFacade.escambia_alerts.first.instructions).to eq("Swim near a lifeguard. If caught in a rip current, relax and\nfloat. Don't swim against the current. If able, swim in a\ndirection following the shoreline. If unable to escape, face the\nshore and call or wave for help.")
          expect(NwsFacade.escambia_alerts.first.response).to eq('Avoid')
        end
      end

      describe 'When there are no alerts' do
        it 'returns a blank array' do
          json_response = File.read('spec/fixtures/DO_NOT_DELETE/services/no_current_alerts.json')
          stub_request(:get, 'https://api.weather.gov/alerts?zone=FLZ202&status=actual&severity=Severe,Extreme').to_return(
            status: 200, body: json_response
          )

          expect(NwsFacade.escambia_alerts).to be_an Array
          expect(NwsFacade.escambia_alerts).to eq([])
        end
      end
    end
  end
end
