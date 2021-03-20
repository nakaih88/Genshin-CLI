class Character

    attr_accessor :name, :url, :nation, :affiliation, :birthday, :constellation, :gender, :title, :title2, :title3

    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

end