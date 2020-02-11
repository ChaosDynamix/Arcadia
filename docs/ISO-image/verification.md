---
layout: default
title: Verification
nav_order: 2
has_children: true
parent: ISO image
permalink: /iso-image/verification/
has_toc: false
---

# ISO image verification
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Public key cryptography

Public-key cryptography, or asymmetric cryptography, is a cryptographic system that uses pairs of keys :

- public keys which may be disseminated widely
- private keys which are known only to the owner

Effective security only requires keeping the private key private. The public key can be openly distributed without compromising security.

---

## Public key cryptography best-known usage

### Public key encryption
{: .no_toc}

A message is encrypted with a recipient's public key. The message cannot be decrypted by anyone who does not possess the matching private key, who is thus presumed to be the owner of that key and the person associated with the public key. This is used in an attempt to ensure confidentiality.

### Digital signatures
{: .no_toc}

A message is signed with the sender's private key and can be verified by anyone who has access to the sender's public key. This verification proves that the sender had access to the private key, and therefore is likely to be the person associated with the public key.

This also ensures that the message has not been tampered with, as a signature is mathematically bound to the message it originally was made with, and verification will fail for practically any other message, no matter how similar to the original message.

### Sources
{: .no_toc .text-delta}

- [Wikipedia - Public key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography)
- [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)

---

