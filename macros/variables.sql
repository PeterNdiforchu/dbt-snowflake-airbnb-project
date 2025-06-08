{% macro learn_variables() %}

-- Jinja Variables
{% set your_name_jinja = 'Alef' %}
{{ log("Hi " ~ your_name_jinja, info=True) }}

-- DBT Variables
-- dbt run-operation learn_variables --vars '{user_name: Alef}'
{{ log("Hi dbt user " ~ var("user_name", 'NO USERNAME IS SET!!') ~ "!", info=True) }}

{% endmacro %}