Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955750;
	b=s6a0Pu1SqMVlwEcbrmM57S0xJFIvwzhLL2NTeakMPhlEK4P8+IO073rS0bTKA2YqmDso
	 sOHXVc/A7cRxZsMRVDzLZxXM9S2zUsM85NGHawkgO+8urVBlywEw6XsLjOENdYZJYazlJ
	 Suc+NAMF4Hrh0ZkR8srqzPpqJY7a6vi2mhMVUL8/nNJwVc5qQIV/WLZJpCYQS4htkwOHS
	 gyeB1zrLKwrP9giDG5DFKR9eEIktJJpYYw3gpzS5KwSqjcP83YKAa5DbeNZ+Gt26SWheC
	 T0dkQIM0XRtVFQeKD1rxl5z/e7rUESyly7SNeo3H0Z4f/4zraA4QorysBmzilhtlS8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zxc17WVo0gYUnTOtZw1pyN8QC3Vommte57dKv0ZbhgA=;
	b=TOh69BMbe+KCtxN0MRLfznBQmMwGtYWoWJ3TZe93mLdjxJL5igolWumNdWDp6JAXHvtS
	 TdjDXGoMXus9aN4tXALspCkMi6Iic4d+itgTalh7zi3Luuoc48TXR+7XScMkkkaFYW07v
	 0g5LxjZM9HBqmPqEa6KMnibVReUCy2UEYEmHwg2PKU+wHoAZzOHM/Pa2nm+PFjrINmfZn
	 V7M3ECzk8LyvnDfpZ41YC0wUqujVxdiO8fY77/xnRzAOI5k5kos7JskiJ7jNhVzGs74LD
	 PRDU+lYTqeCsEWN8bVmcmkO22UlEVEHxCplK45jKZOvwcaQDYXt7Cng27cLL/+SODjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tCok0Ar/";
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864EF60A261B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 864EF60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCok0Ar/
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6aa9606ddadso257747eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794955749; x=1795560549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zxc17WVo0gYUnTOtZw1pyN8QC3Vommte57dKv0ZbhgA=;
        b=tCok0Ar/JeKM2kOPQ/6MQ9xT0UiZ5MgjXtMfKNPMMawSO2jl/jdaEBKRcchyPk435x
         w/JMWw7I+PxT6Py8cy0uhMaBI4xe4/Bk2su3tZC0a7h3Q8foasppdZOrLkq2UsA6qgbk
         W8a62ol9q6gSVmHxcYWEA1Mvsw0HRNibTJmrGg65+4jcvImB8I13iCDmAt8atape8/LQ
         YmnQh/1JzJvL9yrGA9kPAr+Lau5zz4dsclfevCazeZCYq1yG+qSVBWgsWjqKmY3M7L99
         //P4Km2IoaF6Be37pzEfNhKG3iTm94aGpxX7ecqQFPpS+sydvmYeMkpgjCey/g+4EvnS
         0P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955749; x=1795560549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zxc17WVo0gYUnTOtZw1pyN8QC3Vommte57dKv0ZbhgA=;
        b=n1mTtyhbtP2xt3o7MRhTINDOXR4WZ7mwbDPQMhMdHTHLII+W83UM5fKRl53BW/n3po
         LiYswSfVGPAXb0VA8FV4tbsyM6vr+kMPQl32nJN1HFIhvoASmxHscUYMJVNOCV4aY9yj
         YCrLs2T4UwM0tUPalpBZiQCCAbQA5H97RAePxHP3G0ge014aCRL0gINEnFgiKc004wtL
         YLtQVlJfQrX9v3j8yf5iIXmZSkRewh0JrnK2UMAj5onJiKz+jUA470M0zy6mZrJWYDzQ
         pUjVF7qFN+RuknrKiBuMY8RuHlV7h60lqMNl0C9KFC4X6Ou87zEIG3/gKmlLJIbcnfBN
         YSjQ==
X-Forwarded-Encrypted: i=1; AL+hErEtZAS7twcslu0WjWPxRJ14tBH4MzRFLj8ZFzADG/vf5B9+rHD2eD4i5IRaf8dL/FNj/1RKT2QJDH9LFOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j3xXh9IyLkPfnaTiYcoZBg0G5iWfWnIO8INhYn3F3KWP7bv82
	18WjRb4dowUxdE9R78Hz8aKlb6NMWcB6dAJopKaiAYeqeC5IjUYEWYwc
