class Candidate < ActiveRecord::Base
    has_many :vote_logs, dependent: :destroy
end
