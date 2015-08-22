module Mina
  module Dotenv
    module Utils
      def self.read_file(file_path)
        return '' unless File.exist?(file_path)
        File.open(file_path, 'r').read
      end
    end
  end
end
