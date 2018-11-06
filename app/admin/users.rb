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
    permit_params :name, :email, :gender, :school, :school_year,
                    :password, :password_confirmation
    config.per_page = 20
    actions :all, :except => [:edit]
    
    index do
        column :name
        column :email
        column :gender do |user|
            if user.gender == 0
                'Nam'
            else "Nữ"
            end        
        end
        column :school
        column :school_year
        actions
    end
    
    show do
        attributes_table do
            row :name
            row :email
            row :gender do |user|
                if user.gender == 0
                    'Nam'
                else "Nữ"
                end        
            end
            row :school
            row :school_year
            #row :picture do |user|
             #   image_tag user.picture.url
            #end
        end
    end
        
    form do |f|
        f.semantic_errors
        f.inputs 'Basic Information' do
            f.input :name
            f.input :email
            f.input :password, as: :password
            f.input :password_confirmation, as: :password
            f.input :gender, as: :select, :collection => ["Nam", "Nữ"]
            f.input :school
            f.input :school_year, as: :select, :collection => 1..5
        end
        f.actions
    end
    filter :name
    filter :email
    filter :school
    filter :school_year, as: :numeric
end
