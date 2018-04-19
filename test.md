---
layout: home
---

{% capture next_seven_days %}
{{ "now" | date: "%Y-%m-%d" }},
{{ "now" | date: "%s" | plus: 86400 | date: "%Y-%m-%d" }},
{{ "now" | date: "%s" | plus: 172800 | date: "%Y-%m-%d" }},
{{ "now" | date: "%s" | plus: 259200 | date: "%Y-%m-%d" }},
{{ "now" | date: "%s" | plus: 345600 | date: "%Y-%m-%d" }},
{{ "now" | date: "%s" | plus: 432000 | date: "%Y-%m-%d" }},
{{ "now" | date: "%s" | plus: 518400 | date: "%Y-%m-%d" }}
{% endcapture %}

{% assign next_seven_days = next_seven_days | split: ',' %}

{% for day in next_seven_days %}
{% assign this_date = day | date: "%Y-%m-%d"%}
## {{ day | date: "%a %d %B"}}
{% for film in site.films %}
{% for screening in film.screenings %}
{% assign film_date = screening.date | date: "%Y-%m-%d" %}
{% if film_date == this_date %}
{{ film_date | date: "%I.%M%p" }} | **{{film.title}}** <span class="certificate">({{film.certificate}})</span> {% for label in screening.labels %}<span class=" label label--{{ label | downcase | replace:' ','' | replace:'&','-' }}">{{ label }}</span>{% endfor %}

{% endif %}
{% endfor %}
{% endfor %}
{% endfor%}