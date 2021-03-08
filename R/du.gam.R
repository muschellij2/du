#' @rdname disk_usage
#' @export
#'
#' @examples
#' library(mgcv)
#' dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
#' b <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat)
#' disk_usage(b, dat)
#'
#'
#' dat <- gamSim(1, n = 25000, dist = "normal", scale = 20)
#' bs <- "cr"
#' k <- 12
#' b <- bam(y ~ s(x0, bs = bs) + s(x1, bs = bs) + s(x2, bs = bs, k = k) +
#'            s(x3, bs = bs),
#'          data = dat[sample(nrow(dat), size = 10000),])
#' disk_usage(b, dat)
disk_usage.gam = function(object, full_data) {
  # beauty if doing this is that any data that's not used for model
  # is automatically dropped (NA/etc)
  outdf = object$model
  result = cross_reference_data(outdf, full_data)

  used_cols = colnames(outdf)
  mat = du_matrix(full_data, used_cols, result$indata) * 1

  return(mat)
}




