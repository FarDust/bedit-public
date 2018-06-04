class Reply < ApplicationRecord
  belongs_to(:commentary)
  belongs_to(:response, class_name: 'Commentary')
end
