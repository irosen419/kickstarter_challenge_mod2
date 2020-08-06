class Project < ApplicationRecord
    def donate(amount)
        self.total_donated + amount.to_i
    end

    def goal_met?
        self.total_donated >= self.goal
    end
end
