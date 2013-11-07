class User < ActiveRecord::Base
  has_many :invites, dependent: :destroy
  has_many :hosted_events, foreign_key: "host_id", class_name: "Event"
  has_many :events, :through => :invites

  def self.find_or_create_by_csv_string(csv_string)
    users = csv_string.split(",").collect{|g| g.strip}
    users.collect do |user_name|
      User.find_or_create_by(:name => user_name.split(" ").map(&:capitalize).join(" "))
    end
  end
end
