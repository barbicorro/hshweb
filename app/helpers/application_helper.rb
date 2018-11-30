module ApplicationHelper

   def flash_message
     return unless flash

     if flash[:notice]
       content_tag :div, flash[:notice], class: 'alert alert-dark'
     elsif flash[:success]
       content_tag :div, flash[:success], class: 'alert alert-success'
     elsif flash[:error]
       content_tag :div, flash[:error], class: 'alert alert-danger'
     elsif flash[:alert]
       content_tag :div, flash[:alert], class: 'alert alert-dark'
     end
    end



end
