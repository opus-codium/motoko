# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Motoko::Formatters::Datetime do
  before do
    ENV['TZ'] = 'Pacific/Tahiti'
  end

  after do
    ENV.delete('TZ')
  end

  describe '#format' do
    subject(:formatter) { described_class.new.format(value) }

    {
      nil                         => nil,
      'foo'                       => nil,
      '2021-03-12 18:23:13 +0100' => '2021-03-12 07:23:13 -1000',
    }.each do |k, v|
      context "with #{k.inspect}" do
        let(:value) { k }

        it { is_expected.to eq(v) }
      end
    end
  end
end
