module ApplicationHelper
  def get_api_key
    # sets @api_key in all views to either API key set on server or a known Google Maps client key
    # probably a magic """""number""""" but fuck it
    @api_key = ENV['GOOGLE_CLIENT_API_KEY'] || 'AIzaSyA7HCWU3UdcM5WoeuByGBnK4cAOG7V9gJk'
  end
end
