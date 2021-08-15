# frozen_string_literal: true

require_relative "sniffed/version"

module Sniffed
end

require "sniffed/sniffer"

ActiveSupport.on_load :active_record do
  include Sniffed::Sniffer
end
