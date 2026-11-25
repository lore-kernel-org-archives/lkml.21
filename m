Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593444;
	b=CF7xjxM+eHw40h7yW0Ykv+YMfb/aNnmf8pTsYPGVzoHtmMmHLUqyDvUFicXbU+p1cs0I
	 dMu7wYVp8dtlQeh5X5X3gE1eFvFTBlHJwU8jHcMumjqVvgwZ8jxSr3nHrKctdr4/6HB5H
	 NCZsxYQRlOezyVB9r8WoPgEY9phg1KkgjVp5nEQOTom/Pp0h6YOrJJ3YfsSVfh0TN4mWA
	 T7VH9mV1fKdEoFlsvW8jr5p7XvnK2Or6bZ2DS8WSLmH1GgRdZIL6tAY4RMhXBQx8Y2lgS
	 Sa5z+yz6vVbJ4wVNZfuTzX7qiAOw5nDkEHotSoCR/LNklExRsjNYzW8N/lNfLgVaYQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XuNfvEy1BgM6+lq/Ggcvuq6XdX7O276tu5lC+EY67b8=;
	b=3aSoMkYZcklaE+qalj1yvJO2TD3XVHx4rArI04xkPNw2p0vsxEJ41a7JgKNWmE1ofPkK
	 N24z8fF7QcE6AUNQ1QL8wpnZHYYPStBAszt56jz8Ggdhr5slGvcJpH2HQndU/DnxSHC1v
	 /Fqf+bI+sG8VermDSXqNY45QCg04A7wmSLcnXyrL+S9Nf+kvCD7weYS92C5heSG9hgWsZ
	 SFvMM8dH1i1t4e9wLaDWVZfrvGsn+ZLtu7bhfswvLjYaTDMux+xRW2FQ8U+44xuCi0F5U
	 ArExNqmFuqOMbq4Kw1aZbqoX2OCf7hgv3ToE2s65OLBM4CzffF9k0RmSqxrv5hhAOGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFK8tmDW;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02178606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02178606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFK8tmDW
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2562247a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593443; x=1796198243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XuNfvEy1BgM6+lq/Ggcvuq6XdX7O276tu5lC+EY67b8=;
        b=ZFK8tmDWhCipL0grDwpXjMPOD20gczCLfVmo7aiULDHAvwARWaIiOC8ZX1wNkFuclF
         wMtQq3G/vEWJHMGvgBUYq+stgdivQX5+iNCCJXMnhID8FsC5wrmAB7W2hVd1hFsUK+gp
         r4k3r1kAm27vBm8wEcuL6ZCuchg/lem5eYpZ3B10Cf4AZLIHy4a1nPZlEp3Vh6v5OSjb
         3xSwp/LK01S+cc2sZYyapeFMxruE8P90ELucOc050HgPati2I7WlSlM+xWWz5Cy/LnkH
         1uZBVXf0ZC4iEKS5L0pMAW0vMZcvCzPPpl6/StWZ//FbX70bP1FDgIt9DnSRY7bnH0G2
         pt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593443; x=1796198243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XuNfvEy1BgM6+lq/Ggcvuq6XdX7O276tu5lC+EY67b8=;
        b=usfa5dfZ8Q0LswJ6hDlVz/SnEOI7dpu0viIvLzEJJbxFdzfM+s18DCH/50K71S5hCB
         fMNN1RjzAPE7sEWMfTWtja1oBfaNfFFrWfBze4VYl7CeF8k2pnQUshj3U4E7KTQblku5
         FDQjDhztLlvz9MC3SOnAZbRY68xSrKAgpQBF6Sp2+GPFhsE45C4xTcKEAJ10aNJolY6V
         YFAv75MyIjyegQqLp3Bp1VVa9xD8TgVK6SabFzXYnkhwsbY9CnhHymFSAAmPnPGXkf2D
         8SLVVCtyJVDxWrmcqdND78AYQqbt/1RymhX4pBymGuHJ1/fzeyqJPAbcDuY8aw34R1Mt
         iLlg==
X-Forwarded-Encrypted: i=1; AL+hErGxA6bY/ER+LZOiWnIlw6YofMhtuqCnCv2jN96DOuch71L7DAVy+dKiYHV8sat55rO/O37H8PoawPbQ+5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sXP4nzuMT5sDJZLF4d4AXnNFQSUgaaVCVDTpqaEi7HN/7rrFe
	Jw7vuXmWaYq/srA1PIChUVHqi8FXOXJ0j2AybgJ/7yGbf7rGTw084u/s
