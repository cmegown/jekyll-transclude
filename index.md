---
layout: default
---

# Preamble

A while back I created [an issue in the official Jekyll repository](https://github.com/jekyll/jekyll/issues/6789) to start a discussion around adding [transclusion](https://en.wikipedia.org/wiki/Transclusion) to the native `include` tag. The idea being that there are cases where you need to pass a block of formatted content/markup to the included file, rather than just a simple string. While this is possible with [capture blocks](https://shopify.github.io/liquid/tags/variable/#capture) this method relies on consistently using the same capture/include pattern in every instance, which seems prone to error.

I would recommend reading through the issue thread but the feedback was essentially this: good idea for a new tag via new plugin. Ok, great! I've never written a line of Ruby in my life but let's give it a shot.

To do:

* Create a new `transclude` block tag.
* This new tag will have the exact same functionality as `include` (and probably `include_relative`).
* This new tag will allow a block of formatted content and/or markup to be passed verbatim to the target file.
* A new variable will be created to define a "transclude slot" in the target file (e.g. `transclude_content`).

Proposed syntax:

```
{% raw %}
{% transclude example.html %}
  <select>
    <option>Select...</option>
    <option>Alpha</option>
    <option>Bravo</option>
    <option>Charlie</option>
  </select>
{% endtransclude %}
{% endraw %}
```

## Example using a `capture` block with `include`

{% capture select %}
  <select>
    <option>Select...</option>
    <option>Alpha</option>
    <option>Bravo</option>
    <option>Charlie</option>
  </select>
{% endcapture %}

{% include component-include.html component=select %}

## Example using new `transclude` tag

Work in progress.

{% transclude component-transclude.html %}
  <select>
    <option>Select...</option>
    <option>Alpha</option>
    <option>Bravo</option>
    <option>Charlie</option>
  </select>
{% endtransclude %}
