class Vote < ActiveRecord::Base
	paginates_per 10

  attr_accessible :name, :last_name, :middle_name, :voters_id, :age, :sex, :panel_no

	ColumnNames = ["Panel", "Sr No", "First Name", "Middle Name", "Last Name", "Voters Id", "Sex", "Age"]

	scoped_search :on => :name, :complete_value => :true 
	scoped_search :on => :last_name, :complete_value => :true
	scoped_search :on => :sr_no, :complete_value => :true
	scoped_search :on => :middle_name, :complete_value => :true
	scoped_search :on => :voters_id, :complete_value => :true
	scoped_search :on => :age, :complete_value => :true
	scoped_search :on => :sex, :complete_value => :true
	scoped_search :on => :panel_no, :complete_value => :true


end
