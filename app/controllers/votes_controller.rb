class VotesController < ApplicationController

	layout false, :only => [:new, :search]

	def index
		render :layout => "application"
	end

	def new		
	  render :layout => "search"
	end

	def search
		@records = Vote.search_for(params[:search], :order => 'panel_no').page params[:page]
		render :layout => "search"
  rescue => e
    #flash[:error] = e.to_s
    @records= Vote.search_for('', :order => 'panel_no').page params[:page]
		render :layout => "search"
	end

	def find_user_address
		if params[:id].present?
			@user = Vote.find_by_sr_no(params[:id])
			render :partial => "find_user_info"
		end
	end

	def update_mobile_no
		record = Vote.find(params[:id]) if params[:id]
		if params[:mob_no].present? && record.update_attribute(:mobile_num, params[:mob_no])
			render :text => "success" 
		else
			render :text => "failed"
		end
	end

#  def auto_complete_search
#    begin
#      @items = Vote.complete_for(params[:search])
#    rescue ScopedSearch::QueryNotSupported => e
#      @items = [{:error =>e.to_s}]
#    end
#    render :json => @items
#  end

end
