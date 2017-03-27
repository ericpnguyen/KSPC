class Email < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :inquiry,   :validate => true
  attribute :message,   :validate => true

  def headers
    {
      :subject => "Contact Form",
      :to => "kspc.auto@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
    end
end
