view: measurement {
  sql_table_name: qpp.measurement ;;

  dimension: measurement_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.measurement_id ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: eligible_population {
    type: number
    sql: ${TABLE}.eligible_population ;;
  }

  dimension: eligible_population_exception {
    type: number
    sql: ${TABLE}.eligible_population_exception ;;
  }

  dimension: eligible_population_exclusion {
    type: number
    sql: ${TABLE}.eligible_population_exclusion ;;
  }

  dimension: is_end_to_end_reporting {
    type: yesno
    sql: ${TABLE}.is_end_to_end_reporting ;;
  }

  dimension: measure_id {
    type: string
    sql: ${TABLE}.measure_id ;;
  }

  dimension: measurement_set_id {
    type: string
    sql: ${TABLE}.measurement_set_id ;;
  }

  dimension_group: performance_end {
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
    sql: ${TABLE}.performance_end ;;
  }

  dimension: performance_met {
    type: number
    sql: ${TABLE}.performance_met ;;
  }

  dimension: performance_not_met {
    type: number
    sql: ${TABLE}.performance_not_met ;;
  }

  dimension: performance_rate {
    type: number
    sql: ${TABLE}.performance_rate ;;
  }

  dimension_group: performance_start {
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
    sql: ${TABLE}.performance_start ;;
  }

  dimension: reporting_rate {
    type: number
    sql: ${TABLE}.reporting_rate ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}.section ;;
  }

  dimension: submission_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.submission_id ;;
  }

  dimension: submission_method {
    type: string
    sql: ${TABLE}.submission_method ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: value_30_days_after_cost {
    type: number
    sql: ${TABLE}.value_30_days_after_cost ;;
  }

  dimension: value_93_days_prior_to_cost {
    type: number
    sql: ${TABLE}.value_93_days_prior_to_cost ;;
  }

  dimension: value_bool {
    type: yesno
    sql: ${TABLE}.value_bool ;;
  }

  dimension: value_denominator {
    type: number
    sql: ${TABLE}.value_denominator ;;
  }

  dimension: value_hospital_cost {
    type: number
    sql: ${TABLE}.value_hospital_cost ;;
  }

  dimension: value_numerator {
    type: number
    sql: ${TABLE}.value_numerator ;;
  }

  dimension: value_total_cost {
    type: number
    sql: ${TABLE}.value_total_cost ;;
  }

  dimension: value_total_patients {
    type: number
    sql: ${TABLE}.value_total_patients ;;
  }

  measure: count {
    type: count
    drill_fields: [measurement_id, submission.programname, submission.submission_id]
  }
}
