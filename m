Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955748;
	b=N2hxuzd799Rs+Q3IwzipjH6GqDyPN3j8hmpSBn0cIAf3+ibX5+pIEdlX5+L8XonrQKxB
	 Nc0bXDpgj9xqG0bGXszPll+f5P+ukOypD2ea3JKS7e+YcL20WWwwLU4kAPfEQkBBNT8Yi
	 4dsehw9qLbk0ymnmIlWvSmPSmSfy6iZf784g3ZcuZoAnaRigFML1lB6ESldXdn+Pyb7i/
	 e4vi/NgXbOuHUpjnPnBK47vmgS/CcXegI5WZGr+MXO77dIY38b1aPbOtItYXMkcWhaRKU
	 p5JUQnUtuQGKfkB/NfNxak0RbqIeqhGYbOGlOm+kVfwgZ+RDgDrcGE4VIMgw2YlVnJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
	b=fgWFhuygxZhFqxG5ePw6i1tWRfyrQ4j93pRbNy/19xF1+xdhNRQb7r6sjXru0QOaRQBM
	 biBYSULrmE4qp9wFsx66j4wLhIi7d+l3jzym6Mtb6xBHAB3Hfx66zF0EB7aqkm/SXHaEK
	 4G6amD+QSm8NrgdR4hOeY/TdRlIzGIJHNUn2y7mAM7bvslGb3SFakKHQzLY6COpE2GKDw
	 2wVdCBtb3BL6AvswcofuQG2xI77pjRj4sbREUmD30nYyYe+RpmwqsoAn2Yi7iYA8Bn0kO
	 VkFbzPwy3vzr9dsPrkdnr1Jly+0MUVlYmB2ag+U6WFBeE8wdYMTQCej7KJzl/7ZyilA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AyEalmPB;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E3606A88B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6E3606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AyEalmPB
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a85c656c58so252300fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794955747; x=1795560547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
        b=AyEalmPBMPz0b3MRazrgpn1GqD0jzv+rVAzxdGw50a8lsVqTI4DPBFMO+k0JYVDsmf
         z3/KU2ytnbK8urMj+N0WXVskL2/lyD1NVm0TvGSdssJbTWG/AONgYRKcWNxEr4Jny4ze
         1ROzfDVlSZjvYvxH9ksiWmjhvbef4NbE2y7UzD4HgqAuQHPID+OLueOELoVcBOhXmBSX
         P8z1lS33wbW1gz5rUmp8rZaW+9RNKw31NCfGWrN/DBiALPijM0YIVkouEU1m6aqqvPcn
         utQPa71Szxni148rJqxKscHx0JBB5+exfBRUXdS6V92e91rYSiwrYOI6frB9X8LPkDNf
         QiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955747; x=1795560547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
        b=l7EidoO3zAI2fgZuT/p9CD0lxz+GbteIi8bmhYUshkjC76Mnh7a6JY+LgOGjB40htk
         HKbRNkxYSdOEt2CRHSv2OaQ81TJTqaZv902KjOoISADrDS8C+sB1NU0S1W4bGrvtI5T8
         +NU0sWwE3BYUD15Uu6S/L03PNNOeXyGwvTZSLH8ExJrVTP57jMxtRNnmXN3cX+KkSlwR
         4N3e9kwEyaZ7VIt10PDXONdmTWaPGOU3vbR0agx+h3es9yqOdxi/W8ALlNG4tSfo57SM
         uLYLFfJ7zMtujxrHk4599aPu4OqWo/IB1w6WExChkDkc+tzJL0fdBTAb1NjuBRk/KxyC
         6q1Q==
X-Forwarded-Encrypted: i=1; AL+hErG6/CnxvDnBlEROZmBJx6PwkHHWXWyVZJ1mYnCGI/CcFY6bq5QEcpwZGjZ1R1aUQUAYdn58LWuZafkDHXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0LvD3u25Lo5g2aI9pZNCRUqS+4K6E68p4ze4gqWnIV/DFXzSr
	huVEsIqGVW50fJOoYU2rA6hclOVyGW/VhLDy0xcjU9UVINjv5yJRpj5p
X-Gm-Gg: AYBFou0sAa8xJhn9D61uctzY71vcPnHdzNp+LMhH6tMgt73ycFT+hns7vJNRVW6bcYe
	SqahWkz127FnNWiRRmOABUPQf88MJICMRdf958Ox3ht5dhBIrvECMIChm3Y5X8n+LOdsZOSdLpw
	HE8EVwpgdxkGDcO/G7Za9lN7Ve/RB5Asuzpe0Du5v3Y4RtAGImJgM+QDVdX4cGdwMIcWALoYj5q
	IeW1XRhVvITtkv5wl6oerUowOztAdZnF4lHUX0XzI8cZtXpEU5+ZgaT0a8jcXcIZxMzyDfvbfct
	ekWPyKoksOgSO2nwMvEe8PHgcQsB1Kh1lPGIkIvAXMgzfANe4oTD0ww60YJ2ZQuQPXDsGtqtXL8
	N9uWaUxeSJW9TDPeyNAtAgkUfOGJQlnSkhNYDSDmaHjVNKaYm+pSN4CTsq9LXZIEc5khq7Ukro4
	5BT6BDPPs+TK2LnM/0agLhJ1BMljlXZZIR2E2FSlH5ajQnF6yp5ECb8oTnd+IXZjYu6a3DHmWMF
	o4YjoRSmfbvdKFn1GD5nn3iu+DFHtQIaUR+/kbgmFhlYNJmd6w4zZULt4sSc4/iBqgbtUic85Wk
	3zBJSsidCvnmNj5wsUoMIaqF3JDZX1YN5zqCk06tMWFAyoDg4pSDG7CEppgsniJ0XOxfqnd+Ua3
	FDXrY+iFI+h8wKPBKDgt7ZmJkx2TEGzYvpq+HjUPxPBQUrUq+5wpSGrYQAwwb2j3QB+eUdgVqQd
	IwfTsR2a31zZVMAbyu60Huu6nn7pAWgvLBVlvnen6VAK62NASEMhE=
X-Received: by 2002:a05:6870:c0d0:b0:4ad:5d5c:29f8 with SMTP id 586e51a60fabf-4b7627ad063mr526790fac.53.1794955746828;
        Tue, 17 Nov 2026 14:49:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b74560af5fsm583066fac.16.2026.11.17.14.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:49:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:48:39 -0700
Subject: [PATCH v9 4/6] dmaengine: dw: extract hardware-LLP residue
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
Message-Id: <20261117-submit-dw-dma-synchronize-v1-v9-4-7dc066ed0bcf@gmail.com>
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
index 982a4b9bd678..504b6ddeccd4 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -214,6 +214,30 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
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
@@ -270,23 +294,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
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

