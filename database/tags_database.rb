class TagsDatabase

    def self.create(tag)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("INSERT INTO tag (id, name) VALUES (#{tag.id}, '#{tag.name}')")
        connection.close
    end

    def self.read(id)
        tag = {}
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("SELECT * FROM tag WHERE id = '#{id}'")
        results.each do |row|
            tag[:id] = row["id"].to_i
            tag[:name] = row["name"]
        end
        connection.close
        tag
    end

    def self.update(id, attr, value)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("UPDATE tag SET #{attr} = '#{value}' WHERE id = #{id}")
        connection.close
    end

    def self.delete(id)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("DELETE FROM tag WHERE id = '#{id}'")
        connection.close
    end

    
end