class Page
	
	def initialize base, args = nil
		@base = base
		@base.wait if @base.respond_to? "wait"
		args.each do |k,v|
			instance_variable_set("@#{k}", v) unless v.nil?
		end unless args.nil?
	end
	
	def app app
		@app = app
	end
	
	def base &_base
		(_base.call unless _base.nil?)||@base
	end
	
	def content
		@base.text
	end
	
	def close
		@base.close if @base.respond_to? "close"
	end
	
	def wait
		@base.wait if @base.respond_to? "wait"
	end
	
	def open (page, *parameter)
		if parameter.length == 0
			return @app.open page
		end
		@app.open(page, paramter)
	end
	
	def self.frame(name, how, what, &_base)
		define_method name, Proc.new { base(&_base).frame(how, what) }
	end
  
	def self.text_field(name, how, what, &_base)
    define_method name, Proc.new { base(&_base).text_field(how, what) }
  end

  def self.button(name, how, what, &_base)
		define_method name, Proc.new { base(&_base).button(how, what) }
  end

  def self.link(name, how, what, &_base)
		define_method name, Proc.new { base(&_base).link(how, what) }
  end
	
	def self.checkbox(name, how, what, &_base)
		define_method name, Proc.new { base(&_base).checkbox(how, what) }
  end
	
	def self.select_list(name, how, what, &_base)
		define_method name, Proc.new { base(&_base).select_list(how, what) }
  end
	
	def self.ul(name, how, what, &_base)
		define_method name, Proc.new { base(&_base).ul(how, what) }
	end
	
	def self.span(name, how, what, &_base)
		define_method name, Proc.new { base(&_base).span(how, what) }
	end
end