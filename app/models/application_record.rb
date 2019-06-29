class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

    def self.find_all(search_params)
      self.where(search_params).order(:id)
    end

    def self.random
      self.pluck(:id).sample
    end
end
