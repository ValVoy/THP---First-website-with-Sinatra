require 'csv'

class Comment
  attr_accessor :gossip_id, :content

  def initialize(gossip_id, content)
    @gossip_id = gossip_id
    @content = content
  end

  def save
    CSV.open("./db/comment.csv", "ab") do |csv|
      csv << [@gossip_id, @content]
    end
  end

  def self.all_with_id(gossip_id_target)
    comments = []
    
    return [] unless File.exist?("./db/comment.csv")

    CSV.read("./db/comment.csv").each do |csv_line|
      if csv_line[0].to_i == gossip_id_target.to_i
        comments << Comment.new(csv_line[0], csv_line[1])
      end
    end
    return comments
  end
end