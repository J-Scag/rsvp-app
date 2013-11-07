class Event < ActiveRecord::Base
  has_many :invites
  belongs_to :host, class_name: "User"
  has_many :guests, :through => :invites, source: "user"

  def host_name
    self.host.name if self.host
  end

  def host_name=(set_host)
    self.host = User.find_or_create_by(:name => set_host)
  end

  def guest_list
  end

  def guest_list=(guests)
    User.find_or_create_by_csv_string(guests).each do |guest|
      self.add_guest(guest)
    end
  end

  def add_guest(guest)
    self.guests << guest
  end

end
