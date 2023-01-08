require 'rails_helper'

RSpec.describe TwitterFacade do
  it 'exists' do
    twitter_facade = TwitterFacade.new

    expect(twitter_facade).to be_an_instance_of(TwitterFacade)
  end

  describe 'Class Methods' do
    describe '@fl511_alerts' do
      it 'returns escambia related tweets', :vcr do
        expect(TwitterFacade.fl511_alerts).to be_an Array
        expect(TwitterFacade.fl511_alerts.count).to eq 3
        expect(TwitterFacade.fl511_alerts.first.created_at).to be_a String
        expect(TwitterFacade.fl511_alerts.first.id).to be_a String
        expect(TwitterFacade.fl511_alerts.first.text).to be_a String
        expect(TwitterFacade.fl511_alerts.first.text).to include('Escambia')
      end
    end

    describe '@bereadyescambia_alerts' do
      it 'returns most recent tweets', :vcr do
        expect(TwitterFacade.bereadyescambia_alerts).to be_an Array
        expect(TwitterFacade.bereadyescambia_alerts.count).to eq 3
        expect(TwitterFacade.bereadyescambia_alerts.first.created_at).to be_a String
        expect(TwitterFacade.bereadyescambia_alerts.first.id).to be_a String
        expect(TwitterFacade.bereadyescambia_alerts.first.text).to be_a String
      end
    end
  end
end
