# frozen_string_literal: true

ActiveAdmin.register Transport do
  permit_params :name, :company_transfer
end
