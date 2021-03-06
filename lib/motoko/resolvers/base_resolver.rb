# frozen_string_literal: true

require 'motoko/utils/snake_to_camel'

module Motoko
  module Resolvers
    class BaseResolver
      attr_accessor :name
      attr_writer :human_name
      attr_reader :formatter

      include Motoko::Utils::SnakeToCamel

      def initialize(name, options)
        options ||= {}

        @name = name
        @human_name = options.delete('human_name') if options.key?('human_name')
        formatter = options.delete('formatter') || 'base_formatter'
        @align = options.delete('align')

        @formatter = Object.const_get("Motoko::Formatters::#{snake_to_camel_case(formatter)}").new(options)

        puts "unused keys for column #{name}: #{options.keys.join(', ')}" if options.keys.any?
      end

      def align
        @align&.to_sym
      end

      def human_name
        @human_name ||= name.tr('_', ' ').gsub('.', ' > ').split.map(&:capitalize).join(' ')
      end

      def resolve_for(_node)
        raise 'Not implemented'
      end

      def value(node)
        formatter.format(resolve_for(node))
      end
    end
  end
end
