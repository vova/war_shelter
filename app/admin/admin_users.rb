ActiveAdmin.register AdminUser, as: "Coordinators" do
  menu priority: 3
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :email
    column 'Phone numbers' do |admin_user|
      "#{admin_user.phone}\n#{admin_user.phone2}"
    end
    column :vaccination
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :phone_or_phone2, as: :string
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone
      f.input :phone2
      f.input :vaccination
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
