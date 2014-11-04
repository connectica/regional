ActiveAdmin.register Region do

  permit_params :name, :description, :parent_id

  filter :name

  sidebar "Optional", only: [:show, :edit] do 
    ul do 
      li link_to "Add sub-region", new_admin_region_path(parent_id: region)
    end
  end

  index do
    column :id
    column :name
    column :description
    column :created_at
    column :updated_at
    column "Parent" do |region|
      link_to region.parent.name, admin_region_path(region.parent) if region.parent.present?
    end
    actions
  end

  show do 
    attributes_table do 
      row :id
      row :name
      row :description
    end

    panel "Sub-region" do 
      table_for region.children do
        column :id
        column :name
        column :description
        column "edit" do |children|
          link_to 'edit', edit_admin_region_path(children)
        end
      end
    end if region.has_children?
  end

  form do |f|
    f.inputs "Details" do 
      f.input :name
      f.input :description, as: :text
      if params[:parent_id].present?
        f.input :parent_id, as: :hidden, input_html: { value: params[:parent_id] }
      else
        f.input :parent_id, as: :hidden
      end
    end
    f.actions
  end
end
