module Hold
  module InMemory
    class ObjectCell < InMemory::Cell
      include Hold::ObjectCell

      def get
        @value && @value.dup
      end

      def get_property(property_name)
        @value && @value[property_name]
      end

      def set_property(property_name, value)
        fail EmptyConflict unless @value
        @value[property_name] = value
      end

      def clear_property(property_name)
        fail EmptyConflict unless @value
        @value.delete(property_name)
      end

      def property?(property_name)
        fail EmptyConflict unless @value
        @value.key?(property_name)
      end
      alias_method :has_property?, :property?
    end
  end
end
