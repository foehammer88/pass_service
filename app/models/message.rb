class Message < ActiveRecord::Base
  attr_accessible :body, :from, :to, :ip
end
