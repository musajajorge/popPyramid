
utils::globalVariables(c("tot_pop", "perc_pop"))

options(dplyr.summarise.inform = FALSE)

#' Creates percentage of a dataframe
#'
#' @description Creates a dataframe in long format and in percent
#'
#' @import dplyr
#' @param df Name of dataframe
#' @param age Age or age group. Write the parameter in quotation marks.
#' @param sex Sex or other categorical grouping variable. Write the parameter in quotation marks.
#' @param pop Population (in numerical value). Write the parameter in quotation marks.
#'
#' @return The dataframe in long format and in percentage
#' @export
#'
#' @examples
#' df <- popPyramid::popPER
#' df <- dplyr::filter(df, Year==2021)
#' df <- percDF(df, "Age", "Sex", "Population")

percDF <- function(df, age, sex, pop){

  #tot_pop <- NULL
  #perc_pop <- NULL

  df <- data.frame(cbind(df[,colnames(df)==age],
                         df[,colnames(df)==sex],
                         df[,colnames(df)==pop]))

  colnames(df) <- c("age", "sex", "pop")

  df$age <- as.factor(df$age)
  df$sex <- as.factor(df$sex)
  df$pop <- as.numeric(df$pop)

  df <- df %>%
    ungroup() %>%
    group_by(age, sex) %>%
    summarise(pop = sum(pop, na.rm = T)) %>%
    group_by(sex) %>%
    mutate(tot_pop = sum(pop, na.rm = T),
           perc_pop = round(pop/tot_pop*100, 4)) %>%
    select(age, sex, perc_pop) %>%
    arrange(sex, age)

  colnames(df) <- c(age, sex, paste0("perc_",pop))

  return(df)

}
