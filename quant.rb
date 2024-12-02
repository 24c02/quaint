# QUick Airtable Navigation Tool

class Base
  attr_accessor :name, :id, :_api_key, :record_types

  def initialize(name)
    @name = name
    @record_types = []
  end

  def api_key(key)
    @_api_key = key
  end

  def base_id(id)
    @id = id
  end

  def record_type(name, &block)
    record_type = RecordType.new(name, id)
    @record_types << record_type
    record_type.instance_eval(&block)
  end

end

class RecordType
  attr_accessor :name, :table_id, :searchable_columns, :parent_base

  def initialize(name, parent_base)
    @name = name
    @searchable_columns = []
    @parent_base = parent_base
  end

  def table(id)
    @table_id = id
  end

  def searchable_column(key:, name:)
    @searchable_columns << { key: key, name: name }
  end

  def tag(col)
    "#{parent_base}_#{name.downcase}_#{col}"
  end
end

class Quant
  attr_reader :bases

  def initialize(&block)
    @bases = []
    instance_eval(&block)
  end

  def base(name, &block)
    base = Base.new(name)
    @bases << base
    base.instance_eval(&block)
  end

end