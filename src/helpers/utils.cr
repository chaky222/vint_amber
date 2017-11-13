module Utils
  def self.arr_i8(x : Array(T)) forall T
    x.map { |v| v.to_i8 }
  end
end
