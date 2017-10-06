view: submission {
  sql_table_name: qpp.submission ;;

  dimension: submission_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.submission_id ;;
  }

  dimension: aci_score {
    type: number
    sql: ${TABLE}.aci_score ;;
  }

  dimension: cost_score {
    type: number
    sql: ${TABLE}.cost_score ;;
  }

  dimension_group: createdat {
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
    sql: ${TABLE}.createdat ;;
  }

  dimension: entitytype {
    type: string
    sql: ${TABLE}.entitytype ;;
  }

  dimension: ia_score {
    type: number
    sql: ${TABLE}.ia_score ;;
  }

  dimension: npi {
    type: string
    sql: ${TABLE}.npi ;;
  }

  dimension: performanceyear {
    type: number
    sql: ${TABLE}.performanceyear ;;
  }

  dimension: programname {
    type: string
    sql: ${TABLE}.programname ;;
  }

  dimension: quality_score {
    type: number
    sql: ${TABLE}.quality_score ;;
    drill_fields: [submission_id, programname]
  }

  dimension: tin {
    type: number
    sql: ${TABLE}.tin ;;
  }

  measure: total_score {
    type: number
    sql: ${TABLE}.total_score ;;
  }

  dimension_group: updateat {
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
    sql: ${TABLE}.updateat ;;
  }

  measure: count {
    type: count
    drill_fields: [submission_id, programname, measurement.count]
  }
}
