class AddAvatarColumnsToQualityinventories < ActiveRecord::Migration
   def self.up
    add_attachment :qualityinventories, :avatar
  end

  def self.down
    remove_attachment :qualityinventories, :avatar
  end
end
