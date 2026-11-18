Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998469;
	b=NchVC6SNDS9JZbHaKcuyxy/ENi9S0fo7AzDrojCf5a5ln4pK4U5XTZXgPR7wisnJ0ifJ
	 MGKmNRxu8YANu+9odgrkBXyZO3N2eJIBhn3v/IzxQPvbVB158Z2cOPN1x+AaevYLpQ4NK
	 /u8mEEYFTGSg4ydhxWw9XM7e0qpxbF6j4tQduLRFvLPxMjfrTYvMHwf81OBj9Ab8tr/PP
	 PXS4aNRLPhqgEgId2tS3ggp3cnE45lFuZVWtTeAG69ypfqRLH6T34XBATzis6Sf+kQApx
	 rLQTDdo2VmIYi2cfRyUIwIm0KAXp171vZzDFzfeA9sNu3TlXqpazSbD5V6RWwLo6CZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kS3cX612MipxE0CFdz557euZvfmxBpX6YeWo0Z1H5i4=;
	b=A63SRCuU0AhorkiEmJEtHPYzNCeveFCyJebtAtpxBBfaE5h/4mTgjApU/BJZaihE/Ozn
	 qXH7UiAlI3DCIeN9DEk0mS3Nx8yxJBbPEUr6SKh1wM9SUOf4iLWSschiRJtBtascwuV2O
	 5gbJskwqQNYRgd9n2DUik8cPJVsf1M6owqn41BunSV03mjGC3z4L+JU5ALATorAMNAZ9+
	 sgjHSfWH3dgztb8PibRuG4ClzZCD/CM6zYI1I/onWrcoXf5usO0T3VAezHSvzYtJQUpST
	 reB3tDL5oFClo4OdBCnf+pSGy6bZqMzWKb8PEJzcaVA01DYDj4QDPb1FvSGgujhH+Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuNab1o8;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B32606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuNab1o8
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso376304f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998467; x=1795603267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kS3cX612MipxE0CFdz557euZvfmxBpX6YeWo0Z1H5i4=;
        b=zuNab1o80s/NsAmT7vCIB+Kwdfv2a70k3ZFq+IjcWRnkoUsgdlds39GvM+lmMuJf2L
         /d+wlh3bgTA0ynZsyXPTo2cKgjuhOmrtJ+XhbvcQyLcUIEP4WB4Yh4Ou8HB1lDe1ShYu
         hqKLvsuy0wr3jtVBZGFpff4hvlmViJj40X8/kBvFlqy8PsJqhVsg93DVb07a5HFFIX0U
         eKg8gCH6c3CL0AniupIMQ14VYg54T21o+SA1glQgMo6OsrLHx9dzBS570PlIm/eZj8OV
         Lm8XsPMMgzT3uW+McmQBkZjvbW65/fSJDCRDd94dIujd48W7XnXKJ6N9DjDSZr9nskAo
         uf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998467; x=1795603267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kS3cX612MipxE0CFdz557euZvfmxBpX6YeWo0Z1H5i4=;
        b=cCrOs8sS6QjTHaygcTLNgYxTOYgH4SAlGOjvbxK7v9aeONQLQ0XFDmR4dAeQPXq7kR
         CdHkuzcBr4X0brJg9M15JtFfMtwCvrWYymKQBN844KQCfUT9n2h8aTj2F1pmBbOpfTdp
         D0Xu1K6h4Oj0kUKvQtgbzH6vtYlOUZUXQyr1JkaRgoWjxQIMQp4HpUtwcfaoAbYtdLrP
         8FRSJndw3CiEoBKQ883P0+v9eI5gTtb8ELGfkMUF4hHcFrxkBZmLUfwKmAFnqsaa1WdY
         Optq/UiuVsHoF4Au9NQfHZVqjTWdngvTeD6PnlTuWsKrI8kol1mMrGvCpuk1vJ8uzUYq
         Y0bQ==
X-Forwarded-Encrypted: i=1; AL+hErGVGaw6hefzZEJb2uQg2oX4DMEPF3HuYe+41YJTro8vytlfQlhZDkHIMbbxCfiaS7Gqu4wIKoOmmytnf7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XB3x6sqeqemvL874KTU84GadGO9qzUCQvuIV5fmcOaae7Y5OM
	b3bBxyF6GIR6G50oxDtx5ZonEyEU1fmCSZJ/9dAZcT0Bl1M7YiALOD7W
X-Gm-Gg: AZFdTZcjQWy9vflA0aZ9DGPJw7jkWxKaDI0AxTemRZodazUL5ubQRUZzvc1qGUZgAzV
	cRlWnQ9l74CpMgEa6Lljqb3lmzZ7cr47y+cYD+NYIbzPh7g4b6x+b2N4DpwXBlBQojJoITge/JP
	zDokbdau3VOrnFyXMCJ1I3U36KO1YnL+Z7kYH9liHiZPy94TAFkSelfG3307bhIl44OP6Mp+a7k
	CKPEie0DaFTmV17td2xRJy3/e1YNvp8NmV9uQxmcR1wNK7E6dlSO1WusZ4RGuA0WVi8PUDpvd4Z
	HD11wSxdi9sQS+duJmmBAjhCzIi0z+E304Tr/vu01FbWnlyoLw5nizd5YlyfnrnZW5D0eQiL6C4
	QGkvrUdcaM9z3j/Z0cpuZTBjOUHokcUAFCs2nl/kSrhIUjdxupOZYcB6jP1xK3kBXd9I2GGtn/V
	NxzjhIYzBEf0r8IZ7NSiUXOu8yNERa6/NDu8HMkXzYnclN6SkR6dQfIf29jhRCrB9bzqeSpbSN3
	onuKPw+W4RQ07t8xuA5gSCpyTHN0sc1gcuXLeXiCq9F8PmpFf+4zv8LxAXnIqAQAIV75c2WAE5p
	BzeEqHjkhSPsdGXVM/59j8XO67A6Nzq6G8n4ihBVVsASMwt7WengUH87SEJCxNpv8YqsW90hUBC
	UIotjsAiXe5XbCg==
