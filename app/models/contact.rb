class Contact < MailForm::Base 

    include MailForm::Delivery
    
    # Validations for form
    attribute :name, :validate =>true
    attribute :email, :validate => /\A[^@\s]+@[^@\s]+\z/
    attribute :message, :validate => true
    attribute :nickname, :captcha => true #spambot
     attribute :subject, :validate => true

     # Method to send emails
    def headers 
        {
        :subject => :subject,
        :to => "a.selb121@gmail.com",
        :from => %("#{name}" <#{email}>)
    }
    end
end