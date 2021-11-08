require "rails_helper"

RSpec.describe EnhancivesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/enhancives").to route_to("enhancives#index")
    end

    it "routes to #show" do
      expect(get: "/enhancives/1").to route_to("enhancives#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/enhancives").to route_to("enhancives#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/enhancives/1").to route_to("enhancives#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/enhancives/1").to route_to("enhancives#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/enhancives/1").to route_to("enhancives#destroy", id: "1")
    end
  end
end
