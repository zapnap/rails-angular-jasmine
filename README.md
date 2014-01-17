# Rails + Angular + Jasmine Example

Illustrates how to setup and organize a vanilla Rails backend application to
leverage Angular.js with a full Jasmine test suite.

Uses jasmine-rails, guard, and angularjs-rails.

Browse the Coffeescript example code in `app/assets/javascripts/app` and
compare with the specs found in `spec/javascripts`. Pay particular attention
to the spec helper setup in `spec/javascripts/spec_helper.coffee`.

Run the combined test suite via Guard:

    bundle
    bundle exec guard
