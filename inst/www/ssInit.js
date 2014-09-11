// This recieves messages of type "SSset" from the server.
Shiny.addCustomMessageHandler("SSset",
  function(message) {
    simpleStorage.set(message.key, message.value)
  }
);

Shiny.addCustomMessageHandler("SSget",
  function(message) {
    checkVar = simpleStorage.get(message.key);
    Shiny.onInputChange("ssInputVar", checkVar)
  }
);

Shiny.addCustomMessageHandler("SSdel",
  function(message) {
    checkVar = simpleStorage.deleteKey(message.key);
  }
);

Shiny.addCustomMessageHandler("SSsetTTL",
  function(message) {
    checkVar = simpleStorage.setTTL(message.key, message.ttl);
  }
);

Shiny.addCustomMessageHandler("SSgetTTL",
  function(message) {
    checkVar = simpleStorage.getTTL(message.key);
    Shiny.onInputChange("ssInputVar", checkVar)
  }
);

Shiny.addCustomMessageHandler("SSflush",
  function(message) {
    checkVar = simpleStorage.flush();
  }
);

Shiny.addCustomMessageHandler("SSindex",
  function(message) {
    checkVar = simpleStorage.index();
  }
);

Shiny.addCustomMessageHandler("SSstorageSize",
  function(message) {
    checkVar = simpleStorage.storageSize();
  }
);

Shiny.addCustomMessageHandler("SScanUse",
  function(message) {
    checkVar = simpleStorage.canUse();
  }
);

var fileInterval = setInterval(function(){
    if (typeof Shiny !== 'undefined'){
      checkVar = simpleStorage.get('myVar');
      if(typeof checkVar === "undefined"){
        checkVar = "SSNOTINITIALISED"
      }
      Shiny.onInputChange("ssInputVar", checkVar);
      clearInterval(fileInterval);
    }
},100);

