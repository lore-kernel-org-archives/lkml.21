Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082554;
	b=W6j/Xbm/+UAqpAdtYf8rCPZp9zyjBGtLvMAPGypT7of/dsDzMmO7pPRMW+dAhc3UqEeb
	 Dy+h325vkpm7eUVTi4ayXFJ9Swl5owSyyLo6z/28gaqgCr8hheM3OZSU5FoAX/QsxTrGJ
	 6/qghUijlSpP7IhEyAtp5jg2eAnn7szd4uQS5/qh9WILdCGPxC98uWKj7hh7I4DAjnXhe
	 ueI41K34oEQK0A3/wIe9mzwwWrvEJ/KqoMKAY482XoT4ItgQijh6uMbiTT7J9OesCNgPj
	 U6tbaGa69/CIpvHTBSzmdPEK8zVUSxLgoPfEv1vUFeiufyhbMn4I4OwX15E1qdOViYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
	b=3Ah5yCG8PnVQZyH0UFsY88lY5gXzVfxlQYvAkI99+3iHCchWbZ5hjXmfzOQPKcvjkYx3
	 NIejyMg1vwlavh3WkO96AfYf704uIOWfH6WgbCkY8qAjsGpLKzCDGbWQ/1g19iJYKcCiM
	 9074DXF3khIq4OLoKjrpyPQzGYnyDcZg6qlp4/5YfMvAbz3NridlW0Kqj/983pBURz32K
	 Pfv7HFRTIR+iypOjbRUeWIDTnJGdrCrVdZipC1SfewO3ER7wnDghaR7RhVjhyjYGIIXpH
	 f0q4hxzBeS+4Ltt0YGqIgWdzSrXI7+wzJ7sqLc6h5imxlWrxAe7kB7Ts6GXJ8LslIJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cP6joHov;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C72460A2604
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C72460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cP6joHov
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71aed54d4c5so1344263eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082553; x=1795687353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
        b=cP6joHovQZxfV43Gj96NVapePF4F1oLgVJtWAla1AWdzBfxMQwA9jaN5Io5yxybHn1
         fVOFwfLb8NYuqrrwLt57r9meftxKoiWP3sgfCdZcBbBmyCuT718TuqYIR8ONvnzB8OSK
         OG6JsPd8IzNj2CzXWh7JUicQsOW+HgU+rJIX5oJlxOGBQIiOcrzf4EV2Y9Y0EKmHfsQs
         tuqz6xntkRNn6hz+gFoivwpsu7J9bkp640K9+1l3Wq/JMZ1WAi5fulfez+bGBvfhmL14
         h61m6Sa8RCzsjxzMlyGQGfu57E+/xvW0an9G/WJNgurm1+Fk11xbYE2Sx/xH/QzEA8dX
         ALXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082553; x=1795687353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+uR6LSFUuS82mC117S1N7GIewTkAQxRxMN6R5yzzdI=;
        b=P/0pACGtaegYzXewGCGgr8/2fyf1rVTP11IqhK9qaoQC/S1417+OW1oMZznMGWcygU
         D7yF+V1yefpXCAjbpq3uvTOp53bBrsEK8cNh52FDVSkMdbGErU3ThPELbzao7ovhiMko
         NecRJFQNf4ckrpDwFX+8KknI+6pdx7sRdtSsxR5cx+avjWi4OJxsQKnrf5hlETkhiSdW
         ObLIR0/xCAOemyyPZCllT98WePJKj/fosv70P8LP/otOPp3H3UjhSdt4aihvx8H1o+kW
         sz7/gwKAFPv9yh1yzRPnA86m9M7m+yiW8zpUhVRmGmDLjMkVWYbaLcpYKIXFWdCUn2Ll
         LnUg==
X-Forwarded-Encrypted: i=1; AL+hErFmAbDGHl58eWP0bPNQ8xpydDOUJAycrifrcWSw5KDJcgk2CyRfyMwXyIEPpNoawOAgH7oiq95AuXZKY+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mCyuji7jv5YxrxQgwwXC22gVuQczZlanyYuSHgKC9e9HC42xz
	1jM9f8lfSuriYNBnolu6DTS98vHLTRkX4JbmCTS8J66kPHapuoVLZzaq
X-Gm-Gg: AYBFou0UmQaETTFChcmDk3rnNjDIziFAwFVQzubW1GSHt+/h1syvvgpilmTgKHOvVcn
	m+EZAugI8vIvgc4BxWRtuvVsZvy9f5VEJGp3Xz6Eo7noQDwPXcX/HaX/FV0qQxh5YwQcA/Lya86
	jYCfelOXzp4TJE7KdyDrYTyU+SnuoRM0tFZoSGEPOr7lCdDQY2MBMLH9W0YTJNOcUs9n/e6oO28
	4SXN/MHSAnbBIhmNlXpHtspyW2ani+WpSjBITHrZxobhTqyhhw9EB86pl1At+k1F4X3dyT2VM0X
	EdMJkeNZDGRnlt8GHYaXYK/iUiJpxGu934WlgNYJeE6EWK2aV4QHnvgMP4+8++Z39XbrueYFqL/
	ZHxjZH4zehQLClaefBNNDN3ft6WGs2bYF/t0SaHKdCtLiHrKal0g5Unc7WDfEI4oClRK8/3bvAK
	AF4iMiXs81T5H4nxRrmnmvkjWqLIjF8rX0RXR4+7uB7Voq/CrwzXMc6P3O+7zAUyX/w0EG91y/j
	EI+rGpc94TBFxFmD6PH4QiIKe7bHusPjWCw6kSIHI5ufAycaHz5LVQU0Vnrvv1Nta8l29tCmrk0
	N8BOjKY6sRkE3rlnVSvOkUuTcAvSz3Et0AsSTxSubGQnliTgLoQr9e8HXCRiRh2zIYD0a/dMlZ1
	Rt51AwzPYMfe7A2DOWeGp0QqiazlGWZdjlhVNNFJeiIytFpwuhgrvfFEYVMXgcc7qNHw2ZskxHW
	C3RwnPfRWamzRBVdZRWCKlm/c6A5o21MX0CA1yJ93xnFQEjrxx637i
X-Received: by 2002:a05:6820:c5cb:20b0:71a:fa49:2f33 with SMTP id 006d021491bc7-71b1848ea22mr2638874eaf.41.1795082553010;
        Thu, 19 Nov 2026 02:02:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:01:39 -0700
Subject: [PATCH v10 5/7] dmaengine: dw: extract hardware-LLP residue
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
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-5-3a737597a0d1@gmail.com>
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

