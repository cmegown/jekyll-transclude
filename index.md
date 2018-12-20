---
layout: default
---

# Preamble

A while back I created [an issue in the official Jekyll repository](https://github.com/jekyll/jekyll/issues/6789) to start a discussion around adding [transclusion](https://en.wikipedia.org/wiki/Transclusion) to the native `include` tag. The reason for this is that I ran into cases where I needed to pass a block of formatted content/markup to the included file, rather than just a simple string. While this is possible with [capture blocks](https://shopify.github.io/liquid/tags/variable/#capture) it relies on consistently using the exact same capture/include pattern in every instance, which seems very prone to error.

I would recommend reading through the issue thread but the feedback was essentially this: good idea for a new plugin. Ok, great! I've never written a line of Ruby in my life but nobody else has volunteered to start working on it so let's give it a shot. To do:

* Create a new `transclude` block tag.
* This new tag will have the exact same functionality as `include` (and probably `include_relative`).
* This new tag will allow a block of formatted content and/or markup to be passed verbatim to the target file.
* A new variable will be created to define a "transclude slot" in the target file (e.g. `transclude_content`).

Here's the proposed syntax:

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

## Example: standard `include` with simple string parameters

{%
  include figure.html
  src="https://placehold.it/512x288"
  alt="This should succinctly describe the image."
  caption="This caption is a simple string."
%}

## Example: standard `include` with simple HTML in parameters

{%
  include figure.html
  src="https://placehold.it/512x288"
  alt="Don't forget to add descriptive alt text!"
  caption="<em>This caption is italicized.</em>"
%}

Note: when I originally filed the issue this particular ability did not exist.

## Proposal: new `transclude` block tag

{% transclude component-sample.html %}
  <select>
    <option>Select...</option>
    <option>Alpha</option>
    <option>Bravo</option>
    <option>Charlie</option>
  </select>
{% endtransclude %}

