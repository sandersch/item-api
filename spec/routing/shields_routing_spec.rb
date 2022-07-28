require "rails_helper"

RSpec.describe ShieldsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shields").to route_to("shields#index")
    end

    it "routes to #show" do
      expect(get: "/shields/1").to route_to("shields#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/shields").to route_to("shields#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shields/1").to route_to("shields#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shields/1").to route_to("shields#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shields/1").to route_to("shields#destroy", id: "1")
    end
  end
end
