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
        column :address
        column :representative_name
        column :representative_role
        column :foundation
        column :vietnam_representative
        column :business_content
        column :code_language
        column :work_time
        column :work_hour
        column :appeal
        column :other
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
        f.semantic_errors
        f.inputs 'Basic Information' do
            f.input :name
            f.input :address
            f.input :representative_name
            f.input :representative_role
            f.input :foundation
            f.input :vietnam_representative
            f.input :business_content, as: :text
            f.input :code_language
            f.input :work_time
            f.input :work_hour
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
