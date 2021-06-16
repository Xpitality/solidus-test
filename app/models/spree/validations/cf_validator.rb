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
          record.errors[attribute] << (options[:message] || "Italian fiscal code not valid or underage")
        end
      end

      private

      def cf_is_valid?(str)
        return false unless str
        str.upcase!
        return false unless str =~ FORMAT
        return false if underage?($2, $3, $4)
        true
      end

      def underage?(year, month, day)
        if year.to_i < 30
          year = "20#{year}"
        else
          year = "19#{year}"
        end
        case month
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
        if day.to_i > 31
          day = day.to_i - 40
          day = "0#{day}" if day < 10
        end
        ((Date.today - Date.parse("#{day}-#{month}-#{year}")) / 365).to_i < 18
      end
    end
  end
end