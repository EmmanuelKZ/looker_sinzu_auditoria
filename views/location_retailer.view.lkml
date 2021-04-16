view: location_retailer {
  sql_table_name: public.location_retailer ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}."company_id" ;;
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
