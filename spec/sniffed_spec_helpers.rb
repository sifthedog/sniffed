# frozen_string_literal: true

module SniffedSpecHelpers
  def create_dog(first_name: "Sif", last_name: "The Dog")
    Models::ActiveRecord::Dog.create(first_name: first_name, last_name: last_name)
  end
end
