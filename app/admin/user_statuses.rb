# frozen_string_literal: true

ActiveAdmin.register UserStatus do
  permit_params :status
end
