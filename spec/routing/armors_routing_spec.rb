require "rails_helper"

RSpec.describe ArmorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/armors").to route_to("armors#index")
    end

    it "routes to #show" do
      expect(get: "/armors/1").to route_to("armors#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/armors").to route_to("armors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/armors/1").to route_to("armors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/armors/1").to route_to("armors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/armors/1").to route_to("armors#destroy", id: "1")
    end
  end
end
