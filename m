Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717793;
	b=JPIbWsKq+U7CIQto9ielerQjUQOA7CR4hqhDupM2msVOLZhG+6lVMC4w71RY67LqwGMk
	 aKGofYaBgWewKEnGdgDaz1VIAlfk2usMPSGpMnpDRW8qwCVqB0DZXVcAW+xc81grRPfuz
	 SBMIeo27+igPxp0fVDvA+g3k4bggk9sKE6LYaYyWFDA1ivtG8K5Xv2bcqWrQ15fKW8RuV
	 US4vAR5pO5iSvRiYCdQocXTqej/umn387I7vq3pdJDnPgH3Wt5AKP7NYDvvnR7sMCaow4
	 E+EGZv1jF43aYZOm5QjsczppAv2oVLdF+6FRe4RQh+VM3d50mIiufGJET0r5OPYGM0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/q8f729eKxMWvV8pzxhn9Gn25ubKt4vbGrfRah8m1Uk=;
	b=s4ZHUCjXTQqSXytSBLO/KZeJp/0Buxg04mRIIdnmyezupfv7SkygSry66C0QZ+ahrJmE
	 Oye6zYt7boX2plpOA1nwCLhEwB3Ywq+AiFyRtP60dXrP7/8JrmRmfq1+vKhQVoViVuzSS
	 b68jwj+KjrAXUE7SzJMMkWk3GRCzkA+9HpWXMJnt4POdfA3oBgcYd3c5kRsZ+kY0qeDxA
	 nbtpeaqqT8c2Iw23vSTDQtupELjQxgvI0d76CuhGN7HC/mmOkCb+Rwt4V9AqqKy2E2dKm
	 tEwdreH0f8yM0nvpERwjl0QEEKC29bKVHhyw6fULMWWQRG+WjECgjaVjOI8UmywbcBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xV0vkAwp;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1736606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1736606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xV0vkAwp
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3358959f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717790; x=1796322590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/q8f729eKxMWvV8pzxhn9Gn25ubKt4vbGrfRah8m1Uk=;
        b=xV0vkAwpuwZNdzGyJjsCOChioy5HLjYi/ssfMex0l+IfAaOzd9N7HH9+Wqv2XwvvaS
         NMsmEUnwolvruXOgLj3uCoIwDFAJjGbMCcvVrTtA1PqGGzCmpqTC0B/WyHAVsMLV+s4J
         aX9K+MljvWRnnPaBWdo00Ji/DOF3s0glZ8tGmcfqRpaA3LlTgFQIVEKNq0SQYYDBHGKZ
         7RBE9/QB7IW3GOnuitIP+YpztVSkmz+nYFSN8PqiMy8pNd+pfX7fxKFvZ5OJ3EarKU1F
         jK4/e7zhhwa/exSUE4xdobLXwlpm00pmz9hs8NSarb+d84lVp/iyoYtz6eFFiELY61SL
         lWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717790; x=1796322590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/q8f729eKxMWvV8pzxhn9Gn25ubKt4vbGrfRah8m1Uk=;
        b=nxyFGbKGjqr790hhvybYuTLRlnKIzRCbd7syZdN0JyGP+gAP5zSK24KVTl2Ucb/aQT
         PZnO6byBn5Q6CtDoMr3tJe7TsluPyKJyuKbNbGOuiZt7BBNG5u25eZYlu0n4XJUFK9J9
         sNaupxsL1CcgvEKdQyORH+vl9Hieq4CKe31CKe4/p1cVV6P2tH8anx2VdqFODtsbtFRa
         wi1CwpGueOyH5KsUsU6iGIUYR2EthuFRPhZJMZWW4WvVXdCpq+V8kE4RpEkkzePvMJ47
         //M5azHlMwntlITTjPY+Zanou/LFB++6LnJ0CJipKC68lHFQQvlJmvFAitua6ejBggjr
         gCkQ==
