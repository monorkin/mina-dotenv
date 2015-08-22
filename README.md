# Mina-dotenv

:black_circle: [Dotenv](https://github.com/bkeepers/dotenv) plugin for mina.

Alleviate the need to SSH to your server and setup an `.env` file manually there. This plugin simply copies your local `.env` to your server :yum:

## Installation

To use it in your project's deployment process install this gem with the following command:

```bash
gem install mina-dotenv
```

Add the following line to your `deploy.rb` script:

```Ruby
require 'mina/dotenv'
```

This enables you to use the `dotenv:push` task in your deploy script.

To automatically push your `.env` file to the server add this line to your `deploy` task:

```Ruby
invoke :'dotenv:push'
```

## Configuration

Your development machine and your server will often need different keys to run your app. Therefore a `:dotenv_location` variable exist to define which `.env` file to push to the server.

__Important:__ The `:dotenv_location` defaults to `.env`

To change which `.env` file to push add this line your `deploy.rb` file:

```Ruby
set :dotenv_location, '.server_env'
```

## Example deploy script

```Ruby
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
require 'mina/dotenv' # <---- Added this line

set :domain, 'my-page.com'
set :deploy_to, '/home/deploy/www/...'
set :repository, 'https://github.com/...'
set :branch, 'master'
set :dotenv_location, '.server_env' # <--- Added this line

...

desc "Deploys the current version to the server."
task :deploy => :environment do
  to :before_hook do
  end

  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'dotenv:push' # <----- Added this line
    invoke :'bundle:install'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
    end
  end
end
```

## What it does

### Tasks

#### Push

The push task will look for the '.env' file specified in the `:dotenv_location` variable. If found it will copy it's content and echo it to an `.env` file located in the `shared` folder location you your app's deploy location. And symlink it to the root of the newest release.

If no local `.env` file is found a blank one will be created on the server.
