view: provider {
  sql_table_name: qpp.provider ;;

  dimension: npi {
    type: string
    sql: ${TABLE}.npi ;;
  }

  dimension: org_state {
    type: string
    sql: ${TABLE}.org_state ;;
  }

  dimension: part_b_claims_total {
    type: number
    sql: ${TABLE}.part_b_claims_total ;;
  }

  dimension: patient_count {
    type: number
    sql: ${TABLE}.patient_count ;;
  }

  dimension: specialty {
    type: string
    sql: ${TABLE}.specialty ;;
  }

  dimension: tin {
    type: number
    sql: ${TABLE}.tin ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
