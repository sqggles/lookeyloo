view: perf_query_daily {
  derived_table: {
    sql: SELECT
          DATE(s.createdat) as created_day,
          p.part_b_claims_total as claims_total,
          p.patient_count,
          'US-' + p.org_state as org_state,
          p.specialty,
          s.ia_score,
          s.aci_score,
          s.quality_score,
          s.cost_score,
          s.total_score,
          'success' as status,
          1 as ct,
          count(*) over (partition by org_state) as state_ct,
          (1.0*sum(case when s.total_score > 0 then 1 else 0 end) over (partition by org_state)/count(*) over (partition by org_state)) as state_succ
      FROM qpp.submission s
      LEFT JOIN qpp.provider p
      ON p.npi = s.npi and p.tin = s.tin
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: created_day {
    type: date
    sql: ${TABLE}.created_day ;;
  }

  dimension: claims_total {
    type: number
    sql: ${TABLE}.claims_total ;;
  }

  dimension: patient_count {
    type: number
    sql: ${TABLE}.patient_count ;;
  }

  dimension: org_state {
    type: string
    sql: ${TABLE}.org_state ;;
  }

  dimension: specialty {
    type: string
    sql: ${TABLE}.specialty ;;
  }

  measure: ia_score {
    type: average
    drill_fields: [detail*]
    sql: ${TABLE}.ia_score ;;
  }

  measure: aci_score {
    type: average
    sql: ${TABLE}.aci_score ;;
  }

  measure: quality_score {
    type: average
    drill_fields: [detail*]
    sql: ${TABLE}.quality_score ;;
  }

  measure: cost_score {
    type: average
    drill_fields: [detail*]
    sql: ${TABLE}.cost_score ;;
  }

  measure: total_score {
    type: average
    drill_fields: [detail*]
    sql: ${TABLE}.total_score ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: ct {
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.ct ;;
  }

  measure: state_ct {
    type: number
    sql: ${TABLE}.state_ct ;;
  }

  measure: state_succ {
    type: average
    sql: ${TABLE}.state_succ ;;
  }

  set: detail {
    fields: [
      created_day,
      claims_total,
      patient_count,
      org_state,
      specialty,
      ia_score,
      aci_score,
      quality_score,
      cost_score,
      total_score,
      status,
      ct,
      state_ct,
      state_succ
    ]
  }
}
