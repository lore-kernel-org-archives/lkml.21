Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082556;
	b=PIRkOSRKzqyTeHoIIXw55Z2o4sTErOhd6q0kTzTntdEl2e9kSSO2lZo+Ue9u6ooebm94
	 dBZU3WNPGkrSMw+UDFmQlrpO7X0Dujq95kRbMqd9YO/+/5jgr6os235MFqqKmrhQf12Fa
	 sMkOc7ug192B65aIQTRfV5KtFDninSes8l42Eb07K7kTipq1ONpF0d6UHPEKgfPmLYNVP
	 soeUsCi++ekkSZFfZUHdMEHTDVMyITnXXxNYhwXm5GUm39UzKAu0oiAC1KFj7GBFJ4Tkb
	 fdhMWYG8uVe/c9EE92N0+Ap/kq0AiL8otNUrw3uBLyY2OudgLlhaU5Oj+oUUgYUoffQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
	b=jzJdMcdE2MojxDWRE1uyHgToRm/HJ8VGAZJa3C/ExgUAnho1wY1v5JwErns5Fv7LlBos
	 bZ3WVyWoMp4iPS8iRn2Hm4k2XMVbTe1jB8duGeO2t6mz1fFxrNBZ8xVHZ05WYRW45b7gP
	 ZtVFVkjaKCsTRwcelVCZOMmeg0UyECO/FpZrr6L4hmhKj2NRyaS0011Fr+ZZmOFZo0Goh
	 OcWeZOp2fiwdWmOzKxALCn1tYcwpsEvNip87hpFg8b4mLMscCUkWuBKW6Txatj3YCqR8/
	 J/zBGAfGmTTpB0aqrW215Kj/0SuKkeG0bcXX7mgSeHnEuYtRCg/p+EZs7zm5W6b4v2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqKCasXB;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EBC60A2630
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78EBC60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqKCasXB
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-703be215729so990369eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082554; x=1795687354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
        b=UqKCasXBDO0hLpycOtrLJqwUIDTf/hQ6qud9KSXX4mQviejJB9wmD+uX3qhmUW8hPS
         8vjLJEKhzphDLngcZOvczQ2rG0Elta2BtCDAVMiL1Zkovx+K5kkTBj7ksSJiEV2TRDgj
         eCq+v6N/8VRgxfUqGxeAzZBjcXOp1tpmNE0RteZpSsZThgOBrMsA56T+CSUJDMiHTySt
         PIdBQn+dhkAujUG/2xTDFxHShwyiR63D7Y1S/G8GvO7lXm9XZ2Jfs10Ky5r8nBRxYCaF
         hSkDCKK81qqsPmi8UsD0W0ACucUo4c/sm20nkaMMRjyIjXIjUGvn6jLAvwD7LfqN1jDc
         ow5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082554; x=1795687354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MNqx8SelieMagco0tCtX+Et6uyqf4e8xNdGXpW/e7g=;
        b=r48oh2gsPKkKhQAQ4sTDlGTAZhzY0RuZNyO0xwdsSSDY30EE2jMlFtJ38KexN51QCR
         5dq0Y61VXQfDt7rlJUVdQQWjFlZxSbVQy6cauMMQp816GcqMcWaBRNDQiRIF932gLPUz
         vGYwG0pLUluymYxabzmLhbyvekdWlkvTsiBsHc1k3lFGwgkMOzI97wWFv6ieBc2gHY6o
         TByNYjxIAzrO8d6JLRtrOwoJj56gAKGjApGknm9X3EDDHLilVU27QY1TKzKRQW/imWIE
         AFUlUksSNnB3prO3TaiprUrZFMqp14Kv02t1erCla+V3vLqvqKETNlIEqoKVD04cG/lI
         umrg==
X-Forwarded-Encrypted: i=1; AL+hErFHljcpFSi+h9d6LXoP3oKgX/rPAuRuc8alT/EI0XJGNpIpljTmoZMGP/dG+nM7PQlkkkXKDpExNyJ40ag=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V4TKiuizA7XkwOfiX2jIjfTzb1Lm5vasLuJZiG+3MRL/u9aqp
	JqE2xQzol6RCdK8aguLs9KhBnGvWsKYtk8NRXzkc0r2PTTtWf9jY+urb
X-Gm-Gg: AYBFou1uBHoGNnVrDZ8i9u75D+vsmlHfvXNDGL4KqtpVtI7Y/eFVNZE/wDXVyL968dS
	lQ3BXEiokUbe+/YkLNF07w3PWxrS9LBr+KzmeoeVWu7CG7t4maNISugGJ4Tkt+VR3EKqD4gv/yj
	tGABxu9tBu6O5B/GDLy2y9vCnyNQ5+Vl1rv6IG5BkV4CveaZcYDm8Je/YyZ5GpnWb9koS04Kv6g
	VXRjR+H2Das6aO9yzXogEOdW7tV8hcupdLvupbAjIjdk8tfGI4Qir6xbfro+1+v8XJgUFQabWsi
	hT2uvo04vWz5IWjUuVLF1UyVpF8MSzSQvGRJZpNKxMBzXKwsUgJd8UJc39I0h6fm9ijkUJCs1uB
	9RoOkAwxn+oAxa8D/A8gpcZLwoZz77G5fj5hrUoBBTnGrRPwTKSoF3WL0R/jWJAMw8B8bjdHN8T
	PipwEsQtaxWGpHi9D4V2LycND8eRnBTSu7ZWPS1YZaiBtXQuNbk8J3NCuNkxQWwHpmeyC8Fqbjk
	vF4hxuQYYsBWqSZDZNz0CoTpE7QcfvH+k01Haf99crk9/oP9K/6n5rtpkUwHV237IFVffpNeHps
	RwUpiX1AKJgIaoLlw29wRx+e9NzRTOi7g3bmon55mTsGHbfTbyWLiX34gjishb3tx5/h52i5jHY
	iVRN9cJ2jiFn6OAnX7uv8k7awyk4ikNwdo4eazsXdH7oi6PQSlYhdqyUKD5gZwFbS62tjlwKBIR
	KANEalhUjH4elJKvRf3zwOtza3NOK6s0iAJEVC5fnLcZvUxnaStDHN
X-Received: by 2002:a05:6820:16a1:b0:71b:1c49:5f22 with SMTP id 006d021491bc7-71b1c496c08mr3044704eaf.42.1795082554397;
        Thu, 19 Nov 2026 02:02:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:01:40 -0700
Subject: [PATCH v10 6/7] dmaengine: dw: calculate residue in the status
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
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-6-3a737597a0d1@gmail.com>
References: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
In-Reply-To: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
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

