KoaioClientUtils = {}

KoaioClientUtils.toServer = function(eventName, ...)
    TriggerServerEvent("Koaio:"..safety.."" .. Koaio.safetyhash(eventName)..safety2, ...)
end

KoaioClientUtils.Server = function(eventName, ...)
    TriggerServerEvent(eventName, ...)
end