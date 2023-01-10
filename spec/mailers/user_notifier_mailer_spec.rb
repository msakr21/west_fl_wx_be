require 'rails_helper'

RSpec.describe UserNotifierMailer, type: :mailer do
  describe 'UserNotifierMailer', :vcr do
    let!(:user1) { create(:user) }
    let!(:alerts) { NwsFacade.escambia_alerts }
    let!(:tweets) { [TwitterFacade.fl511_alerts, TwitterFacade.bereadyescambia_alerts] }
    let!(:mail) { UserNotifierMailer.send_alerts(user1, alerts, tweets) }

    describe 'can send alerts with all relevant information included' do
      it 'renders the headers' do
        expect(mail.subject).to eq("#{user1.name}, here are your emergency alerts")
        expect(mail.to).to eq([user1.email])
        expect(mail.from).to eq([ENV['west_fl_wx_email']])
        expect(mail.reply_to).to eq(nil)
      end

      it 'renders the body' do
        expect(mail.body.to_s).to include('@BeReadyEscambia Alerts')
        expect(mail.body.to_s).to include('@FL511 Alerts')
        expect(mail.body.encoded).to include('@BeReadyEscambia Alerts')
        expect(mail.body.encoded).to include('@FL511 Alerts')
      end
    end
  end
end
