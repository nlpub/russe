---
layout: default
---

<div class="columns">
<div class="column is-two-thirds">
{{ content }}
</div>
<div class="column">
<h2>Recent News</h2>
<ul>
{% for post in site.posts limit:5 %}
<li>
<span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
  <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
</li>
{% endfor %}
</ul>
<p>We also offer an Atom <a href="{{ "feed.xml"  | prepend: site.baseurl }}">feed</a>.</p>
</div>
</div>
