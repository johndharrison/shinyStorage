#' CLASS shinyStore
#'
#' class to handle local storage
#'
#' This class handles local storage
#' 
#' @field session An environment (\code{\link{session}}) associated with a shiny server function.
#' @export shinyStore
#' @exportClass shinyStore
#' @aliases shinyStore
#' @import shiny

shinyStore <- setRefClass("shinyStore", ,
                          fields = list(session = "environment"),
                          methods = list(
                            set = function(key, value, options = NULL){
                              session$sendCustomMessage(
                                "SSset", 
                                list(key = key, value = value, options = options))
                            },
                            
                            get = function(key, name){
                              session$sendCustomMessage(
                                "SSget", 
                                list(key = key))
                              session$input[["ssInputVar"]]
                            },
                            
                            deleteKey = function(key){
                              
                            },
                            
                            setTTL = function(key, ttl){
                              
                            },
                            
                            getTTL = function(key){
                              
                            },
                            
                            flush = function(){
                              
                            },
                            
                            index = function(){
                              
                            },
                            
                            storageSize = function(){
                              
                            },
                            
                            canUse = function(){
                              
                            }
                          )
)