class Batch::SendDailyMail
  def self.send
    DailyMailer.send_daily_mail_to_user.deliver
  end
end