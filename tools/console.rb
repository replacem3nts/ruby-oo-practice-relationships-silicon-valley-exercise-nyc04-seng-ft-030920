require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("Elon M", "SpaceX", "Space")
startup2 = Startup.new("Mark Z", "Facebook", "Social Media")
startup3 = Startup.new("Jeff B", "Amazon", "Retail")

vc1 = VentureCapitalist.new("Sequoia", 1_000_000_000.0)
vc2 = VentureCapitalist.new("Benchmark", 750_000_000.0)
vc3 = VentureCapitalist.new("Union Square", 12_000_000_000.0)

round1 = FundingRound.new("Angel", startup1, vc2, 4_000_000.0)
round2 = FundingRound.new("Seed", startup1, vc3, 10_000_000.0)
round3 = FundingRound.new("Series A", startup1, vc1, 700_000_000.0)
round4 = FundingRound.new("Series B", startup2, vc3, 40_000_000.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line