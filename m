Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574230;
	b=gqDDDfeH0ufHUsi+z7sjMC2lSs/JcIPWO1K5qceyskiv7NtTDirk3wjvfyWtwGrUpnQ+
	 xFhKACOyiA6WyEYsbVmheG8WJ5VI8T3OzjBdXDM/sOjFG6R6AwhmIw88tTYu2cKtjzGGn
	 A076m6wINgNGAQtiRDvA6DDHvtsmTMLdqR27B61KEClG+flDPmuP0VuRjv0gDO4iqaJIX
	 mmrmKdAVvJyXoG4pm0Q950eFCuBTlPv2ELaHV/yVHQUCcFcdvvo2eJoWbDWCYU79ADW9Z
	 1RH3vI0ldcvQVxIYLxr4FXTvt3gt6PcLNjZEdZKx39utlyabnPF6RZJvB7lQHsAjj+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3FjnUi2pwPR5DHsF2bq9Hbvyd0STLH+1ds5EmTt9Js=;
	b=UBWqTbjJ1D4DiSiv8ibrMKlUTnkvdfBBCsnq12CSMIUyCmp3ihrfHO8WSP8lCNbF441q
	 COOOxXP1p07QRjUqn+eTELRMSlMWYWKTvB4QCjs3jQ3NUk+wNJ0upMmAcyUgMAWNuaqu6
	 etvxyNWB1/j39kIxMX3APGD88b3XxA3i6byuSYG+/g/d8LdTFIhK9OqOJG1IK9DRKf2OO
	 d6jm5waLMh+cJDAhTVwbngG+erwN4xOjxmzQ8UAkbEtAfplRl5LTWmCNLeI9QL1+9lzTT
	 lzptenp3zjCpGZDqxKWJOa2Luc7ekRPlvbXZU2fFLxtlcsCl8EHrywc68CwViaLK27w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydkvx2eV;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE53606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydkvx2eV
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso3582031a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574229; x=1796179029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3FjnUi2pwPR5DHsF2bq9Hbvyd0STLH+1ds5EmTt9Js=;
        b=ydkvx2eVZ1SYN0AGPGkusWDplW/SfOGDcd5OfQBObHQnLrHbSw0fzQlSIXCrCIZXTm
         K2KlE2LIYer9CHk8vMx8QuIa6NwO9Lfu2l3ESmJs8vD7QOBSaRUw5K0u+RKDQm9OI6Yc
         4D6Zw6iinMmyCodrKXDmi/FxW98GYNSkedMPL5oukF3R3g0DWqgs/StnCBNCpIs0TqUO
         9k9mn4ZzVs5hpCZ512ehLMGBhLvhgc4rfGwANX73o8ytoXYgCyv5TZSdrFEtGD4tdNal
         iTHHq3YUbLhBxWIuHpFaAOTdEsShsMz/UoO7BqBi5RPGSLnl+yGm8A7jrRr0wQ2MuPKt
         YUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574229; x=1796179029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3FjnUi2pwPR5DHsF2bq9Hbvyd0STLH+1ds5EmTt9Js=;
        b=tUS+zG9HLEqAErIFNxDyLVzWjoggK8nSLU75/tAhUN5bmPANL7lkhgDVfmILhAaUqa
         m6DAJJLrqwGhh4xr6czA3X4TdIgt3Zx3kYKtDJc0AV473oq/QnGVo/7YPA76a7EiIpxL
         YtmtbLkt0CLKdYX8umnexurmTRi15WGuRGrfkX/mV2dPAN7VqFdHhIsIY/IoLcUqH1rR
         3rzecdhsXeZ7GSr8gTJIEghaTD9uA7VSWVpEaLccd0cwIUrOxWMhkLmCjzsEpadGkN0A
         tD4zZSRvjY/FJsZERowNqfZQjHl+uTD2AhrAhNFEYt0ijsFG7aH3Znc4Oqo4BJLYcVSG
         HtuA==
X-Forwarded-Encrypted: i=1; AL+hErEj3heJKmeBWdF8hZ+LMeFAzY5UrrLObPRV5wgwuNW4nRFIm8rd5sJMmPA6XbdEKkJ08Ds/UBISWEYerZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yGar9WedumGE5TDPqTCwG9Oih4+faMDmw5xt9Hi6QvoTmj5XR
	qEkmDxO1USlJhrq1UaR6U6e8vLEAPgiKW9aR1DR0wA86V9oi4cw90SIr
