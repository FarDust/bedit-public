class Reply < ApplicationRecord
    belongs_to(:commentary)
    belongs_to(:reply, :class_name => "Commentary")
end
