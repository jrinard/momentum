class StatsController < ApplicationController

  def index
    @user = current_user
    @users = User.all

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
    @chart1 = Spectator.group_by_day(:created_at).count

    @current_year = Time.new.year
    @spectactors_year = Spectator.where("date(created_at) > ?", 365.days.ago).count
    # @sunday_average = Spectactor.
    # @test = @Spectators.group("year(created_at)").group("month(created_at)").count
    # @events.spectators.count(:group => "year(created_at),month(created_at)")
    # @test = Spectator.group_by_year(:created_at).count

    # @thisweek = Spectator.where("date(created_at) > ?", 6.days.ago).count
    d = Date.today
    @startweek = d.at_beginning_of_week.strftime("%b %d")
    @endweek = d.at_end_of_week.strftime("%d")

    @serving_average = Spectator.count / Event.count

    lastweek = Date.today.at_beginning_of_week - 7
    @startlastweek = lastweek.strftime("%b %d")
    endlastweek = Date.today.at_beginning_of_week - 1
    @endlastweek = endlastweek.strftime("%d")
    @adultthisweek = Spectator.where("date(created_at) > ?", 6.days.ago).count

    @test2 = Spectator.where("date(created_at) > ?", 6.days.ago).count

    # @test = Spectator.where(:val => 5).group('week(created_at)').count
    # @test = Date.today.strftime("%U").to_i
    @countunits = Unit.top(:familyname).count
    # @test = Spectator.top(:created_at).count
    @test = Time.now.wday

    #date object ot test if the day is wednesday
    date = Date.new(Time.now.year, Time.now.month, Time.now.day)
    @test = date.wednesday?
end

end
