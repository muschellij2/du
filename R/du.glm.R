#' @rdname disk_usage
#' @export
#'
#' @examples
#' if (requireNamespace("MASS", quietly = TRUE)) {
#'   utils::data(anorexia, package = "MASS")
#'
#'   anorex.1 <- glm(Postwt ~ Prewt + Treat + offset(Prewt),
#'                   family = gaussian, data = anorexia[ anorexia$Prewt > 70.25,])
#'   disk_usage(anorex.1, full_data = anorexia)
#'   disk_usage(list(data = anorex.1$data), full_data = anorexia)
#' }
disk_usage.glm = function(object, full_data) {
  # beauty if doing this is that any data that's not used for model
  # is automatically dropped (NA/etc)
  outdf = stats::model.frame(object$formula, data = object$data)
  result = cross_reference_data(outdf, full_data)

  used_cols = colnames(outdf)
  mat = du_matrix(full_data, used_cols, result$indata) * 1

  return(mat)
}


#' @rdname disk_usage
#' @export
#' @examples
#' if (requireNamespace("MASS", quietly = TRUE)) {
#'   utils::data(anorexia, package = "MASS")
#'
#'   anorex.1 <- lm(Postwt ~ Prewt + offset(Prewt), data = anorexia)
#'   disk_usage(anorex.1, full_data = anorexia)
#'   disk_usage(list(model = anorex.1$model), full_data = anorexia)
#'
#' }
disk_usage.lm = function(object, full_data) {
  # beauty if doing this is that any data that's not used for model
  # is automatically dropped (NA/etc)
  outdf = object$model
  result = cross_reference_data(outdf, full_data)

  used_cols = colnames(outdf)
  mat = du_matrix(full_data, used_cols, result$indata) * 1

  return(mat)
}




