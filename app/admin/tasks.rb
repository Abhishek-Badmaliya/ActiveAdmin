ActiveAdmin.register Task do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :project_id, :admin_user_id, :title, :is_done, :due_date
  #
  # or
  #
  # permit_params do
  #   permitted = [:project_id, :admin_user_id, :title, :is_done, :due_date]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :project_id, :admin_user_id, :title, :is_done, :due_date

  scope :all, :default => true
  scope :due_this_week do |tasks|
    tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now)
  end
  scope :late do |tasks|
    tasks.where('due_date < ?', Time.now)
  end
  scope :mine do |tasks|
    tasks.where(:admin_user_id => current_admin_user.id)
  end
  
end
