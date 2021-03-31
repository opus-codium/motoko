# frozen_string_literal: true

module Motoko
  module Utils
    module TimeAgo
      def seconds_to_human(value)
        return nil unless value

        value = value.round
        res = []

        {
          's' => 60,
          'm' => 60,
          'h' => 24,
        }.each do |unit, count|
          res << Kernel.format('%2d%s', value % count, unit)
          value /= count

          break if value.zero?
        end

        res << "#{value}d" if value.positive?

        res.reverse.join(' ')
      end
    end
  end
end
