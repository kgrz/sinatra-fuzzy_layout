# Sinatra::FuzzyLayout

Enable or Disable `layout.<extension>` via regex.

How many times did you wished you could do something like this:

```ruby

class App < Sinatra::Base
  
  register Sinatra::FuzzyLayout

  enable_layout_for "home", :admin
  disable_layout_for /.+_reports/

  get '/' do
    haml :index             # layout.haml is used
  end

  get '/admin' do
    haml :admin             # layout.haml is used
  end

  get '/home' do
    haml :home              # layout.haml is used
  end

  get '/system_reports' do
    haml :system_reports    # layout.haml is not used.
  end

end
```

Never? 

k.


## Installation

Run this:

    gem install 'sinatra-fuzzy_layout'

Or, if your use bundler like the pros, add this line to 
your application's Gemfile:

    gem 'sinatra-fuzzy_layout'

And then execute:

    $ bundle

## Usage

Once the gem is installed, add this in your app file:

    require 'sinatra/fuzzy_layout'


#### Classic Style

Once you `require` the gem, you can define the `enable_layout_for` and/or 
`disable_layout_for` end-points

#### Modular Style

An additional step in case of Modular style apps is :

```ruby
require "sinatra/fuzzy_layout" # just like in classic style

class App < Sinatra::Base

  register Sinatra::FuzzyLayout

  enable_layout_for :a_template
end
```

Done.

## How it works

(Note: if you use a different templating engine like `slim` or `erb`, 
replace all instances of `haml` with that engine here on)

When the app encounters a `haml :view` in a route, 
it tries to render that view by reading the `view.haml` file and checking 
to see if a `layout` option is defined. This usually is set at a global 
level in the app `set :haml, :layout => false` or set on a per-route 
basis `haml :view, :layout => false`. If the layout is required, then the 
`layout.haml` is also parsed and the `view.haml` part is added to the 
layout. 

This extension lets you define the layout options at a global level. 
It modifies the `render` method in `Sinatra::Templates` so that the templates 
are checked against the regexes defined and the layout option is set 
(or unset) based on the result.


A template is first validated against the `enable_layouts_for` options. If the 
`enable_layouts_for` directive is not defined in the app however, the check 
only happens against `disable_layouts_for`. If the first check returns true, 
i.e., if the layout is enabled for that template, the second check never 
happens. This means that if you define a template in both the 
`enable_layouts_for` and `disable_layouts_for` directives, the layout gets enabled 
since the first check returns true.

Typically, only one template is used in each route (duh!). This means 
that the regex checks happen only one in the best case and 
twice in the worst case and so should not affect performance by a large 
margin. However, if you are writing at webscale, you might want to skip 
this.

Even if you use this plugin, it won't interfere with the normal Sinatra 
layout directives (global and per-route) and so, you can mix-and-match if 
you're into it. If you're still uncertain whether or not to use it, but 
want to, I'd say go ahead.


## Contributing

Lulz. Really?

Okay.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
