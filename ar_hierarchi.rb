require './lib/config'
require './lib/class_finder'

module ARHierarchi
  class << self
    def configure &block
      config = configuration
      block.call config
      config.extra_conditions ||= lambda { true }
    end

    def configuration
      Config.instance
    end
  end
end