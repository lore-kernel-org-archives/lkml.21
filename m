Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702129;
	b=G107wUOwuVb4VB9v9Nn4AeqbL/aiQAjzO+1UvpFCi1m0d3hwsa+gX8b2olEZ1TMWbt0G
	 sPwNhvHxmxYWkX/XApQtGEDeFqPHG96WU/fZ/OU3ScepiMqeVBsJ8+4ocs+ZrJyiX+ZB2
	 dIQmGe1b3SjtBkOegxySAqqCgXZcIl7vD0cgMF8zoh3jlZ/ty0HvL7aDFow20xrqIJPVi
	 Yxb/FCc6COuZz9J4a3csxfxgXDW9T05LJEJxe5zOJNZGrqeJrCnKdpNqTKDl7sj4zkimI
	 +Z0HmwWsRrGIAW5FzS5u7LZWDnxwsAWbl7vPq8ZhNA/2X7K+6T7dCTopLk4lQjtDgbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=6Oi3YeuFZkqFjMzEFnKlQEaAaYTEmMRxkDStd3tGqhw=;
	b=O8lVsECLAJWSHzgcZjdgZinugL9XiT0ey/Xtctl+V0Y1vG5avaAMYsyqXZRya9Xwv9Sr
	 SdU3RVeOUM/Ot7J9KTeJfJfOxvElmifjlALpumDq9KNT4kBRFmZ0VZYDeID6Ga3bougeC
	 a4tbIbals66Fqy4FC/A0VoOTBqivQ+Au+jOGYdbPbbtiqAL2SbSjZKa6DApoggMN9Q8Bp
	 8TOVoNqBLXFWVPhVusZMJ50Q1D4plrf0R8kForvsNlbWk5usnDCHMw80Ca1PbUFVnwLpe
	 BVtaxn9v0yUsK+OuAzpRn6Z4PfnfwdwRs/kjOMi/dL8HB3SmR9e2JnM06PidujjZwpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0FFE4b0;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075A8606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075A8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0FFE4b0
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb9f760337so3959277a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702128; x=1796306928; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Oi3YeuFZkqFjMzEFnKlQEaAaYTEmMRxkDStd3tGqhw=;
        b=Z0FFE4b0hfGrQctMahgCbATSZa/2yZWK3m4w+FeIUhbT/xarEviWdM5zWhDYnhHmNS
         DQ5CRYBBp2tnp1YivOT0kJFkPVvp55CKLdyAdyw+YxmMetCkW4ffwQ5nhXbxKmI4Y1Xp
         yX0HSOg06hHB7zcYd1+wlzPKaI/U9i85yEOtnNmPM0qHVEkGR8xZI+SBYIZwJrZNCjTJ
         fWqJzauhzJMaPxT+uUniARz6HQJrxJWULYO6PqHjTukCWwANxyfs4ke0S1U29f6AQUvo
         d/91023cPt8kHGyRI+VrPCIkEdHq/EnaSBrWOKCpyaIl018RwcKsWuPDdknA0mIWKcWn
         imPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702128; x=1796306928;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Oi3YeuFZkqFjMzEFnKlQEaAaYTEmMRxkDStd3tGqhw=;
        b=vyg9dlXRyHzW+uYtV4io3T7Jh+NZuBQ9rN6UyXePuhmw6PYyu1WrI8MmvNeooHVS8q
         M5iXeEfnwH2bhO+iW8/A1MkJAh/yCj9Lil9RLy/3Vu91pMkF7tuKRdFYNiOzPzOWerE1
         5/SXh/igy/gEpQEMzoKAOt6a/auNzTEMqJMEQZnZSVRxL5Apq4aau3vM/gTpmUD4bJa0
         hjNiCkWgR4KeZWaaKnGNfF2RxfI7tvA+a+hijyVFYiUpoTkzx0temQzUlK14sBmrQVnT
         A6+ah847qL8vO3BHaZ7v859HBHRwRqVr2bkEyZfKLP9Mh4bP+tqSaB/so6rGFcpKg/t4
         slOg==
