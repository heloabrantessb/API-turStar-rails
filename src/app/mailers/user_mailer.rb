class UserMailer < ApplicationMailer
        # app/mailers/user_mailer.rb
    class UserMailer < ApplicationMailer
      def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Bem-vindo ao nosso aplicativo!')
      end
    end
end