X-Forwarded-Encrypted: i=1; AL+hErGdNRYEID6ydfOebjU3AWDSpwHXpFjoLI9Dm9EJIOsQoPiV10V/fjNjYVVjCZwhyOqK0t+9qetowU0MGqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VRRkiS/JbvfNyCnRhDZ6lLFY4N5MCrUjwCDMpytRbs8ODh/2v
	n1yYL/V34VxNX1TN2gqkoL+6Pnis0kRERJeItaDFo16NYgE3HSKcS2pv
X-Gm-Gg: AZFdTZcbPmYeZiio7OF2EiiWALIh/xZKAC1+bknlO0ppR9945J2X1CuC8CNwsgt6waM
	R8AIr/1jnAGr9YnH07N6MfB8RBjlei4be/KO4783e4UVEc13htRtg/5BcMd+cKQAzt4FPykAmtV
	+FfYhE2t+DONr0s/06kCfOibO1CtNDvd/3ml7a7DBZ2CmWUjVAT+6Mmlu4jA4e8O/OC5+XymA56
	d42oEBPjxol/45blm3TUZ67cvC+lq0e+vavQq+Slild8qdwgGwNC7oLaS2ULvTrTv2Ui8PBtlmF
	LMUwb2zB+fhF32vlijAogAPR+SJApdnLKaYufvummrjIU0v4iBKrT3pAzMGBxj7aWx5PWZI/XPU
	le7JhbxXuyfMoQFCPmkx3HeKsoDPN77a3lDJCfCIROMDwPRDq6o231u2lfAT80WhABtk4OYvs4T
	V8Cye37Gf3Hc5yvU46qMagQLWfn752fzygplFJ7Pnin4l9cofHKYMRvGFYpsBa8p/hEVOyzOe69
	XNUa62g3r3w13z2mqjxkF823er1Trb0/q67cAsOXIDDSThE5H+iNXuJJJL17wNcmDn9N4GQzsgj
	uKeXre7cthU1QW+eXHnvpy0I1qmqzSQWjHrnRkMAntZ1VTlHwsw4TCnSUQmc6Rnrmk4mfKdLZF+
	mFUtMQwXTgce8cRwP78jGmOgmfxP0P/e6euoi3hWoOArp+DRFP/aXVgSNUX4XrfjMSvPWCO3XVR
	oF0fC22hNMRxnVCTdk7iQPKmks409qEXMSTkmzVkO3WsDVEFHhgXlECYKhLFviBM+NB8nriHBpu
	I7M+YkP2mfWAHr8qEDecg+omZWuvliXpVQyJeGBAw==
X-Received: by 2002:a05:6000:200f:b0:4b7:6dcb:e906 with SMTP id ffacd0b85a97d-4b76dcbea3emr16532367f8f.43.1795717790229;
        Thu, 26 Nov 2026 10:29:50 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:49 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/3] mmc: sunxi: Set the IDMA DMA mask
Date: Thu, 26 Nov 2026 19:29:42 +0100
Message-ID: <20261126182944.3136900-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
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

Controllers with a non-zero idma_des_shift (D1, A100 and H616) store
buffer and descriptor addresses shifted right by two, so they can
address 34 bits of physical memory. The driver never sets a DMA mask,
so the default 32-bit mask applies. On boards with DRAM above 4 GiB,
like H616 boards with 4 GiB of DRAM starting at 0x40000000, every
buffer above that limit is needlessly bounced through SWIOTLB.

Set the DMA mask to the range the controller can address. For the
other controllers, it stays at 32 bits.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index c7fda9c66537..c53d47576864 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1390,6 +1390,11 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = dma_set_mask_and_coherent(&pdev->dev,
+					DMA_BIT_MASK(32 + host->cfg->idma_des_shift));
+	if (ret)
+		goto error_disable_mmc;
+
 	host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
 					  &host->sg_dma, GFP_KERNEL);
 	if (!host->sg_cpu) {
-- 
2.43.0

