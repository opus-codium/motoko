# frozen_string_literal: true

module Motoko
  module Columns
    class Cpu < BaseColumn
      def resolve_for(node)
        format('%2d × %s', node.fact('processors.count'), node.fact('processors.models').first.gsub(/\((R|TM)\)|Processor/, '').gsub(/ {2,}/, ' '))
      end
    end
  end
end
