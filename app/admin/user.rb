ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  selectable_column
  id_column
  column :email
  column :status
   column "confirm" do |user|
    link_to "confirmation", url_for(:action => :enable1, :id => user.id), :method => :get
  end

  column "ip_comm" do |user|
    link_to "addipcomm", url_for(:action => :enable, :id => user.id), :method => :get
  end
   column "remove ip_comm" do |user|
    link_to "removeipcomm", url_for(:action => :enable3, :id => user.id), :method => :get
  end
  column :user_type
  column :isipcomm
  actions

end


member_action :enable, :method => :get do
  faculty = User.find(params[:id])
  count= User.where.not(isipcomm: false).count
  
  	if faculty.user_type == "Faculty"
    	faculty.isipcomm = 1
    	faculty.save
    else
		flash[:notice] = "Only faculty can be ip comm!" 
	end
  
  redirect_to :action => :index
end
member_action :enable3, :method => :get do
  faculty = User.find(params[:id])
  count= User.where.not(isipcomm: false).count
  if count<=3
		flash[:notice] = "Ip comm cannot less than 3!" 
  else 
    
  end
  	faculty.isipcomm = 0
    faculty.save
  redirect_to :action => :index
end
member_action :enable1, :method => :get do
  user = User.find(params[:id])
	if user.status == 0
		user.status=1
		user.save
	else
		flash[:notice] = "User already approved!"  
  end
  redirect_to :action => :index
end
end