class PagesDatabase

    def self.create(page)
        # TODO - Config part
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("INSERT INTO page (id, name, slug) VALUES (#{page.id}, '#{page.name}', '#{page.slug}')")
        results = connection.query("INSERT INTO page_config (title, description, keywords, page_id) VALUES ('#{page.config.title}', '#{page.config.description}', '#{page.config.keywords}', #{page.id})")
        connection.close
    end

    def self.read(id)
        page = {}
        config = {}
         # TODO - Config part
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("SELECT * FROM page WHERE id = '#{id}'")
        config_results = connection.query("SELECT * from page_config where page_id = '#{id}'")
        results.each do |row|
            page[:id] = row["id"].to_i
            page[:name] = row["name"]
            page[:slug] = row["slug"]
        end
        config_results.each do |row|
            config[:title] = row["title"]
            config[:description] = row["description"]
            config[:keywords] = row["keywords"]
        end
        connection.close
        
        page[:config] = config
        page
    end

    def self.delete(id)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("DELETE FROM page WHERE id = '#{id}'")
        connection.close
    end

    
end