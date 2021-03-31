# frozen_string_literal: true

module Motoko
  module Columns
    class Os < BaseColumn
      def resolve_for(node)
        node.fact('os.distro.description') || format('%s %s', node.fact('os.name'), node.fact('os.release.full'))
      end
    end
  end
end
