class Post < ApplicationRecord
    validates :title, :body,presence:true
    validates_uniqueness_of :title, on: :create, message: " the title must be unique"
end
