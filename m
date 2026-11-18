Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998470;
	b=3hMHJQjdPekHckIWleCiLq+ySVUpgsndPaiDtaysVV585yxbfojyG19ml3UjGHT1BvSl
	 2DIxNIp+OtKCV4iWBUS33j9koZRM059gkCQtWTbccuvRc68f5Mec3DX0v0RK579Du7+3U
	 n6yOk2r14DGkA0/qecD9T94jilemVJmgUro/TJbW0MKfCvf2U1S7QNwVVtdHpEzOt06ha
	 wWbgZ2C5ZHqDqSUl9hX6zb5PO9VcO7ho4FdO7LoLnZI5bnqgBtk448hVo+ZqwucbfJNLB
	 Lw88mTOvtrSDmjl5ng1IM5xomdb59Hc3c6u5+dQK7QUIUzrS2+D+k0S/KJiXiuCjBsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
	b=fRBzGKi5H6pDCgk29RVK+Lmi7ocIHN2wIwyQu4CCkYTnKOnhfPUBT1IQa/qpzRMhuPEi
	 /9UtkI4LA3fiC9KGWwfeAVra64RYjJWFX6cw4EG9b26jxnKwbArlNb1SLOauuJ9aRa6Nn
	 Va0QLFnkrz3Uk6FFNkh5wVcA2XHmzBLMd8fSJd4pqqA8YvC7rUFERAIMNHhWGEuZyAzCN
	 haoBRwutWnoAC8KSHciU8ITa+IEfAVW+ykMeENa0+Gwk+rdJOBPeHrxxey79lBxNy6K1Z
	 PS5UmN1kVQwCHpNEVJYRic7Or5B3ycZWX+bQuNCfSJGzp8fjUfafHwfWfSDfw+ItjVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnc5VWIG;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2A9606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F2A9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnc5VWIG
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49465892f7bso569948f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998469; x=1795603269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
        b=bnc5VWIG/OGvEIurIIk5O+jY0t7fEIqYGBB1T6BSBzhIjIzSJd3K+oMpEU0lbUXIGV
         REGw3J928rfq2I4FxTNt1lJQr1MGqKBF2KPSTCYeCEh+YSsPLJm5UxZeBJsfS205d+1A
         8sW266sPjbGpWyUSWgO0cGa4fElFgZ4+h2kgZDTAZLnr7KbdLWijbLdBKdsgPqDMNUUy
         qJJ9B7gPLeet5PdPt5vtG2Y8EtufGoxClj8jaqh8nPXlQ+9LtBUks5hFLP/6Bg7aEz40
         g7hcs3gHQNGt4V6nUmBHnkzTrSk9LjZPtePKjU0qfHBysojLhJfBRgB30+7sefzMbN94
         DShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998469; x=1795603269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
        b=EcIy51pTuHT+4Ft5nF9sxqxhxziWgan44SOBMghqVjiMyAHx6O3xRpcRDCsVbAy0qj
         i2owSkIEj06Wc29beOxHA/9d9yyUYf4FdgFZPhHnngKteh+27etDC1Wk7C3ny1KOZSd4
         XDv5bCTON4rbXRYdQPiAAi/2vK73lao9zJLxfEWARzQu4OkhUBgjyiLxr+vuuDo6JSWu
         gQ+hjMbjlFrKH4eesg69y2U49BKwt7qbwBzzeW1Hi3z8pZ00vFcAfky31XgkrvQFVR1p
         GDIJtdLilZl4/AaTtdOvXYjvLs9YuNlmwh0xGN0KGYHvrtUF4SbAZbyuni9oYM62KOjy
         0lKg==
X-Forwarded-Encrypted: i=1; AL+hErFUQFoCIjZHMcTBgUu04L5S08YItV8RNdLZKJeo4vFsxf60R9xlFeCaUEzOlkmfC3zA69XIRmeaGKjyXx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z81dd14IdMEW+RPxR8eRUqqU6ScijNkFgSl6uXh3F+wbD528dlW
	5pJMBf/BFDbRx3r/NG6hyXy95ZwdXVmiQ7hXW1DOdrnDVD9wHVAXn38D
