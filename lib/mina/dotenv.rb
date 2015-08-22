require 'mina/dotenv/version'
require 'mina/dotenv/defaults'
require 'mina/dotenv/tasks'

module Mina
  module Dotenv
    def version
      Gem::Version.new VERSION::STRING
    end
    module_function :version
  end
end