X-Gm-Gg: AZFdTZeijOcanUuVMrr3u66sIErz4ydgbySziKmQdik38OP99SRB6rmnXG9hOvdBjt9
	Q0WqEP+CUpr5Kasa1ft7ext+5SjgN/fkXcSuVvwfHEjfU2WhBvI8Twnbik7n2sXHbb6RVvn9AFR
	g7vYShFtlUwGRml/sdN8RDr1R3JWeW+x67v6slATSAn8rQyobbwP6nPWfWz0n/FJjfDrhNEi45M
	rhow2OQGtLeI5tzlj8fvSwEt3ccE0DdzgDIRH8LVBfjoDO+XJ8YZJV5gzAM40Bx1C5kZkyS+Ck+
	u0QyfNfMkASDiPDnxo4zrCw1IJmqv7mHJhGtObdbcYNYucbrJfkEFvYTLpfEDzD22fNj+i5VxyD
	ayHfRKMxJHkJ5V/rTuP7Zbc3i7kOhv8QYRZJPf+n+KYonc+4Rso/8j6uVVdqGw0oEnCjotz9TqO
	RY+giSjhBmd1jGgT2NtR24Whxge0sk0qLMn1D0my4jF/L2V1Kee8efLyFv+O0v5KeIayADd4YuO
	FOYaBkGVX6yqP566pss180RpZBMX+fDWtSjJ/tyAZVj4vNL6QDNvSSKT5kzLaAqbRkp0waak18N
	Ch3MnIUKOdNL28AQGywtihQ/T1AmArcqQGiBx3CRRZLu5ciJzvF+nFNCLkwIipIWcXQ=
X-Received: by 2002:a17:90b:52:b0:3b4:f457:9e5d with SMTP id 98e67ed59e1d1-3b4f457a24amr1003392a91.9.1795574229078;
        Tue, 24 Nov 2026 18:37:09 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm24946594a91.4.2026.11.24.18.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:37:08 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Hui Peng <benquike@gmail.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 0/2] xfrm: refuse route optimization mode for ESP
Date: Wed, 25 Nov 2026 11:37:01 +0900
Message-ID: <cover.1795573672.git.kyuwoncho18@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ChoKyuWon <kyuwoncho18@gmail.com>

An ESP state in route optimization mode can be created, and its first
packet hits the WARN_ON_ONCE()s in xfrm_state_mtu() and
xfrm_inner_mode_input(). Patch 1 accepts the mode in
verify_newsa_info() only for DSTOPTS and ROUTING, as in v1. Patch 2,
as Sabrina suggested, also makes ah_init_state(), esp_init_state() and
esp6_init_state() refuse the modes they do not support, like
ah6_init_state() already does.

To Sabrina's questions: XFRM_MODE_IN_TRIGGER is already refused by
verify_newsa_info() ("Unsupported mode"). AH or ESP over IPv4 cannot
get route optimization mode at all: xfrm4_mode_map has no entry for it,
so __xfrm_init_state() fails with -EPROTONOSUPPORT before
ah_init_state() runs. So only ESP over IPv6 reaches these WARNs, and
the IPv4 part of patch 2 is for consistency.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v2:
- Patch 1: say that esp6_init_state() accepts any mode instead of
  "treats" an unknown mode as transport (Sabrina).
- Patch 2 is new (Sabrina, Steffen).
v1: https://lore.kernel.org/netdev/179550330841.535592.4607028415857424638@gmail.com/

The patches were written with LLM assistance; we reviewed and tested
them on the ipsec tree. ESP over IPv6 in route optimization mode is
refused with -EINVAL with patch 1, with patch 2 alone, and with both,
and the reproducer no longer warns. ESP and AH in transport, tunnel and
BEET mode over IPv4 and IPv6, and DSTOPTS and ROUTING states in route
optimization mode, are still accepted.

Kyuwon Cho (2):
  xfrm: allow route optimization mode only for DSTOPTS and ROUTING
    states
  xfrm: refuse modes that AH and ESP do not support

 net/ipv4/ah4.c       | 11 ++++++++++-
 net/ipv4/esp4.c      | 18 +++++++++++++++---
 net/ipv6/esp6.c      |  6 +++++-
 net/xfrm/xfrm_user.c |  9 ++++++++-
 4 files changed, 38 insertions(+), 6 deletions(-)

-- 
2.43.0

