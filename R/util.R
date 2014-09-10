#' Add necessary js components for shinyStorage
#'
#' \code{addSS}
#' A utility function to add the simpleStorage javascript library to a shiny app.
#' @import shiny
#' @export
#' @examples
#' \dontrun{
#' shinyUI({
#' fluidPage(
#'   addSS()
#' )
#' })
#' }

addSS <- function() {
  addResourcePath(
    prefix = 'shinystorage',
    directoryPath = system.file('www', package='shinyStorage')
  )
  singleton(tags$head(
    tags$script(src = 'shinystorage/simpleStorage.js')
    , tags$script(src = 'shinystorage/ssInit.js')
  ))
}
