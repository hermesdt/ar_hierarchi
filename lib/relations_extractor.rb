module ARHierarchi
  class RelationsExtractor

    def extract_reflection_type reflection
      reflection.class.name.match(/ActiveRecord::Reflection::(\w+)Reflection/)[1].underscore
    end

    def extract_relations klass
      klass.reflections.map do |relation, reflection|
        [relation, process_reflection(reflection)].flatten
      end
    end

    def process_reflection reflection
      if ActiveRecord::Reflection::ThroughReflection === reflection
        reflection = reflection.delegate_reflection
      end
      [extract_reflection_type(reflection), reflection.options]
    end
  end
end
