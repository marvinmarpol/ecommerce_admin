ActiveAdmin.register Product do
  permit_params do
    permitted = [ :name, :price, :description, :stock, :seller_id, :category_id, :published_at ]
    permitted << :other if params[:action] == "create" && current_admin_user
    permitted
  end

  scope :all
  scope :published
  scope :unpublished

  form do |f|
    f.inputs do
      f.input :seller
      f.input :category
      f.input :name
      f.input :description
      f.input :price
      f.input :stock
    end
    f.actions
  end

  action_item :publish, only: :show do
    link_to "Publish", publish_admin_product_path(product), method: :put if !product.published_at?
  end

  action_item :unpublish, only: :show do
    link_to "Unpublish", unpublish_admin_product_path(product), method: :put if product.published_at?
  end

  member_action :publish, method: :put do
    product = Product.find(params[:id])
    product.update(published_at: Time.zone.now)
    redirect_to admin_product_path(product)
  end

  member_action :unpublish, method: :put do
    product = Product.find(params[:id])
    product.update(published_at: nil)
    redirect_to admin_product_path(product)
  end
end
