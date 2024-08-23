# frozen_string_literal: true

class Rule < ApplicationRecord
  belongs_to :product

  enum rule_type: { NOT_OFFERED: "NOT_OFFERED", MINIMUM_AGE: "MINIMUM_AGE" }
end
