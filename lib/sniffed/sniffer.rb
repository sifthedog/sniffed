# frozen_string_literal: true

module Sniffed
  module Sniffer
    extend ActiveSupport::Concern

    module ClassMethods
      def sniffed
        include Sniffed::Sniffer::SniffedInstanceMethods

        after_initialize :reset_commited_changes
        after_save :track_commited_changes
      end
    end

    module SniffedInstanceMethods
      def reset_commited_changes
        @unfiltered_commited_changes = {}
      end

      def commited_changes
        @unfiltered_commited_changes.reject(&unchanged_attributes)
      end

      private

      def track_commited_changes
        previous_changes.each_pair(&track_commited_change)
      end

      def track_commited_change
        lambda do |(attribute, (previous_value, current_value))|
          if @unfiltered_commited_changes.key?(attribute)
            @unfiltered_commited_changes[attribute][1] = current_value
          else
            @unfiltered_commited_changes[attribute] = [previous_value, current_value]
          end
        end
      end

      def unchanged_attributes
        lambda do |_k, (previous_value, current_value)|
          previous_value == current_value
        end
      end
    end
  end
end
