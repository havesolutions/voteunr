class UpdatedVote < ActiveRecord::Base
	validates :name, :middle_name, :last_name, :sex, :presence => true
	validate :date_of_birth_is_valid_datetime
#	validate :date_of_birth_is_valid_datetime
#	validates_date :date_of_birth, :on_or_before => lambda { Date.current }


  def date_of_birth_is_valid_datetime
    errors.add(:date_of_birth, 'can\'t be blank') if date_of_birth.first.blank? || date_of_birth.first.empty?
  end

end
