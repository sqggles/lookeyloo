connection: "qpp_red"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: measurement {
  join: submission {
    type: left_outer
    sql_on: ${measurement.submission_id} = ${submission.submission_id} ;;
    relationship: many_to_one
  }

}

explore: provider {
  join: submission {
    type: left_outer
    sql_on: ${provider.npi} = ${submission.npi} AND ${provider.tin} = ${submission.tin} ;;
    relationship: many_to_one
  }

}

explore: submission {
  join: provider {
    type: left_outer
    sql_on: ${provider.npi} = ${submission.npi} AND ${provider.tin} = ${submission.tin} ;;
    relationship: many_to_one
  }
  join: measurement {
    type: left_outer
    sql_on: ${measurement.submission_id} = ${submission.submission_id} ;;
    relationship: many_to_one
  }

}

explore: perf_query_daily {}