X-Forwarded-Encrypted: i=1; AL+hErGhWPt+SfZ00gsNbv8eClxWFnatWREx4fLwllPp9HjG7Ryh++DeATN/rlkknWRJ7Uh1Z/MxcKWlbCMbp50=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xfBzcIJA4fyMKcKarsPSvdKeV7DVtJONA7oVnV0pfEWCQER/i
	hzfiSqo++HSpyoEeSxu9B7g9rVxPxPYc4rswmEzvkbk6YMYLtvl1ZMwq
X-Gm-Gg: AZFdTZf70WOZtggYjViLnox2j8W9IH+uun1w6/QUiKgdTMXHuiVdawNkf4tSp0lQl9K
	8tWPmkjYdEu8M1swFwj2wrwpITgbi2WavgDpnRX5uOv4qjuKHpwyFylKOavIfLjL0BP+CiXghJn
	91hWVk0sZzWlUydPWIErDMYdo7OGERFcnaCQTVWP5eTzrDMbqvKeezeG1jNroenA8Kkx1u5yC2h
	HTZxOAnBK+PgXC+2T1kNkdInOt86g4MNvK2LoL42pEnDERbQt1Nf4vYfUYb1nKG7WOk5HYaMktK
	p4GxyLdjG0nF1oKBPxZJSzQ3Nb96fFiunTjK/evUAkOxc0ikXIF3FhJDIy0zqjKfYXBoIo/mI+D
	d4Be1BECr4NlDrRQuUxYxNgV4fUw1wrpdYC9IXIKYuJwj0HCyVioHLPd8pnBFvYks59xsSMfpWj
	YAEnZKuj2DOusL5fsw+B+vyngmsRrCEY44ZTqfjbD/j0caJbMIn2pF/6SpRBoFgElHB+8EBv4dh
	93q+NzzEQS9F2u/i/P0so/luHxJtbUO6vpm/mEot1dlaZxPNB2OR8BkpKI2uTw/1CI4R+thHiuz
	gBGLo9xdwC2eKuNzyYrDPD33HPYJZSftWSJjBVG8Z/FgJnucuvWQjvMD8l9IUTJXfnvgpCyTSdH
	5b9WgDslvATuKlVS3yIT1CZccnWy3ipjJdGHRzJUSr0OsUO5f/piEPx6a
X-Received: by 2002:a17:90b:4d0a:b0:3b3:b562:899c with SMTP id 98e67ed59e1d1-3b41c8dc9f1mr12583300a91.9.1795702128125;
        Thu, 26 Nov 2026 06:08:48 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm12583573a91.3.2026.11.26.06.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:08:47 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Subject: [PATCH net-next v4 0/2] rust: net: phy: pass &Device to callbacks
 without exclusive access
Date: Thu, 26 Nov 2026 23:08:31 +0900
Message-Id: <20261126-exp-phy-rs-maybelocked-v4-0-16f9a10bb579@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF89CGsC/4XOyw6CMBAF0F8xXTumDyjWlf9hXPQxSlUeaZFAC
 P9uxQ0xMS5vZu6ZmUjE4DGSw2YiAXsffVOnkG03xJa6viJ4lzLhlEvGGAUcWmjLEUKESo8GH42
 9owPnbK6UEngxmqRyG/DihwU+kRo7qHHoyPkziU9zQ9u93fdu6WPXhHH5oWdL49+5ngEFQbmwV
 tE8R3W8Vto/drapliM9XzPZT4YnhimdOSfzvZHmmxFrpvjJiMRkyPZCF0JKXayZeZ5fTXkOpmY
 BAAA=
X-Change-ID: 20261110-exp-phy-rs-maybelocked-ddc59993efba
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Trevor Gross <tmgross@umich.edu>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2

