require 'spec_helper'

describe GadgetsController, :type => :controller do

  let(:user) { create(:user) }

  let(:valid_attributes) { { "user_id" =>  user.id.to_s, :name => "Guns, lots of guns."} }

  before do
    sign_in(user)
  end

  describe "GET search" do
    before do
      @cell_phone = user.gadgets.create :name => "Cell phone"
      @iphone     = user.gadgets.create :name => "iPhone"
      @ipad       = user.gadgets.create :name => "iPad"
      @macbook    = user.gadgets.create :name => "Macbook"
      @thinkpad   = user.gadgets.create :name => "Thinkpad"
    end

    it "should find cell_phone and iphone whensearch for 'phone'"
    it "should find iphone and ipad for 'IP'"
    it "should find ipad and thinkpad for 'pad'"
    it "should not find anything when searched for 'neo' "

  end

  describe "GET index" do
    it "assigns all gadgets as @gadgets" do
      gadget = Gadget.create! valid_attributes
      get :index, {}
      expect(assigns(:gadgets)).to eq([gadget])
    end
  end

  describe "GET new" do
    it "assigns a new gadget as @gadget" do
      get :new, {}
      expect(assigns(:gadget)).to be_a_new(Gadget)
    end
  end

  describe "GET edit" do
    it "assigns the requested gadget as @gadget" do
      gadget = Gadget.create! valid_attributes
      get :edit, {:id => gadget.to_param}
      expect(assigns(:gadget)).to eq(gadget)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Gadget" do
        expect {
          post :create, {:gadget => valid_attributes}
        }.to change(Gadget, :count).by(1)
      end

      it "assigns a newly created gadget as @gadget" do
        post :create, {:gadget => valid_attributes}
        expect(assigns(:gadget)).to be_a(Gadget)
        expect(assigns(:gadget)).to be_persisted
      end

      it "redirects to the created gadget" do
        post :create, {:gadget => valid_attributes}
        expect(response).to redirect_to(gadgets_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gadget as @gadget" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Gadget).to receive(:save).and_return(false)
        post :create, {:gadget => { "user" => "invalid value" }}
        expect(assigns(:gadget)).to be_a_new(Gadget)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Gadget).to receive(:save).and_return(false)
        post :create, {:gadget => { "user" => "invalid value" }}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested gadget" do
        gadget = Gadget.create! valid_attributes
        # Assuming there are no other gadgets in the database, this
        # specifies that the Gadget created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Gadget).to receive(:update).with(valid_attributes)
        put :update, {:id => gadget.to_param, :gadget => valid_attributes}
      end

      it "assigns the requested gadget as @gadget" do
        gadget = Gadget.create! valid_attributes
        put :update, {:id => gadget.to_param, :gadget => valid_attributes}
        expect(assigns(:gadget)).to eq(gadget)
      end

      it "redirects to the gadget" do
        gadget = Gadget.create! valid_attributes
        put :update, {:id => gadget.to_param, :gadget => valid_attributes}
        expect(response).to redirect_to(gadgets_url)
      end
    end

    describe "with invalid params" do
      it "assigns the gadget as @gadget" do
        gadget = Gadget.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Gadget).to receive(:update).and_return(false)
        put :update, {:id => gadget.to_param, :gadget => { "user" => "invalid value" }}
        expect(assigns(:gadget)).to eq(gadget)
      end

      it "re-renders the 'edit' template" do
        gadget = Gadget.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Gadget).to receive(:update).and_return(false)
        put :update, {:id => gadget.to_param, :gadget => { "user" => "invalid value" }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested gadget" do
      gadget = Gadget.create! valid_attributes
      expect {
        delete :destroy, {:id => gadget.to_param}
      }.to change(Gadget, :count).by(-1)
    end

    it "redirects to the gadgets list" do
      gadget = Gadget.create! valid_attributes
      delete :destroy, {:id => gadget.to_param}
      expect(response).to redirect_to(gadgets_url)
    end
  end

end
