class ContactsController < ApplicationController
    require 'mail_form'
    def new
        @contact = Contact.new
    end
    
    def create
       @contact = Contact.new(params[:contact])
       @contact.request = request 
        if @contact.deliver
           redirect_to home, notice: 'Message sent successfully'
        else
            render :action => 'new', alert:'Message is undeliverable'
        end
    end

    private

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end  
end