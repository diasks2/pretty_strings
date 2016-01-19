require "pretty_strings/version"
require "rails-html-sanitizer"

module PrettyStrings
  class Cleaner
    attr_reader :text
    def initialize(text)
      @text = text
    end

    def pretty
      return '' if text.nil? || text.empty?
      remove_bracketed_numbers(
        replace_symbol_with_bracket(
        remove_newlines(
        replace_tabs(
        remove_bracketed_code(
        scan_for_code(
        escape_text(
        sanitize_text(
        replace_bracket_with_symbol(
        escape_text(
        sanitize_text(
        replace_bracket_with_symbol(
        text
      )))))))))))).squeeze(" ").strip
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
      Rails::Html::FullSanitizer.new.sanitize(text)
    end

    def scan_for_code(text)
      text =~ /(?<=\{\\f23).*?(?=})/ ? text.scan(/(?<=\{\\f23).*?(?=})/).join(" ") : text
    end
  end
end
