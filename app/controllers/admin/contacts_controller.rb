class Admin::ContactsController < AdminController
  def show
    @contact = Contact.find params[:id]
  end

  def index
    @contacts = Contact.all
  end
  
  def destroy
    @contact = Contact.find params[:id]
    @contact.destroy
    redirect_to "/admin/contacts"
  end

end
