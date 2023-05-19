local reactor = peripheral.wrap("fissionReactorLogicAdapter_1")
local reactorStatus = true ;
local function activateReactor(status)
    if status then
        if !reactor.getStatus() then
            reactor.activate();
         end
    else
        reactor.scram();
    end
    
end
while true do 
    
    if reactor.getTemperature() <= 1100 then
        reactorStatus = true;
        print("Temperature is ok!!");

    else
        reactorStatus = false ;
       print("Temperature is too high!!!");

    end
    activateReactor(reactorStatus);
end
