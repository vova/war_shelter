ActiveAdmin.register User do
  menu priority: 1

  permit_params(
    :email, :password, :password_confirmation, :status_id,
    :coordinator_id, :from, :destination, :adults, :kids, :kids_comment,
    :pets, :phone, :phone2, :geo, :accommodation_pref, :transport_id,
    :date_arrival, :request_id, :vaccination, :comment, :name
  )

  controller do
    def scoped_collection
      end_of_association_chain.includes(
        :user_status, :coordinator,
        :accommodation_type, :transport
      )
    end
  end

  filter :status_id,
         label: 'Status', as: :select,
         collection: lambda {
           UserStatus.all.pluck(:status, :id)
         }
  filter :coordinator_id,
         label: 'Coordinator', as: :select,
         collection: lambda {
           AdminUser.all.pluck(:email, :id)
         }
  filter :accommodation_pref,
         label: 'Accommodation', as: :select,
         collection: lambda {
           AccommodationType.all.pluck(:name, :id)
         }
  filter :transport_id,
         label: 'Transport', as: :select,
         collection: lambda {
           Transport.to_select_collection
         }
  filter :name
  filter :email
  filter :from
  filter :destination
  filter :adults
  filter :kids
  filter :pets
  filter :phone
  filter :phone2
  filter :vaccination
  filter :date_arrival

  index do
    id_column
    column :name
    column :email
    column :from
    column :destination
    column :adults
    column :kids
    column :kids_comment
    column :pets
    column :phone
    column :phone2
    column :geo
    column :vaccination
    column :comment
    column :status_id do |user|
      user.user_status.status
    end
    column :coordinator_id do |user|
      user.coordinator.email
    end
    column :accommodation_pref do |user|
      user.accommodation_type.name
    end
    column :transport_id do |user|
      user.transport.presentable_name
    end
    column :date_arrival do |user|
      user.date_arrival
    end
    actions
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs 'User' do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :from
      f.input :destination
      f.input :adults
      f.input :kids
      f.input :kids_comment
      f.input :pets
      f.input :phone
      f.input :phone2
      f.input :geo
      f.input :vaccination
      f.input :comment
      f.input :status_id, as: :select, collection: UserStatus.all.pluck(:status, :id)
      f.input :coordinator_id, as: :select, collection: AdminUser.all.pluck(:email, :id)
      f.input :accommodation_pref, as: :select, collection: AccommodationType.all.pluck(:name, :id)
      f.input(
        :transport_id,
        as: :select,
        collection: Transport.to_select_collection
      )
      f.input(
        :date_arrival,
        as: :datepicker,
        datepicker_options: { min_date: '2022-01-01' }
      )
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :from
      row :destination
      row :adults
      row :kids
      row :kids_comment
      row :pets
      row :phone
      row :phone2
      row :geo
      row :vaccination
      row :comment
      row :status_id do |user|
        user.user_status.status
      end
      row :coordinator_id do |user|
        user.coordinator.email
      end
      row :accommodation_pref do |user|
        user.accommodation_type.name
      end
      row :transport_id do |user|
        user.transport.presentable_name
      end
      row :date_arrival do |user|
        user.date_arrival
      end
    end

    active_admin_comments
  end
end
