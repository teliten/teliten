
# Toothfairy smart contract

init:
  contract.storage["CHILD"] = 0xb7b2e5e12992267f85455ffee1435f02760402f0
  contract.storage["TOOTHFAIRY"] = 0xc61185cffa955bd1a6b914a6c616b3cdd5206aa1
code:
  # Child calling... with proof of lost tooth given as the contract input
  if msg.sender == contract.storage["CHILD"]:
    contract.storage["PROOF_OF_TOOTH"] = msg.data[0]
  # Toothfairy calling... to release contract funds to child
  if msg.sender == contract.storage["TOOTHFAIRY"]:
    send(contract.storage["CHILD"], contract.balance, (tx.gas - 100))
  else:
    # Anyone else calling just gets their funds back
    send(msg.sender, msg.value, (tx.gas - 100))
