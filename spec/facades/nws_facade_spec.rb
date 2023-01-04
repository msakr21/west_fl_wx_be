require 'rails_helper'

RSpec.describe NwsFacade do
  it 'exists' do
    nws_facade = NwsFacade.new

    expect(nws_facade).to be_an_instance_of(NwsFacade)
  end

  describe "Class Methods" do
    describe "#escandia_alerts" do
      it "returns escandia alerts objects", :vcr do

        expect(NwsFacade.escandia_alerts).to be_a Array
        expect(NwsFacade.escandia_alerts.first).to be_a NwsAlert
      end
    end
  end
end

