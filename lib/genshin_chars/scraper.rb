class Scraper

    RELATIVE_URL = "https://genshin-impact.fandom.com/"

    def self.scrape_characters
        html = open("https://genshin-impact.fandom.com/wiki/Category:Playable_Characters")
        doc = Nokogiri::HTML(html)
        doc.css("li.category-page__member").each do | char |
            name = char.css('a').text.strip
            url = char.css('a').attr("href").value

            Character.new(name, url)
        end
    end


    def self.scrape_ind_characters(char)
        html = open(RELATIVE_URL+char.url)
        doc = Nokogiri::HTML(html)

        char.title = doc.css("div[data-source='title']").text.strip
        char.title2 = doc.css("div[data-source='title2']").text.strip
        char.title3 = doc.css("div[data-source='title3']").text.strip
        char.nation = doc.css("div[data-source='region']").text.strip
        char.affiliation = doc.css("div[data-source='affiliation']").text.strip
        char.birthday = doc.css("div[data-source='birthday']").text.strip
        char.constellation = doc.css("div[data-source='constellation']").text.strip
        char.gender = doc.css("div[data-source='sex']").text.strip
    end


end