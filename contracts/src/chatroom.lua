-- .load-blueprint token

Members = Members or {}

Handlers.add(
    "Register",
    Handlers.utils.hasMatchingTag("Action", "Register"),
    function (msg)
        table.insert(Members, msg.From);
        Handlers.utils.reply("registered")(msg);
    end
);

Handlers.add(
    "Broadcast",
    Handlers.utils.hasMatchingTag("Action", "Broadcast"),
    function (msg)
        if Balances[msg.From] == nil or tonumber(Balances[msg.From]) < 1 then
            print("UNAUTH REQ: " .. msg.From)
            return
        end
        
        -- TODO: Not used.
        --local type = msg.Type or "Normal"

        print("Broadcasting message from " .. msg.From .. ". Content: " .. msg.Data)

        for _, recipient in ipairs(Members) do
            ao.send({
                Target = recipient,
                Action = "Broadcasted",
                Broadcaster = msg.From,
                Data = msg.Data
            });
        end

        -- TODO: In the following section of the tutorial, it looks like we are just loading a new chatroom in a new
        -- process. Instead, we should just reference the original process.
        -- https://cookbook_ao.arweave.dev/tutorials/begin/tokengating.html#testing-from-another-process-id

        -- Handlers.utils.reply("Broadcasted.")(msg);
    end
);

