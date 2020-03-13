class Startup
attr_accessor :name, :domain
attr_reader :founder

@@all = []

    def initialize(founder, name, domain)
        @founder = founder
        @name = name
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end 

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(name)
        all.find {|startup| startup.founder == name}
    end

    def self.domains
        all.map {|startup| startup.domain}
    end

    def sign_contract(vc, type, inv)
        new_round = FundingRound.new(type, self, vc, inv)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.sum {|round| round.inv}
    end

    def investors
        i_array = funding_rounds.map {|round| round.vc}
        i_array.uniq
    end

    def big_investors
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end
end
