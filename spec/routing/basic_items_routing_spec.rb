require "rails_helper"

RSpec.describe BasicItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/basic_items").to route_to("basic_items#index")
    end

    it "routes to #show" do
      expect(get: "/basic_items/1").to route_to("basic_items#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/basic_items").to route_to("basic_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/basic_items/1").to route_to("basic_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/basic_items/1").to route_to("basic_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/basic_items/1").to route_to("basic_items#destroy", id: "1")
    end
  end
end
