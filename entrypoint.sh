#!/bin/bash

# 加载环境变量
source ~/.bashrc

# 开启ntp
/usr/sbin/ntpd

# 节点公私钥
keytool genkeypair | tee >(grep "PrivateKey" | awk '{print $2}' > ~/platon-node/data/nodekey) >(grep "PublicKey" | awk '{print $3}' > ~/platon-node/data/nodeid)

# 节点BLS公私钥
keytool genblskeypair | tee >(grep "PrivateKey" | awk '{print $2}' > ~/platon-node/data/blskey) >(grep "PublicKey" | awk '{print $3}' > ~/platon-node/data/blspub)

# 启动验证节点
/PlatON/PlatON-Go/build/bin/platon --identity platon --datadir ~/platon-node/data --port 16789 --testnet --rpcport 6789 --rpcapi "db,platon,net,web3,admin,personal" --rpc --nodekey ~/platon-node/data/nodekey --cbft.blskey ~/platon-node/data/blskey --verbosity 3 --rpcaddr 0.0.0.0 --syncmode "full" > ~/platon-node/data/v.log