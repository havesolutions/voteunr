class UpdatedVotesController < ApplicationController

	def create
		@new_record = UpdatedVote.new(params[:new_vote])
		@record = Vote.find(params[:old_record_id]) if params[:old_record_id].present?
		@keyword = params[:search_keyword]
		if @new_record.save			
			if @keyword.blank?
				flash[:notice] = "Your details have been successfully saved."
				redirect_to new_vote_path
			else
				flash[:notice] = "Your details have been successfully saved."
				redirect_to search_votes_path(:search => @keyword )
			end
		else
			#show_validation_errors(:updated_vote, {:div => "user_error_messages"})
			if @keyword.blank?
				render :template => "updated_votes/new.html.haml", :layout => 'search'
			else
				render :template => "votes/show.html.haml", :layout => 'search'
			end
		end
	end

	def new
		render :layout => false
	end
end
