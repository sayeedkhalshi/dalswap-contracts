-include .env

build:; forge build

deploy-zkscam:
	forge script script/UniswapDeployer.s.sol:UniswapDeployer --rpc-url $(ZKSCAM_RPC) --account dexKey --broadcast --legacy

deploy-sepolia:
	forge script script/UniswapDeployer.s.sol:UniswapDeployer --rpc-url $(SEPOLIA_RPC) --account aidropAccountKey --broadcast --legacy

deploy-tabi:
	forge script script/UniswapDeployer.s.sol:UniswapDeployer --rpc-url $(TABI_TESTNET_RPC) --account aidropAccountKey --broadcast --legacy

deploy-factory:
	forge script script/DeployFactory.s.sol:DeployFactory --rpc-url $(TABI_TESTNET_RPC) --account aidropAccountKey --broadcast --legacy

deploy-bartio:
	forge script script/UniswapDeployer.s.sol:UniswapDeployer --rpc-url $(BARTIO_TESTNET_RPC) --account aidropAccountKey --broadcast --legacy --verifier-url 'https://api.routescan.io/v2/network/testnet/evm/80084/etherscan' --etherscan-api-key "verifyContract"

deploy-story:
	forge script script/UniswapDeployer.s.sol:UniswapDeployer --rpc-url $(STORY_TESTNET_RPC) --account aidropAccountKey --broadcast --legacy 

deploy-uni:
	forge script script/UniswapDeployer.s.sol:UniswapDeployer --rpc-url $(UNI_TESTNET_RPC) --account aidropAccountKey --broadcast --legacy 

deploy-sonic:
	forge script script/UniswapDeployer.s.sol:UniswapDeployer --rpc-url $(SONIC_TESTNET_RPC) --account aidropAccountKey --broadcast --legacy 