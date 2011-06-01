class PurchasingEditPage < Page
	text_field :title, :name, 'txtTitle'
	button :btnUpdate, :name, 'btnUpdate'
	text_field :orderNumber, :name, 'txtOrderNumberToAdd'
	button :btnAddOrderNumber, :name, 'btnOrderNumbersAdd'
	link :btnDeleteOrderNumber, :xpath, "//table[@id='orderNumberList']//a"
	
	def save record
		title.set record['Title']
		btnUpdate.click
	end
	
	def add_order_number text
		orderNumber.set text
		btnAddOrderNumber.click
	end
    
	def delete_order_number text
		btnDeleteOrderNumber.click
	end

end