Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960482;
	b=FcHsFZyusxt6mbNcMubw3qT0DqieAgVKdntCK2IjPt/dRk2bqe4VEEeQkKsgnVUoRHQ6
	 dmp/pWqNa9gi1Ht5vYYXx2/deQZz45al2zYcFiPfCKxf1cgM25HbHr97Xn6J/dbYIed5u
	 vzWuMmSf/oNsfRq2VHhEhiGWH1Q+xP/y+AdUF+G20b/hp5vQVs1bBpu/G3bwxTOKOGhme
	 BqupdPb8bQdtcUdcwwUp/yEE65mi7yZVOzI1FCJdUmrcUUg9X5LK6vvqFtSDfmPeXnnO9
	 U57ywMOhY266xnMm3Kxn2mwhlJ9T4f+awJDdP4kmRSzpTmDhAc094ovoRcGI/Q1Ue3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
	b=gDsNqDS+fxs0DAFmh4mGYn91CZj428QOXWgI8X0ieKtXt1eDuE6oK7ub5kSYL+LLOq8a
	 3A/oL8BhjeMOKkk5cG2Pll3wflj8gMuBLjQVUKGTsszmDfW8xSWc4YcVrXwxM/R7j/iLK
	 EPHsli97j7hvyoaUIeFVscX+43I0hM/W39kBbg5ySi8tsds4rTF+UpgV80WOfgQZmYnOM
	 T/Igqfg9KqEnUXPmbaH+YWAW9C0GbmG1T35BXPUto2inheAlwJoKdptlPfpgYR/5HZvc1
	 7ygzUhARtQiKRkSJLWBwXGqVHJsbA+M3xBvUw0APH69dn2C2NeT4MuvD7E3QKeEosUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kixrYyYk;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54DE606A893
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C54DE606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kixrYyYk
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-53ec9237600so131409b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960481; x=1795565281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
        b=kixrYyYkKrlOhQUpV7Bbau/38e0d9V4iKAMOql8QUSA3egSSN0joWIRF83HrY1O4kg
         wj6ICoLrnHb/G6xt7SNMZPqazbcfErGjFUL/tRuopwFGT4UKBBtZ+szlkdWU4DiZyj/e
         F2HeY9fEvrrvvgukTWZnoAnliGwWSPMfMQ1tdZM8zGXiPMAPxpxrSDGV2iTF+hiTXtIe
         y298fgM9+rPC9lFhlWEfyQi/4ikh4y0YJpbivMTIkf4SE2d3UHFnFzTPRl8bR5oN0ZsO
         9NLtwNS1vPpDaHM7qMwLaES6RhMunNluxNSkMaTWDXGusG6ZpLPMVdog6U1HinXqdxZg
         8MMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960481; x=1795565281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
        b=T6MdSv9T6Lr2rp4YPNvJwYniQ2pXCuoFP9LCzUQ7sPXNbScn/oELDi3J/yx0VjrKqM
         b81iBBJMuvSyU/kD1B/0fdUusdHwErorCifT/woeMKLjPXoE1sTS1dM+nzRH1rbG30F+
         u298Yhpl/ymz9NVpMwStJj2nRRcWUF0tZmU1vPxXq81XpSkEPmZiSMywMqYGXU9M4w4H
         TVzopDZGFR5D1vxo6NR0HnGNt9uCRtpgYrcXbwdEusWenVWNyMMqMOFvdTrDqmdxZk/W
         e4CzyScBl7St0y5x93JfSZGNKA8V12A7+GcdcDzL8wLV/8UBElOwb2d0Cd6rwI7hzzNQ
         U5+Q==
X-Forwarded-Encrypted: i=1; AL+hErF6Ie5adD5ypiaj2aZOglk7BShMKDYtlDSLBTJA94Wx7FFsXR3wOF2LMwfeQRcUhfC26TcEvFgwSKP8XW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f+549BMJXsJedamoovwpPxO9vjF0tlbid9xpbXTztjA57bumK
	xP/oxOJ3wu4qx7JwJVWA7UOjYzcT3Pfl7WXOEiRfuCo6e32oEFT+A4wv
