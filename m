Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289528;
	b=5WfLEs2tmKUnfVIfm/4AO9bR7tUHGxGia06wOTT7FuiXwASu1nus81Fo9gim2nF5KIL6
	 cgFZ7bEtQx50h0wI0EBNzUvwLDG4YW1cUaRnrGwfuC2YqtvprltYRhBMq29xzVzByCkPr
	 ThFW6POnvW33kiBXcgzB0cBx3OGQssxZYnlJ3pEd3xc1Lp3UatZv7t63zu6AC4uHp4hHh
	 V2gP6h5cds8zcIygEcU4JyKBGoqA2yFN5AzAZq+ilBD+6yG+o83gOkBaRD40rP79t6fn3
	 7LWn41GuvlHTqd5NBz0cXwWpQcL5VARTjzDZABykEvEM6DnExogP10otLKTehic4XMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VE4zAAxcygsvV5ZcsBxmmkhqvwMRdkRmIU2rT504NLg=;
	b=TEzGD6ritEYOXIu7BkEPgF6n6jKUAhnDlQQqvVrNlyWWvF4hm44nM6WsTHl16me49LTx
	 2T8frVxUJgwrmuBfSfO08whN2jsX6KN6MOSl4g78OwlgR3yhCYMhNQaf9ms0fmzPGHYkc
	 DXIQfrlOncjHseL8Yn+emhCPqsTnhJInvF7P0IDPAQ/5etz7sSHivzeG/4okh0xYSYn3P
	 SACJ/2fZ2vqlmMFbwooQshLMG0fdn+A31hrwlZO7R65fgcwjErrsgWYHUP5Cz+xtdhVbs
	 fwsICbLS/6Dw9BOaNeEiqgkEd21GSy1qW+nerlDiWlZHk3n4l22cx/+Aba9HFLESYPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHRe5Yaq;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49532606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49532606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHRe5Yaq
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04e3bf46dso12771215ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289528; x=1795894328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VE4zAAxcygsvV5ZcsBxmmkhqvwMRdkRmIU2rT504NLg=;
        b=jHRe5YaqOekqoanDCL2SqWu+a0WnRr+HP/6F5Xp/9YDfMohErQGbCjzj1yVPjIfq8v
         N8v1HFclRLzyZ3jmWqlq8ipqm0qgH0hueJ+ZTMgeRLOsqrM/VmS2ibNaihovCF3yx6Kf
         rhfX42Y3ADLvbkuvgAeNfrF5PXvv86jqJyyApYPubLNbDZYk99Q003BdQZMLGr8cITD7
         Re2W4mVpE7fvHrvMrCCrZKcgB8r2HpYkhZF38cPptw6EBtARGGAeFkV4LTRmDDaXwd+e
         509ENlVvFgIVhHqPYvmL/TU8xg6aFmeZQR/KD7XZtIHlyw2PNfiOgdKAnEQqFBT9WscW
         1WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289528; x=1795894328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VE4zAAxcygsvV5ZcsBxmmkhqvwMRdkRmIU2rT504NLg=;
        b=I80j2NxBfEEaJtqEDK04yWKlE6z32lSNNHHj9p6C68oHI0urciw/8SVbIfeFOEoxgs
         yKRFpqfUlRFgO6MmdVDVkvpo8KUu1f0wCygsGItjf1CrQTcXhIBK8IzmTLbVkr0BbwCM
         HC3d863b4D8PQ7X1tMFJjy78fZXqHckn9RTUmWAK/RUAyR0WrRz/lxRgWV44PJ78Nn2H
         CXFXYqjQVMwktxG57USmfIAStoLbvq5LtuG3ok8i0eveLai5W4P8/gLGs8zdQHAX0SIC
         UBTJAYP0uljU+yNz3ybuRB+AHLV/O5dtquQjP+ViwCFx29l4tVB06+wo6URpZcQgkkGS
         WLrg==
X-Forwarded-Encrypted: i=1; AL+hErHznMWM56qmyv1c7h7xjwr4TRUBZNykPL1R0TTvslTTlQ9mKVJ7MMb9pOrJAGtQZHkrJOHpPuFU/qOuID0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WSPBxUPW/XGb0HZrxbMF+d4s2bZunVkj/JHy5tilCKteCI5Hs
	n2+TRevZdg/WJ/M4wzoy3fp0jkDNzOQVv+SRFnlK8gexy9/OVfDPUbts
X-Gm-Gg: AZFdTZdd0SKF6mQmll1VQzm8S533c538UmymAAHgayoguWTWCJIxJzswAE9Hm3fqnwB
	VuWXwVx0FJOIEZ2i3AEP8wfCWStR+o+b9QpYM+wSsGEfo7h4l0ZsB1k1322mJw3uNnLT76Ra7IX
	jS4+WO2ThlYsNuvGvpWSAi3bESQRsibgD8zIUZyjwY1I/2bqNoWpk3kZT372+0fgPPVI+qZgZ50
	E7VSURMzpg65J5zSUIYk92kl7b7uOeNPcTS+bIZKV95yueMECEtEQS+tb/djtd2meYzImXxqhhE
	omIxlwiSD0YjppI3BInUk2o4RmnLr6OgdcA3NVxC6HR421EkFzkbHqM700vuCGQUBfNOghvmafc
	4UbP8cozo2rQ26XoWJKQoNVUyWtP7NfU4CtQaJU7UDJCOByP8faCcddR0dcttvMD9VL5VOra+mT
	mvB+35lUJasLkZAl+ZFpxeoLQelRn96mY6kHLLMt6LA9CGdm4mGwpH4k0zYweWHTyx6MxcSOt1L
	+H1mSFoJ7Cr6VsW01HJpbqkh/RLHtPGfQiSzOj+1cLjgmsSGCjJ6JpfTpkIyExoQMJHPxU9MPnj
	t09IicMVnlha+3gZzmvPFAnoQw5hIWveV0vMO8hs2vnZ/9JezWd/03ykqw9Bvu2M/WcnCfXPMHi
	7Gnh4ooinZfAh
X-Received: by 2002:a17:902:e847:b0:2ef:e32d:f476 with SMTP id d9443c01a7336-2f03f1cf4cdmr74856185ad.10.1795289527674;
        Sat, 21 Nov 2026 11:32:07 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm28591205ad.59.2026.11.21.11.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:32:06 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/1] netdevsim: bound the peer TX queue index in nsim_start_peer_tx_queue()
Date: Sun, 22 Nov 2026 04:32:01 +0900
Message-ID: <179528809256.2009509.5007624677973207521@gmail.com>
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

nsim_start_peer_tx_queue() can wake a TX queue past the end of the
peer's TX queue array after the device is relinked to a peer with fewer
TX queues; KASAN reports a slab-out-of-bounds read in nsim_poll(). The
patch skips the wake-up in that case.

v2: send the patch inline instead of as an attachment (Jakub).
v1: https://lore.kernel.org/netdev/179505710275.3511681.13434978152402269948@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, the reproducer from v1 no longer triggers the KASAN report.

Kyuwon Cho (1):
  netdevsim: bound the peer TX queue index in nsim_start_peer_tx_queue()

 drivers/net/netdevsim/netdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.43.0