X-Received: by 2002:a5d:6f06:0:b0:4a6:d298:832c with SMTP id ffacd0b85a97d-4a6d2988596mr2974121f8f.31.1794998466847;
        Wed, 18 Nov 2026 02:41:06 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-46-112-114-48.play-internet.pl. [46.112.114.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm4320525f8f.56.2026.11.18.02.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:06 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/4] net: dsa: qca8k: fix the MIB autocast and management frame handlers
Date: Wed, 18 Nov 2026 11:41:00 +0100
Message-ID: <20261118104104.26684-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The netdev AI review of the MIB statistics series [1] found bugs in
the qca8k handlers of the Ethernet management and MIB autocast frames,
and its review of v1 of this series [2] found two more. None of them
has been seen in production, so as Andrew asked for the related MTU
series [3], this goes to net-next rather than net. All four keep their
Fixes tags.

1. qca8k_bulk_read() falls back to MDIO when the management path is
   not available, but stores register i at val_buf + i with val_buf a
   void pointer, so every multi-register read is garbage: the FDB dump
   and the MDB add/del write the wrong port mask back into the ATU.

2. An ethtool MIB request over Ethernet (autocast) that times out
   leaves the caller's buffer published; late frames write into it
   after ethtool has freed it, and extra frames underflow the frame
   counter. v2 also handles the frames of an earlier autocast arriving
   during the next request.

3. The autocast handler reads up to 164 bytes of counters without
   checking the frame length.

4. The management ack handler trusts the frame for both the length and
   the layout: up to 32 bytes into a 16-byte buffer, read from
   skb->data without checking that the frame has them.

Changes in v3:
- Rebase on current net-next; the code is unchanged.
- 1/4: the description said that the last three bytes of a
  three-register read are never written; it is the last six (Alexey
  Immoreev) [5].

Changes in v2:
- Drop "let regmap serialize register access" (v1 1/3): Yongzhao Chen
  carries it, unchanged, as 1/2 of his net-next v8 "preserve port state
  across MTU changes" [4]; this series does not depend on it.
- New 1/4: the MDIO fallback of qca8k_bulk_read() (review of v1 1/3).
- 2/4: poll MIB_BUSY before the next autocast, as qca8k_mib_init()
  does after a flush, and track the ports seen as a bitmap instead of
  a countdown (review of v1 2/3). The description now says that a
  frame of the previous autocast still queued on the host can serve the
  next request, with counters one autocast old, instead of claiming
  that every late frame is dropped.
- 3/4 unchanged (v1 3/3).
- New 4/4: bound the data of a management ack frame (review of v1
  3/3).
- Target net-next; describe the LLM assistance here and in the commit
  messages instead of an Assisted-by tag.

Testing: the affected objects build with W=1 on arm64 on this base.
The hardware test is the one of v2, the code being the same: on a
QCA8337 behind an IPQ5018 (GL.iNet GL-B3000), kernel 6.18.60 with
these four patches, under tag_qca with the management conduit on port
0, counted on the conduit: one ethtool -S costs 3 management frames up
and 10 down (the MIB_BUSY poll, the cast, the 7 autocast frames and
acks); with the request timeout forced to 0 by a test-only module
parameter it costs 50 up and 57 down, i.e. the register fallback over
management frames plus the 7 late autocast frames, which the handler
drops. The counters stayed monotonic over 2000 such reads and over
5x200 reads under iperf3 in both directions while toggling the
timeout, with no memory growth and no splat. Under a tagger without
management frames (qca-8021q, OpenWrt) the MDIO fallback of 1/4 was
checked by the FDB dump.

LLM assistance: Claude Code (Claude Opus 5.5 for v1, Claude Fable 5.1
for v2, Claude Fable 5.2 for the v3 rebase) drafted the code and the
descriptions from my analysis and the review findings, and helped work
out the race in 2/4. I reviewed every line, built the series and ran
the tests above. The review findings themselves came from Sashiko, the
netdev AI review bot.

[1] https://lore.kernel.org/netdev/20261019191137.307514-1-kuncy7@gmail.com/
[2] https://lore.kernel.org/netdev/179304303832.3134.328719975361344250@kernel.org/
[3] https://lore.kernel.org/netdev/47e9713f-815e-4caf-8928-a7ec12d0087b@lunn.ch/
[4] https://lore.kernel.org/netdev/20261104120130.48455-1-yongzhao.derek@gmail.com/
[5] https://lore.kernel.org/netdev/20261107031005.2525-1-luixo-public@luixo.me/

v2: https://lore.kernel.org/netdev/20261104210757.467964-1-kuncy7@gmail.com/
v1: https://lore.kernel.org/netdev/20261022192933.384898-1-kuncy7@gmail.com/

Stanislaw Pal (4):
  net: dsa: qca8k: read each register into its own word over MDIO
  net: dsa: qca8k: drop MIB autocast frames once the request is over
  net: dsa: qca8k: check the length of MIB autocast frames
  net: dsa: qca8k: bound the data of a management ack frame

 drivers/net/dsa/qca/qca8k-8xxx.c   | 81 ++++++++++++++++++++++++++----
 drivers/net/dsa/qca/qca8k-common.c |  2 +-
 drivers/net/dsa/qca/qca8k.h        |  9 ++--
 3 files changed, 77 insertions(+), 15 deletions(-)


base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
-- 
2.43.0

