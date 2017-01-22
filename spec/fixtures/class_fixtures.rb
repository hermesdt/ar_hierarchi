module ARHierarchi
  class AbstractActiveRecord < ActiveRecord::Base
    self.abstract_class = true
  end

  class User < AbstractActiveRecord
    has_one :address, class_name: 'User::Address'
    has_many :mobile_phones, class_name: 'User::MobilePhone'
    has_many :user_comissions, class_name: "UserCommission"
  end

  class User::Address < AbstractActiveRecord
    belongs_to :user
  end

  class User::MobilePhone < AbstractActiveRecord
    belongs_to :user
  end

  class Advertiser < AbstractActiveRecord
    has_many :user_comissions, class_name: 'UserCommission'
    has_many :users, through: :user_comissions
  end

  class UserCommission < AbstractActiveRecord
    belongs_to :user
    belongs_to :advertiser
  end
end