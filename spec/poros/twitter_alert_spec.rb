require 'rails_helper'

RSpec.describe TwitterAlert do
  let!(:fl511_data) do
    {
      id: '1611272894998548483',
      created_at: '2023-01-06T08:06:08.000Z',
      text: 'Cleared: Planned construction in Escambia County on I-10 East, at MM 9. Left lane blocked. Last updated at 02:03 AM.'
    }
  end

  let!(:bereadyescambia_data) do
    {
      id: '1611102651160084481',
      created_at: '2023-01-05T20:49:39.000Z',
      text: '📲 Are you signed up for emergency alerts for Escambia County? Are you signed up to receive updates during emergencies? \n\n📢 Get signed up today and be ready! \n\n👉 Visit https://t.co/cHRpcAMcJ7 to sign up for any Escambia County emergency notifications.\n\n#bereadyescambia https://t.co/F5TYI3X4Bp'
    }
  end

  let!(:fl511_twitter_alert) { TwitterAlert.new(fl511_data) }
  let!(:bereadyescambia_twitter_alert) { TwitterAlert.new(bereadyescambia_data) }

  describe 'fl511 Twitter Alert' do
    it 'exists' do
      expect(fl511_twitter_alert).to be_an_instance_of(TwitterAlert)
    end

    it 'has readable attributes' do
      expect(fl511_twitter_alert.id).to eq('1611272894998548483')
      expect(fl511_twitter_alert.created_at).to eq('Friday at 8:06am, January 6, 2023')
      expect(fl511_twitter_alert.text).to eq('Cleared: Planned construction in Escambia County on I-10 East, at MM 9. Left lane blocked. Last updated at 02:03 AM.')
    end
  end

  describe 'bereadyescambia Twitter Alert' do
    it 'exists' do
      expect(bereadyescambia_twitter_alert).to be_an_instance_of(TwitterAlert)
    end

    it 'has readable attributes' do
      expect(bereadyescambia_twitter_alert.id).to eq('1611102651160084481')
      expect(bereadyescambia_twitter_alert.created_at).to eq('Thursday at 8:49pm, January 5, 2023')
      expect(bereadyescambia_twitter_alert.text).to eq('📲 Are you signed up for emergency alerts for Escambia County? Are you signed up to receive updates during emergencies? \n\n📢 Get signed up today and be ready! \n\n👉 Visit https://t.co/cHRpcAMcJ7 to sign up for any Escambia County emergency notifications.\n\n#bereadyescambia https://t.co/F5TYI3X4Bp')
    end
  end
end
