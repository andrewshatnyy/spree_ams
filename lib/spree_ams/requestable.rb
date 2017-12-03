module Spree
  module Api
    module Ams
      module Requestable
        extend ActiveSupport::Concern

        private

        # Provide a guest user if there's no
        # current api user loaded.
        def load_user
          super
          @current_api_user = Spree.user_class.new if @current_api_user.nil?
        end

        # Allow the current order to be be
        # loaded from the request's header.
        def order_id
          params[:order_id] || params[:checkout_id] || params[:order_number] || request.headers['X-Spree-Order-Id']
        end

      end
    end
  end
end