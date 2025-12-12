# Proof of Work — Foundry + Anvil (SimpleStorage)

**Summary**  
Local dev run: Foundry (forge) + Anvil used on WSL to compile, script-deploy, and interact with a `SimpleStorage` contract. This repository contains code + screenshots showing the full flow.

## Steps performed
1. WSL + Foundry install  
2. `anvil` started → noted RPC & private keys  
3. `forge init` → wrote `src/SimpleStorage.sol`  
4. Wrote `script/DeploySimpleStorage.s.sol` using `vm.startBroadcast()` / `vm.stopBroadcast()`  
5. `forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --private-key <key> --broadcast`  
6. Imported Anvil private key to MetaMask (custom network http://127.0.0.1:8545)  
7. Verified contract deployed and interacted (cast / script)

## Screenshots / Proof
1. `images/anvil.png` — Anvil output (RPC + private keys)  
2. `images/deploy_time.png` — VS Code project tree (src, script, foundry.toml)  
3. `images/complile.png` — `forge build` / compilation output  
4. `images/finalDeploy.png` — `DeploySimpleStorage.s.sol` in VS Code  
5. `images/success.png` — Terminal: dry-run / broadcast output + contract address  
6. `images/addnetwork.png` — MetaMask with imported Anvil account showing dummy ETH

> ⚠️ NOTE: Do not publish private keys publicly. These are local Anvil test keys for a local chain only.

## Commands used (copy & run)
```bash
# run local node
anvil

# in new terminal — init + build
forge init
forge build

# deploy with private key from Anvil output
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --private-key 0x... --broadcast

# optional: call or send via `cast`
cast call <contract> "retrieve()(uint256)" --rpc-url http://127.0.0.1:8545
cast send <contract> "store(uint256)" 123 --rpc-url http://127.0.0.1:8545 --private-key 0x...