#' @rdname popPyramid-ggproto
#' @format NULL
#' @usage NULL
#' @export
GeomLabelPyramid <- ggplot2::ggproto("GeomLabelPyramid", GeomLabel,
  required_aes = c("x", "y", "label", "split"),

  setup_params = function(self, data, params) {
    ggplot2::ggproto_parent(ggplot2::GeomLabel, self)$setup_params(data, params)
  },

  setup_data = function(self, data, params) {
    split_var <- unique(data$split)

    data$x[data$split == split_var[1]] <- -1 * data$x[data$split == split_var[1]]

    ggplot2::ggproto_parent(ggplot2::GeomLabel, self)$setup_data(data, params)
  },

  draw_panel = function(self, data, panel_params, coords, lineend = "butt", linejoin = "mitre") {

    ggplot2::ggproto_parent(ggplot2::GeomLabel, self)$draw_panel(
      data,
      panel_params,
      coords
    )
  }
)

#' Labels for pyramid plot
#' 
#' Requires the following aesthetics:
#' \itemize{
#'   \item{x}
#'   \item{y}
#'   \item{split: The variable on which to stratify the plot}
#' }
#' 
#' Other aesthetics are passed onto `geom_label`
#' 
#' @inheritParams ggplot2::geom_label
#' 
#' @export
geom_label_pyramid <- function(mapping = NULL, data = NULL,
  stat = "identity", position = "nudge",
  ...,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
) {
  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomLabelPyramid,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = rlang::list2(
      na.rm = na.rm,
      ...
    )
  )
  
}