ActiveAdmin.register Region do

  permit_params :name, :description, :parent_id, :kind


  filter :name
  filter :kind, as: :select

  sidebar "Optional", only: [:show, :edit] do 
    ul do 
      li link_to "Add Sub-Region", new_admin_region_path(parent_id: region)
    end
  end

  index do
    column :id
    column :name
    column :description
    column :kind do |region|
      status_tag region.kind
    end
    column "Parent" do |region|
      link_to region.parent.name, admin_region_path(region.parent) if region.parent.present?
    end
    column "Sub-Region" do |region|
      link_to "Add", new_admin_region_path(parent_id: region)
    end
    actions
  end

  show do 
    attributes_table do 
      row :id
      row :name
      row :kind
      row :description
      row :parent
    end

    panel "Sub-Region" do 
      table_for region.children do
        column :id
        column :name
        column :kind
        column :description
        column :parent
        column "edit" do |children|
          link_to 'edit', edit_admin_region_path(children)
        end
      end
    end if region.has_children?
  end

  form do |f|
    f.inputs "Details" do 
      f.input :parent_id, as: :select, input_html: { value: params[:parent_id].present? ? params[:parent_id] : nil }, collection: Region.all
      f.input :name
      f.input :kind, as: :select, collection: ["Fylke", "Distrikt", "Kommune", "By/Tettsted", "Bydel", "Gate"]
      f.input :description, as: :text
    end
    f.actions
  end
end
