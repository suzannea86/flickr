require 'rails_helper'

describe SearchController do

  describe "GET 'index'" do

    before do
      get :index
    end

    it { expect(response).to be_success }
    it { expect(response).to render_template(:index)}
  end
  
  describe "GET 'search'" do

    context "with search parameter" do
      let(:search_result) do
        { 
          :id => '123',
          :owner => 'Suzanne',
          :title => 'sydney'
        }
      end

      before do
        flickr = double(FlickRaw::Flickr)
        allow(FlickRaw::Flickr).to receive(:new).and_return(flickr)
        allow(flickr).to receive_message_chain(:photos, :search) {"#{search_result}"}
        get :search, search: "sydney"
      end
      
        it { expect(response).to be_success }
        it { expect(response).to render_template(:search)}
        it { expect(assigns(:search_results)).to eq("#{search_result}") }
    end

    context "without search parameter" do
      before { get :search }

      it { expect(response).to redirect_to(root_path)}
    end

  end
  
end
