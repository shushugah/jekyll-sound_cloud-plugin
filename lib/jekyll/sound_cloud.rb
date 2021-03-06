require 'shellwords'
# require 'jekyll/sound_cloud/version'

module Jekyll
  module SoundCloud
    class SoundCloudTag < Liquid::Tag
      BASE_URL= "https://player.soundcloud.com/player.swf?url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F".freeze

      def initialize(tag_name, markup, tokens)
        super
        params = Shellwords.shellwords markup
        @sound = { :id => params[0], :widget => params[1] || 'html5', :color => params[2] || 'ff7700', :size => params[3] || 'medium' }
      end

      def render(context)
        case @sound[:widget]

        when 'html5'
          "<iframe width='100%' height='166' scrolling='no' frameborder='no' src='https://w.soundcloud.com/player/?url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F#{@sound[:id]}&show_artwork=true'></iframe>"
        when 'flash'
          "<object height='81' width='100%'><param name='movie' value='#{BASE_URL + @sound[:id]}&amp;show_comments=false&amp;auto_play=false&amp;color=#{@sound[:color]}'></param><param name='allowscriptaccess' value='always'></param><embed allowscriptaccess='always' height='81' src='#{BASE_URL + @sound[:id]}&amp;show_comments=false&amp;auto_play=false&amp;color=#{@sound[:color]}' type='application/x-shockwave-flash' width='100%'></embed></object>"
        when "mini"
          "<object height='18' width='100%'><param name='movie' value='#{BASE_URL + @sound[:id]}&amp;auto_play=false&amp;player_type=tiny&amp;font=Arial&amp;color=#{@sound[:color]}'></param> <param name='allowscriptaccess' value='always'></param> <param name='wmode' value='transparent'></param><embed wmode='transparent' allowscriptaccess='always' height='18' src='#{BASE_URL + @sound[:id]}&amp;auto_play=false&amp;player_type=tiny&amp;font=Arial&amp;color=#{@sound[:color]}' type='application/x-shockwave-flash' width='100%'></embed></object>"
        when "artwork"
          "<object height='#{dimension}' width='#{dimension}'><param name='movie' value='#{BASE_URL + @sound[:id]}&amp;auto_play=false&amp;player_type=artwork&amp;color=#{@sound[:color]}'></param><param name='allowscriptaccess' value='always'></param><embed allowscriptaccess='always' height='220' src='#{BASE_URL + @sound[:id]}&amp;auto_play=false&amp;player_type=artwork&amp;color=#{@sound[:color]}' type='application/x-shockwave-flash' width='220'></embed></object>"
        when "playlist"
          "<iframe width='100%' height='450' scrolling='no' frameborder='no' src='#{BASE_URL + @sound[:id]}&amp;color=%23ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;show_teaser=true'></iframe>"
        else
          ''
        end
      end

      private

      def dimension(size)
        case @sound[:size]

        when 'small'
          220
        when 'medium'
          300
        when 'large'
          425
        else
          0
        end
      end
    end
  end
end

Liquid::Template.register_tag('soundcloud', Jekyll::SoundCloud::SoundCloudTag)
