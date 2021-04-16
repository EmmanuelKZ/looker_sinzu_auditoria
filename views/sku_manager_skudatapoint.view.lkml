view: sku_manager_skudatapoint {
  sql_table_name: public.sku_manager_skudatapoint ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: image_id {
    type: number
    sql: ${TABLE}."image_id" ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}."key" ;;
  }

  dimension: sku_id {
    type: number
    sql: ${TABLE}."sku_id" ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}."value" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
