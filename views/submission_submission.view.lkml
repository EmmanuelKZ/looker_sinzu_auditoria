view: submission_submission {
  sql_table_name: public.submission_submission ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}."brand_id" ;;
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

  dimension: form_type {
    type: string
    sql: ${TABLE}."form_type" ;;
  }

  dimension: form_url {
    type: string
    sql: ${TABLE}."form_url" ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}."phone_number" ;;
  }

  dimension: retailer_id {
    type: number
    sql: ${TABLE}."retailer_id" ;;
  }

  dimension: sheet_name {
    type: string
    sql: ${TABLE}."sheet_name" ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}."store_id" ;;
  }

  dimension: submission_data {
    type: string
    sql: ${TABLE}."submission_data" ;;
  }

  dimension: tab_name {
    type: string
    sql: ${TABLE}."tab_name" ;;
  }

  dimension: task_id {
    type: string
    sql: ${TABLE}."task_id" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, sheet_name, tab_name]
  }
}
