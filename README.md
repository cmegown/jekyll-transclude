# jekyll-transclude

A while back I created [an issue in the official Jekyll repository](https://github.com/jekyll/jekyll/issues/6789) to start a discussion around adding [transclusion](https://en.wikipedia.org/wiki/Transclusion) to the native `include` tag. The idea being that there are cases where you need to pass a block of formatted content to the included file, rather than just a simple string. While this is possible with [capture blocks](https://shopify.github.io/liquid/tags/variable/#capture), this method relies on consistently using the same capture-include pattern in every instance, which seems prone to error.

I recommend reading through the issue thread but the feedback was essentially this: good idea for a new tag via plugin. Ok, great! Let's give it a shot:

* Create a new `transclude` block tag.
* This new tag will have the exact same functionality as `include`.
* This new tag will allow a block of formatted content to be passed to the target file.
* A new variable will be created to define a "transclusion slot" in the target file (e.g. `transclude_content`).

Proposed syntax:

```
{% transclude example.html %}
  <select>
    <option>Select...</option>
    <option>Alpha</option>
    <option>Bravo</option>
    <option>Charlie</option>
  </select>
{% endtransclude %}
```

## Links

* [Original issue filed with Jekyll maintainers](https://github.com/jekyll/jekyll/issues/6789)
* [Jekyll's documentation on tags](https://jekyllrb.com/docs/plugins/tags/)
* Reference for Jekyll's [`highlight` tag](https://github.com/jekyll/jekyll/blob/587111ec9f3e5a2d6d2dc60ce8b0ec651ded27b7/lib/jekyll/tags/highlight.rb) and [`include` tag](https://github.com/jekyll/jekyll/blob/587111ec9f3e5a2d6d2dc60ce8b0ec651ded27b7/lib/jekyll/tags/include.rb)
