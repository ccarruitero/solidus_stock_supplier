class Spree::Admin::SuppliersController < Spree::Admin::ResourceController
  def index
    @suppliers = Spree::Supplier.all.page(params[:page]).
      per(params[:per_page] || Spree::Config[:orders_per_page])
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :phone, :email, :uid)
  end
end
