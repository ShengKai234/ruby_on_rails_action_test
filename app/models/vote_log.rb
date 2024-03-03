class VoteLog < ActiveRecord::Base
  belongs_to :candidate, counter_cache: true
end
