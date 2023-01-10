require 'rails_helper'

RSpec.describe Api::V1::AlertMailerController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/api/v1/alert_mailer?email=email&name=name').to route_to('api/v1/alert_mailer#create', email: 'email', name: 'name')
    end
  end
end
