# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Motoko::Resolvers::Identity do
  subject(:column) { described_class.new('host', {}) }

  let(:node) do
    Motoko::Node.new('example.com', {})
  end

  describe '#resolve_for' do
    subject { column.resolve_for(node) }

    it { is_expected.to eq('example.com') }
  end
end
