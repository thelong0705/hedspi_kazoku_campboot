ActiveAdmin.register Company do
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
    permit_params   :name,
                    :address,
                    :representative_name,
                    :representative_role,
                    :foundation,
                    :vietnam_representative,
                    :business_content,
                    :code_language,
                    :work_time,
                    :work_hour,
                    :appeal,
                    :other,
                    :picture
        
    config.per_page = 10 
    index do
        selectable_column
        id_column
        column :name
        column :foundation
        column :vietnam_representative
        column :business_content
        column :code_language
        column :work_time
        column :work_hour
        column :picture do |company|
            image_tag company.picture.thumb.url
        end
        actions
    end
    
    show do
        attributes_table do
            row :name
            row :address
            row :representative_name
            row :representative_role
            row :foundation
            row :vietnam_representative
            row :business_content
            row :code_language
            row :work_time
            row :work_hour
            row :appeal
            row :other
            row :picture do |company|
                image_tag company.picture.thumb.url
            end
        end
    end
    
    form do |f|
        para "* are required fields."
        f.semantic_errors
        f.inputs 'Basic Information' do
            f.input :name, :required => true
            f.input :address, :required => true
            f.input :representative_name, :required => true
            f.input :representative_role, :required => true
            f.input :vietnam_representative, as: :boolean
            f.input :foundation, :required => true, as: :date_select, :start_year => 1900
            f.input :business_content, :required => true, as: :text
            f.input :code_language, :required => true
            f.input :work_time, :required => true
            f.input :work_hour, :required => true
            f.input :appeal, as: :text
            f.input :other
            f.input :picture, as: :file
        end
        f.actions
    end
    
    filter :name
    filter :vietnam_representative, as: :check_boxes
    filter :business_content
    filter :code_language
    filter :work_time
    filter :work_hour
end
