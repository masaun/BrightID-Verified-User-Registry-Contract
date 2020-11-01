# BrightID Verified User Registry Contract

***
## 【Introduction of BrightID Verified User Registry Contract】
- BrightID Verified User Registry contract for the clf.fund
  - a VerifiedUserRegistry contract that ensures only BrightID verified users can sign as contributors to each round of clr.fund.  
    https://github.com/masaun/BrightID-Verified-User-Registry-Contract/blob/master/contracts/clrfund/verifiedUserRegistry/VerifiedUserRegistry.sol


&nbsp;

***

## Setup
### ① Install modules
```
$ npm install
```

<br>

### ② Run ganache-cli
（Please make sure whether port number is `8545` or not）
```
$ ganache-cli
```

<br>

### ③ Compile contracts
```
$ npm run compile:local
```

<br>

### ④ Test contracts（※ In progress to implement）
```
$ npm run test:local
```


&nbsp;

***

## 【References】
- BrightID
  - BrightID contracts (v4)：
https://github.com/BrightID/BrightID-SmartContract/tree/master/v4
  - Structure of BrightID（Privacy mixer, MACI, etc...）
https://medium.com/brightid/anonymous-participation-e-g-voting-using-brightid-42a13b4d1c94

<br>

- clf.fund 
  - Project：https://clr.fund/#/
  - Repo：https://github.com/clrfund/monorepo

<br>

- Build A BrightID Verified User Registry Contract (from Gitcoin)
https://gitcoin.co/issue/clrfund/monorepo/26/100023816 
