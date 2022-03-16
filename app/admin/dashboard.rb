# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Users to pay attention" do
          paginated_collection(User.to_pay_attention(current_admin_user).page(params[:page]).per(10), download_links: false) do
            table_for collection do |t|
              t.column('name') { |user| link_to(user.name, admin_user_path(user)) }
              t.column('email') { |user| user.email }
              t.column('status') { |user| user.user_status.status }
              t.column('people') { |user| "#{user.adults + (user.kids || 0)}total, #{user.kids || 0} kid(s)" }
              t.column('pets') { |user| user.pets }
              t.column('Phone numbers') { |user| user.phone + user.phone2 }
            end
          end
        end
      end
    end

    columns do
      panel "Places to pay attention" do
        paginated_collection(Place.to_pay_attention(current_admin_user).page(params[:page]).per(5), download_links: false) do
          table_for collection do |t|
            t.column('name') { |place| link_to(place.name, admin_place_path(place)) }
            t.column('city') { |place| place.city }
            t.column('region') { |place| place.region&.center }
            t.column('address') { |place| place.address }
            t.column('status') { |place| place.status }
            t.column('Accommodation type') { |place| place.accommodation_type }
            t.column('Capacity') { |place| place.capacity }
            t.column('Available since') { |place| place.available_since }
            t.column('Price per day') { |place| "#{place.price_per_day} #{place.currency.upcase}" }
            t.column('Price per month') { |place| "#{place.price_per_month} #{place.currency.upcase}" }
          end
        end
      end
    end
  end

  sidebar :statistics do
    "This is a placeholder for daily statistics.
    Places available:
    People to call:"
  end
end
