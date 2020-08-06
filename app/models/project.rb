class Project < ApplicationRecord
    def donate(amount)
        self.total_donated + amount.to_i
    end
end
