view: submission_submissionimage {
  sql_table_name: public.submission_submissionimage ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: exif_data {
    type: string
    sql: ${TABLE}."exif_data" ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}."latitude" ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}."longitude" ;;
  }

  dimension: meta_data_id {
    type: number
    sql: ${TABLE}."meta_data_id" ;;
  }

  dimension: process_logs {
    type: string
    sql: ${TABLE}."process_logs" ;;
  }

  dimension: question_text {
    type: string
    sql: ${TABLE}."question_text" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."score" ;;
  }

  dimension: storage {
    type: string
    sql: ${TABLE}."storage" ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}."timestamp" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."url" ;;
  }

  dimension: url_link {
    type: string
    sql: CONCAT('http://jobs.zubale.com//aws/', ${url}) ;;
    html: <a href="{{ value }}" target="_blank">{{value}}</a> ;;
  }

  dimension: link {
    sql: ${url};;
    html: <a href=http://jobs.zubale.com//aws/{{value}} target="_blank">Photo</a> ;;
  }
  dimension: dimension_with_picture {
    type: string
    sql: ${url_link};;
    html:
      <details>
         <summary>Imagen</summary>
         <p>
          <a href={{value}} target="_blank">
          <img height="100" src="{{value}}"></img>
          </a>
        </p>
      </details>
 ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
