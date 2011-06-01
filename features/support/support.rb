module DataFixtures
  def data(path)
    YAML::load_file("#{File.dirname(__FILE__)}/../data/#{path}")
  end
end

module PageAssertions
	def have_text (text)
		PageAssertions::Rspec::HaveText.new text
	end
	
	def have_link (how, what)
		PageAssertions::Rspec::HaveLink.new(how, what)
	end
	
	module Rspec
		class HaveText
			def initialize text_or_regex
				@text_or_regex = text_or_regex
			end
			
			def matches? page
				@page = page
				if @text_or_regexp.is_a?(Regexp)
          !!page.content =~ @text_or_regexp
        else
          !!page.content.index(@text_or_regexp.to_s)
        end
			end
		end
		
		class HaveLink
			def initialize (how, what)
				@how = how
				@what = what
			end
			
			def matches? page
				@page = page
				begin
					link = @page.base.link(@how, @what)
					if link.respond_to?(:assert_exists)
            # IE
            link.assert_exists
            true
          else
            # Safari
            link.exists?
          end
				rescue ::Watir::Exception::UnknownObjectException => e
          false
        end
			end
		end
	end
end

def require_all(root)
  Find.find(root) do |path|
    next if FileTest.directory?(path)
    require path if path =~ /\.rb$/
  end
end

def safe
  yield rescue nil
end