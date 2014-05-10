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

let’s refine the definition of the price to have eight digits of signifi- cance and two digits after the decimal point. [code]()