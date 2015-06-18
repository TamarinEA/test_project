class ProductsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @product = @group.products.create(product_params)
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @product = @group.products.find(params[:id])
    @product.destroy
    redirect_to group_path(@group)
  end

  def edit
    @group = Group.find(params[:group_id])
    @product = @group.products.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @product = @group.products.find(params[:id])
    @product.update_attributes(product_params)
    redirect_to group_path(@group)
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
