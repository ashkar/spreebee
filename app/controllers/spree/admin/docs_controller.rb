module Spree
  module Admin
    class DocsController < ResourceController
      before_filter :load_data

      create.before :set_viewable
      update.before :set_viewable
      destroy.before :destroy_before

      private

        def location_after_destroy
          admin_product_docs_url(@product)
        end
 
        def location_after_save
          admin_product_docs_url(@product)
        end

        def load_data
           @product = Product.find_by_permalink(params[:product_id])
          @variants = @product.variants.collect do |variant|
            [variant.options_text, variant.id]
          end
          @variants.insert(0, [I18n.t(:all), @product.master.id])
        end

        def set_viewable
          @doc.viewable_type = 'Spree::Variant'
          @doc.viewable_id = params[:doc][:viewable_id]
        end

        def destroy_before
          @viewable = @doc.viewable
        end

    end
  end
end
