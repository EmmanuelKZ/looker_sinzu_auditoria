connection: "zubale_-_zombie"

datagroup: sinzu_auditoria_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sinzu_auditoria_default_datagroup

include: "/views/**/*.view"

access_grant: view_deprecated {
  user_attribute: view_deprecated
  allowed_values: ["yes"]
}

explore: sinzu_auditoria_store {
  required_access_grants: [view_deprecated]
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
    sql_on: ${skudata.meta_data_id} = ${submissionmetadata.id} AND ${skudata.name_string} NOT LIKE '75%'
      AND ${skudata.name_string} NOT LIKE '88%'
      AND ${skudata.name_string} != 'CONOCE'
      AND ${skudata.name_string} != 'MARCA'
      AND ${skudata.name_string} != 'ANAQUEL'
      AND ${skudata.name_string} != 'BENEFICIOS'
      AND ${skudata.name_string} != 'CONTESTÓ'
      AND ${skudata.name_string} != 'VENTA'
      AND ${skudata.name_string} != 'EXHIBIDOR ADICIONAL'
      AND ${skudata.name_string} != 'NO PONERLO'
      AND ${skudata.name_string} != 'PUNTO DE COMPRA';;
  }

  join: price {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${price.sku_id} = ${skudata.id} AND ${price.key} = 'precio' ;;
  }

  join: price_picture {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${price_picture.sku_id} = ${skudata.id} AND ${price_picture.key} = 'precio_foto' ;;
  }

  join: price_picture_2 {
    from: submission_submissionimage
    type: left_outer
    relationship: one_to_one
    sql_on: ${price_picture_2.id} = ${price_picture.value}::integer ;;
  }

  join: availability {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${availability.sku_id} = ${skudata.id} AND ${availability.key} = 'disponibilidad' ;;
  }

  join: personal {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    fields: [value,count]
    sql_on: ${personal.sku_id} = ${skudata.id} AND ${personal.key} = 'personal' ;;
  }

  join: packing {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${packing.sku_id} = ${skudata.id} AND ${packing.key} = 'especifica' ;;
  }

  join: know_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${know_data.meta_data_id} = ${submissionmetadata.id} AND ${know_data.name_string} = 'CONOCE' ;;
  }


  join: know {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${know.sku_id} = ${know_data.id} AND ${know.key} = 'especifica';;
  }

  join: personal_beneficiaries_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${personal_beneficiaries_data.meta_data_id} = ${submissionmetadata.id} AND ${personal_beneficiaries_data.name_string} = 'BENEFICIOS' ;;
  }


  join: personal_beneficiaries {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${personal_beneficiaries.sku_id} = ${personal_beneficiaries_data.id} AND ${personal_beneficiaries.key} = 'personal';;
  }

  join: personal_contest_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${personal_contest_data.meta_data_id} = ${submissionmetadata.id} AND ${personal_contest_data.name_string} = 'CONTESTÓ' ;;
  }


  join: personal_contest {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${personal_contest.sku_id} = ${personal_contest_data.id} AND ${personal_contest.key} = 'personal';;
  }

  join: specific_exhibitor_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${specific_exhibitor_data.meta_data_id} = ${submissionmetadata.id} AND ${specific_exhibitor_data.name_string} = 'EXHIBIDOR ADICIONAL' ;;
  }

  join: specific_exhibitor {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${specific_exhibitor.sku_id} = ${specific_exhibitor_data.id} AND ${specific_exhibitor.key} = 'especifica';;
  }

  join: exhibitor_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${exhibitor_data.meta_data_id} = ${submissionmetadata.id} AND ${exhibitor_data.name_string} = 'EXHIBIDOR ADICIONAL' ;;
  }

  join: exhibitor {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${exhibitor.sku_id} = ${exhibitor_data.id} AND ${exhibitor.key} = 'captura_foto';;
  }

  join: exhibitor_picture {
    from: submission_submissionimage
    type: left_outer
    relationship: one_to_one
    sql_on: ${exhibitor_picture.id} = ${exhibitor.value}::integer ;;
  }

  join: personal_putting_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${personal_putting_data.meta_data_id} = ${submissionmetadata.id} AND ${personal_putting_data.name_string} = 'NO PONERLO' ;;
  }

  join: personal_putting {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${personal_putting.sku_id} = ${personal_putting_data.id} AND ${personal_putting.key} = 'personal';;
  }

  join: personal_sale_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${personal_sale_data.meta_data_id} = ${submissionmetadata.id} AND ${personal_sale_data.name_string} = 'VENTA' ;;
  }

  join: personal_sale {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${personal_sale.sku_id} = ${personal_sale_data.id} AND ${personal_sale.key} = 'personal';;
  }

  join: specific_purchase_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${specific_purchase_data.meta_data_id} = ${submissionmetadata.id} AND ${specific_purchase_data.name_string} = 'PUNTO DE COMPRA' ;;
  }

  join: specific_purchase {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${specific_purchase.sku_id} = ${specific_purchase_data.id} AND ${specific_purchase.key} = 'especifica';;
  }

  join: shelves_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${shelves_data.meta_data_id} = ${submissionmetadata.id} AND ${shelves_data.name_string} = 'ANAQUEL' ;;
  }

  join: shelves {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${shelves.sku_id} = ${shelves_data.id} AND ${shelves.key} = 'captura_foto';;
  }

  join: shelves_picture {
    from: submission_submissionimage
    type: left_outer
    relationship: one_to_one
    sql_on: ${shelves_picture.id} = ${shelves.value}::integer ;;
  }

  join: personal_purchase_data {
    from: sku_manager_skudata
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${personal_purchase_data.meta_data_id} = ${submissionmetadata.id} AND ${personal_purchase_data.name_string} = 'PUNTO DE COMPRA' ;;
  }

  join: personal_purchase {
    from: sku_manager_skudatapoint
    type: left_outer
    relationship: one_to_one
    sql_on: ${personal_purchase.sku_id} = ${personal_purchase_data.id} AND ${personal_purchase.key} = 'personal';;
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



}
