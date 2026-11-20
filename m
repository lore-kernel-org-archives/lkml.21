Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202966;
	b=V7agv/VycqEyN3R7EYr9yEhnj89NnLP50f6GcJi7R0s0Daates1L0KHKWAK827hhZgQS
	 r7BAklpB/oCfEVmVyOcST+KMoywHuYOGfCeukuoxxllsPPs9cACuhMP7FSAZQr03W59xj
	 bKFvOf8yE9Y4nzATqmUIiPtBmup8AAI0sukajMzeIxGfEHAzvlDF+deSru6YumeCrX3TZ
	 cbXBwPt7N7ou0ILzQyivaumY7+SzRH0sGSXUwu4buxkFRchhd09eoUKdW1yzBG4ncp5JA
	 S6IptbONPmKv9fioy+4oYDHu9U3dfCmKeM/o/oDpRXPgzKisKRGQhcFKAdaTUt22Xew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
	b=Sebc3H8c4bR+GdxaeGxYkRDARpkMPw085subcmcxWW9wjtq49NecPBsIliL0/XL5SSv2
	 0ou/AMf0+JWu6nCcpnm+1IDaBGnsBYwCc/IBDDZ+2ZABiLLcLA3rjI1xxeo3ec51ACkFU
	 G15N+cmMJZEfo6HUWxjbm/AvkUG1hxZF4HvJDM7gMGy+PAQPVxaqgO1JrQP1YZoZVi34P
	 1pZkPaQKz/z0oCjbaDph6HXxZjVJbE0oQjZRBgf51FcIfH84WuaLXVdeCElZk8W5lGcUQ
	 sBkUpiy2ljjtdGRgggbpJJ6g0EX+8/F49Apn6bF46Es2HOYqc2BF5iETWLI9+g3tMMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDDBoHPC;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BE660A2608
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23BE660A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDDBoHPC
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71b47eede22so185532eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202964; x=1795807764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
        b=VDDBoHPC4r0P9LzupMd9R5QRJUsXTf7e6q6/7iPt7oKGKSmiWyNI+F6MiAX8Nekhgb
         kcBAiNXhLXJZeubUlcXynjabkPIjdi0lZGV2Z0QnOFxD+6Mw0uNuW7DxMdpNPYrjUIaC
         BN/N0vVY/GneOLwR6vUE+8EcP4FqE00cBUTz5ImMTy95rSwEcatFiZMCnWUw5cloYdVL
         PvBnAaOPclMcpC7DBf7OZ9eVlWwO2SuVtzMeZa5XYamXwWP86gVNathg14wxcBsE/EZb
         bbwj8+ZSem4jxLw8+AaZR07QDvN5hm6uWycCONLpqu6QQaEIqGqeXPCMJS0FoHSywfsv
         K/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202964; x=1795807764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
        b=AyD7nTf1Z/VDnIHdB4Y3smM774ST6EWU9sSBp7pad8NBErT1pxRlKZXDiYiXRtdfrY
         8tre1S7Tdh2CIVQ0HZ1KBDrOaLcGboGguP2CB7yXSPrWHGFEDYkshKNtWBc51K3pDyQd
         JTI+fYpMqlqh3J9fglu5MCbOQsT0SX7/JQtsVie/VwiaAU5eB8tA4JCnrEQ92Nfo6F/T
         J245TdFKtfi5fxx0HOdAHYjKiM6IVkWC4cxMU3fVgqOPeh9tuSQOIALqbOElHbiySTyw
         PKNIXwi7pW4jbCEDLtrwDMR2cqc+N+N7ffLaMNc3/hrQw2ZzN78ZostJCQYOvrxamJiK
         BHiw==
X-Forwarded-Encrypted: i=1; AL+hErELJc6mdgdCIrKFrSIQl8TkmfG4kraxXhxlgV0hXwi3NuJhXI4j4mZ1RBV0Ae0RCaMyvhQNQ6NGNHUtvJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+n2PcO8MPuEasahH+FC98dnLv0dW9in1SRpAGwijO/xnshEjt
	4YpnJCPa/OUOigBm96TiDsK3vAKwBoBKztC1jqyeRqEItgmRQQdSCWhd
X-Gm-Gg: AYBFou1ECmvIN1GNfcgc5OnLfg90M/BlPUZPsmbBG3ZD0tgpCSd14kOJ1vbKcURUSOP
	KPHdny95VInm2hTrWS3mQW3w0ma4RH52EWcUv7SGm0J0g972fe01uY47KeVoy6+kIJl+4AQjVsE
	GgWezi9gDAc+ydZQgs6VkeoxkcRGKYQkty7QvZQSBuAJSXE+35/72sTCwZu75bQ1SBcnPqPkcRI
	Bzr9u14PfFiPNHEfumoJ6I33iaFkJc2Pe5UsESXkx8AA6BmYqtuPJ+CRxgDphvZr5IpDpSqAcuq
	ps+Yb8KeqtRLeBWS8fEkj1PcpEy4gOXSfzsCHhMMmCzG8ZUMTlUlNIi1aYMXTRpkVQ0aFutvN8J
	m4PAjw5+LYN6UUPXFzMfQT+m8BSgae4ADezSEFavvuYgzk5VyJjfr40mzCTMw8Btzt+SVtoSNuN
	yV3EJ1DOkb4gqTkLZ1SFtxL+nGRv3wV/clMeS8xqVbTKU86AeZlneqE8E8TYaixM2rsPxflGiKd
	D1MhjN6dIPS4e4gJcQZKe1U+CddJdpK3JIDbsGjDdHz8syC8KExrSpTy7kEqHuIlvBDCxdu5Hg9
	ihFEWWS9ZmDYmqiTtEtXiDVSk1weaP/8C6Zs1jurNCxoI2/22bVYyozt9aSxM/ZodTMn8xDGYHY
	2oFUbDnPaHUFuJ7x1GmXmcoZ55K9L8plxxHlYeNSkWtzCbYokZMRljO8u9A4OMwTdNj4EZrpnh8
	hUbJOLR4GjAYOyTIpP4WRvaSv9KNAT6rhc611oM3MTzhBT4C8gP/Rh
X-Received: by 2002:a05:6820:55ca:10b0:71a:ee76:d7d1 with SMTP id 006d021491bc7-71b3953f78dmr2753238eaf.67.1795202964033;
        Fri, 20 Nov 2026 11:29:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm3434498fac.8.2026.11.20.11.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:29:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:29:12 -0700
Subject: [PATCH v11 6/7] dmaengine: dw: calculate residue in the status
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
Message-Id: <20261120-submit-dw-dma-synchronize-v1-v11-6-9b9166bc2cc7@gmail.com>
References: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
In-Reply-To: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
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
index b556a39a24a9..7a66dc75c546 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -281,41 +281,41 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
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
@@ -355,14 +355,6 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	dwc_retire_cookie(dwc, &desc->vd);
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
@@ -967,9 +959,10 @@ static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cook
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

