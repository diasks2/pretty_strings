require "pretty_strings/version"

module PrettyStrings
  class Cleaner
    attr_reader :text
    def initialize(text)
      @text = text
    end

    def pretty
      return '' if text.nil? || text.empty?
      remove_bracketed_numbers(
        remove_consecutive_dots(
        replace_symbol_with_bracket(
        remove_newlines(
        replace_tabs(
        remove_bracketed_code(
        remove_twb_tags(
        scan_for_code(
        escape_text(
        sanitize_text(
        replace_bracket_with_symbol(
        escape_text(
        sanitize_text(
        replace_bracket_with_symbol(
        text
      )))))))))))))).squeeze(" ").strip
    end

    private

    def remove_newlines(text)
      text.gsub!(/\n/, ' ') || text
      text.gsub!(/\r/, ' ') || text
    end

    def replace_tabs(text)
      text.gsub!(/\t/, ' ') || text
    end

    def remove_bracketed_code(text)
      text.gsub!(/(?<=\*\*)\{(?=date\}\*\*)/, '⚘') || text
      text.gsub!(/(?<=\*\*)\{(?=number\}\*\*)/, '⚘') || text
      text.gsub!(/(?<=\*\*)\{(?=email\}\*\*)/, '⚘') || text
      text.gsub!(/(?<=\*\*)\{(?=url\}\*\*)/, '⚘') || text
      text.gsub!(/(?<=\*\*\{date)\}(?=\*\*)/, '♚') || text
      text.gsub!(/(?<=\*\*\{number)\}(?=\*\*)/, '♚') || text
      text.gsub!(/(?<=\*\*\{email)\}(?=\*\*)/, '♚') || text
      text.gsub!(/(?<=\*\*\{url)\}(?=\*\*)/, '♚') || text
      text.gsub!(/\{.*?\}/, '') || text
      text.gsub!(/♚/, '}') || text
      text.gsub!(/⚘/, '{') || text
    end

    def remove_twb_tags(text)
      remove_twb_tags_post(
      remove_twb_tags_post(
      remove_twb_tags_post(
      remove_twb_tags_post(
      remove_twb_tags_pre(text)))))
    end

    def remove_twb_tags_post(text)
      text.gsub!(/({\\b )([^{}}]*)(}\\line)/, '\2') || text
      text.gsub!(/({\\\S+ )([^{}}]*)(})/, '\2') || text
      text.gsub!('\sectd\\linex0\\headery708\\footery708\\colsx708\\endnhere\\sectlinegrid360\\sectdefaultcl\\sftnbj ', '') || text
    end

    def remove_twb_tags_pre(text)
      text.gsub!(/\{\\super \d+}/, '') || text
      text.gsub!(/\{\\\*\\fldinst [^{}]*}/, '') || text
    end

    def remove_consecutive_dots(text)
      text.gsub!(/\.{5,}/, '') || text
    end

    def replace_bracket_with_symbol(text)
      text.gsub!(/<(?=\s*\d+)/, '♳') || text
    end

    def replace_symbol_with_bracket(text)
      text.gsub!(/♳/, '<') || text
    end

    def remove_bracketed_numbers(text)
      text.gsub!(/\<\d+\>/, '') || text
    end

    def escape_text(text)
      CGI.unescapeHTML(CGI.unescapeHTML(CGI.unescapeHTML(CGI.unescapeHTML(text))))
    end

    def sanitize_text(text)
      text.gsub!(/(<[^>\d\/][^>]*>)|\n\t/, '') || text
      text.gsub!(/(<\/[^>\d][^>]*>)|\n\t/, '') || text
    end

    def scan_for_code(text)
      text =~ /(?<=\{\\f23).*?(?=})/ ? text.scan(/(?<=\{\\f23).*?(?=})/).join(" ") : text
    end
  end
end
