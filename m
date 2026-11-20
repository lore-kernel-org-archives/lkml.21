Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202967;
	b=YjVE1dv7N1QDKe8viicJRZoB3rkKDsgoUfUJwEg5MRYn9OjY2tzoXn1IUOyBRRDqcesR
	 /2DTOnMsT96HiDW3DcPFm6wiGPxY0Z/rHApiA3zG95HY3dPfLJuE8n6pVO0UlsBPPLW7t
	 d5jNCfFtCMgpDSqbG7A3/uvWGAoB7RHNikuf6V6IO8UszD0zqW2sTEV5FpFO1CwWcvHiv
	 e4gxf3qldg5ojYFsMKV11fous5kI6vIS3cChQtuFyC0fJtUveR4G/c/Me2IWFN0bXTEYr
	 ch7c3zR5k0/DxhmrwxrPpVfhdtIFmPCgjIHAJDbg/JGtsO/q+qUptI6L3BffomxL0HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
	b=iO/LN6b3uGYU8xeLvn251PxIgAxPxA6Fmrig2N45Je5Q8HZMqoee1Rl6ZjhrnGbBMY65
	 ofWFi53htEqIHR94DKZGc2CWNsKeQHvKtqPSvMGXPQSYX8RGMWIJ5B/U9lQysR7r49nIE
	 ko2L4EB3TZeQud8HokuLNlCWpTpmrSSCaNSRRg5+fDWYBm6i5KF4u+EVOkEcCKys534bI
	 beIc7T7A3OGSyRfyMkHvbRNXPj/nEAQpTm3o6ea7UXbQZulQK1eeVbezxfjpWJ6TuP7+A
	 1NepGCtKAX5HAzC5YAGhkkMo0ReZkFw/0GlzHoq7/NVtpfaVX2hWXV2g2GgLAhJHxpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IiWIgmAC;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369A9606A6F2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 369A9606A6F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IiWIgmAC
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53dbe9b8d6eso985261b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202963; x=1795807763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
        b=IiWIgmACyebbT9WvoWjjV4QCmCn8NN58c1DAhYi/wI/dT+vfl+dYfVUv4YyzduE/Oe
         n4ovgbxRJYWG7zMomXcHMRVjGF2Q3VXgRBnzmxoyRmLrAvnMyqk229YauYXT6CbrHK7F
         99yBShRRMpV93TKuEZXfYfsEkQwAiRXN2f2u4XyHU3H/sZRFbwOZ1MDDMZz0DjMJmKd2
         b0GdLn2oA+z84Gr7Fu7vaVk6Rb6UFFTZTwM4+/Hbb7eOqStIaxZ77YOQajEzzbX/fZ8z
         yLAZ/JOvokZBbQ13uBpo+WVvvyWbklQnvLOnJ9SoQJErJe4iUUND/QHohUyqzpa6Oyum
         9MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202963; x=1795807763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
        b=T7OWMql6QFFSgOnuMvG+tXKCMhMkSCi58YUrGQ/eQGeck5DLuJxnLvmwZyeWSAYiln
         IlDkDooXPmwz9la4Dxfg2nJR1TxKlwZv08P+gnSPFvdiKgw/CP9D2ng1dbZe4v0j3xQa
         pUEUpq+Rs0va4igPciEv8RulVg29cxQvt4OhheYolIwrsHz78hEJm2PjLLPLtEj0YPCb
         mZYj1DrSkKIlTqmi944kAiZenT6AwxzasD8ZQ3m+2ghFqdMn6lDS8Wzc7ku4wLTU0Tlv
         bm9FfGFyQ4WRHJDyX365TmAoiFdwj0JEPFnNxNSji+q9RQt02taQVlpr9+11iysAcHVX
         Eu/g==
X-Forwarded-Encrypted: i=1; AL+hErHqstfvgS2hrAcVmFt7FY6+0rsymw/ghg9W9ocVl3n6MXMZaf6t+9aFJmXHWkXfLaGj2lSE5gTUABvj3+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z95/P6VRCbWulCfFR7cnjlo1sbf0Sr+df7xF8NlaqVmry+AwLMw
	b5zN2gb6Eb0FQLxPBpJkaM1MZlndqaoKoHy/iibeYuFwf8CctA8ir1eI
