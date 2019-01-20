# Jekyll SoundCloud Plugin

A Jekyll plugin for embedding SoundCloud tracks in your Liquid templates.

## Installation
Add this to your Gemfile and `bundle install`
```ruby
gem 'jekyll'

group :jekyll_plugins do
  gem 'jekyll-sound_cloud'
end
```

## Usage:
```
    {% soundcloud_sound 256241332 %}
    {% soundcloud_sound 256241332 widgetname %}
    {% soundcloud_sound 256241332 widgetname ffffff %}
    {% soundcloud_sound 256241332 widgetname ffffff small %}
```
  `256241332` is a sample SoundCloud trackID, `widgetname` is the sound's visual representation, `ffffff` is the `color`, and `size` is the size (SoundCloud gives you three options for the artwork widget).

### Available SoundCloud widgets:

  * html5 (default)
  * *flash
  * *mini
  * *artwork

*Requires a paid SoundCloud tier

### Contributors
* @cnunciato -- original repository [here](https://github.com/cnunciato/jekyll-soundcloud)
* @shushugah