X-Gm-Gg: AYBFou1x7rad3gIs8VK3zOiHEXeClePcgX7XKSt3zsz9XbdvBJDpP3fpJJwVs5hvBmM
	q/uTFKfadE8CbXQo5zyv8eXj+Ccl0u/zd+uOPPkksVka1ugJ/uQhfoat1ld9DkK+s0d7PRrAfFt
	/rIKHbBC5SP8CscKEkq8Xypn7mKDsH7fY8tJH5jqbR7ZWOn6jmbwY1fgvLrYUfMwRjTdm9UfCrc
	6UzMOGi6oXFcNZU5uF3Pbsf6Zdf36yRHLBcbzTffgpRYaPgaYM9PKwneOOa5h5kQJ7OZg+SHMbp
	RIcgmZ4ibmXziGNrKZulzfmKqXZpWaUuA8ghKzy4MzE1bxp04wPLipuRnVpOUi8bMH+F4Kbn7T3
	VsS9G83d89euNlcqicWHDhCx3wZTnUN75hfYg++0eWcsBvfGcVOY28/g55HgoILOHCLU3VaAZNy
	wks0Ip8SshxwPUBuk8DTqbnYhSkXyyOt3h8Ax9X3B8WlT8g/1Rl4Q4ll7X2xBfnIWTiqZlUaV6K
	KfordsUWEhAgHnBKM84fM4j/r4kK+dRXbsORWyoTQCOyIAz4Yy8r5U+duXX3ztGSQkpNAMZJ8sw
	Qe77ka3LfRnssz329K/+iAvLNJowhzvpFB89tKYf7hPp9uUZsuM6wp79fWVt3Mq4gF8gEdy8vRo
	C8asJ97lOKWJ3PvOwqAute0+H6M9wmlYcKfg/gKFEDAO+xsdsBXf0SxklCxmJPqaBirrD/GGO6S
	ZXDLB7wQ7C27596z7cUpQwrsWOgODe2ob+IcTRtlDQnhcK5b7vOb4=
X-Received: by 2002:a05:6808:309c:b0:574:524d:f252 with SMTP id 5614622812f47-5774143060amr1944911b6e.24.1794960480831;
        Tue, 17 Nov 2026 16:08:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:08:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:45 -0700
Subject: [PATCH v7 6/8] dmaengine: dw-axi-dmac: retain descriptors until
 callbacks drain
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-6-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Wang YuWei <1973615295@qq.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

Termination frees every descriptor while a pending period callback can
still refer to one through vc->cyclic. An executing callback has already
cleared that pointer, but still receives a pointer to the descriptor's
tx_result and can use it after termination frees the descriptor.

An error interrupt can also move the cyclic descriptor to desc_completed
before termination. Looking only at the head of desc_issued therefore
does not cover every pending cyclic callback.

Use vchan_terminate_all() after stopping the channel to clear the pending
alias and move the collected descriptors to desc_terminated. The existing
synchronize callback drains the tasklet before reclaiming that list.
Descriptors already detached onto the tasklet's private completed list
remain owned by the tasklet. Repeated termination preserves the retired
list, including when called from a completion callback.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Reported-by: Wang YuWei <1973615295@qq.com>
Link: https://lore.kernel.org/r/tencent_C00D995A9F70206DFD1330DCB1222EEBCB07@qq.com/
Reported-by: Mitch Barnett <mitch@accuratesound.ca>
Cc: Wang YuWei <1973615295@qq.com>
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index cd9a5b45d295..97098367535f 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1203,7 +1203,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	unsigned long flags;
 	bool enabled;
 	int ret;
-	LIST_HEAD(head);
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
@@ -1224,7 +1223,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	vchan_get_all_descriptors(&chan->vc, &head);
+	vchan_terminate_all(&chan->vc);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 	chan->desc = NULL;
@@ -1233,8 +1232,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	chan->cyclic_restart = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	vchan_dma_desc_free_list(&chan->vc, &head);
-
 	dev_vdbg(dmaengine_chan_dev(dchan), "terminated: %s\n", axi_chan_name(chan));
 
 	return 0;

-- 
2.53.0

