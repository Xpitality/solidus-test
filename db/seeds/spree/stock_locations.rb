# frozen_string_literal: true

Spree::StockLocation.create_with(backorderable_default: false)
                    .find_or_create_by!(name: 'default')
