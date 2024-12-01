;; Title: STX-Derivatives Platform Core Contracts
;; Description: Implementation of core derivatives trading functionality

;; -----------------------------
;; Constants and Traits
;; -----------------------------

;; Define error codes
(define-constant ERR-UNAUTHORIZED (err u100))
(define-constant ERR-INVALID-AMOUNT (err u101))
(define-constant ERR-INSUFFICIENT-BALANCE (err u102))
(define-constant ERR-INVALID-POSITION (err u103))
(define-constant ERR-INSUFFICIENT-COLLATERAL (err u104))

;; Minimum collateral ratio (150%)
(define-constant MIN-COLLATERAL-RATIO u150)

;; Position types
(define-constant TYPE-LONG u1)
(define-constant TYPE-SHORT u2)

;; -----------------------------
;; Data Maps and Variables
;; -----------------------------

;; Track user balances
(define-map balances 
    principal 
    { stx-balance: uint })

;; Track positions
(define-map positions 
    uint 
    { owner: principal,
      position-type: uint,
      size: uint,
      entry-price: uint,
      leverage: uint,
      collateral: uint,
      liquidation-price: uint })
