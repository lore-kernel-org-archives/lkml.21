Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630871;
	b=BcBzBtPjZp9u1HN2mN78NS+vvPvvhUla5TV43dIgwECxmGqRfJcqYtDSLa5wra0B9GZa
	 01Y1xv3JSS6IsJQcHI7BkJmwo1haI6+y1Xvt24eGH54sKa4zWVLIF0s2SBKxAscejVMJ5
	 ZGk3ZLCFn7i+PUaskxR0Uz+4FmpLrkwJNjG4fM0MD+yMXT1xj6arr36FMy2ZymTOS1ROc
	 PpTGZAmQp6SAwIVXcg2YluppULGU432yE1DTdqZiK9nxw6NGWhti8Zf5aY6n+GQdbj7+i
	 Y7pGlz2opWmk29MCO9U/Olt5bgfc3nIqfNFZqEsnRE3VSJ4pNdDCcq8F2UE3EcBW7IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630871;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=fCytLPbTQSjOf7Vpu6o9kchdmZ8p74IaOwZ5U8CL04Q=;
	b=S4AvRHI4csvnx0tzZtgmkzydn5FisdqL7YPk7vuhs1foFaXOHa4AVqMwHTXjzOal54gq
	 uLvdzl17FqhChfM9J0CDNIC+/hcykE1LE/F12igfczE3+wZW6pqmhX8of6y4Y7+rmDm6l
	 MTUeKM/GfCqil1UNW9skFxtiOBCtiv2G+cluKgw8XNETZQAzmo69IVBBJFH7n4Y0AALB+
	 SvnX1+P4HPYVbuLebax7WjpV4I8oA2YHsg7U6xeNzduuzpWQOup1PuzcEhp7ivQkaMdzi
	 KkvnYAjjxfnpQEp2GnseITPOPnwfXLCCLC7xwfiAHN2rcbm5SM/rzO1qRPlllYcwE5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OPD5IsaT;
	arc=none smtp.remote-ip=209.85.128.226
Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF8E606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF8E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OPD5IsaT
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-8b503e2a87bso65120737b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630869; x=1796235669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCytLPbTQSjOf7Vpu6o9kchdmZ8p74IaOwZ5U8CL04Q=;
        b=u04Va3lmTse/XotGrAiCzav1vKBZCm+MM7J/cEObwqiR+4Ien2OOqk0J/nJBCgyn6T
         IIlc6FbCbD1lKA0IaE0OCz+RHn1eSNS+gNFbCT6rt+vad8lK9DqNGdQSLAtemm2Wz8WM
         C58K53iMwQjb86Z7xg3YLvvqCClYwXq4eInORcuQVUpC+elPwElW0EaxKvWnbTsGN3pt
         mSZO8ngk9ZepwqjaL9E028g+eZhZq+M79RSmTp2Ty7si5kO11Nm3l2qaXySCCGTKna02
         3UAUGw8FyTD6ZwIZWUfZwj5ybnaDEQ3LLAT+9rSn5SGtWNM2LDaHM5uLYTTWc18JswPl
         XTPw==
X-Forwarded-Encrypted: i=1; AL+hErFWglANhjNPpU7I859O82gK4blvMxyDtfzEJsVi6rsp25NzHvKemFeDJbAyWm1s2uINtXU23JWhXB3wrNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mmbqm5l5Qka/EqQXZk9ixSFUy6ZOf2bmtxDhqfguU3ojmE/t7
	VfE1wynTNoucG/pCLBw6wnG3YMv8hDK4maspQdCCBQfrRofGWQaiuQaU2swMv8RnmlGbE0xZLkn
	r41LqezwNMj0D0AYpXjOqeMUuoJFZhgSbK3uIkZMW3LrAgMciKerofjSHXFsXz+4i5b7ORdRNvF
	Gechc5zu7nmIc6MwgU3PVoCwoC8JI9YyOtQlrCGn24SM0wRIlQMT0VdlDVzdoUHlnSIlkBVwaDU
	2PF+Fscrz1KcGYh
X-Gm-Gg: AZFdTZcMcPoOw7N37//i+h2OLTvAyKRY/dO2nisbVHuOc79H5RcwjlS+PZya20bSHtF
	z7pZG8dXpofFkrfTDSVYktBl4G2JYCwpmA0vuY1ZElEP6vCN2WE0vOkIaHzRz+kwz7GzEGNBxk3
	CH3HSx56npeuo7KMhN2K7Fs6atZwXKRboJqweCsTRvNy9drIVq3qjj6phPqhSX/sh86KwSVcw9Z
	e481E1CTJaSxmh3m9w7KrCIxkEsLWHosD+aHW0bX0pn6g2ecLjVljx/Q8tWgWOrH1ZrekWG3dTp
	vdQFgRinOD+m1Tx0iqkTVP+qrOGmK5nW0zHAv4IRJqfP0ebQwCX5ub91aMrU9X8Ro6q0HO2uPdF
	TcqTkKZ7vXFvNxY7LvJBjxJgoM3LjIDSGq0MEHgxS4YCuYgtDZlTwqEd/OeR0EJnOVZz2pUN8Qq
	mXYkSEZJsFPO5bzOYe5HZIJymn5ZYQtfiiisU=
