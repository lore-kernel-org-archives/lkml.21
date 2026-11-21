Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295112;
	b=C33upGVtxIvjTXp+5QSy+0YTNmr+O50KN1AE5AIxACq1Pi0ak37U7hCYtl6cQtxKbIfd
	 jVDftftbHG09nbf2VppMfxUJDQd3WgngfEUovGAVRo8iWoJs9ySv20tU8sXpjGC0tSxpm
	 itE10vqndx8z/WRhXtUJlf+PUV9LKA64tr07ZCr7hN5yvudUEuAyARX54VthA1UBrUItm
	 2q+dZrkkJW5Pwtwlq7zFFjnNl7J1Ac3OmE0Yr8zB/sto3hEAYfQ+DBtSTNXot7P0RVLZh
	 E47YKWNgQTjbNYrP+NaDxwD62+5jE4hJvg8Q/oM9h3+3Ey4rTd2aK3KHrQhCZjIHtNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hOkDAm5C9odfejCA066hItzRaUywPpsZ5Ql9NYpuEuI=;
	b=NOGNkVyAnyHxbAeZEqtBCXbaSuLXsCTqok5HMkVOzClEuaitecyUo1aKbk6q1aCtMCkn
	 mbxmRkazjD7GWYhsAwZ9OHJFt39HmMy6bhXlHNvlwcnS8+LiJceJkDTSt6PHjAFoD9IcQ
	 cG0ypRgT0ID6CWSpXiOHr9QHTPlLCtgKRfmKhQ5aA5Kg0i+vmRBYSYumdjmV8F0xFdnAP
	 7TOkGv4le3aC/6bOzqDEZRCzvmsXC84IhMjS5W4E8Wf4SHfrhWuTBP/Ysf0LQ/uav+8B9
	 cvMlcYoZk1Kmy6ps8If1vIVbTeSEZPMfkfQrFBVr6sj5qikoPHxE3YYZlERIZPDeXfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ECwppMr2;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CA8606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CA8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ECwppMr2
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71ae5389c00so1282305eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795295111; x=1795899911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOkDAm5C9odfejCA066hItzRaUywPpsZ5Ql9NYpuEuI=;
        b=ECwppMr2iaiCweGgzYOx7H7vE6IhmGHoV4YCRSdYTUoxAbF2pnJ23mtJtPA5l3ixC8
         uKnHiVm8xs1Sc8yiFFwsGqku4NvLIc8D0eNZz+w7Fhq22JSfR4tEY2bIJP2DARGpRqqw
         cqr66VI32gJhgkMcw8ZA/ruQx/1/LddgYcpwqCJibhFP3fTnaa2vcZTElH+xtKUPN4nV
         s+IrnIcv2lBYKzJfsOtRcHECIsE2jNwfh8vyzqO4cyVb4o05sfv11zee1zAPH5xLCGia
         v/Dxl/1ldB1GAj62QQv/3+H3cfkOcRAIwReHn38d7Tfd28sDvM1D8KP+HHYcO3Nd9LSu
         3VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295111; x=1795899911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOkDAm5C9odfejCA066hItzRaUywPpsZ5Ql9NYpuEuI=;
        b=gTm3QO/IU33CCa6eMdDQi8eLEpgFvAyAOnYNQoN36yxUKK/ifg2cxJaEvaCPeGYFax
         EqqUZXX+lpWj1Sd3mtwoCiCtJO6bl2QpBSeeUF/Dq+ml0CqjNkFjU98brAR9Cko3LKDn
         YH4PaJydNgjz8JuLZqdsYtJHNFsjsx7CfBDrstvlKOG0ahjq+gJ9jb/YmHISBdFubHIg
         YDg0Pg7wFrRLuQgRFaB0UJsZRNl/2B+x8k0UdbuYyfz5yu0qBG0kF5IJXQuXYx1YTS33
         m6mI+mn9Z1SWoMnZlwKrjdA65Vb+EBzHOUM+NHYq54vgfF8AwRFuACWSlsGqdtGdUoIQ
         yx0w==
X-Forwarded-Encrypted: i=1; AL+hErEV5TAuRhSYObaOxtzBz+DXITy5KnaJkJigPLkc386G/set0IcfJxX9mjrkFP81eY9c9hgeQRfF+vNDFos=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nk1lmAtJ5Ue2vtpUjY3BZ8s6qrAXGpLv56cApsNazqipQaufD
	S8+DwtGg4sWjYRaCyrV2wXeMAITlEKeHASaUvT70W3qxcIb6OQwphPV2
X-Gm-Gg: AZFdTZfvBVgAq1Y5btKcCMfjL43+754gstgKSuF7O2qcNf7riSu0TnWYGYCjzVeq9Iq
	Vflo6zKYtPRZ9FFTdb81IPk4zDAsV8reKX2Ot/sTvYQ83zn1FTOPVo2B3cqbH5TEf2bRXZ+E1Ub
	RlXTm+N1+GKp1wFE5h2aM+m6g3XGy7RY7nnWkFgm8IbUoBVQw7fwpd25hmGebFAn9E6z6J1qqQc
	tWtpi3egZnNKJs0L9NZY2vW7qlmDW3oiYT+OKUUIwwDPjssMkTGGPxTdn5zxJ6SUh6wHjoWEY+i
	n0zg5cx2oYAMhfqDKz+0ZolKOw/35eeDiXK8tn4CdkvLVzd2JDlJrV7XXPWKjyCsBPWtVEZOQVC
	alu4VnMePdm48ohG5L/nfGc9prNk7I03T2GefQinLsWOiaXbLrDdKZTrN7R62sn4gK0R/qDSgx6
	PiputVuhFeVvohpYXaYifDWxcLLAMALT5//k/etocRs2u++7PSHme+X83WWtj+ELpV3lKmglWpe
	08xR20YGVOaqrntJcWluIM0ZYn4SJRSliYgHdMSuydR6qMm0qF5cZz+CY9muKgLALIoejcR0XxD
	TdvzZ4nLuetbDygqKXR8ZRbcc0z6UZ3JYHWWK0r9pmo+4O20IxpA463kv5By1NGF8jTOMaPL4tM
	+xz/Jzd69ETXjiR8v7bskSoECfEW99m81/P/64Ix7sGEKIuHTb6bk3SWpuxkda+9D2Zx4gq0kG2
	iPh6VXsJPntxPQp24tCzBUecWDXXV6eQnPYWTQvykDG0mK23RwfiaW
X-Received: by 2002:a05:6820:f021:b0:71b:1715:7ce1 with SMTP id 006d021491bc7-71b39043d0dmr6285699eaf.0.1795295110819;
        Sat, 21 Nov 2026 13:05:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm4635728eaf.13.2026.11.21.13.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:05:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 21 Nov 2026 14:03:20 -0700
Subject: [PATCH v12 5/7] dmaengine: dw: extract hardware-LLP residue
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
Message-Id: <20261121-submit-dw-dma-synchronize-v1-v12-5-f51eb635209d@gmail.com>
References: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
In-Reply-To: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
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
index d00d0d53f6ba..150823544f40 100644
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

