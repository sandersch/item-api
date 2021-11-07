require "rails_helper"

RSpec.describe ResistancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/resistances").to route_to("resistances#index")
    end

    it "routes to #show" do
      expect(get: "/resistances/1").to route_to("resistances#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/resistances").to route_to("resistances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/resistances/1").to route_to("resistances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/resistances/1").to route_to("resistances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/resistances/1").to route_to("resistances#destroy", id: "1")
    end
  end
end
