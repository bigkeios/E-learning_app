module ApplicationHelper
    def full_title(title)
        base_title = "E-learning App"
        if title.empty?
            base_title
        else
            title + " | " + base_title
        end
    end
    def will_paginate(collection_or_options = nil, options = {})
        if collection_or_options.is_a? Hash
          options, collection_or_options = collection_or_options, nil
        end
        unless options[:renderer]
          options = options.merge renderer: WillPaginate::ActionView::BootstrapLinkRenderer
        end
        super *[collection_or_options, options].compact
      end
end
