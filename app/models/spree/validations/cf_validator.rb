module Spree
  module Validations
    class CfValidator < ActiveModel::EachValidator

      # Regex for validation. It validates the code without the check-digit.
      # It also separates the sections with appropriate grouping. Example:
      # codice_fiscale =~ FORMAT_NO_CHECK_DIGIT
      # name, year, month, day, place = $1, $2, $3, $4, $5
      # Duplication avoidance is handled
      FORMAT_NO_CHECK_DIGIT = /([A-Z]{6})([\dL-V]{2})([ABCDEHLMPRST])([\dL-V]{2})([A-Z][\dL-V]{3})/

      # Regex for validation. It validates the code with the check-digit
      # It also separates the sections with appropriate grouping. Example:
      # codice_fiscale =~ FORMAT_NO_CHECK_DIGIT
      # name, year, month, day, place, check_digit = $1, $2, $3, $4, $5, $6
      # Duplication avoidance is handled
      FORMAT = /#{FORMAT_NO_CHECK_DIGIT}([A-Z])/

      def validate_each(record, attribute, value)
        unless cf_is_valid?(value)
          record.errors[attribute] << (options[:message] || "Italian fiscal code not valid")
        end
      end

      private

      def cf_is_valid?(str)
        return false unless str
        str.upcase!
        return false unless str =~ FORMAT
        true
      end
    end
  end
end