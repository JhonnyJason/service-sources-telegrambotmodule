telegrambotmodule = {name: "telegrambotmodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["telegrambotmodule"]?  then console.log "[telegrambotmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion


############################################################
Slimbot = require("slimbot")

############################################################
bot = null
chatId = null

############################################################
telegrambotmodule.initialize = () ->
    log "telegrambotmodule.initialize"
    cfg = allModules.configmodule
    chatId = cfg.telegramChatId
    bot = new Slimbot(cfg.telegramToken)
    # bot.on("message", handleMessage)
    return

############################################################
handleMessage = (message) ->
    log "onStart"
    olog message
    chatId = message.chat.id
    bot.sendMessage(chatId, "thisChatId: " + chatId)
    return

############################################################
telegrambotmodule.send = (message) ->
    log "telegrambotmodule.send"
    bot.sendMessage(chatId, message)
    return

    
module.exports = telegrambotmodule
