class VotesController < ApplicationController

	layout false, :only => [:new, :search]

	def index
		render :layout => "application"
	end

	def new		
	  render :layout => "search"
	end

	def search
		@records = Vote.search_for(params[:search], :order => 'panel_no').all(:limit => 200)
		render :layout => "search"
  rescue => e
    flash[:error] = e.to_s
    @records= Vote.search_for('', order => 'panel_no').all(:limit => 200)
		render :layout => "search"
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
