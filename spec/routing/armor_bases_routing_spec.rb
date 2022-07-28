require "rails_helper"

RSpec.describe ArmorBasesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/armor_bases").to route_to("armor_bases#index")
    end

    it "routes to #show" do
      expect(get: "/armor_bases/1").to route_to("armor_bases#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/armor_bases").to route_to("armor_bases#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/armor_bases/1").to route_to("armor_bases#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/armor_bases/1").to route_to("armor_bases#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/armor_bases/1").to route_to("armor_bases#destroy", id: "1")
    end
  end
end
