view: location_brand {
  sql_table_name: public.location_brand ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}."country_id" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."created_on" ;;
  }

  dimension: custom_config {
    type: string
    sql: ${TABLE}."custom_config" ;;
  }

  dimension: image {
    type: string
    sql: ${TABLE}."image" ;;
  }

  dimension: logo_url {
    type: string
    sql: ${TABLE}."logo_url" ;;
  }

  dimension_group: modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."modified_on" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: zubale_id {
    type: number
    sql: ${TABLE}."zubale_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
