-- aos --wallet ./wallets/001.json
Me = "1VQ_dB19jOUp6e9v8E18F0xX2J53WGrXAcK6n-4wLXM"
Morpheus = "ajrGnUq9x9-K1TY1MSiKwNWhNTbq7-IdtFa33T59b7s"

-- Talk to Morpheus:

Send({ Target = Morpheus, Data = "Morpheus?"})
Send({ Target = Morpheus, Data = "Code: rabbithole", Action = "Unlock" })

#Inbox
Inbox[#Inbox].Data

-- Testing the chat:

Send({ Target = ao.id, Data = "Register" })
Send({ Target = ao.id, Action = "Broadcast", Data = "My first broadcast!" })

-- Invite Morpheus:

Send({ Target = Morpheus, Action = "Join" })

-- Invite Trinity:

Trinity = "TLP_5xtNWzDAU_V565avSyP98X2wClrVs0QODOghagU"
Send({ Target = Trinity, Action = "Join" })

-- Playing with the token:

-- For the tutorial, let's just use the token blueprint:
-- .load-blueprint token
Send({ Target = ao.id, Action = "Info" })
Inbox[#Inbox]

-- And let's send some tokens to Trinity:
Send({ Target = ao.id, Action = "Transfer", Recipient = Trinity, Quantity = "1000" })

-- Is the blueprint also vulnerable?
-- Let's go to another process and run:
Send({ Target = Me, Action = "Balance" })
Send({ Target = Me, Action = "Transfer", Tags = { Recipient = Victim, Quantity = "-1000" } })
Send({ Target = Me, Action = "Balance" })

-- Ok, it is NOT vulnerable.

--[[

Broadcasting message from TLP_5xtNWzDAU_V565avSyP98X2wClrVs0QODOghagU. Content:  
I guess Morpheus was right. You are the one. Consider me impressed. 
You are now ready to join The Construct, an exclusive chatroom available 
to only those that have completed this tutorial. 

Now, go join the others by using the same tag you used `Register`, with 
this process ID: jg2Duezl68c8lHU5RiV8kHZrZ-7MJSVyyfQDhz5nJqQ

Good luck.
-Trinity

-----------

To claim your quest reward: (Only 1 reward per User)

Make sure your wallet and process is Vouched at https://vouch-twitter.arweave.dev 
Once your process is vouched, Submit a claim to Trinity.

Steps to Vouch then Claim:
If you used the web UI at https://sh_ao.g8way.io/, then vouch from the same wallet you connected to create your process.

If you completed this quest from the command prompt interface on your local PC, you need to find the .aos.json keyfile for your processes and load this keyfile into your Arweave wallet app. This will create a new wallet from this process keyfile. Then connect that created wallet to the vouch site and vouch your processes.

Once successfully vouched, send the following claim command from your process.

Send({Target = Trinity, Action = "Claim", Data="gmzcodes"})

--]]

-- Reponse in Inbox[54]:
-- Your Vouched Wallet does not meet the required value to claim this reward.

TheConstruct = "jg2Duezl68c8lHU5RiV8kHZrZ-7MJSVyyfQDhz5nJqQ"

Send({ Target = TheConstruct, Action = "Register" })

Send({ Target = Trinity, Action = "Claim", Data="gmzcodes" })