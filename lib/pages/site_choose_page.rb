class SiteChoosePage < Page
	ul :site_list, :id, 'siteSel1_list'
	
	def choose site
		site_list.link(:text, site.to_s).click
	end
end