X-Gm-Gg: AYBFou0v6beD136G7hhU1aNknmy8UDFSgwal8vRKoRzylt9byHe+r2ccYQJ+Pxx9PHG
	tiS8+zIHhNGHQRVdzqMJSke9O6ASAKh6ImOVA2R75vs0sXjn2mN7XZEkSMoQP0az57ceqLaroDs
	LgzhZIG+DPmSP6iUa4V0Xal+pLISfVJcP6k4C33buo5V3OamMn8xumSoC/Sz139Jdn02+r0qWCC
	dpLbpDTsvWoSUv7ueSzYqky54/iNZKuXSerfIl0OOvmlWOQkb426vcnHPVVgjBig5XvEiYMH5zY
	WFXKJx48l1ECT1Za2ilM/T4P+XJPogymz5RWpQI0pLaqOihPUHpz2M/cmOjPpLlMFyAbKNh2v8Q
	LMJncVDexXGTLjxOAxeutj752i4PUy79EBzpDscfcNlmicCfrPQmO6riEEvWWHSIxaD3xro4HL8
	iooN1I45115AtDIhdJ+HPqc0WLmo+q3GXIsfvbHVlT7PjV67Vd3yttjspct6az9uPtTRWZz0Vld
	ub/P45U5AAw9oGvDtMkhUmq5C8OGmxxY+Ad2ubzZoCKNFgnfQxhwUWVmlz/cRITCTpVpydmD01m
	cR+ggCcT1A0WU6yND6BdAlXia9WLX4LBnqVKyBzlTaKhtvR4ycT0uf3LyH20gxJ+PBS/df/RM70
	CILD3CuGg2ixxR9g2OWf5f32WACO4+gQ1v8INfk3Ix5bJr34wCeIeShLJ2SpPGdmnmFceUGAcf1
	Wu67dHRWb6Fr/PDt8x7OKYI/Wi5O++Pla6O9p66Q3lKQesCvUCM2c=
X-Received: by 2002:a05:6808:c133:b0:568:3866:d1c8 with SMTP id 5614622812f47-5774122a39emr1396230b6e.42.1794955748915;
        Tue, 17 Nov 2026 14:49:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b74560af5fsm583066fac.16.2026.11.17.14.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:49:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:48:40 -0700
Subject: [PATCH v9 5/6] dmaengine: dw: calculate residue in the status
 getter
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
Message-Id: <20261117-submit-dw-dma-synchronize-v1-v9-5-7dc066ed0bcf@gmail.com>
References: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
In-Reply-To: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

From: Serge Semin <fancer.lancer@gmail.com>

Calculate hardware-LLP residue while looking up the requested cookie under
the channel lock. The descriptor scanner updates cached residue only when
no transfer-complete event is pending. If a status query completes the
current transaction and starts the next one, that new transaction's cached
residue has not been initialized and a query for its cookie reports zero.

Have dwc_get_hard_llp_desc_residue() return a local residue value from a
fresh LLP snapshot. Keep the persistent residue field for software-LLP
block accounting, subtracting the current block's progress when reporting
status. The descriptor scanner continues to advance software-LLP blocks
and complete cookies from RAW.XFER, including for polled transfers.

Fixes: 4702d5244ca9 ("dw_dmac: return proper residue value")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: retain polled completion and software-LLP progress]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 49 +++++++++++++++++++++----------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 504b6ddeccd4..c138008d7cb0 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -214,41 +214,41 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
-static void dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
-					  struct dw_desc *desc, dma_addr_t llp)
+static u32 dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc, struct dw_desc *desc)
 {
+	u32 residue = desc->total_len;
 	struct dw_desc *child;
+	dma_addr_t llp;
+
+	llp = channel_readl(dwc, LLP);
 
-	desc->residue = desc->total_len;
+	/* The first descriptor may still be waiting to be fetched. */
 	if (desc->vd.tx.phys == DWC_LLP_LOC(llp))
-		return;
+		return residue;
 
-	if (lli_read(desc, llp) == llp) {
-		desc->residue -= dwc_get_sent(dwc);
-		return;
-	}
+	if (lli_read(desc, llp) == llp)
+		return residue - dwc_get_sent(dwc);
 
-	desc->residue -= desc->len;
+	residue -= desc->len;
 	list_for_each_entry(child, &desc->tx_list, vd.node) {
-		if (lli_read(child, llp) == llp) {
-			desc->residue -= dwc_get_sent(dwc);
-			return;
-		}
-		desc->residue -= child->len;
+		if (lli_read(child, llp) == llp)
+			return residue - dwc_get_sent(dwc);
+
+		residue -= child->len;
 	}
+
+	return residue;
 }
 
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	struct dw_desc *desc;
 	struct dw_desc *child;
-	dma_addr_t llp;
 
 	lockdep_assert_held(&dwc->vc.lock);
 
-	llp = channel_readl(dwc, LLP);
 	if (!(dma_readl(dw, RAW.XFER) & dwc->mask))
-		goto residue;
+		return;
 
 	dma_writel(dw, CLEAR.XFER, dwc->mask);
 	if (!dwc->desc)
@@ -287,14 +287,6 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	dwc->desc = NULL;
 	vchan_cookie_complete(&desc->vd);
 	dwc_dostart_first_queued(dwc);
-	return;
-
-residue:
-	desc = dwc->desc;
-	if (!desc || test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags))
-		return;
-
-	dwc_get_hard_llp_desc_residue(dwc, desc, llp);
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)
@@ -892,9 +884,10 @@ static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cook
 	desc = dwc_find_desc(dwc, cookie);
 	if (desc) {
 		if (desc == dwc->desc) {
-			residue = desc->residue;
-			if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags) && residue)
-				residue -= dwc_get_sent(dwc);
+			if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags))
+				residue = desc->residue - dwc_get_sent(dwc);
+			else
+				residue = dwc_get_hard_llp_desc_residue(dwc, desc);
 			if (test_bit(DW_DMA_IS_PAUSED, &dwc->flags))
 				*status = DMA_PAUSED;
 		} else {

-- 
2.53.0

