module ApplicationHelper
  include ERB::Util

  def auth_token
    '<input type="hidden" name="authenticity_token" value="#{form_authenticity_token}" />'.html_safe
  end

  def ugly_lyrics(lyrics)
    lines = lyrics.split("\n")
    output = ''
    lines.each do |line|
      output += ( line.length > 1 ? '&#9835; ' : '') + line + "\n"
    end
    output.html_safe
  end
end
