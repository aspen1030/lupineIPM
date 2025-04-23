#' Format raw demographic data for survival modeling
#'
#' @param df A dataframe containing raw demographic data. The dataframe should
#'    contain columns titled "year", "surv_t1" and "area_t0" at minimum.
#'
#' @return A subsetted dataframe of individuals with known survival status.
#' @export
#'
#' @examples
#' x <- data.frame( year = c( 2000, 2000, 2001, 2001, 2002, 2002 ),
#'                  indiv = c( 1, 2, 1, 2, 1, 2 ),
#'                  area_t0 = c( 0.002, 0.01, 0.01, 0.05, 0.03, NA ),
#'                  surv_t1 = c( 1, 1, 1, 1, 0, NA ) )
#' setup_vr_surv( x )
setup_vr_surv <- function( df ){

  surv        <- subset( df, !is.na( surv_t1 ) ) %>%

    subset( area_t0     != 0 ) %>%
    dplyr::mutate( log_area_t0  = log( area_t0 ),
            year         = year + 1 ) %>%
    dplyr::mutate( log_area_t02 = log_area_t0^2,
            log_area_t03 = log_area_t0^3 )

  return( surv )

}
