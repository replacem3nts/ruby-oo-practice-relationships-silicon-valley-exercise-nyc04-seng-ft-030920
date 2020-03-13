class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end


    def self.all
        @@all
    end

    def self.tres_commas_club
        all.select {|fund| fund.total_worth >= 1_000_000_000}
    end

    def offer_contract(startup, type, inv)
        new_round = FundingRound.new(type, startup, self, inv)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.vc == self}
    end

    def portfolio
        funding_rounds.map {|round| round.startup}
    end

    def biggest_investment 
        funding_rounds.max {|round| round.inv}
    end

    def invested(domain)
        domain_array = Startup.all.select {|startup| startup.domain == domain}
        funding_rounds.select {|round| domain_array.include?(round.startup)}
    end
end
