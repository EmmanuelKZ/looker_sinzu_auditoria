connection: "zubale_-_zombie"

datagroup: sinzu_auditoria_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sinzu_auditoria_default_datagroup

include: "/views/**/*.view"

explore: sinzu_auditoria_store {
  from: location_store

  join: retail {
    from: location_retailer
    type: left_outer
    relationship: many_to_one
    sql_on: ${sinzu_auditoria_store.retailer_id} = ${retail.id} ;;
  }

  join: company {
    from: location_company
    type: left_outer
    relationship: many_to_one
    sql_on: ${company.id} = ${retail.company_id} ;;
  }

  join: submissionmetadata {
    from: submission_submissionmetadata
    type: inner
    relationship: one_to_many
    sql_on: ${submissionmetadata.store_id} = ${sinzu_auditoria_store.id} AND ${submissionmetadata.approved} = 'Yes' AND
      ${submissionmetadata.brand_id} = 282;;
  }

  join: skudata {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    sql_on: ${skudata.meta_data_id} = ${submissionmetadata.id} AND ${skudata.name_string} NOT LIKE '74%'
      AND ${skudata.name_string} != 'TAREA' AND ${skudata.name_string} != 'MARCA';;
  }

  join: front {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${front.sku_id} = ${skudata.id} AND ${front.key} = 'frentes' ;;
  }

  join: price {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${price.sku_id} = ${skudata.id} AND ${price.key} = 'precio' ;;
  }

  join: expired {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${expired.sku_id} = ${skudata.id} AND ${expired.key} = 'caducadas' ;;
  }

  join: availability {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${availability.sku_id} = ${skudata.id} AND ${availability.key} = 'disponibilidad' ;;
  }

  join: shalves {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${shalves.sku_id} = ${skudata.id} AND ${shalves.key} = 'anaqueles' ;;
  }

  join: shalves_picture {
    from: submission_submissionimage
    type: left_outer
    relationship: one_to_one
    sql_on: ${shalves_picture.id} = ${shalves.value}::integer ;;
  }

  join: comment_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${comment_data.meta_data_id} = ${submissionmetadata.id} AND ${comment_data.name_string} = 'MARCA';;
  }
  join: comment {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${comment.sku_id} = ${comment_data.id} AND ${comment.key} = 'comentario' ;;
  }

  join: exhibitions_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${exhibitions_data.meta_data_id} = ${submissionmetadata.id} AND ${exhibitions_data.name_string} = 'TAREA' ;;
  }

  join: exhibitions {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${exhibitions.sku_id} = ${exhibitions_data.id} AND ${exhibitions.key} = 'exhibiciones_foto';;
  }

  join: exhibitions_picture {
    from: submission_submissionimage
    type: left_outer
    relationship: one_to_one
    sql_on: ${exhibitions_picture.id} = ${exhibitions.value}::integer ;;
  }

  join: picture_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${picture_data.meta_data_id} = ${submissionmetadata.id} AND ${picture_data.name_string} = 'TAREA' ;;
  }


  join: picture {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${picture.sku_id} = ${picture_data.id} AND ${picture.key} = 'foto_foto';;
  }

  join: picture_picture {
    from: submission_submissionimage
    type: left_outer
    relationship: one_to_one
    sql_on: ${picture_picture.id} = ${picture.value}::integer ;;
  }



}
