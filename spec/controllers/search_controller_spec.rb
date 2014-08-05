require 'rails_helper'

describe SearchController do
  
  describe "GET 'index'" do
    
    before {get :index, search: "hi"}

    it { expect(response).to be_success }
    it { expect(response).to render_template(:index)}
    it { expect(assigns(:search_results)).to_not be_nil }

  end
end