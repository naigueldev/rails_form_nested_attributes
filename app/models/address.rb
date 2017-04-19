class Address < ApplicationRecord
  belongs_to :user,  required: false
  # validates_presence_of :city

  # def self.import(file)
  #   CSV.foreach(file.path, headers: true) do |row|
  #     Address.create! row.to_hash
  #   end
  # end

  def self.import(file)
    CSV.foreach(file.path, headers: true, :header_converters => :symbol) do |row|
      player_hash = row.to_hash
      teamname = player_hash[:user]
      teamhash = User.where(:name => teamname).first
      hashid = teamhash.id
      player_newhash = player_hash.reject!{ |k| k == :user}
      player_newhash[:user_id] = hashid
      Address.create!(player_newhash)
    end
  end

  # def self.import(file)
  #   CSV.foreach(file.path, headers: true, :header_converters => :symbol) do |row|
  #     player_hash = row.to_hash
  #     player_newhash = player_hash.reject!{ |k| k == :user}
  #     player_newhash[:user_id] = find_team(player_hash[:user]).id
  #     Address.create!(player_newhash)
  #   end
  # end
  #
  #
  # def find_team(team_name)
  #   User.where(name: team_name).first
  # end

  # def self.import(file, category_id)
  #   CSV.foreach(file.path, headers: true) do |row|
  #     Model.where(
  #     :category_id => category_id,
  #     :name => row[1],
  #     :cap_id => row[10]
  #     ).first_or_create do |record|
  #       record.layout = row[3],
  #       record.manufacturer_id = Manufacturer.where(:name => row[0], :category_id => category_id).id
  #     end
  #   end


end
