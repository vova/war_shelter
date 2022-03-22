# frozen_string_literal: true

ActiveAdmin.register User do
  menu priority: 1

  permit_params(
    :email, :password, :password_confirmation, :status_id,
    :coordinator_id, :from, :destination, :adults, :kids, :kids_comment,
    :pets, :phone, :phone2, :geo, :accommodation_pref, :transport_id,
    :date_arrival, :request_id, :vaccination, :comment, :name, :region_id,
    :country_id
  )

  controller do
    def scoped_collection
      end_of_association_chain.includes(
        :user_status, :coordinator,
        :accommodation_type, :transport, :region, :country
      )
    end

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

  scope('Urgent to call') { |scope| scope.where(status_id: 1) }
  scope('Accommodated') { |scope| scope.where(status_id: 2) }
  scope('In office') { |scope| scope.where(status_id: 3) }
  scope('In trip') { |scope| scope.where(status_id: 4) }
  scope('At home') { |scope| scope.where(status_id: 5) }
  scope('No response') { |scope| scope.where(status_id: 6) }
  scope('Declined') { |scope| scope.where(status_id: 7) }

  scope('LVIV Destination') { |scope| scope.where(region_id: 2) }
  scope('TERNOPIL Destination') { |scope| scope.where(region_id: 3) }
  scope('CHERNIVTSI Destination') { |scope| scope.where(region_id: 4) }
  scope('IVANO-FRANKIVSK Destination') { |scope| scope.where(region_id: 5) }
  scope('UZHGOROD Destination') { |scope| scope.where(region_id: 6) }
  scope('OTHER Destination') { |scope| scope.where(region_id: 1) }

  filter :status_id,
         label: 'Status', as: :select,
         collection: lambda {
           UserStatus.all.pluck(:status, :id)
         }
  filter :coordinator_id,
         label: 'Coordinator', as: :select,
         collection: lambda {
           AdminUser.all.pluck(:name, :id)
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
  filter :region_id,
         label: 'Region', as: :select,
         collection: lambda {
           Region.all.pluck(:center, :id)
         }
  filter :country_id,
         label: 'Country', as: :select,
         collection: lambda {
           Country.all.pluck(:name, :id)
         }
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
    column :region_id do |user|
      user.region&.center
    end
    column :country_id do |user|
      user.country&.code&.upcase
    end
    column 'Base City for Country' do |user|
      user.country.default_city
    end
    column 'Time Zone' do |user|
      user.country.time_zone
    end
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
      user.user_status&.status
    end
    column :coordinator_id do |user|
      "#{user.coordinator.name}" "\n" "#{user.coordinator.email}"
    end
    column :accommodation_pref do |user|
      user.accommodation_type&.name
    end
    column :transport_id do |user|
      user.transport.presentable_name
    end
    column :date_arrival do |user| # rubocop:disable Style/SymbolProc
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
      f.input :status_id, as: :select, collection: UserStatus.all.pluck(:status, :id)
      f.input :coordinator_id, as: :select, collection: AdminUser.all.pluck(:name, :id)
      f.input(
        :accommodation_pref,
        as: :select,
        collection: AccommodationType.all.pluck(:name, :id),
        include_blank: false
      )
      f.input(
        :transport_id,
        as: :select,
        collection: Transport.to_select_collection,
        include_blank: false
      )
      f.input(
        :date_arrival,
        as: :datepicker,
        datepicker_options: { min_date: '2022-01-01' }
      )
      f.input :phone
      f.input :phone2
      f.input :from
      f.input :destination
      f.input(
        :region_id,
        as: :select,
        collection: Region.all.pluck(:center, :id),
        include_blank: false
      )
      f.input(
        :country_id,
        as: :select,
        collection: Country.all.pluck(:name, :id),
        include_blank: false
      )
      f.input :adults, min: 0
      f.input :kids, min: 0
      f.input :kids_comment
      f.input :pets
      f.input :vaccination
      f.input :geo
      f.input :comment
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :from
      row :destination
      row :region_id do |user|
        user.region.center
      end
      row :country_id do |user|
        user.country.name
      end
      row "Base City for #{user.country.code}" do |user|
        user.country.default_city
      end
      row "Time Zone for #{user.country.code}" do |user|
        user.country.time_zone
      end
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
      row :date_arrival do |user|  # rubocop:disable Style/SymbolProc
        user.date_arrival
      end
    end

    active_admin_comments
  end
end
