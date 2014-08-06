require 'rails_helper'

describe SearchController do
  
  describe "GET 'index'" do

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
      get :index, search: "sydney"
    end

    it { expect(response).to be_success }
    it { expect(response).to render_template(:index)}
    it { expect(assigns(:search_results)).to eq("#{search_result}") }

  end
  
end
