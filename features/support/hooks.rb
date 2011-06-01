# "before feature - all scenarios"
browser = Watir::IE.new

# "after feature - all scenarios"
at_exit do
  browser.close
end

# "before each scenario"
Before do
	@app = Application.new browser
	@app.start
end

# "after each scenario"
After do
	@app.logout
end

World(DataFixtures, PageAssertions)