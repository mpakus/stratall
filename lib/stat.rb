require 'active_support/all'

class Stat
  attr_reader :client

  def initialize(client)
    @client = client
  end

  def current_week
    client.list_athlete_activities(after: week_begins, before: week_ends, per_page: 48)
  end    

  def distance_in_current_week
    (current_week.sum{ |e| e['distance'] } / 1000).round(2)
  end

  private

  def week_begins
    Date.today.beginning_of_week.to_time
  end

  def week_ends
    Date.today.end_of_week.to_time
  end

  def iam
    @iam ||= client.retrieve_current_athlete    
  end  
end
