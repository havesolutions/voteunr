class UpdatedVote < ActiveRecord::Base
	validates :name, :middle_name, :last_name, :address_line_1, :presence => true
#	validate :date_of_birth_is_valid_datetime
#	validates_date :date_of_birth, :on_or_before => lambda { Date.current }


  def date_of_birth_is_valid_datetime
    errors.add(:date_of_birth, 'must be a valid date') if ((DateTime.parse(date_of_birth) rescue ArgumentError) == ArgumentError)
  end

end
