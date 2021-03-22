class JobApplication < ApplicationRecord
belongs_to :job
belongs_to :applicant, :class_name => "User"
end
