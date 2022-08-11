--Inititalization 
local FISSION_REACTOR = peripheral.wrap("fissionReactorLogicAdapter_4")

--Variable which stores the sides
local SIDES = rs.getSides()

--Shutdown function
function REACTOR_SHUTDOWN()
    FISSION_REACTOR.scram()
    sleep(40)

--Check reactor function returns 0 or 1
function CHECK()
    
    --check if the reactor becomes critical, activates an alarm and shutes down the reactor else activates the reactor 
    
    if (FISSION_REACTOR.getCoolantFilledPercentage() < 0.25) then
        rs.setOutput("front",true)
        REACTOR_SHUTDOWN()
        return 0
   
    elseif (FISSION_REACTOR.getTemperature()>=900)then
        rs.setOutput("left",true)
        REACTOR_SHUTDOWN()
        return 0
    
    elseif (FISSION_REACTOR.getHeatedCoolantFilledPercentage() > 0.9) then
        REACTOR_SHUTDOWN()
        return 0
    
    elseif (FISSION_REACTOR.getWasteFilledPercentage()>=0.9) then
        rs.setOutput("top",true)
        REACTOR_SHUTDOWN()
        return 0
    
    else
        --deactivates the redstone, activates reactor and returns 1
        for k = 1,6,1 do
            if k == 5 then
                goto stop
            else 
                rs.setOutput(SIDES[k],false)
            ::stop::
            end
        end
        FISSION_REACTOR.activate()
        return 1

    end


--start of the program
while true do

    --reactor will activate if a redstone signal is received else the reactor will shut down
    while (rs.getInput("right")) do
        --Checks if the reactor is deactivated and activates the reactor
        CHECK()

    end
    FISSION_REACTOR.scram()
end