X-Gm-Gg: AZFdTZcElqipwFHYnqyniKPPYmlQ5KByEhQCMgFZSHlOcYl0+pbQEKn62qAbQrBlXvm
	hnNS8aOg5f9b9w25bEy4xNlYgTi+VV8PxSbrjP6uLIvOK+rEJUKaSZup6Zmrf+5s6SqvlqUbC2+
	eaa6hedsT0TzxiZ89Dt+dvZJlvrk4ozU9bbLNqOME9M12QDRvd2mbSk/3dT65Ir+d3gcHbl57fJ
	0FE5MBhTZ3IsDkdo6eAZUibwltgpqqu7ZguMoCrJZk7M6ORbjHrdSvo9OvLL1yhylfc3lUvEIaK
	PFL20GG5hvkAoSe8xScF6eKt6ZHV/k1DihV3H4fGXaROIzqlxBVlMqaSKFPtKzDXa7y0CywqDWz
	LRMHtSBpJrO5PD2TqU4oZrXwExTvxJ58WylyDsNXzPEIDGgtJRkhjXfzfq+/Bihvz5VxcLledkL
	zyL+KV72VMsGXXNFUnksj2/H8w62xnSuCpBRSPj4DKgKYf1Gpm64hJnWxeWy5wXedCrmtZj7bw6
	j6Ye5G0AzlQ866BnqhGzKyTaGhQBKXEvwZL+fy8s0N/dv30VnG6AL9g8/C5OLXkmNYk4VVrnMeJ
	6qZxsJEmiCgHJ6oqrRGNmeZ73Y+q
X-Received: by 2002:a17:90b:5543:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3b41c8dd197mr15969724a91.11.1795593443202;
        Tue, 24 Nov 2026 23:57:23 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm28092402a91.3.2026.11.24.23.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:57:22 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: romain.gantois@bootlin.com,
	cathycai0714@gmail.com,
	avifishman70@gmail.com
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] net: stmmac: Fix the problem about interrupt storm
Date: Wed, 25 Nov 2026 15:57:16 +0800
Message-Id: <20261125075716.2262174-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7732873.EvYhyI6sBW@fw-rgant>
References: <7732873.EvYhyI6sBW@fw-rgant>
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

Hello Romain, Cathy, Avi,

We hit exactly the interrupt-storm scenario you discussed, on a local board
running a PREEMPT_RT kernel, and I'd like to ask whether this series is
still being worked on.

Our setup and trigger:
- stmmac with dwxgmac2 (xgmac) and dwmac4 (gmac) MACs, kernel 6.18.34+
  with PREEMPT_RT and panic_on_rcu_stall.
- Trigger: fault-injection of an uncorrectable MAC safety error, which
  makes stmmac_global_err() schedule stmmac_reset_subtask(), i.e. 
  dev_close()/dev_open().

Symptom:
About 30 seconds after the injected error the board panics with an RCU
stall (rcu_preempt detected stalls, rcuc starved).

Root cause (confirmed on-board):
- The main level-triggered IRQ storms at roughly 820k irqs/sec during the
  reset window (irq count jumps from ~220k to ~23M in ~28s).
- stmmac_interrupt() returns IRQ_HANDLED without clearing any status while
  STMMAC_DOWN is set -- exactly the "unconditionally returning without
  clearing any interrupt flags" behaviour you flagged as dangerous.
- The level IRQ stays asserted -> infinite storm -> starves rcuc -> RCU
  grace period never converges -> panic.

This matches Romain's point: the unconditional early-return in the
STMMAC_DOWN state is the actual storm source, not the TMOUTEN/safety
watchdog.

Fix we validated:
disable_irq(priv->dev->irq) right after set_bit(STMMAC_DOWN, &priv->state)
in stmmac_reset_subtask(), before dev_close(). This masks the level IRQ
during the synchronize_net() window.

Results: irq count peaks at ~724 instead of ~23M.

Questions:
1. Is anyone still working on this series, or should we revive Cathy's RFC
   with the evidence above?
2. Would a patch along the lines of "disable_irq around the STMMAC_DOWN
   window" be acceptable, or do you prefer the more general approach you
   suggested -- wrapping the STMMAC_DOWN set/clear in a handler that also
   disables all interrupts?

Best regards,
Zxyan Zhu
