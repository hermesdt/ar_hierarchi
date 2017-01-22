require './lib/class_finder'
require './lib/relations_extractor'
require './lib/printer'

module ARHierarchi
  class << self
    def get_classes
      ClassFinder.new.get_descendants_of ActiveRecord::Base
    end

    def print_relations
      classes = get_classes
      relations = classes.inject({}) do |memo, klass|
        memo[klass] = RelationsExtractor.new.extract_relations klass
        memo
      end

      Printer.new.print_relations relations
    end
  end
end
