# nikke

An old fashioned slot machine whose whole business logic is implemented in a blockchain. You have real odds, believe in pseudo randomization!

## the odds

| ITEM (?)   | PROBABILITY (%) | PRIZE (%) |
|------------|-----------------|-----------|
| nothing    | 50 ~ 100        | 0         |
| play again | 13 ~ 50         | 0         |
| d          | 5 ~ 13          | 1         |
| c          | 2 ~ 5           | 3         |
| b          | 1 ~ 2           | 8         |
| a          | 0 ~ 1           | 21        |

## god and the odds

```
function random() private view returns (uint8) {
    return uint8(uint256(keccak256(block.timestamp, block.difficulty)) % 100);
}
```

## ./utils

* https://github.com/josex2r/jQuery-SlotMachine
* https://tokenmarket.net/news/opinion/creating-ethereum-smart-contract-transactions-in-client-side-javascript/
