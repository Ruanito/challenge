# frozen_string_literal: true

class Product < ApplicationRecord
  has_and_belongs_to_many :categories, join_table: :products_categories
  has_many :rules

  scope :permitted_by_state_and_age, ->(state, age) do
    where
      .not(
        id: Rule.where(state: state, rule_type: :NOT_OFFERED)
                .or(Rule.where(state: state, rule_type: :MINIMUM_AGE, minimum_age: ...age)).map(&:product_id)
      )
  end

  scope :permitted_by_state, ->(state) do
    where.not(id: Rule.where(state: state, rule_type: :NOT_OFFERED))
  end
end
