# frozen_string_literal: true

module Capybara
  # @api private
  module Queries
    class TextQuery < BaseQuery
      def initialize(type = nil, expected_text, session_options:, **options) # rubocop:disable Style/OptionalArguments
        @type = type.nil? ? default_type : type
        @expected_text = expected_text.is_a?(Regexp) ? expected_text : expected_text.to_s
        @options = options
        super(@options)
        self.session_options = session_options

        @search_regexp = Capybara::Helpers.to_regexp(@expected_text, exact: exact?)

        assert_valid_keys
      end

      def resolve_for(node)
        @node = node
        @actual_text = text
        @count = @actual_text.scan(@search_regexp).size
      end

      def failure_message
        super << build_message(true)
      end

      def negative_failure_message
        super << build_message(false)
      end

      def description
        if @expected_text.is_a?(Regexp)
          "text matching #{@expected_text.inspect}"
        else
          "#{'exact ' if exact?}text #{@expected_text.inspect}"
        end
      end

    private

      def exact?
        options.fetch(:exact, session_options.exact_text)
      end

      def build_message(report_on_invisible)
        message = +''
        unless (COUNT_KEYS & @options.keys).empty?
          message << " but found #{@count} #{Capybara::Helpers.declension('time', 'times', @count)}"
        end
        message << " in #{@actual_text.inspect}"

        details_message = []
        details_message << case_insensitive_message if @node && check_case_insensitive?
        details_message << invisible_message if @node && check_visible_text? && report_on_invisible
        details_message.compact!

        message << ". (However, #{details_message.join(' and ')}.)" unless details_message.empty?
        message
      end

      def case_insensitive_message
        insensitive_regexp = Capybara::Helpers.to_regexp(@expected_text, options: Regexp::IGNORECASE)
        insensitive_count = @actual_text.scan(insensitive_regexp).size
        return if insensitive_count == @count

        "it was found #{occurrences insensitive_count} using a case insensitive search"
      end

      def invisible_message
        invisible_text = text(query_type: :all)
        invisible_count = invisible_text.scan(@search_regexp).size
        return if invisible_count == @count

        "it was found #{occurrences invisible_count} including non-visible text"
      rescue StandardError
        # An error getting the non-visible text (if element goes out of scope) should not affect the response
        nil
      end

      def valid_keys
        COUNT_KEYS + %i[wait exact normalize_ws]
      end

      def check_visible_text?
        @type == :visible
      end

      def check_case_insensitive?
        !@expected_text.is_a?(Regexp)
      end

      def text(node: @node, query_type: @type)
        normalize_ws = options.fetch(:normalize_ws, session_options.default_normalize_ws)
        node.text(query_type, normalize_ws: normalize_ws)
      end

      def default_type
        Capybara.ignore_hidden_elements || Capybara.visible_text_only ? :visible : :all
      end
    end
  end
end
