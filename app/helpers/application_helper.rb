# So, this module is where (all of) our application helper functions live.
# Helpers are associated with rendering views, and application_helper.rb is the "master" helper, 
# included in views by default. 

module ApplicationHelper
  
  #Returns the full title on a per-page basis
  def full_title(page_title)
    base_title = "Sample Rails App"
    if page_title.empty? 
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
end