X-Received: by 2002:a05:690c:6609:b0:8b0:eb93:fba1 with SMTP id 00721157ae682-8b5204db372mr84855887b3.47.1795630869566;
        Wed, 25 Nov 2026 10:21:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b5202c93f5sm1111277b3.28.2026.11.25.10.21.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso248217285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630869; x=1796235669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCytLPbTQSjOf7Vpu6o9kchdmZ8p74IaOwZ5U8CL04Q=;
        b=OPD5IsaTISg6sb+rgiXx94CpPWIX0jkkortJeADY7RArtWZQBlSWH5mkPxstplUx+J
         IgnYXTzicnWOke0YNZD3XQEEDU60u54x6/+MB/P7LRO2mOjBq4GZYDQv/8LIcRZoPsVj
         6NdTvsAXkTE1i4wBZDFpWRz/Pgcql1kF7V0hs=
X-Forwarded-Encrypted: i=1; AL+hErGOYWzd8nIkBEgAKIpndHiD0hvSsKvhruSL7S+QW94DcH3a5CysSfz5+LKg9kBuBci83U2sD1u9F1j5ysc=@vger.kernel.org
X-Received: by 2002:a05:620a:6609:b0:93c:664e:e212 with SMTP id af79cd13be357-949ba9e83d2mr2856743985a.32.1795630868605;
        Wed, 25 Nov 2026 10:21:08 -0800 (PST)
X-Received: by 2002:a05:620a:6609:b0:93c:664e:e212 with SMTP id af79cd13be357-949ba9e83d2mr2856739385a.32.1795630868124;
        Wed, 25 Nov 2026 10:21:08 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:07 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v14 5/6] mmc: core: Move and split reset functions for eMMC
Date: Wed, 25 Nov 2026 13:20:52 -0500
Message-Id: <20261125182053.3915833-6-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

To prepare for a subsequent change and to simplify review, let's move the
function for resetting the eMMC card a few lines up in the file.

While at it, split the cache flush out of _mmc_hw_reset() into a new
mmc_hw_reset_recovery() function and use that for the ->hw_reset() bus
operation. This keeps the flush for recovery, where it was intended, but
allows the card to be reset without it, by calling _mmc_hw_reset()
directly. That is needed when resetting the card at system resume, as the
cache has already been flushed at suspend and the flush would only fail
with a timeout, after the card has been accessed by firmware.

There are no functional changes.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/mmc.c | 73 ++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 34 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 93bd9b44e7d9..122ac9ba0a4b 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2273,6 +2273,44 @@ static int mmc_shutdown(struct mmc_host *host)
 	return err;
 }
 
+static bool mmc_card_can_reset(struct mmc_card *card)
+{
+	u8 rst_n_function;
+
+	rst_n_function = card->ext_csd.rst_n_function;
+	return ((rst_n_function & EXT_CSD_RST_N_EN_MASK) == EXT_CSD_RST_N_ENABLED);
+}
+
+static int _mmc_hw_reset(struct mmc_host *host)
+{
+	struct mmc_card *card = host->card;
+
+	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
+	    mmc_card_can_reset(card)) {
+		/* If the card accept RST_n signal, send it. */
+		mmc_set_clock(host, host->f_init);
+		host->ops->card_hw_reset(host);
+		/* Set initial state and call mmc_set_ios */
+		mmc_set_initial_state(host);
+	} else {
+		/* Do a brute force power cycle */
+		mmc_power_cycle(host, card->ocr);
+		mmc_pwrseq_reset(host);
+	}
+	return mmc_init_card(host, card->ocr, card);
+}
+
+static int mmc_hw_reset_recovery(struct mmc_host *host)
+{
+	/*
+	 * In the case of recovery, we can't expect flushing the cache to work
+	 * always, but we have a go and ignore errors.
+	 */
+	_mmc_flush_cache(host);
+
+	return _mmc_hw_reset(host);
+}
+
 /*
  * Callback for resume.
  */
@@ -2321,39 +2359,6 @@ static int mmc_runtime_resume(struct mmc_host *host)
 	return 0;
 }
 
-static bool mmc_card_can_reset(struct mmc_card *card)
-{
-	u8 rst_n_function;
-
-	rst_n_function = card->ext_csd.rst_n_function;
-	return ((rst_n_function & EXT_CSD_RST_N_EN_MASK) == EXT_CSD_RST_N_ENABLED);
-}
-
-static int _mmc_hw_reset(struct mmc_host *host)
-{
-	struct mmc_card *card = host->card;
-
-	/*
-	 * In the case of recovery, we can't expect flushing the cache to work
-	 * always, but we have a go and ignore errors.
-	 */
-	_mmc_flush_cache(host);
-
-	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
-	     mmc_card_can_reset(card)) {
-		/* If the card accept RST_n signal, send it. */
-		mmc_set_clock(host, host->f_init);
-		host->ops->card_hw_reset(host);
-		/* Set initial state and call mmc_set_ios */
-		mmc_set_initial_state(host);
-	} else {
-		/* Do a brute force power cycle */
-		mmc_power_cycle(host, card->ocr);
-		mmc_pwrseq_reset(host);
-	}
-	return mmc_init_card(host, card->ocr, card);
-}
-
 /**
  * _mmc_handle_undervoltage - Handle an undervoltage event for MMC/eMMC devices
  * @host: MMC host structure
@@ -2412,7 +2417,7 @@ static const struct mmc_bus_ops mmc_ops = {
 	.runtime_resume = mmc_runtime_resume,
 	.alive = mmc_alive,
 	.shutdown = mmc_shutdown,
-	.hw_reset = _mmc_hw_reset,
+	.hw_reset = mmc_hw_reset_recovery,
 	.cache_enabled = _mmc_cache_enabled,
 	.flush_cache = _mmc_flush_cache,
 	.handle_undervoltage = _mmc_handle_undervoltage,
