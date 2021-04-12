class JobApplication < ApplicationRecord
# Associations
    belongs_to :job
    belongs_to :applicant, :class_name => "User"
end
