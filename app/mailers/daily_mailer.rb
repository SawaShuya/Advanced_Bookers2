class DailyMailer < ApplicationMailer

  default from: "hogehoge@example.com"

  def send_daily_mail_to_user
    mail(
      subject: "本日のトピック", #メールのタイトル
      to: User.pluck(:email) #宛先
    ) do |format|
      format.html
    end
  end
end
