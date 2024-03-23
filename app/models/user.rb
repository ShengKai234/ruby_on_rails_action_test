require 'digest'

class User < ActiveRecord::Base
    has_one :store
    
    validate :name_validator

    before_create :encrypt_email

    private
    def name_validator
        unless name.starts_with? 'Ruby'
            errors[:name] << "必須是 Ruby 開頭喔！"
        end
    end

    def encrypt_email
        self.email = Digest::MD5.hexdigest(email)
    end
end
