ActiveAdmin.register Recruit do
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
permit_params :company_id, :work_type, :employee_no, :workplace, :applicable_student,
:job_description, :personality_desired, :japanese_level, :english_level, :status
end
