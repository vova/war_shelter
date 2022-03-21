# frozen_string_literal: true

ActiveAdmin.register AdminUser, as: 'Coordinators' do
  menu priority: 3
  permit_params :email, :password, :password_confirmation,
                :name, :phone, :phone2, :country_id

  controller do
    def update_resource(object, attributes)
      attributes.each do |attr|
        if attr[:password].blank? && attr[:password_confirmation].blank?
          attr.delete :password
          attr.delete :password_confirmation
        end
      end

      super
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column 'Phone numbers' do |admin_user|
      "#{admin_user.phone}\n#{admin_user.phone2}"
    end
    column :country_id do |admin_user|
      admin_user.country&.code&.upcase
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
  filter :country_id,
         label: 'Country', as: :select,
         collection: lambda {
           Country.all.pluck(:name, :id)
         }
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone
      f.input :phone2
      f.input(
        :country_id,
        as: :select,
        collection: Country.all.pluck(:name, :id),
        include_blank: false
      )
      f.input :vaccination
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
