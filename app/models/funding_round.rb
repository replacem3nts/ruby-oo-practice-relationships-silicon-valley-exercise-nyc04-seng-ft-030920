class FundingRound
    attr_reader :type, :startup, :vc, :inv

    @@all = []

    def initialize(type, startup, vc, inv)
        if !arg_check(type, inv)
            puts 'Invalid round type or investment amount.'
            puts "Please enter round type as string and float greater than zero."
            return
        else
            @type = type
            @startup = startup
            @vc = vc
            @inv = inv
            @@all << self
        end
    end

    def arg_check(type, inv)
        (type.class == String && inv.class == Float && inv > 0)
    end

    def self.all
        @@all
    end

    def inspect
        "#<#{startup.name}: #{inv} #{type} round from #{vc.name}>"
    end
end
