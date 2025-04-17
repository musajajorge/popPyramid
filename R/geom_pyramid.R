#' @rdname popPyramid-ggproto
#' @format NULL
#' @usage NULL
#' @export
GeomPyramid <- ggplot2::ggproto("GeomPyramid", GeomBar,
  required_aes = c("x", "y", "split"),
  non_missing_aes = c("xmin", "xmax", "ymin", "ymax"),

  setup_params = function(self, data, params) {
    ggplot2::ggproto_parent(ggplot2::GeomBar, self)$setup_params(data, params)
  },

  setup_data = function(self, data, params) {
    split_var <- unique(data$split)

    data$x[data$split == split_var[1]] <- -1 * data$x[data$split == split_var[1]]

    ggplot2::ggproto_parent(ggplot2::GeomBar, self)$setup_data(data, params)
  },

  draw_panel = function(self, data, panel_params, coords, lineend = "butt", linejoin = "mitre") {

    ggplot2::ggproto_parent(ggplot2::GeomBar, self)$draw_panel(
      data,
      panel_params,
      coords,
      lineend = lineend,
      linejoin = linejoin
    )
  }
)

#' Back-to-back pyramid plots
#' 
#' A column plot with back-to-back labels, stratified on some input variables.
#' 
#' Requires the following aesthetics:
#' \itemize{
#'   \item{x}
#'   \item{y}
#'   \item{split: The variable on which to stratify the plot}
#' }
#' 
#' Other aesthetics are passed onto `geom_col`
#' 
#' @inheritParams ggplot2::geom_col
#' @inheritParams ggplot2::layer
#' @export
geom_pyramid <- function(mapping = NULL, data = NULL,
  stat = "identity",
  position = "stack",
  ...,
  just = 0.5,
  width = NULL,
  na.rm = FALSE,
  orientation = NA,
  show.legend = NA,
  inherit.aes = TRUE) {
  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomPyramid,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
    just = just,
    na.rm = na.rm,
    orientation = orientation,
    ...
    )
  )
}

#' Label values by absolute value
#' 
#' @param ... Extra arguments passed to `format`
#' @return Function that can be used to format values, best used inside `scale_*` or `geom_label`-like functions.
#' @export
labeller_abs <- function(...) {
  function(x) format(abs(x), ...)
}

#' Base ggproto classes for popPyramid
#'
#' @seealso [`ggproto()`][ggplot2::ggproto]
#' @keywords internal
#' @name popPyramid-ggproto
NULL