ActiveAdmin.register Project do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title
  #
  # or
  #
  # permit_params do
  #   permitted = [:title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :title
  
  show :title => :title do
    panel "Tasks" do
      table_for project.tasks do |t|
        t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
        t.column("Title") { |task| link_to task.title, admin_task_path(task) }
        t.column("Assigned To") { |task| task.admin_user.email }
        t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
      end
    end
  end
end
