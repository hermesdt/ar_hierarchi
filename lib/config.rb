require 'singleton'

module ARHierarchi
  class Config
    include Singleton

    attr_accessor :extra_conditions
  end
end