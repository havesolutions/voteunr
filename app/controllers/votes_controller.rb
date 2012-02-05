class VotesController < ApplicationController
	before_filter :update_session_time, :only => :search
	before_filter :session_expires, :only => :search
	layout false, :only => [:new, :search]

	def index
		render :layout => "application"
	end

	def new		
	  render :layout => "search"
	end
	
	def show
		@keyword = params[:keyword]
		@record = Vote.find(params[:id]) if params[:id]
	end

	def search
		@records = Vote.search_for(params[:search], :order => 'panel_no').page params[:page]
		if @records.blank?		
			session[:no_record] = "true"	
			flash.now[:notice] = "Sorry, couldn't find any record with your input keyword, please try other combination of keywords or use  help me finding my vote button to find your vote"
			render :action => :new, :layout => "search"
		else
			session[:no_record] = nil
			render :layout => "search"
		end
  rescue => e
    #flash[:error] = e.to_s
    @records= Vote.search_for('', :order => 'panel_no').page params[:page]
		render :layout => "search"
	end

	def find_user_address
		if params[:id].present?
			@user = Vote.find(params[:id])
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

	private

	def session_expires
		@time_left = (session[:"#{request.remote_addr}"] - Time.now).to_i
		logger.info "@time_left =======#{@time_left.inspect}================"
		unless @time_left > 0
		  reset_session
		  flash[:alert] = 'Your time on this page is exceeded to a maximum limit, please visit this site tomorrow'
		  redirect_to "http://voteulhasnagar.com/"
		end
	end

	def update_session_time
		if session[:"#{request.remote_addr}"].blank?
			session[:"#{request.remote_addr}"] = 60.minutes.from_now
		end
	end

end
