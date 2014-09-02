#### Please take a look at the excellent [rails-assets](https://rails-assets.org/) project before using this gem!
icheck-rails
=======================

[![Gem Version](https://badge.fury.io/rb/icheck-rails.svg)](http://badge.fury.io/rb/icheck-rails)

[iCheck](http://damirfoy.com/iCheck/) is a library for creating super customized checkboxes and radio buttons with JQuery & Zepto.
This [Gem](http://rubygems.org/) packages iCheck for [Ruby](http://www.ruby-lang.org) on
[Rails'](http://rubyonrails.org/) [asset pipeline](http://guides.rubyonrails.org/asset_pipeline.html)

License: [MIT License](http://opensource.org/licenses/MIT) (just like iCheck)

Rails: 3.1 and up

This gem's major and minor version reflects the version of iCheck it packages (currently iCheck 1.0.2 is packaged by icheck-rails 1.0.2.0)

**Important**

*If you are upgrading from iCheck version 0.9, the `jquery.icheck.js` and `zepto.icheck.js` files was removed and now it is just `icheck.js`*

## Installation

Add this line to your application's Gemfile:

    gem 'icheck-rails'


And then execute:

    $ bundle


## Usage

Include the javascript part:

For Coffeescript

    #= require 'icheck'

For JavaScript

    //= require 'icheck'


Be sure to include JQuery or Zepto before requiring iCheck.

Include the style part:

iCheck includes several skins, most of them with multiple color schemes. Include them like this:

    @import 'icheck/square/blue'
    @import 'icheck/square/green'

or

    @import 'icheck/square/_all' //includes all color schemes

Some skins don't have multiple color schemes. Include them like this:

    @import 'icheck/futurico/futurico'

Then use markup like this:

```html
    <input type="checkbox" class='icheck-me' data-skin="square" data-color="blue">
```
With an initializer like this:

```javascript
function icheck(){
  if($(".icheck-me").length > 0){
    $(".icheck-me").each(function(){
      var $el = $(this);
      var skin = ($el.attr('data-skin') !== undefined) ? "_" + $el.attr('data-skin') : "",
      color = ($el.attr('data-color') !== undefined) ? "-" + $el.attr('data-color') : "";
      var opt = {
        checkboxClass: 'icheckbox' + skin + color,
        radioClass: 'iradio' + skin + color,
      }
      $el.iCheck(opt);
    });
  }
}

$(function(){
  icheck();
})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
