module ARHierarchi
  class RelationsExtractor

    def extract_relations klass
      klass.reflections.map do |relation, reflection|
        { type: reflection_type(reflection), name: relation, options: reflection.options, klass: reflection.klass }
      end
    end

    def reflection_type reflection
      if ActiveRecord::Reflection::ThroughReflection === reflection
        reflection = reflection.delegate_reflection
      end
      extract_reflection_type(reflection)
    end

    def extract_reflection_type reflection
      reflection.class.name.match(/ActiveRecord::Reflection::(\w+)Reflection/)[1].underscore
    end
  end
end
