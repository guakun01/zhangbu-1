class UserMailer < ApplicationMailer
  def welcome_email(code)
    @code = code
    mail(to: "354929394@qq.com", subject: "hi, for test.")
  end
end
