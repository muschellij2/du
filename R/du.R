#' General Data Usage
#'
#' @param ... a set of objects to obtain data usage.
#' @param full_data Full data that the data passed into \code{object}
#' was derived from
#'
#' @return A data matrix of percentages.
#' @export
#'
#' @examples
#' ## an example with offsets from Venables & Ripley (2002, p.189)
#' if (requireNamespace("MASS", quietly = TRUE)) {
#' utils::data(anorexia, package = "MASS")
#'
#' sub_anor = anorexia[anorexia$Prewt > 73,]
#'
#' anorex.1 <- glm(Postwt ~ Prewt + Treat + offset(Prewt),
#'                 family = gaussian, data = anorexia[anorexia$Prewt > 70.25,])
#' anorex.2 <- glm(Postwt ~ Prewt + offset(Prewt),
#'                 family = gaussian, data = anorexia)
#' du(anorex.1, anorex.2, sub_anor, full_data = anorexia)
#' library(ggplot2)
#' library(dplyr)
#' g = anorexia %>%
#'    filter(Prewt > 75 & Postwt < 100) %>%
#'    ggplot(aes(x = Prewt, y = Postwt, colour = Treat))
#' g2 = anorexia %>%
#'    ggplot(aes(x = Prewt, y = Postwt)) +
#'    geom_point() +
#'    geom_line(aes(size = Treat))
#' du(g, g2,  full_data = anorexia)
#' du(g, g2, anorex.1, anorex.2,  full_data = anorexia)
#' }
du <- function(..., full_data) {
  models = list(...)
  # loop over models and get the matrix, then take mean
  out = lapply(models, disk_usage, full_data = full_data)
  as.data.frame(Reduce(out, f = "+")/length(models))
}


#' Disk Usage of Specific Object
#'
#' @param object Different types, including \code{glm}, \code{ggplot}.
#' @param full_data Full data that the data passed into \code{object}
#' was derived from
#'
#' @return A binary data matrix.
#' @export
disk_usage = function(object, full_data) {
  UseMethod("disk_usage", object)
}

#' @export
#' @rdname disk_usage
disk_usage.default = function(object, full_data) {
  if ("data" %in% names(object)) {
    object = object$data
  }
  # beauty if doing this is that any data that's not used for model
  # is automatically dropped (NA/etc)
  result = cross_reference_data(object, full_data)

  used_cols = colnames(object)
  du_matrix(full_data, used_cols, result$indata)
}
