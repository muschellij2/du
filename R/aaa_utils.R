
cross_reference_data = function(used_data, full_data) {
  indata = NULL
  rm(list = "indata")

  cn = colnames(used_data)
  full_cn = colnames(full_data)
  stopifnot(any(cn %in% full_cn))
  # can't have these unique variables in your data set otherwise
  # things get messed up
  stopifnot(!"indata" %in% full_cn)
  # stopifnot(!"row_number_index" %in% full_cn)
  used_data$indata = TRUE
  # full_data$row_number_index = 1:nrow(full_data)
  # cols = intersect(colnames(full_data), colnames(used_data))

  # column-indicator of use
  cols = intersect(full_cn, cn)
  # full_data has to be first
  result = dplyr::full_join(full_data, used_data, by = cols)
  # indata is row-indicator of use
  result = result %>%
    dplyr::mutate(indata = ifelse(is.na(indata), FALSE, indata))
  stopifnot(nrow(result) == nrow(full_data))

  return(result)
}

# get data usage matrix
du_matrix = function(full_data, used_cols, indata) {
  # create simple indicator matrix
  mat = array(TRUE, dim = dim(full_data))
  colnames(mat) = colnames(full_data)

  full_cn = colnames(full_data)
  cols = intersect(full_cn, used_cols)

  # any variables not in the model, put as FALSE
  mat[, setdiff(full_cn, cols)] = FALSE
  # rows not used set to FALSE
  mat[!indata, ] = FALSE
  return(mat)
}

