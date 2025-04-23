test_that("setup_vr_surv() subsets only individuals with survival information", {
  expect_equal( setup_vr_surv( data.frame( year = c(1,1,2,2,3,3),
                                           area_t0 = c(1,1,1,1,1,1),
                                           surv_t1 = c(1,1,1,0,0,NA) ) ),
                data.frame( year = c(2,2,3,3,4),
                            area_t0 = c(1,1,1,1,1),
                            surv_t1 = c(1,1,1,0,0),
                            log_area_t0 = c(0,0,0,0,0),
                            log_area_t02 = c(0,0,0,0,0),
                            log_area_t03 = c(0,0,0,0,0) ) )
})

test_that("setup_vr_surv() subsets only individuals with area not equal to 0", {
  expect_equal( setup_vr_surv( data.frame( year = c(1,1,2,2,3,3),
                                           area_t0 = c(1,1,1,1,1,0),
                                           surv_t1 = c(1,1,1,1,0,0) ) ),
                data.frame( year = c(2,2,3,3,4),
                            area_t0 = c(1,1,1,1,1),
                            surv_t1 = c(1,1,1,1,0),
                            log_area_t0 = c(0,0,0,0,0),
                            log_area_t02 = c(0,0,0,0,0),
                            log_area_t03 = c(0,0,0,0,0) ) )
})

test_that("setup_vr_surv() changes the value of the year", {
  expect_equal( setup_vr_surv( data.frame( year = c(1,1,2,2,3,3),
                                           area_t0 = c(1,1,1,1,1,1),
                                           surv_t1 = c(1,1,1,1,1,1) ) ),
                data.frame( year = c(2,2,3,3,4,4),
                            area_t0 = c(1,1,1,1,1,1),
                            surv_t1 = c(1,1,1,1,1,1),
                            log_area_t0 = c(0,0,0,0,0,0),
                            log_area_t02 = c(0,0,0,0,0,0),
                            log_area_t03 = c(0,0,0,0,0,0) ) )
})

test_that("setup_vr_surv() adds log_area_t0, the square, and the cube", {
  expect_equal( setup_vr_surv( data.frame( year = c(1,1,2,2,3,3),
                                           area_t0 = c(1,2,3,4,5,6),
                                           surv_t1 = c(1,1,1,1,1,1) ) ),
                data.frame( year = c(2,2,3,3,4,4),
                            area_t0 = c(1,2,3,4,5,6),
                            surv_t1 = c(1,1,1,1,1,1),
                            log_area_t0 = c(log(1),log(2),log(3),log(4),log(5),log(6)),
                            log_area_t02 = c(log(1)^2,log(2)^2,log(3)^2,log(4)^2,log(5)^2,log(6)^2),
                            log_area_t03 = c(log(1)^3,log(2)^3,log(3)^3,log(4)^3,log(5)^3,log(6)^3) ) )
})

test_that("setup_vr_surv() errors if survival column is missing", {
  expect_error( setup_vr_surv( data.frame( year = c(1,1,2,2,3,3),
                                           area_t0 = c(1,2,3,4,5,6) ) ) )
})

test_that("setup_vr_surv() errors if year column is missing", {
  expect_error( setup_vr_surv( data.frame( surv_t1 = c(1,1,1,1,1,1),
                                           area_t0 = c(1,2,3,4,5,6) ) ) )
})

test_that("setup_vr_surv() errors if area column is missing", {
  expect_error( setup_vr_surv( data.frame( surv_t1 = c(1,1,1,1,1,1),
                                           year = c(1,1,2,2,3,3) ) ) )
})

test_that("setup_vr_surv() errors if year column is non-numeric", {
  expect_error( setup_vr_surv( data.frame( year = c("A",1,2,2,3,3),
                                           area_t0 = c(1,2,3,4,5,6),
                                           surv_t1 = c(1,1,1,1,1,1) ) ) )
})

test_that("setup_vr_surv() errors if area column is non-numeric", {
  expect_error( setup_vr_surv( data.frame( year = c(1,1,2,2,3,3),
                                           area_t0 = c("A",2,3,4,5,6),
                                           surv_t1 = c(1,1,1,1,1,1) ) ) )
})
