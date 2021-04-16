view: submission_submissionmetadata {
  sql_table_name: public.submission_submissionmetadata ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: approved {
    type: yesno
    sql: ${TABLE}."approved" ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}."brand_id" ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}."comments" ;;
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

  dimension: image_count {
    type: number
    sql: ${TABLE}."image_count" ;;
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

  dimension: phone_number {
    type: string
    sql: ${TABLE}."phone_number" ;;
  }

  dimension: rejection_cause_id {
    type: number
    sql: ${TABLE}."rejection_cause_id" ;;
  }

  dimension: reviewed {
    type: yesno
    sql: ${TABLE}."reviewed" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."score" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}."store_id" ;;
  }

  dimension: submission_id {
    type: number
    sql: ${TABLE}."submission_id" ;;
  }

  dimension: task_id {
    type: string
    sql: ${TABLE}."task_id" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension: user_uuid {
    type: string
    sql: ${TABLE}."user_uuid" ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}."value" ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}."version" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
