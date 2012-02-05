class ApplicationController < ActionController::Base
  protect_from_forgery

  def show_validation_errors(item, options={})
    target_div = options.empty? ? 'error_messages' : options[:div]
    render :update do |page|
      page.replace_html target_div, error_messages_for(item)
      page << "$('##{target_div}').scrollTo(500);"
    end
  end

end
