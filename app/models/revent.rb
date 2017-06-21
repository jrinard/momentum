class Revent < ApplicationRecord
  serialize :recurring, Hash

  has_many :event_exceptions

  def recurring=(value) #check to see if it is a valid rule from select Gem # goal is to parse strings into symbols so we can access things.
    if RecurringSelect.is_valid_rule?(value)
      super(RecurringSelect.dirty_hash_to_rule(value).to_hash) #parse the value and verify it is accurate and pass it to hash and saved by calling super overriding the recurring =
    else
      super(nil)
    end
  end
  #
  # def rule
  #   IceCube::Rule.from_hash recurring
  # end
  #
  # def schedule(start)
  #   schedule = IceCube::Schedule.new(start)
  #   schedule.add_recurrence_rule(rule)
  #
  #   event_exceptions.each do |exception|
  #     schedule.add_exception_time(exception.time)
  #   end
  #
  #   schedule
  # end
  #
  # def calendar_events(start)
  #   if recurring.empty?
  #     [self]
  #   else
  #     #start_date = start.beginning_of_month.beginning_of_week
  #     end_date = start.end_of_month.end_of_week
  #     schedule(start_time).occurrences(end_date).map do |date|
  #       Event.new(id: id, name: name, start_time: date)
  #     end
  #   end
  # end
end
