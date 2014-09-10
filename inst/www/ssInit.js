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