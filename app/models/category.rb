# frozen_string_literal: true

class Category < ApplicationRecord
  has_and_belongs_to_many :products, join_table: :products_categories
end
