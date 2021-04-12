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
        :to => "x19222114@student.ncirl.ie",
        :from => %("#{name}" <#{email}>)
    }
    end
end