class Vote < ActiveRecord::Base
  attr_accessible :name, :last_name, :middle_name, :voters_id, :age, :sex, :panel_no

#  scoped_search :on => :name, :complete_value => :true, :default_order => true
#  scoped_search :on => :description, :complete_value => :false
#  scoped_search :in => :author, :on => :last_name, :complete_value => true, :rename => :"author.last"
#  scoped_search :in => :author, :on => :first_name, :complete_value => true, :rename => :"author.first"

	ColumnNames = ["Panel", "Sr No", "First Name", "Middle Name", "Last Name", "Voters Id", "Sex", "Age"]

	scoped_search :on => :name, :complete_value => :true 
	scoped_search :on => :last_name, :complete_value => :true
	scoped_search :on => :middle_name, :complete_value => :true
	scoped_search :on => :voters_id, :complete_value => :true
	scoped_search :on => :age, :complete_value => :true
	scoped_search :on => :sex, :complete_value => :true
	scoped_search :on => :panel_no, :complete_value => :true


end
