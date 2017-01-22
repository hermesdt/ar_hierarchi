require 'forwardable'

module ARHierarchi
  class Printer
    extend Forwardable

    def initialize device = STDOUT
      @device = device
    end

    def_delegator :@device, :puts

    def print_relations data
      data.each do |klass, relations|
        print_relation klass, relations
      end
    end

    def print_relation klass, relations
      puts klass.name
      relations.each do |relation|
        options = relation[:options]
        options = "" if options == {}

        puts "\\- #{relation[:type]} #{relation[:name]} (#{relation[:klass]}) #{options}"
      end
      puts ""
    end
  end
end
