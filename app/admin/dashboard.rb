# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Low Stock Products" do
          ul do
            Product.where("stock < 500").map do |product|
              li "#{product.name} (#{product.stock} left)"
            end
          end
        end
      end
    end
  end # content
end
