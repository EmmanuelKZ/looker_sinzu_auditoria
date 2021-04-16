view: sku_manager_skudata {
  sql_table_name: public.sku_manager_skudata ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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

  dimension: meta_data_id {
    type: number
    sql: ${TABLE}."meta_data_id" ;;
  }

  dimension: name_string {
    type: string
    sql: ${TABLE}."name_string" ;;
  }

  dimension: sku_string {
    type: string
    sql: ${TABLE}."sku_string" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
