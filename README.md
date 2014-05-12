## Creating a Demo Application

	> cd work
	demo> rails new demo

Running rails server should show WEBrick as server (default)

	demo> rails server
	=> Booting WEBrick
	=> Rails 4.0.0 application starting in development on http://0.0.0.0:3000 => Run `rails server -h` for more startup options
	=> Ctrl-C to shutdown server
	[2013-04-18 20:22:16] INFO WEBrick 1.3.1
	[2013-04-18 20:22:16] INFO ruby 2.0.0 (2013-02-24) [x86_64-linux] [2013-04-18 20:22:16] INFO WEBrick::HTTPServer#start: pid=25170 port=3000

Otherwhise we can run

	demo> rails server webrick

Now we need code for a controller and a view, and we need a route to connect the two. (no data -> no model)

	demo> rails generate controller Say hello goodbye

We have created a controller named say which support the hello and goodbye actions.

## Creating the Depot application

Let's create a new app

	rails new depot

let’s create the model, views, controller, and migration for our products table.

	rails generate scaffold Product \
         title:string description:text image_url:string price:decimal

let’s refine the definition of the price to have eight digits of significance and two digits after the decimal point. 

* SHA: f607d2f6bb2abec26430017784fbc2b4e13ab10d

execute migration

	> rake db:migrate

populate the db editing the seeds.rb (* SHA: f32de1eb2f745e09350c80d9270e7c4cf5f16c4b) file and executing 

	rake db:seed

add validations to product model and tests for the product controller and the model and then run

	rake test:models


We’ve already created the products controller, used by the seller to administer the Depot application. Now it’s time to create a second controller, one that interacts with the paying customers. Let’s call it Store.
	
	> rails generate controller Store index

edit config/routes.rb to make /store/index the root of our website

	root 'store#index', as: 'store'

Implement the cart and the line item.
To add a column to a model (quantity to line_item in this case)

	> rails generate migration add_quantity_to_line_items quantity:integer

we can easily roll back our migration with a single command.

	> rake db:rollback

Rails provides a handy rake task to allow you to check the status of your
migrations.

	rake db:migrate:status

Create the order feature:

	> rails generate scaffold Order name address:text email pay_type
	> rails generate migration add_order_to_line_item order:references
	> rake db:migrate

How to access to db

	> sqlite3 -line db/development.sqlite3
	> select * from orders;
	> select * from line_items;

create an atom feed for the taken orders and then try it yourself by typing

	> curl --silent http://localhost:3000/products/3/who_bought.atom

Implement the mailer and set the configurations in config/environment.rb apply to both test and deploy


	> rails generate mailer OrderNotifier received shipped

When you create a model or controller, Rails creates the corresponding unit or functional tests. Integration tests are not automatically created, however, but you can use a generator to create one.

	rails generate integration_test user_stories
