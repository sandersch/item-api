require "rails_helper"

RSpec.describe ArmorAccessoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/armor_accessories").to route_to("armor_accessories#index")
    end

    it "routes to #show" do
      expect(get: "/armor_accessories/1").to route_to("armor_accessories#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/armor_accessories").to route_to("armor_accessories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/armor_accessories/1").to route_to("armor_accessories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/armor_accessories/1").to route_to("armor_accessories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/armor_accessories/1").to route_to("armor_accessories#destroy", id: "1")
    end
  end
end
