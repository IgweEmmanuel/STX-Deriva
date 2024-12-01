# STX-Derivatives Platform Core Contracts

## Overview

The STX-Derivatives Platform Core Contracts implement essential functionality for a decentralized derivatives trading platform built on the Stacks blockchain. The contract enables users to deposit collateral, open and close leveraged positions, and interact with a simplified price oracle.

---

## Features

### Core Features
- **Collateral Management**: Users can deposit and withdraw STX tokens as collateral for trading.
- **Leveraged Trading**: Users can open and manage long and short leveraged positions.
- **Position Tracking**: Each position records details like size, entry price, leverage, collateral, and liquidation price.
- **PnL Calculation**: Profit and loss (PnL) are calculated based on the current price and position type.
- **Liquidation Price**: Calculates the price at which a position will be liquidated.
- **Administrative Controls**: Admin functions to update prices and manage the contract owner.

### Security Features
- **Error Handling**: Comprehensive error codes to handle invalid operations.
- **Collateral Checks**: Ensures sufficient collateral before opening positions.
- **Ownership Validation**: Verifies that only position owners can close positions.

---

## Smart Contract Components

### Constants
- **Error Codes**:
  - `ERR-UNAUTHORIZED`: Error code `100` for unauthorized access.
  - `ERR-INVALID-AMOUNT`: Error code `101` for invalid amount.
  - `ERR-INSUFFICIENT-BALANCE`: Error code `102` for insufficient balance.
  - `ERR-INVALID-POSITION`: Error code `103` for invalid position type.
  - `ERR-INSUFFICIENT-COLLATERAL`: Error code `104` for insufficient collateral.
- **Trading Parameters**:
  - `MIN-COLLATERAL-RATIO`: Minimum collateral ratio (150%).
  - `TYPE-LONG`: Identifier for long positions.
  - `TYPE-SHORT`: Identifier for short positions.

### Data Maps and Variables
- `balances`: Tracks user STX balances.
- `positions`: Tracks active trading positions with detailed metadata.
- `position-counter`: Unique identifier for positions.
- `contract-owner`: Stores the admin of the contract.
- `current-price`: Tracks the current price of the underlying asset.

---

## Functions

### Read-Only Functions
1. **`get-balance(user)`**: Returns the STX balance of a user.
2. **`get-position(position-id)`**: Retrieves details of a specific position.
3. **`get-current-price()`**: Returns the current price from the oracle.
4. **`calculate-liquidation-price(entry-price, position-type, leverage)`**: Computes the liquidation price of a position.

### Public Functions
1. **`deposit-collateral(amount)`**: Allows users to deposit STX as collateral.
2. **`withdraw-collateral(amount)`**: Allows users to withdraw STX from their collateral.
3. **`open-position(position-type, size, leverage)`**:
   - Opens a new leveraged position.
   - Validates position type and collateral.
4. **`close-position(position-id)`**:
   - Closes an existing position.
   - Calculates and returns collateral + PnL.
5. **`update-price(new-price)`**:
   - Updates the current price (admin-only).
6. **`set-contract-owner(new-owner)`**:
   - Transfers ownership of the contract (admin-only).

### Private Functions
1. **`calculate-pnl(position)`**: Calculates the profit or loss for a given position.

---

## Example Usage

### 1. Deposit Collateral
```clojure
(contract-call? .stx-derivatives deposit-collateral u10000)
```

### 2. Open a Long Position
```clojure
(contract-call? .stx-derivatives open-position u1 u1000 u2) ;; Long position, size: 1000, leverage: 2x
```

### 3. Close a Position
```clojure
(contract-call? .stx-derivatives close-position u1) ;; Close position with ID 1
```

### 4. Update Price (Admin)
```clojure
(contract-call? .stx-derivatives update-price u50000) ;; Set price to 50000
```

---

## Security Considerations
- Ensure the `contract-owner` is a trusted address.
- Use a robust oracle service for production price updates.
- Regularly monitor and audit balances and positions to prevent mismanagement.

---

## Future Enhancements
- Integrate with a decentralized oracle for real-time price updates.
- Implement more robust PnL calculations, considering fees and slippage.
- Add support for advanced order types (e.g., stop-loss, take-profit).
- Enable staking mechanisms for collateral rewards.

---

