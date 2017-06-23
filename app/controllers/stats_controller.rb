class StatsController < ApplicationController

  def index
    @user = current_user
    @users = User.all

# GENERAL
    @units = Unit.all
    @units7 = Unit.where('created_at >= :seven_days_ago',:seven_days_ago => 6.days.ago).count
    @units30 = Unit.where("date(created_at) > ?", 30.days.ago).count
    @units365 = Unit.where("date(created_at) > ?", 365.days.ago).count

    @parts = Part.all
    @parts7 = Part.where("date(created_at) > ?", 6.days.ago).count
    @parts30 = Part.where("date(created_at) > ?", 30.days.ago).count
    @parts365 = Part.where("date(created_at) > ?", 365.days.ago).count

    @events = Event.all
    @spectators = Spectator.all

# BIG CHART
    @current_year = Time.new.year
    @spectactors_year = Spectator.where("date(created_at) > ?", 365.days.ago).count

    #Average on Sunday # Doesn't take in account for recurring events.
    s = Revent.where("extract(dow from start_time) = ?", 0).count
    if s === 0 ? s = s + 1 : s
    end #stops error if value is 0
    sunday_event_ids = Revent.where("extract(dow from start_time) = ?", 0).pluck(:id)
    sunday_total_specs = Spectator.where(revent_id: sunday_event_ids).count
    @sunday_average = sunday_total_specs / s

    #Average on WEDNESDAY # Doesn't take in account for recurring events.
    w = Revent.where("extract(dow from start_time) = ?", 3).count
    if w === 0 ? w = w + 1 : w
    end #stops error if value is 0
    w_event_ids = Revent.where("extract(dow from start_time) = ?", 3).pluck(:id)
    w_total_specs = Spectator.where(revent_id: w_event_ids).count
    @wednesday_average = w_total_specs / w

    @serving_average = Spectator.count / Revent.count
    @chart1 = Spectator.group_by_day(:created_at).count

# THIS WEEK
    d = Date.today
    @startweek = d.at_beginning_of_week.strftime("%b %d")
    @endweek = d.at_end_of_week.strftime("%d")
    @adultthisweek = Spectator.where("date(created_at) > ?", 6.days.ago).count

# LAST WEEK
    lastweek = Date.today.at_beginning_of_week - 7
    @startlastweek = lastweek.strftime("%b %d")
    endlastweek = Date.today.at_beginning_of_week - 1
    @endlastweek = endlastweek.strftime("%d")
    @lastweek = Spectator.where(:created_at => 1.week.ago.beginning_of_week..1.week.ago.end_of_week).count


# FULL MONTH
    beginning_of_month = Time.current.beginning_of_month
    end_of_month = beginning_of_month.end_of_month
      @specfullmonth = Spectator.where(created_at: beginning_of_month..end_of_month)



# EXPERIMENTAL
    # @test = Spectator.where(:val => 5).group('week(created_at)').count
    # @test = Date.today.strftime("%U").to_i
    @countunits = Unit.top(:familyname).count
    # @test = Spectator.top(:created_at).count

    # @test = Time.now.wday
    # if Time.now.wday === 5
    #   @test = "Friday"
    # end
    today = Date.new(Time.now.year, Time.now.month, Time.now.day)
    if today.wday === 5
      @today = "Today is Friday"
    elsif today.wday === 6
      @today = "Today is Saturday"
    elsif today.wday === 0
      @today = "Today is Sunday"
    elsif today.wday === 1
      @today = "Today is Monday"
    elsif today.wday === 2
      @today = "Today is Tuesday"
    elsif today.wday === 3
      @today = "Today is Wednesday"
    elsif today.wday === 4
      @today = "Today is Thursday"
    end



    @y = Revent.all.count
    @s = Revent.where("extract(dow from start_time) = ?", 0).count
    @m = Revent.where("extract(dow from start_time) = ?", 1).count
    @t = Revent.where("extract(dow from start_time) = ?", 2).count
    @w = Revent.where("extract(dow from start_time) = ?", 3).count
    @th = Revent.where("extract(dow from start_time) = ?", 4).count
    @f = Revent.where("extract(dow from start_time) = ?", 5).count
    @sat = Revent.where("extract(dow from start_time) = ?", 6).count



    # #Boolean test of day
    # date = Date.new(Time.now.year, Time.now.month, Time.now.day)
    # @test = date.friday?


  end
end
