ActiveAdmin.register AdminUser do
  decorate_with Admin::AdminUserDecorator

  menu false

  permit_params :first_name, :last_name,
                :avatar, :avatar_cache, :remove_avatar,
                :email, :password, :password_confirmation

  # INDEX
  filter :first_name
  filter :last_name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :updated_at
  filter :created_at

  index do
    selectable_column
    column :full_name, :identifier, sortable: :first_name
    column :email
    column :created_at
    actions(dropdown: true, dropdown_name: nil)
  end

  # SHOW
  show do
    panel do
      attributes_table_for resource do
        row :avatar
        row :full_name
        row :email
        row :current_sign_in_at
        row :sign_in_count
        row :updated_at
        row :created_at
      end
    end

    hr
    active_admin_comments
  end

  # FORM
  form multiple: true do
    if resource.new_record?
      form_section [:admin, resource], class: 'mb-3' do |f|
        f.semantic_errors(*f.object.errors.keys)
        f.inputs do
          f.input :avatar
          f.input :remove_avatar, as: :boolean
          f.input :avatar_cache, as: :hidden
          hr

          columns do
            column { f.input :first_name }
            column { f.input :last_name }
          end
          f.input :email

          columns do
            column do
              f.input :password,
                      hint: t('devise.shared.minimum_password_length',
                              count: AdminUser.password_length.min)
            end
            column { f.input :password_confirmation }
          end
        end

        hr
        f.actions
      end
    else
      div error_messages(resource), class: 'mb-4'

      form_section [:admin, resource], class: 'mb-3' do |f|
        f.inputs do
          f.input :avatar
          f.input :remove_avatar, as: :boolean
          f.input :avatar_cache, as: :hidden
          hr

          columns do
            column { f.input :first_name }
            column { f.input :last_name }
          end

          f.input :email
          f.actions
        end
      end

      form_section [:admin, resource] do |f|
        f.inputs t(:reset_password, scope: %i[active_admin panels]) do
          columns do
            column do
              f.input :password,
                      hint: t('devise.shared.minimum_password_length',
                              count: AdminUser.password_length.min)
            end
            column { f.input :password_confirmation }
          end
          f.actions
        end
      end
    end
  end
end