X-Gm-Gg: AYBFou3v4RNufz03F2xp3wzpBqY7tb7uOY+jDD0nlHWh1R337gMV5plR0H/YqdvFhKo
	GTadpgnxsD4woGubVBC6deiHDPHVlkIdQEPJlwSeBhb9lHREO978Ff6hUNKvcHQQ/Sf2t0s1504
	04LhdXg0rhh8fZyvl0jU4NpKG1u/AeSsZXb3kwOENpNO9B5/QYE0NrN83EpZKOslfv3deIw3e5x
	FjUPG1YbWrsY70uRSTyIUL5FiniI+zgC3hz8FYPjNEPosjUs5eF7NZDo9rP1a4O0psAZZAyTC2n
	8RlqtpA5o/WDZG10rK4sOuTdWYy/DvxcRGfchNaXOIMQq5zT0aULdMguC8qSTDg36Qhc3VkWjug
	CYVdBech29/ZyAQk4x9wLYP2i8B4IBpOusLhyiy/wWxjRkD1hxXKc+sK+CQy3hvSdKHgggApEE4
	gJDMRBgaYxK1lL0yXZHVsNdmwh1Z18llqCCM8/7cZAat2HcinLJZv24AIral4poIb2392PGxaMa
	wXYHzVw+tD5vyy+VzVH534gBcvoqogmVOrl4pGa8BX+0PAslX17mHhqPBuLPANK3tE5GqC+3PWX
	X77bbAn6plZdCwKaG3e4BS30AEF4xyK32hOFbmxtPmrzmx3IzMgN8pN47tD0MV5imsTjsusg/3D
	nLgWLQKYH864PQfWIQtpJ8gXJPPuaZAmYsuH8yaFRFCKR/E0ASIuakGgCm7S9TmTpnZ4ErfqcGO
	fzVlfZr5ZqB9G0TaxJnQFByaB2f2NELJ5sHFjJ4Ldolp3rP9Zi3ZRW
X-Received: by 2002:a05:6808:2229:b0:564:3e9e:b4b1 with SMTP id 5614622812f47-5797c0b7852mr4356033b6e.18.1795202963128;
        Fri, 20 Nov 2026 11:29:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm3434498fac.8.2026.11.20.11.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:29:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:29:11 -0700
Subject: [PATCH v11 5/7] dmaengine: dw: extract hardware-LLP residue
 calculation
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
Message-Id: <20261120-submit-dw-dma-synchronize-v1-v11-5-9b9166bc2cc7@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

From: Serge Semin <fancer.lancer@gmail.com>

Move the hardware-LLP residue calculation into
dwc_get_hard_llp_desc_residue() so it can be reused independently of
completion handling.

Keep the scanner's LLP snapshot, descriptor updates and early returns
unchanged. Only one transaction is active, so the helper updates its
cached residue directly without reporting a completion indication.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: extract the calculation for the single active virt-dma transaction]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 0d2407c6472b..b556a39a24a9 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -281,6 +281,30 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
+static void dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
+					  struct dw_desc *desc, dma_addr_t llp)
+{
+	struct dw_desc *child;
+
+	desc->residue = desc->total_len;
+	if (desc->vd.tx.phys == DWC_LLP_LOC(llp))
+		return;
+
+	if (lli_read(desc, llp) == llp) {
+		desc->residue -= dwc_get_sent(dwc);
+		return;
+	}
+
+	desc->residue -= desc->len;
+	list_for_each_entry(child, &desc->tx_list, vd.node) {
+		if (lli_read(child, llp) == llp) {
+			desc->residue -= dwc_get_sent(dwc);
+			return;
+		}
+		desc->residue -= child->len;
+	}
+}
+
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	struct dw_desc *desc;
@@ -338,23 +362,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	if (!desc || test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags))
 		return;
 
-	desc->residue = desc->total_len;
-	if (desc->vd.tx.phys == DWC_LLP_LOC(llp))
-		return;
-
-	if (lli_read(desc, llp) == llp) {
-		desc->residue -= dwc_get_sent(dwc);
-		return;
-	}
-
-	desc->residue -= desc->len;
-	list_for_each_entry(child, &desc->tx_list, vd.node) {
-		if (lli_read(child, llp) == llp) {
-			desc->residue -= dwc_get_sent(dwc);
-			return;
-		}
-		desc->residue -= child->len;
-	}
+	dwc_get_hard_llp_desc_residue(dwc, desc, llp);
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)

-- 
2.53.0

