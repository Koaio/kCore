Koaio.newThread(function()
    Koaio.Internal('chat:addSuggestion', '/detach', _U('cmd_detach'),false)
    Koaio.Internal('chat:addSuggestion', '/otage', _U('cmd_otage'),false)
    Koaio.Internal('chat:addSuggestion', '/' .. Koaio.me.commandName, Koaio.me.commandDescription, Koaio.me.commandSuggestion)
end) 