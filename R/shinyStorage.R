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
                              session$sendCustomMessage(
                                "SSdel", 
                                list(key = key))
                            },
                            
                            setTTL = function(key, ttl){
                              session$sendCustomMessage(
                                "SSsetTTL", 
                                list(key = key, ttl = ttl))                              
                            },
                            
                            getTTL = function(key){
                              session$sendCustomMessage(
                                "SSgetTTL", 
                                list(key = key))
                              session$input[["ssInputVar"]]                              
                            },
                            
                            flush = function(){
                              session$sendCustomMessage(
                                "SSflush", 
                                list())                              
                            },
                            
                            index = function(){
                              session$sendCustomMessage(
                                "SSindex", 
                                list())                                                            
                              session$input[["ssInputVar"]]                              
                            },
                            
                            storageSize = function(){
                              session$sendCustomMessage(
                                "SSstorageSize", 
                                list())                                                            
                              session$input[["ssInputVar"]]                                                            
                            },
                            
                            canUse = function(){
                              session$sendCustomMessage(
                                "SScanUse", 
                                list())                                                            
                              session$input[["ssInputVar"]]                                                                                          
                            }
                          )
)