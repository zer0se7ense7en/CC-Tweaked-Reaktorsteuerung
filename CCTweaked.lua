local reactor = peripheral.wrap("fissionReactorLogicAdapter_1")
local reactorStatus = true ;
local function activateReactor(status)
    if status and not reactor.getStatus() then
            reactor.activate();
    elseif not status and reactor.getStatus() then
        reactor.scram();
    end
    
end
while true do 
    if reactor.getTemperature() =< 1000 and reactor.getCoolantFilledPercentage >= 0.4 and reactor.getWasteFilledPercentage() <= 0.7 and reactor.getDamagePercent() == 0 and reactor.getFuelFilledPercentage() >= 0.2 and reactor.getHeatedCoolantFilledPercentage() <= 0.8 then
        status = true;
    else 
        status = false;
    end
    activateReactor(reactorStatus);
end