X-Gm-Gg: AZFdTZch8SxBlrn78vd0a9Y050IPlFmNmZsf6CwWbS3wBhfEi1BGzZbtWw+bVzLIEx6
	YGOfHgzuG4Si5ljNGBSQ3FuKUHZysWvIFk6SpezkWRNWbsLsJwUKgbnhV7qeafIbw/VMpeiTlcp
	aPi8jvFrHQK3m490B6XbaGRjramWxlKwKzC4FZNnQBdeqiUKXgHfl9OjKs9pPZXtvKHA2j+qtq8
	l1tNQj5aN61M2rxu7rXhx2o8NB50uk3LSbeE5V7ShdeAKD6waHnLHOwFvAzUtsoNnQg5t1zuf59
	mw0RDxwM0N/l3LtYgLK4RRlvLCxJjhXyt3pbQBi6MLsDum18qwqMedkv4qdPnABzqWMYUw3Ky4C
	zg9mtEPBgv8xobzSlgfZsVQW7RdxHDjtb6IE4yBHPpMCiwgdFeDz05lw6ybopuFLL4a0iMQi9g1
	HF3QBjDjushC7QbKXSBEAlgVsAGzmqdclixYCjiUV0SX+mccM1dHDLru3j3B/FNPDw3tER8G4Uj
	0epJm4pSlKKHxJjLcQI4+YftZpLLIBj+tA/yNvS4EXczpt0w/6HbClDtpq7mir3VcHQAEp1/PWv
	kOgGVlui+kAl2QR8MNEcKSdEP22U+0MbIOoPZtKroMl0ZOPeiPerfCFzb8QevIs7Bedtx4XVsI/
	X7Bz14H1TXo11/g==
X-Received: by 2002:a05:6000:454b:b0:4a4:f208:6a37 with SMTP id ffacd0b85a97d-4a63c55e023mr2812636f8f.42.1794998468511;
        Wed, 18 Nov 2026 02:41:08 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-46-112-114-48.play-internet.pl. [46.112.114.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm4320525f8f.56.2026.11.18.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:08 -0800 (PST)
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
Subject: [PATCH net-next v3 1/4] net: dsa: qca8k: read each register into its own word over MDIO
Date: Wed, 18 Nov 2026 11:41:01 +0100
Message-ID: <20261118104104.26684-2-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118104104.26684-1-kuncy7@gmail.com>
References: <20261118104104.26684-1-kuncy7@gmail.com>
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

qca8k_bulk_read() is the regmap read op. When the Ethernet management
path is not available it falls back to reading the registers one by one
over MDIO, but it stores register i at val_buf + i with val_buf a void
pointer: the words land one byte apart and overwrite each other, and the
last six bytes of a three-register read are never written.

Every multi-register read over MDIO is garbage then. qca8k_fdb_read()
reads the three ATU registers this way, so the FDB dump shows MAC
addresses made of the VID and the aging field, the search reads a wrong
status and port mask for the entry it found, and qca8k_port_mdb_add()
and qca8k_port_mdb_del() write that port mask back into the ATU. With
tag_qca the management frames carry these reads and the fallback is
rarely taken; it is taken every time when the management conduit is
down, when a management read fails, and on boards whose CPU port is not
port 0, where qca8k_conduit_change() never sets up the management
conduit.

Store each register in its own u32.

The bug was found while bringing up a tagger without management frames;
an LLM assistant (Claude, claude-fable-5-1) helped write the fix and
this description. I reviewed both and tested the fix on a QCA8337 behind
an IPQ5018 (GL.iNet GL-B3000), where bridge fdb show returns the right
entries with it and garbage without.

Fixes: c766e077d927 ("net: dsa: qca8k: convert to regmap read/write API")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 382753bcc4..3c8044a4d1 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -519,7 +519,7 @@ qca8k_bulk_read(void *ctx, const void *reg_buf, size_t reg_len,
 
 	/* loop count times and increment reg of 4 */
 	for (i = 0; i < count; i++, reg += sizeof(u32)) {
-		ret = qca8k_read_mii(priv, reg, val_buf + i);
+		ret = qca8k_read_mii(priv, reg, (u32 *)val_buf + i);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.43.0

