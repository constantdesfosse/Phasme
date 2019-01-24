class Contact < MailForm::Base
  attribute :Name,      :validate => true
  attribute :Phone,      :validate => /\A\d{10}\z/
  attribute :eMail,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :Message
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "Message sur Phasme-music.com",
      :to => "phasme.contact@gmail.com",
      :from => %("#{nom}" <#{email}>),
      :telephone => %("#{telephone}")
    }
  end
end
