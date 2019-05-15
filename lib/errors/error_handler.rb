module ErrorHandler
  class FileNotFound < StandardError

    def message
      "It seems that path to file is wrong"
    end


    def self.validate_presence_of_file(path)
      raise FileNotFound unless File.file?(path)
    end

  end
end