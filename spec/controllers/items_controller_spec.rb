require 'rails_helper'


describe ItemsController, type: :controller do

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end

# end

# end
#   describe 'GET #show' do
#     it "renders the :show template" do
#       # get :show, params: {  id: 1 }
#     end


    # before do
    #   get :show, params:{id: item.id}
    # end

    # it "responds successfully" do
    #   get :show,params: {id: item.id}
    #   expect(response).to be_success
    # end


    # it "renders the :show template" do
    #   expect(response).to render_template :show
    # end

    # it "assigns the requested item to @item" do
    #   expect(assigns(:items)).to eq item
    # end

    # it "responds successfully" do
    #   get :show,params: {id: item.id}
    #   expect(response).to be_success
    # end

    # it "renders the :show template" do
    #   item = create(:item)
    #   get :show, id: item
    #   expect(response).to render_template :show
    # end



