view: raw_data {
  derived_table: {
    sql: select lc.name as company,
      lr.name as retailer,
      ls.name as tienda,
      sm.created_on as date,
      json_extract_path_text(ss.submission_data::json, 'Especifica si el dependiente ''conoce'' la marca') AS conoce,
      json_extract_path_text(ss.submission_data::json, 'Indica si el personal conoce los ''beneficios'' de la marca') AS beneficios,
      json_extract_path_text(ss.submission_data::json, 'Indica si el personal ''contestó'' las preguntas con amabilidad') AS contestó,
      json_extract_path_text(ss.submission_data::json, 'Especifica si el ''exhibidor adicional'' está colocado') AS exhibidor_adicional,
      json_extract_path_text(ss.submission_data::json, 'Captura foto del ''exhibidor adicional''') AS exhibidor_adicional_2,
      json_extract_path_text(ss.submission_data::json, 'Si no está colocado, indica el motivo del personal para ''no ponerlo''') AS no_ponerlo,
      json_extract_path_text(ss.submission_data::json, 'Indica si el personal conoce el beneficio por ''venta'' de Sinzu') AS venta,
      json_extract_path_text(ss.submission_data::json, 'Especifica si el anaquel cuenta con material ''Punto de Compra''') AS Punto_de_Compra,
      json_extract_path_text(ss.submission_data::json, 'Captura foto del ''anaquel''') AS anaquel,
      json_extract_path_text(ss.submission_data::json, 'Si no está colocado, indica el motivo del personal para no poner ''Punto de compra''') AS Punto_de_Compra_2,
      json_extract_path_text(ss.submission_data::json, '¿Algún comentario adicional que la ''marca'' debería saber?') AS comentario
      from submission_submissionmetadata sm
      left join submission_submission ss on sm.submission_id = ss.id
      left join location_store ls on ls.id = sm.store_id
      left join location_retailer lr on lr.id = ls.retailer_id
      left join location_company lc on lc.id = lr.company_id
      where sm.brand_id = 282 and sm.approved = true
      order by date desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: company {
    type: string
    sql: ${TABLE}."company" ;;
  }

  dimension: retailer {
    type: string
    sql: ${TABLE}."retailer" ;;
  }

  dimension: tienda {
    type: string
    sql: ${TABLE}."tienda" ;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}."date" ;;
  }

  dimension: conoce {
    type: string
    sql: ${TABLE}."conoce" ;;
  }

  dimension: beneficios {
    type: string
    sql: ${TABLE}."beneficios" ;;
  }

  dimension: contest {
    type: string
    sql: ${TABLE}."contestó" ;;
  }

  dimension: exhibidor_adicional {
    type: string
    sql: ${TABLE}."exhibidor_adicional" ;;
  }

  dimension: exhibidor_adicional_2 {
    type: string
    sql: ${TABLE}."exhibidor_adicional_2" ;;
  }

  dimension: no_ponerlo {
    type: string
    sql: ${TABLE}."no_ponerlo" ;;
  }

  dimension: venta {
    type: string
    sql: ${TABLE}."venta" ;;
  }

  dimension: punto_de_compra {
    type: string
    sql: ${TABLE}."punto_de_compra" ;;
  }

  dimension: anaquel {
    type: string
    sql: ${TABLE}."anaquel" ;;
  }

  dimension: punto_de_compra_2 {
    type: string
    sql: ${TABLE}."punto_de_compra_2" ;;
  }

  dimension: comentario {
    type: string
    sql: ${TABLE}."comentario" ;;
  }

  set: detail {
    fields: [
      company,
      retailer,
      tienda,
      date_time,
      conoce,
      beneficios,
      contest,
      exhibidor_adicional,
      exhibidor_adicional_2,
      no_ponerlo,
      venta,
      punto_de_compra,
      anaquel,
      punto_de_compra_2,
      comentario
    ]
  }
}
