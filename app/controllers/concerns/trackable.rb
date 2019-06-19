module WillRemember
  module Trackable
    extend ActiveSupport::Concern

    included do
      before_action :track_page
    end

    private
      def track_page
        if params.key?(:page)
          flash[page_key] = params[:page].to_i
        else
          flash.keep(page_key)
        end
      end

      def page_key
        "#{controller_path.gsub('/', '_')}_page".to_sym
      end

      def paginate
        page = flash[page_key]
        if page.nil? || page < 1
          page = 1
          flash[page_key] = page
        elsif page > 1 && !yield.page(page).any?
          page = (yield.count / WillPaginate.per_page).ceil
          page = 1 unless page > 1
          flash[page_key] = page
        end
        yield.page(page)
      end
  end
end
