local framework = wx.Framework:lower()

if framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
end

function GetCash(id)
    if framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(id)
        return xPlayer.getMoney()
    end
end

function GetBalance(id)
    if framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(id)
        return xPlayer.getAccount("bank").money
    end
end

function Withdraw(id, amount)
    if framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(id)
        if xPlayer.getAccount("bank").money >= amount then
            xPlayer.removeAccountMoney("bank", amount)
            xPlayer.addMoney(amount)
            return true
        else
            return false
        end
    end
end

function Deposit(id, amount)
    if framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(id)
        if xPlayer.getAccount("bank").money >= amount then
            xPlayer.removeMoney(amount)
            xPlayer.addAccountMoney("bank", amount)
            return true
        else
            return false
        end
    end
end

function Transfer(id, target, amount)
    if framework == "esx" then
        if not GetPlayerName(target) then return false end
        local xPlayer = ESX.GetPlayerFromId(id)
        local xTarget = ESX.GetPlayerFromId(target)
        if xPlayer.getAccount("bank").money >= amount then
            xPlayer.removeAccountMoney("bank", amount)
            xTarget.addAccountMoney("bank", amount)
            return true
        else
            return false
        end
    end
end

lib.callback.register('wx_banking:getCash', function(source)
    return GetCash(source) or 5000
end)

lib.callback.register('wx_banking:getBalance', function(source)
    return GetBalance(source) or 5000
end)

lib.callback.register('wx_banking:withdraw', function(source, amount)
    return Withdraw(source, amount) or false
end)

lib.callback.register('wx_banking:deposit', function(source, amount)
    return Deposit(source, amount) or false
end)

lib.callback.register('wx_banking:transfer', function(source, target, amount)
    return Transfer(source, target, amount) or false
end)
