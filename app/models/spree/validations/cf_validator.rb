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
        if !cf_is_valid?(value)
          record.errors[attribute] << I18n.t('errors.messages.fiscal_code.wrong_format')
        elsif underage?(value)
          record.errors[attribute] << I18n.t('errors.messages.fiscal_code.underage')
        end
      end

      private

      def cf_is_valid?(str)
        return false unless str
        str.upcase!
        return false unless str =~ FORMAT
        true
      end

      def underage?(str)
        str =~ FORMAT
        if $2.to_i < 30
          year = "20#{$2}"
        else
          year = "19#{$2}"
        end
        case $3
          when 'A'
            month = "01"
          when 'B'
            month = "02"
          when 'C'
            month = "03"
          when 'D'
            month = "04"
          when 'E'
            month = "05"
          when 'H'
            month = "06"
          when 'L'
            month = "07"
          when 'M'
            month = "08"
          when 'P'
            month = "09"
          when 'R'
            month = "10"
          when 'S'
            month = "11"
          when 'T'
            month = "12"
          else
            month = "01"
        end
        day = $4
        if day.to_i > 31
          day = day.to_i - 40
          day = "0#{day}" if day < 10
        end
        ((Date.today - Date.parse("#{day}-#{month}-#{year}")) / 365).to_i < 18
      end
    end
  end
end