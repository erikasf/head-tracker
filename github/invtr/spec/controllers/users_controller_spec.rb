require 'rails_helper'
require 'spec_helper'


describe UsersController do 
  login_user

	describe 'GET #new' do 
    context "with a valid user" do
  		it 'renders the :new view' do
        allow(controller).to receive(:current_user).and_return(@user)
    		get :new
        expect(response).to render_template :new
  		end 
    end
	end

  describe "GET #show" do
    it "assigns a new User to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user
    	expect(assigns(:user)).to eq(user)
    end

    it "renders the :show view" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "renders an existing User to @user" do 
      user = FactoryGirl.create(:user)
      get :edit, id: user
      expect(assigns(:user)).to eq(user)
    end 

    it "renders the :edit view" do 
      user = FactoryGirl.create(:user)
      get :edit, id: user.id
      expect(response).to render_template :edit
    end 
  end

 	describe "POST #create" do 
    it "increments the User database count by 1" do
      expect {
        post :create, user: FactoryGirl.attributes_for(:user)
      }.to change(User, :count).by(1)
    end
  end 

  describe "PUT #update" do 
    it "locates the correct user" do
      user = FactoryGirl.create(:user)
      put :update, id: user.id, user: FactoryGirl.attributes_for(:user)
      expect(assigns(:user)).to eq(user)  
    end

    it "changes the User's attributes" do
      user = FactoryGirl.create(:user)
      put :update, id: user.id, user: FactoryGirl.attributes_for(:user, name: user.name)
      user.reload
      expect(user.name).to eq(user.name)
    end 
  end 
	
	describe "DELETE #destroy" do
    it "deletes the user" do
      user = FactoryGirl.create(:user)
      expect{
            delete :destroy, id: user        
          }.to change(User,:count).by(-1)
    end

    # it "redirects to the home page" do
    # end
  end


end 





