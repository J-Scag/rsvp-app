class Event < ActiveRecord::Base
  has_many :invites
  belongs_to :host, class_name: "User"
  has_many :users, :through => :invites

  def host_name
    self.host.name if self.host
  end

  def host_name=(set_host)
    self.add_user(User.find_or_create_by(:name => set_host))
  end

  def add_host(user)
    self.host.build(:name => user)
  end
end
