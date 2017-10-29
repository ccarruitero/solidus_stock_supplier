require 'spec_helper'

RSpec.describe Spree::Admin::SuppliersController, type: :controller do
  stub_authorization!

  let(:valid_attributes) {
    { name: FFaker::Company.name, uid: FFaker::CompanyIT.partita_iva }
  }

  let(:invalid_attributes) { { name: '' } }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Spree::Supplier' do
        expect {
          post :create, params: { supplier: valid_attributes }
        }.to change(Spree::Supplier, :count).by(1)
      end

      it 'redirects to the created spree_admin' do
        post :create, params: { supplier: valid_attributes }
        expect(response).to redirect_to(admin_suppliers_path)
      end
    end

    context 'with invalid params' do
      it 'returns a success response' do
        post :create, params: { supplier: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  context 'with supplier' do
    let!(:supplier) { create(:supplier) }

    describe 'GET #edit' do
      it 'returns a success response' do
        get :edit, params: { id: supplier.to_param }
        expect(response).to be_success
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        it 'updates the requested supplier' do
          new_name = FFaker::Company.name
          put :update, params: {
            id: supplier.to_param, supplier: { name: new_name }
          }
          supplier.reload
          expect(supplier.name).to eq(new_name)
        end

        it 'redirects to the spree_admin' do
          put :update, params: {
            id: supplier.to_param, supplier: valid_attributes
          }
          expect(response).to redirect_to(spree.admin_suppliers_path)
        end
      end

      context 'with invalid params' do
        it 'returns a success response' do
          put :update, params: {
            id: supplier.to_param, supplier: invalid_attributes
          }
          expect(response).to be_success
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested spree_admin' do
        expect {
          delete :destroy, params: { id: supplier.to_param }
        }.to change(Spree::Supplier, :count).by(-1)
      end

      it 'redirects to the admin_suppliers' do
        delete :destroy, params: { id: supplier.to_param }
        expect(response).to redirect_to(admin_suppliers_url)
      end
    end
  end
end
