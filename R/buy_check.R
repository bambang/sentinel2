#' Buy check
#'
#' Checks, if granule's are already available or need to be bought
#'
#' @param granuleId a character vector of one or more granuleId's
#' @return logical of the same length as granuleId, where \code{TRUE} means a
#'   granule needs to be bougth to gain access
buy_check = function(granuleId){
  to_buy <- rep(FALSE, length(granuleId))

  for (i in seq_along(granuleId)) {
    g = S2_query_granule(granuleId = granuleId[i])
    to_buy[i] = is.na(g$url) | g$atmCorr == 0
  }

  names(to_buy) = granuleId
  return(to_buy)
}
