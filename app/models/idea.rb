class Idea < ActiveRecord::Base
    validates :title,  presence: true
    validates :description, presence: true
    belongs_to :user, optional: true
    has_many :reviews, dependent: :destroy
end
