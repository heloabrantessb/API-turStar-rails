class PackageDestination < ApplicationRecord
  belongs_to :package
  belongs_to :destination
end
