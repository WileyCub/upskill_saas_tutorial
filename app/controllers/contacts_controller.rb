class ContactsController < ApplicationController
   def new
      @contact = Contact.new
   end 
   
   def create
      @contact = Contact.new(contact_params)
      if @contact.save
         redirect_to new_contact_path, notice: "Hey, thank you for your submission."
      else
         redirect_to new_contact_path, notice: "There was a problem with your submission."
      end
   end 
   
   private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end 
end