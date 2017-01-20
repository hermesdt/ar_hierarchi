module ARHierarchi
  class ClassFinder

    def get_descendant_of base_class = Object
      base_class.descendants.map do |descendant|

        next if descendant == base_class
        next if descendant == base_class.superclass
        next if !descendant.is_a?(Class)
        next if !Config.instance.extra_conditions.call descendant

        descendant
      end.compact
    end

  end
end
