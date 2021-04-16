view: location_store {
  sql_table_name: public.location_store ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}."active" ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}."address" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."country" ;;
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

  dimension: delegation_municipality_id {
    type: number
    sql: ${TABLE}."delegation_municipality_id" ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}."latitude" ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}."longitude" ;;
  }

  dimension: map_url {
    type: string
    sql: ${TABLE}."map_url" ;;
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

  dimension: neighborhood {
    type: string
    sql: ${TABLE}."neighborhood" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }

  dimension: point {
    type: string
    sql: ${TABLE}."point" ;;
  }

  dimension: retailer_id {
    type: number
    sql: ${TABLE}."retailer_id" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: store_number {
    type: string
    sql: ${TABLE}."store_number" ;;
  }

  dimension: timezone_id {
    type: number
    sql: ${TABLE}."timezone_id" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."zip" ;;
  }

  dimension: zubale_area_id {
    type: number
    sql: ${TABLE}."zubale_area_id" ;;
  }

  dimension: zubale_id {
    type: number
    sql: ${TABLE}."zubale_id" ;;
  }

  dimension: zubale_subarea_id {
    type: number
    sql: ${TABLE}."zubale_subarea_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
