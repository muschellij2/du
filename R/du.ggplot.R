#' @rdname disk_usage
#' @export
disk_usage.ggplot = function(object = ggplot2::last_plot(), full_data) {

  used_data = object$data
  all_gdata = lapply(object$layers, `[[`, "data")
  if (any(sapply(all_gdata, NROW)) > 0) {
    warning("Layer data is not implemented for disk_usage")
  }

  result = cross_reference_data(used_data, full_data)

  full_cn = colnames(full_data)

  extract_mapping = function(mapping) {
    unlist(sapply(mapping, rlang::as_label))
  }

  all_vars = extract_mapping(object$mapping)
  all_vars = c(all_vars, extract_mapping(object$layers$mapping))
  all_facet_vars = sapply(object$facet$params$facets, rlang::as_label)

  parse_vars = function(variables, cn) {
    if (length(variables) == 0) {
      return(NULL)
    }
    get_var = function(var, cn) {
      out = sapply(cn, grepl, x = var)
    }
    cn[rowSums(matrix(sapply(variables, get_var, cn), ncol = length(variables))) > 0]
  }

  all_vars = parse_vars(all_vars, full_cn)
  all_facet_vars = parse_vars(all_facet_vars, full_cn)

  used_cols =   unique(c(all_vars, all_facet_vars))
  mat = du_matrix(full_data, used_cols, result$indata)
  return(mat)
}
