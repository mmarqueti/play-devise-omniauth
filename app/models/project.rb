class Project < ActiveRecord::Base
  attr_accessible :name, :description, :start_at
end
