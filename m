Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994217;
	b=Pxl5g3tNX9avq6/59MzzBgxs8Igw9jr143ZbuSMjbuYVVf6iU6ysGZ/M2UlP5XLL1Pxk
	 EpaYisWb4R33p+N3NxJ7yXxjMSOC6DPrMq/wp5C65VIeh89/+XaUm7Qod5mDQJHZ628KX
	 1tlIUb7U+G93B9ZzQ2gSLFobG44VfwXn6n5sC80mRaE5UPoMyt0nmiTthXCMEK2OgHSAK
	 Q+Pqr2Sx52vq9V8Yjs8upXMDZCq0cCXfvHhC3hxVPiZ9uxg/Uu81KFjl/+r+alV6QsvTm
	 YI/rVHYWw22y79ZyGB6pP9eoewDFtb2aUmNDA1LfKVXmLNUJFywydmWVqgXOr5NCmPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I137t/b2HCf/JgYtsEMky8nuvLyX5jojfAj0ADTMjuU=;
	b=ZH26t9MEeB/BEBMQHfChAnzKe2pHD1vohD2/XMr6Yq44S76Fa48R/mgphWHkjQEKdTeK
	 8wmMEeRJo7VVS9CdIQ57DqcdnggEusfjlN2aea7vlkHZgHPg2ESbJeucFkaAGWwoLP/kU
	 nKvfUeZzUQfSATFufgGfJmCxZ4/JXmF1xZOs8fTafyBj2gt2s5zSOOh6QJNXDfNyolFnu
	 R2AVkgXID7Vkp1DJ1jkUh0S7sTuZJdAUr4+b4CKq7XLsujssUCnQN3+Qe//k56i56Lilm
	 MWqdmL1gqZfFKD0qbze0HwVWVj8iDSIMGNVe5VQXNEJUlh8KeVVHdioRgllCh8AMgvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mBREJxG9;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C403606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C403606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mBREJxG9
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so373522f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994216; x=1795599016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I137t/b2HCf/JgYtsEMky8nuvLyX5jojfAj0ADTMjuU=;
        b=mBREJxG9FkN4FznRWb5Z1HhMrY/Xv0FwWRZ0H+ctq5p7521GuELpcri+gGNR/be/07
         DUHccy3El/HTEV5xmYRkB14D51VpO4EKG7e41K1s5viehU4LEHdZnICNY6SgKdCV3SEt
         LALAanhpIPNVNB3GkigBWwQ3hmjPTR0N/ECZSV7qiz5D2H+pOcAPGz8HYQPYBzESHPB5
         l0hmpsTp9/fN/tVMK5TTJFn+B4hAyQPTOjxgkWVxRvkPQ1MlcWciDF8FKrt/v49LMlki
         sZ4cmfXNyswBgzwycWuZdkZXxhaALQwMtKGkCbJmbv3iIQ5vg4v0tEud11j/wDgwcwYG
         Z+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994216; x=1795599016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I137t/b2HCf/JgYtsEMky8nuvLyX5jojfAj0ADTMjuU=;
        b=aWGTx1aLiSRetBjxiDal3rPtz+BdZPYKO7qm2ZbWeDNQn4CU8D6KfVTqQUMSa1rotI
         mCGOwK0YREfB5qDHfBJvsuKZC7oaH43wLk4u/h83kcEfV7cO22m4DCcAR+CAwAWIY1Lt
         sCwsqBw18maNJFeNG+/NMLbLruzqxtvODqvcv62Cjea9q6y/X1mCgVujpfPKFC+Fn+UM
         x7XL57dYYD8bbGMPP7LGUbA0yoZ9bcT3XyAfgSBxV03DWuhWtFxXCP+Vnven79WtFiZY
         0UUC5+n/1+YSvw0c/EbqvSdnqsmRTmiHxjP6ZXSA0C9gZ6KxzzWTRIDUUDRWph82h4g9
         QeFA==
X-Forwarded-Encrypted: i=1; AL+hErGsG5kttSzjmY6Llh0KAXz4fMu764+O5Way3ukPLEOxNyLVoVgLApyAe7Fnhpnvi2pNPlVwmn3fIA8U5aM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rr7rGk8hFATK27mtBojC7M4efWIgWPWAHQ7xZ9wrtl0sZ+vxB
	K2w1uPwjzpc9tB3UQbkGXbCpMVlRTXT0pKMzczyupquYlzWXM2uEtQwV
