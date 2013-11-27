# phplist

Api for phplist to subscribe to phplist.

## Installation

    $ gem install phplist
    
## Requirements

    1 - :domain => 'mailer.example.com' # Your Phplist domain url
    2 - :action => 'LCSub.php' # Your action php file
    3 - :password => 'xxxxxx' # Your phplist password which you have mentioned in LCSub.php
    4 - :ssl_enabled => false # Is ssl_enabled or not 

## Usage

You can use this by creating an instance:

    phplist = Phplist::API.new({:domain => 'mailer.example.com', :action => 'LCSub.php', :password => 'xxxxxx', :ssl_enabled => false})
    
You could set the values in an initializer file in your app (e.g. your_app_path/config/initializers/phplist.rb).

    Phplist::API.domain = 'mailer.example.com'
    Phplist::API.action = 'LCSub.php'
    Phplist::API.password = 'xxxxxx'
    Phplist::API.ssl_enabled = false
    
If you have added in initializer then you don't need to pass this as function parameters.
 
    phplist = Phplist::API.new
    
### Subscribe User to a list:
 
    phplist.subscribe({:id => list_id, :subscriber => {:email => 'name@email.com'}})
    
    
### Subscribe a batch of users:

    phplist.subscribe_list({:id => list_id, :subscribers => [{:email => 'name1@email.com'}, {:email => 'name2@email.com'}]})
    
### Subscribe multiple details:

You can also subscribe multiple details like name, city, country:

    phplist.subscribe({:id => list_id, :subscriber => {:email => 'name@email.com', :name => 'name', :city => 'city', :country => 'country'}})
    phplist.subscribe_list({:id => list_id, :subscribers => [{:email => 'name@email.com', :name => 'name', :city => 'city', :country => 'country'}, {:email => 'name2@email.com', :name => 'name2', :city => 'city2', :country => 'country2'}]})