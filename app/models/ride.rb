class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        ticket_check, height_check = meets_requirements
        if ticket_check && height_check
          start_ride
        elsif !ticket_check && height_check
          "Sorry. " + not_enough_tickets
        elsif ticket_check && !height_check
          "Sorry. " + not_tall_enough
        elsif !ticket_check && !height_check
          "Sorry. " + not_enough_tickets + " " + not_tall_enough
        end
      end
    
      def meets_requirements
        ticket_check, height_check = false
        if self.user.tickets >= self.attraction.tickets
          ticket_check = true
        end
        if self.user.height >= self.attraction.min_height
          height_check = true
        end
        return [ticket_check, height_check]
      end
    
      def start_ride
        new_happiness = self.user.happiness + self.attraction.happiness_rating
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new_ticket = self.user.tickets - self.attraction.tickets
        self.user.update(
          :happiness => new_happiness,
          :nausea => new_nausea,
          :tickets => new_ticket
        )
        "Thanks for riding the #{self.attraction.name}!"
      end
    
      def not_enough_tickets
        "You do not have enough tickets to ride the #{self.attraction.name}."
      end
    
      def not_tall_enough
        "You are not tall enough to ride the #{self.attraction.name}."
      end

end
