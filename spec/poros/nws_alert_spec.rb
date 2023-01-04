require 'rails_helper'

RSpec.describe NwsAlert do
  before :each do

    @data = {
      id: "https://api.weather.gov/alerts/urn:oid:2.49.0.1.840.0.86615ea6c56c2dc6d1ecfcb695f26d8802eda75d.001.1",
      areaDesc: "Mobile Coastal; Baldwin Coastal; Escambia Coastal; Santa Rosa Coastal; Okaloosa Coastal",
      effective: "2023-01-03T13:09:00-06:00",
      ends: "2023-01-04T18:00:00-06:00",
      status: "Actual",
      severity: "Minor",
      event: "High Surf Advisory",
      description: "* WHAT...For the High Surf Advisory, large breaking waves of 4\nto 6 feet in the surf zone. For the High Rip Current Risk,\ndangerous rip currents.\n\n* WHERE...In Alabama, Mobile Coastal and Baldwin Coastal\nCounties. In Florida, Escambia Coastal, Santa Rosa Coastal and\nOkaloosa Coastal Counties.\n\n* WHEN...For the High Surf Advisory, until 6 PM CST Wednesday.\nFor the High Rip Current Risk, through late Wednesday night.\n\n* IMPACTS...Dangerous swimming and surfing conditions and\nlocalized beach erosion. Rip currents can sweep even the best\nswimmers away from shore into deeper water.",
      instructions: "Inexperienced swimmers should remain out of the water due to\ndangerous surf conditions.\n\nSwim near a lifeguard. If caught in a rip current, relax and\nfloat. Don't swim against the current. If able, swim in a\ndirection following the shoreline. If unable to escape, face the\nshore and call or wave for help.",
      response: "Avoid"
    }
    @nws_alert = NwsAlert.new(@data)
  end

  it "exists" do

    expect(@nws_alert).to be_an_instance_of(NwsAlert)
  end

  it "has readable attributes" do

    expect(@nws_alert.id).to eq("https://api.weather.gov/alerts/urn:oid:2.49.0.1.840.0.86615ea6c56c2dc6d1ecfcb695f26d8802eda75d.001.1")
    expect(@nws_alert.areas_affected).to eq("Mobile Coastal; Baldwin Coastal; Escambia Coastal; Santa Rosa Coastal; Okaloosa Coastal")
    expect(@nws_alert.effective_at).to eq("Tuesday at 1:09pm, January 3, 2023")
    expect(@nws_alert.ends_at).to eq("Wednesday at 6:00pm, January 4, 2023")
    expect(@nws_alert.status).to eq("Actual")
    expect(@nws_alert.severity).to eq("Minor")
    expect(@nws_alert.event).to eq("High Surf Advisory")
    expect(@nws_alert.description).to eq("* WHAT...For the High Surf Advisory, large breaking waves of 4\nto 6 feet in the surf zone. For the High Rip Current Risk,\ndangerous rip currents.\n\n* WHERE...In Alabama, Mobile Coastal and Baldwin Coastal\nCounties. In Florida, Escambia Coastal, Santa Rosa Coastal and\nOkaloosa Coastal Counties.\n\n* WHEN...For the High Surf Advisory, until 6 PM CST Wednesday.\nFor the High Rip Current Risk, through late Wednesday night.\n\n* IMPACTS...Dangerous swimming and surfing conditions and\nlocalized beach erosion. Rip currents can sweep even the best\nswimmers away from shore into deeper water.")
    expect(@nws_alert.instructions).to eq("Inexperienced swimmers should remain out of the water due to\ndangerous surf conditions.\n\nSwim near a lifeguard. If caught in a rip current, relax and\nfloat. Don't swim against the current. If able, swim in a\ndirection following the shoreline. If unable to escape, face the\nshore and call or wave for help.")
    expect(@nws_alert.response).to eq("Avoid")
  end
end