X-Gm-Gg: AZFdTZeSGGx9TwJ6+yYUDJix3Nik4h3E2OQIdOYtoNeY7Ce1YiI/VkxygxIwBkVCZ1p
	LkN8ikId24XPAW20ZRIEZI4qYxspDKhrKNnCpCKc3qhBYAF0mvVVBO0sdxNDV9xwSHptXfRYxXP
	GDaG0pqosUc7GXt7A74+vU0K/ZimlavlbSydqh8lkFF4NeefJPPaCs6vXoyXG+RuJCRl/zCnXfo
	pDlYkVpnjdwoQD6EB8+ZLeawRO8PTkst9Sx9cm+61n8HTbbSq7x2LTcEzicOwQwaDV1NZS1xl+9
	JrJ8PtLP+rb6UCwS70gjKdaMloJpahH2BROtVEfQ72WLtAI95pvdzWFK/iHgU9SD38MxjXXzhOW
	aMDuK2pK4RLqPNk/uDy3RZvcykdsYT7ANXaqcI5z+GH9iBJXAdhUK7QxJIFopWln/8OZvAgOplj
	PMoEAyE1YYLEShTYaNNlhaqPjvIk74UQ9sq/8JdEuzU3V6/vEiZ2mHxFVJ+cgz/N5c1bO5QaDGT
	C5YBzCeUY3kgpJqQoL7pngSVqKPB5l44eziosNxf33fefAAcAzbL92uae2hGJCCx93Dr1ZWuXv1
	vXlqzTBBChzdS8W/6NgZtI0x6Ku+azaao8Xe4Yq6q2s+jhDCFAmFJIiq4UOMkZN3qWIfMgFjS55
	ok6jgXsgfh55SQAetrTZwe1Xdk1F83W6oI4kn5ZNd+SRz2BcmAWRipJVZeAq6GHZR4Ize2GM6go
	ZioVlRTmVXhPrx/dY3cybXXsF3iPqAB96DmltxFxhBsKhkAJuGpSs6
X-Received: by 2002:a05:6000:40c6:b0:493:4426:96c7 with SMTP id ffacd0b85a97d-4a63ecb5478mr4038646f8f.57.1794994215650;
        Wed, 18 Nov 2026 01:30:15 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:14 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/6] net: mvneta: fix the TX queue arbitration and the mqprio offload
Date: Wed, 18 Nov 2026 10:30:06 +0100
Message-ID: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The NETA TX arbiter is left at its reset default, fixed priority.
Under load a busy TX queue starves the others. OpenWrt has worked
around this since 2017 by sending all TX traffic of its 32-bit boards
through queue 0 [1].

Patch 6 serves the TX queues in weighted round robin, as mvpp2 does.
With an mqprio offload the fixed priority stays, so a class that fills
the link still starves the lower classes. With the default priority
map this includes ARP, which is in class 0.

Patches 1 to 5 fix older bugs in the mqprio offload, found while
working on patch 6. All of them need an admin to set up an mqprio
offload, and the oops fixed by patch 3 also needs mvneta.txq_number
below rxq_number (both default to 8). v4 therefore targets net-next.
If patches 1 to 5 should go to net instead, I can send them as a
separate series.

With patch 2, replacing an offloaded mqprio qdisc under a new handle
loses the traffic classes of the new qdisc. Patch 2 explains why.

Tested on a Turris Omnia (Armada 385) as net f56daaadfeca plus this
series, which applies unchanged to net-next. Without an offload four
TCP streams got 23.5 Mbit/s each on a 100 Mbit/s link and 232 Mbit/s
each on a 1 Gbit/s link. With an offload the higher class got 94 and
926 Mbit/s. Only the Armada 385 was tested, the version 1 registers
for the Armada 370 and XP come from their manuals, and suspend and
resume were not tested.

Changes in v4:
- Retargeted from net to net-next.
- Patch 5 replaces "unwind a failed mqprio setup" and checks the whole
  setup before writing, so a rejected replace keeps the hardware setup
  of the attached qdisc (Sashiko). Reviewed-by dropped.
- Patch 3 is new and checks the TX queue range without a shaper too.
- Patches 3 and 4 come before patch 5, so they apply without it.
- Patch 6 also writes the version 1 arbiter registers and keeps the
  fixed priority when a setup is rejected.
- Patches 1 and 2 keep their code and their Reviewed-by tags.
- v3: https://lore.kernel.org/netdev/20261104224518.66487-1-pepe.schlehofer@gmail.com/
- v2: https://lore.kernel.org/netdev/20261103125021.70845-1-pepe.schlehofer@gmail.com/
- v1: https://lore.kernel.org/netdev/20261102112816.12322-1-pepe.schlehofer@gmail.com/

[1] https://github.com/openwrt/openwrt/blob/a5e96c837ead549820867bb83c1ad471e39f5ace/target/linux/mvebu/patches-6.18/700-mvneta-tx-queue-workaround.patch

Josef Schlehofer (6):
  net: mvneta: lift the per-queue TX rate limits
  net: mvneta: fix the removal of the mqprio offload
  net: mvneta: check the TX queue range of an mqprio offload
  net: mvneta: keep the TX rate limits across open and MTU change
  net: mvneta: validate an mqprio setup before applying it
  net: mvneta: serve the TX queues in weighted round robin

 drivers/net/ethernet/marvell/mvneta.c | 184 +++++++++++++++++++-------
 1 file changed, 137 insertions(+), 47 deletions(-)


base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
-- 
2.54.0 (Apple Git-157)

