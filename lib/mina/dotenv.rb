require 'mina/dotenv/version'
require 'mina/dotenv/defaults'
require 'mina/dotenv/tasks'

module Mina
  module Dotenv
    def self.version
      Gem::Version.new VERSION::STRING
    end
  end
end
