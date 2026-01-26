{% assign data = include.data %}

<ul>
{% for material in data.daily %}
<li style=" margin-bottom: 10px;">
    {% if material.week %}
        {{ material.day }} <span style="color: #0A9396;"> (week {{material.week}})</span>: {{ material.description }}
    {% else %}
        {{ material.day }}: {{ material.description }}
    {% endif %}
    {% if material.due %}
        <br><b>due: {{ material.due }}</b>
    {% endif %}
    {% if material.more %}
        <br>{{ material.more }}
    {% endif %}
    {% if material.handout %}
        <br><a href="{{ data.home }}/{{ material.handout }}">{{ material.handoutname }}</a>
    {% endif %}
    {% if material.slides %}
        <br><a href="{{ data.home }}/{{ material.slides }}">blank slides</a>
    {% endif %}
</li>
{% endfor %}
</ul>
