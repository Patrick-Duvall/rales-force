class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

    def self.find_all(search_params)
      self.where(search_params).order(:id)
    end

    def self.random
      self.pluck(:id).sample
    end

    def self._exists(scope)
      "EXISTS(#{scope.to_sql})"
    end

    def self._not_exists(scope)
      "NOT #{_exists(scope)}"
    end


end
