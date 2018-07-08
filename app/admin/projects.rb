ActiveAdmin.register Project do
  decorate_with Admin::ProjectDecorator

  menu label: proc { menu_label(Project.model_name.human(count: 2), icon: 'code-editor') },
       priority: 1

  permit_params Project.permitted_params

  config.sort_order = 'position_asc'

  actions :all, except: %i[show]

  # INDEX
  filter :position
  filter :title
  filter :description
  filter :devices
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :position
    column :title, :identifier, sortable: 'title'
    column :devices
    column :updated_at
    actions
  end

  # FORM
  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    columns do
      column span: 8 do
        f.inputs do
          f.input :title
          f.input :description, input_html: { rows: 3 }
          f.input :devices,
                  as: :select, multiple: true, collection: Project::DEVICES,
                  input_html: { class: 'select2', data: { 'select2-search': true } }
        end

        f.inputs t(:assets, scope: %i[active_admin panels project]) do
          f.input :browser
          f.input :mobile
          f.input :video
          f.input :background_color,
                  as: :color_picker
        end
      end

      column span: 4 do
        f.inputs t(:status, scope: %i[active_admin panels]) do
          f.input :position
        end
      end
    end

    hr
    f.actions
  end
end
