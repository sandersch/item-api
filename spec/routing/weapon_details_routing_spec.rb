require "rails_helper"

RSpec.describe WeaponDetailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/weapon_details").to route_to("weapon_details#index")
    end

    it "routes to #show" do
      expect(get: "/weapon_details/1").to route_to("weapon_details#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/weapon_details").to route_to("weapon_details#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/weapon_details/1").to route_to("weapon_details#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/weapon_details/1").to route_to("weapon_details#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/weapon_details/1").to route_to("weapon_details#destroy", id: "1")
    end
  end
end
