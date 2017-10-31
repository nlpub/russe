---
layout: default
title: RUSSE News
description: "Never miss any RUSSE announcements again."
keywords: news, semantics, RUSSE
layout: index
---

# News

{% for post in site.posts %}
<h2>{{ post.date | date: "%b %-d, %Y" }}: <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></h2>

{{ post.content | markdownify }}
{% endfor %}

Also, we have an [RSS feed]({{ "/feed.xml" | prepend: site.baseurl }}).
