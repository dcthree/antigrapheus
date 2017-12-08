---
layout: default
---

[View this project on GitHub](https://github.com/dcthree/antigrapheus).

{% capture readme %}
{% include_relative README.md %}
{% endcapture %}

{{ readme | remove_first: "Antigrapheus" }}