The Rust PHY abstraction gives every driver callback a `&mut Device` and
says that PHYLIB holds `phy_device->lock`, but phy_suspend() calls
`suspend` without it, also right after the state machine drops the
lock, and read_mmd and write_mmd run with the MDIO bus lock held
instead. This was found while auditing the SAFETY comments of Rust
abstractions against their C callers, and confirmed with Clang's
context analysis [1].

As FUJITA suggested on v3, the series uses `&Device` and `&mut Device`
for this instead of new context types. Patch 1 makes `&mut Device` mean
exclusive access to the state that `phy_device->lock` protects, fits the
method receivers to that, and documents when the `&mut Device` callbacks
run without the lock. Patch 2 passes a `&Device` to suspend, read_mmd
and write_mmd. The generated code of ax88796b_rust and qt2025 does not
change.

The audit, the patches and their changelogs were done with an AI coding
assistant (Claude Code, Claude Opus 5.5) and reviewed line by line by
me. Compile-tested only.

[1] https://docs.kernel.org/dev-tools/context-analysis.html

---
Changes in v4:
- Use `&Device` and `&mut Device` instead of the `Locked` and
  `MaybeLocked` context types (FUJITA)
- Keep `read_mmd`, `write_mmd` and `match_phy_device`. Pass `&Device` to
  `read_mmd` and `write_mmd`, and document that read() and write()
  deadlock there (FUJITA)
- Make read(), write() and genphy_suspend() take `&self`.
  `match_phy_device` can access registers as C implementations do,
  while read_paged() stays `&mut self`
- Make the getters of the state that `phy_device->lock` protects take
  `&mut self`
- Name the fields that `phy_device->lock` protects in the `Device`
  documentation
- Say that the phy_mii_ioctl() path is outside the guarantee (Andrew,
  FUJITA)
- Link to v3: https://lore.kernel.org/r/20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com

Changes in v3:
- Give `suspend` the `MaybeLocked` context, and make `genphy_suspend()`
  available in both contexts (netdev AI review)
- Move `soft_reset` and `genphy_soft_reset()` back to `Locked`, since
  `genphy_soft_reset()` in `MaybeLocked` could race with lock holders
  in `suspend`, and document phy_mii_ioctl() as an existing PHYLIB race
  instead (netdev AI review)
- Drop `match_phy_device` as well (netdev AI review)
- Fix the `get_features`, `soft_reset`, `read_status` and `resume`
  SAFETY comments, and name the context at each `from_raw()` call
- List the exceptions in the `Locked` documentation, including MAC
  drivers that call phy_init_hw() or phy_read_status() directly
- Link to v2: https://lore.kernel.org/r/20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com

Changes in v2:
- Keep `&mut self` on the moved methods, so that `match_phy_device` does
  not gain register access (netdev AI review)
- Give only `soft_reset` the `MaybeLocked` context
- Drop `read_mmd` and `write_mmd` instead of leaving them `Locked`
- Document how PHYLIB calls the `Locked` callbacks, and fix the
  `from_raw()`, `phy_id()` and `genphy_soft_reset()` SAFETY comments
- Link to v1: https://lore.kernel.org/r/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com

---
SeungJong Ha (2):
      rust: net: phy: take &self in methods that do not need phy_device->lock
      rust: net: phy: pass &Device to suspend, read_mmd and write_mmd

 drivers/net/phy/ax88796b_rust.rs |   4 +-
 rust/kernel/net/phy.rs           | 165 +++++++++++++++++++++------------------
 rust/kernel/net/phy/reg.rs       |  12 +--
 3 files changed, 99 insertions(+), 82 deletions(-)
---
base-commit: 5f049e811762d6784392d9984ce910257224824b
change-id: 20261110-exp-phy-rs-maybelocked-ddc59993efba

Best regards,
--  
SeungJong Ha <engineer.jjhama@gmail.com>

