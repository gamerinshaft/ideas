module Api
  class Api::MarkdownController < ApplicationController
    def convert
      text = params[:markdown]

      renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
      @markdown = Redcarpet::Markdown.new(renderer, tables: true)
      @markdown = @markdown.render(text).html_safe
      Rails.logger.debug(@markdown)
    end
  end
end
