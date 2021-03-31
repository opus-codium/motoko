# frozen_string_literal: true

module Motoko
  module Formatters
    class Ellipsis < BaseFormatter
      attr_accessor :max_length

      def initialize(options = {})
        super
        @max_length = options.delete('max_length') || 20
      end

      def format(value)
        return nil unless value

        res = value.dup
        res[(max_length - 1)..-1] = '…' if res.length > max_length
        res
      end
    end
  end
end
