class Contact < ApplicationMailer
    def say_hello_to(user)
        @user = user
        mail to:@user.email, subject:"您好！！"
    end
end
