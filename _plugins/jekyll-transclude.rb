module Jekyll
  class TranscludeTag < Liquid::Block

    def render(context)
      "#{super}"
    end

  end
end

Liquid::Template.register_tag('transclude', Jekyll::TranscludeTag)
