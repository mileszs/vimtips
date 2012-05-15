class Tip
  include MongoMapper::Document

  key :body, String, :required => true, :length => 0..140
  key :tweeted_at, Time

  cattr_reader :per_page
  @@per_page = 10

  def self.untweeted
    where(:tweeted_at => nil).to_a
  end

  def self.tweeted
    where(:tweeted_at.ne => nil).to_a
  end

  def self.random
    untweeted.to_a[Kernel.rand(untweeted.size)]
  end

end
