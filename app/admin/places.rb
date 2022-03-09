ActiveAdmin.register Place do
  permit_params(
    :name, :accommodation_type_id, :city, :region, :rooms_available,
    :beds, :kids_beds, :is_pets_allowed, :capacity, :additional_child_place,
    :coordinator_id, :status, :price_per_day, :price_per_month, :currency,
    :address, :distance_from_center, :available_since, :available_till, :phone,
    :phone2, :is_realtor, :contact_name, :geo, :website, :comment, :floor, :is_newbuilding, :assigned_to
  )

  menu priority: 2

  controller do
    def scoped_collection
      end_of_association_chain.includes(
        :coordinator, :accommodation_type, :user
      )
    end
  end

  filter :content_matches,
         label: 'Global search by content',
         as: :string
  filter :coordinator_id,
         label: 'Coordinator', as: :select,
         collection: lambda {
           AdminUser.all.pluck(:name, :id)
         }
  filter :accommodation_type_id,
         label: 'Accommodation', as: :select,
         collection: lambda {
           AccommodationType.all.pluck(:name, :id)
         }
  filter :assigned_to,
         label: 'User', as: :select,
         collection: lambda {
           User.all.pluck(:name, :id)
         }
  filter :name
  filter :city
  filter :region
  filter :rooms_available
  filter :beds
  filter :kids_beds
  filter :is_pets_allowed
  filter :capacity
  filter :additional_child_place
  filter :status
  filter :price_per_day
  filter :price_per_month
  filter :currency
  filter :address
  filter :distance_from_center
  filter :available_since
  filter :available_till
  filter :phone
  filter :phone2
  filter :is_realtor
  filter :contact_name
  filter :geo
  filter :website
  filter :comment
  filter :floor
  filter :is_newbuilding

  index do
    id_column
    column :name
    column :city
    column :region
    column :rooms_available
    column :beds
    column :kids_beds
    column :is_pets_allowed
    column :capacity
    column :additional_child_place
    column :status
    column :price_per_day
    column :price_per_month
    column :currency do |place|
      place.currency&.upcase
    end
    column :address
    column :distance_from_center
    column :available_since
    column :available_till
    column :phone
    column :phone2
    column :is_realtor
    column :contact_name
    column :geo
    column :website
    column :comment
    column :floor
    column :is_newbuilding
    column :accommodation_type_id do |place|
      place.accommodation_type.name
    end
    column :coordinator_id do |place|
     "#{place.coordinator.name}\n#{place.coordinator.email}"
    end
    column :assigned_to do |place|
      place.user&.name
    end

    actions do |place|
      button_tag "Copy",
                 :type => "button",
                 :class => "copy_button",
                 :id => "clipboard-btn",
                 :data => {:clipboard_text => place.to_copy_format}
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs 'Place' do
      f.input :name
      f.input :city
      f.input :region
      f.input :address
      f.input :status
      f.input :is_realtor
      f.input :is_pets_allowed
      f.input :is_newbuilding
      f.input :contact_name
      f.input :phone
      f.input :phone2
      f.input :available_since, as: :datepicker, datepicker_options: { min_date: '2022-01-01' }
      f.input :available_till, as: :datepicker, datepicker_options: { min_date: '2022-01-01' }
      f.input :floor
      f.input :coordinator_id, as: :select, collection: AdminUser.all.pluck(:name, :id)
      f.input(
        :accommodation_type_id,
        as: :select,
        collection: AccommodationType.all.pluck(:name, :id),
        include_blank: false
      )
      f.input :rooms_available, min: 0
      f.input :beds, min: 0
      f.input :kids_beds, min: 0
      f.input :capacity
      f.input :additional_child_place
      f.input :price_per_day, min: 0
      f.input :price_per_month, min: 0
      f.input :currency, as: :select, collection: Place.currencies.values,  include_blank: false
      f.input :assigned_to, as: :select, collection: User.all.pluck(:name, :id)
      f.input :distance_from_center, min: 0
      f.input :geo
      f.input :website
      f.input :comment
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :city
      row :region
      row :rooms_available
      row :beds
      row :kids_beds
      row :is_pets_allowed
      row :capacity
      row :additional_child_place
      row :status
      row :price_per_day
      row :price_per_month
      row :currency do |place|
        place.currency&.upcase
      end
      row :address
      row :distance_from_center
      row :available_since
      row :available_till
      row :phone
      row :phone2
      row :is_realtor
      row :contact_name
      row :geo
      row :website
      row :comment
      row :floor
      row :is_newbuilding
      row :coordinator_id do |place|
        place.coordinator.name
      end
      row :accommodation_type_id do |place|
        place.accommodation_type.name
      end
      row :assigned_to do |place|
        place.user&.name
      end
    end

    active_admin_comments
  end
end
