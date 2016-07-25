module GitFindCommitter
  class Response < Array
    def names(limit=nil)
      result = self.each_with_object([]) do |arr, result|
        result << arr[:name]
      end
      if limit.nil?
        result
      else
        result[0..(limit-1)]
      end
    end
  end
end
