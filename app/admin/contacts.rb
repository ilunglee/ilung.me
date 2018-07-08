ActiveAdmin.register Contact do
  decorate_with Admin::ContactDecorator
  menu parent: 'inbox', priority: 1

  permit_params Contact.permitted_params

  config.sort_order = 'updated_at_asc'

  actions :all, except: %i[show]

  # INDEX
  filter :status,
         as: :select,
         collection:
          proc {
            Contact.statuses.map do |k, v|
              [Contact.human_attribute_name("statuses/#{k}"), v]
            end
          },
         input_html: { class: 'select2' }
  filter :name
  filter :email
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :name, :identifier
    column :status
    column :email
    column :updated_at
    actions
  end

  # FORM
  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    columns do
      column span: 8 do
        f.inputs do
          f.input :name
          f.input :email
          f.input :message, input_html: { rows: 3 }
        end

      end

      column span: 4 do
        f.inputs t(:status, scope: %i[active_admin panels]) do
          f.input :status,
                  input_html: { class: 'select2' }
        end
      end
    end

    hr
    f.actions
  end
end
