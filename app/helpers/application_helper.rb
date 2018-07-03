module ApplicationHelper
  # ref: https://richonrails.com/articles/rendering-markdown-with-redcarpet
  def markdown(text)
    options = {
      filter_html:     false,
      hard_wrap:       true,
      no_styles: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    text.sub!('script', 'safe')

    markdown.render(text).html_safe
  end
end
