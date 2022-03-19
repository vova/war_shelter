# frozen_string_literal: true

module ApplicationHelper
  def markdown(text)
    MarkdownRenderer.render(text).html_safe # rubocop:disable Rails/OutputSafety
  end
end
