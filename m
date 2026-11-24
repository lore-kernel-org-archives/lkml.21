Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537885;
	b=V/jzP16DB6Zjq8mrPXXZGEgbZgb9zH/cxxipOS7biDTGDYH06fgniFURwo9RF3OixfaX
	 XqSQL2JGRENeETvn4knqI389FyGCEuQ9cwHwFVUXiT2XFbSJkSmYSLBkKSY3PHG3wH8aH
	 djDQ1Au7NuUQpKJIKqWzu9ztqSIH3PjFY929KkQONnBm3VAAJeRytpqlXthKgi4v4aKwW
	 KBcneQXmCnHr1VADL0mY46P4vOooza5rZ1iFMCWZpA3n/9OWTTMgNeyiNTttORmx1yt9F
	 eUK6MqRD4MN4TKuOy6ebRnLNg8zQxovsO56D0kNzYrmwzLFSeZ7r+XE1WaATT+eyO/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5PVlPBRThxX67H9TTtVJx0hv+Td+7iCuwsI+GnVhog4=;
	b=ZYP/obddf22QCJS4Fg0LKfMg32wsT800EPf0vnD2y5P1QG+LTcwVQz+34AiJQQZsusNZ
	 YqiWM/VmawazoQiaJM4eSa+yo8O2Yn+EX8wdWH0I5MdfnFdBDjXxS2Ciu31kqwoQKONDJ
	 LTSXWeIicuIHNnmO+34wc3ywjjDu6eOnfH66rDNTPcydhLkC8Pi2kqO5/a/Vj95syLs1p
	 jpmKg+oOd55OwJjJEwyYlkH47fr7B7LgTyQxaiA8by4Cop4xnpG2CSV+k/awJFLwP74DK
	 6SO/6H4/jiBN6uizj+cp2kXITLdiZi8NNLnCTNxVAbI4Dud7GS5jFetrfhmWHXn7Cmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoBjn5+z;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2F4606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E2F4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoBjn5+z
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso35371915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537883; x=1796142683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PVlPBRThxX67H9TTtVJx0hv+Td+7iCuwsI+GnVhog4=;
        b=EoBjn5+z9vfyRMolB7sHPK6JX7M1nDRZOPpaW2AZ+ohoq4W/bOyGLvEY93MCkdAL5H
         AwZfgQPMcUzD+/Q4j6H5uk9/GTm1IMWyHGfxeKC/BHTyorm3A7tTGBqYyjmtDuIbgVSI
         sm0SuIXR2iRUJnbAvd5fzsCB+Gsdh/6wis6wLIWv0KUN6fU8O3AEe2414h+q2Kvf/FKu
         2Kf3RhX5D91DgxHzfiEyLPHsUBORGKWQSWXfxkLQRQ5V/dPezE9r+ocGK2RXdWD4afFp
         ljz48Ladd1NLkRFja3P809REOQc8IJ88UlwdkCTk31NhwnwJdDTo7iL//jXjWiHaSzco
         J+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537883; x=1796142683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5PVlPBRThxX67H9TTtVJx0hv+Td+7iCuwsI+GnVhog4=;
        b=fraYLyz1zx6eeFO0ssODvzcrxWKAWqj/TCHrRHJyU98FLJfII3fChe5LIi1yXvdOLb
         qZBDFVhbum1eTHz84a5VfK5fEjrGP51MMFxmCpktOOwDYeNYKxZ7+JNx5q86XvSqXRAN
         HZNZrE0jTna9xFddvzkWbNH0X5BLoMO/57soS9zkUIx4gzUuF5ZDAQv0zZHQ+A6JbKrC
         /BmZmO5GmY8ifs+RrGsDckG6165UabhTg2+YP9Q0AIFEU+NDQlJmkkQa2CUsHKpqE8QB
         au0TqPksJ193if/rnaL6UdbF1I7RocGXhd1IKvfZhJk8w6G4ipxq3Xz/ABirNCfKhNVg
         axdg==
X-Forwarded-Encrypted: i=1; AL+hErGUM2TpKm7V17wXOVr5qQoGNUpxcywT+xmSMtb6CuetrSi5ZhFODaGDXIIvmsHxRrlAnZg7aG3BbXgRFwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8owSEnzA3+hIRW/VEJQyAgsTOzcj+6NlZK330oxqjEefshp/m
	DEub3dXXdQm/oQfJAxMchJ5l0gAIg3AAuXGqkgpTdCd5WMht7fulPStN
X-Gm-Gg: AZFdTZese6QYDkTIi99tZh8q6NIiKex35lUDrDsfrk0CAIpslNRy2MSisBLUpzgz7KR
	Cf18dwSy63jL07kKlEndDI+KGHMEDSWaGZv2dKNTCzEJRFKQ9aYS5/l4enjJKEGXoLdWLBV6VmT
	XVaJVgOQS1Sxwee0r+HAijSfaBiaIBmntju0XKk12V7p0+ZmSEvDRgIWH1L/oTekvE6hCB6R6j7
	sc1ZNCNo4+llZHJv9+fvnwGd7N9zSv4tqzk9I3tWVDjHL9eZkx1KNAi+bZg6CBtg88HlENiY2oT
	MfApBjPRKrMllv9f84q2fo4vN1ieP9b5BIuO3+q7zDqB3uSFacT6aWwnBQme7oItYT9hY50+aJ3
	fReC3ZTtJdd3YLGhFQDFIy+jtwMVblJSQ7Pq2zIWN8GYPaog6SxoyCah5/KbZn3LZoDnmiCV2Qs
	Q/qQ7h1gV3mhPCxdJT2GUei8thYLnWNek7A48NmE2UBMRSS+yRpbFQJfO9nuQzSezbEEC1EgyHP
	lyeSYe77RoXFYeRORGlgkZ1+R+DrrD2umbArK3aAqwjkfLdwogQRgziJ2xk9rbuAWaS3YealqXn
	Pdjqzbd5TmM2j+M7230ExJE9XAFvQ+3l42G2N4SkeRrsLRK+MiJxz2aiXDNfhgqQZA==
X-Received: by 2002:a05:600c:a11:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4bb888120famr315786195e9.16.1795537882758;
        Tue, 24 Nov 2026 08:31:22 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm33058741f8f.24.2026.11.24.08.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:31:22 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 16:31:20 +0000
Subject: [PATCH v4 2/3] mmc: renesas_sdhi: Make HS400 OSEL bit configurable
 per SoC
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
Message-Id: <20261124-sdhi_hs400-v4-2-df452ccd9bca@bp.renesas.com>
References: <20261124-sdhi_hs400-v4-0-df452ccd9bca@bp.renesas.com>
In-Reply-To: <20261124-sdhi_hs400-v4-0-df452ccd9bca@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795537880; l=4140;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=uzoW0FnBY7lsUObZbuxqWOsDbiHEnxLpgnRmU8ynFUU=;
 b=KvBXPiVvk3F0FXZUfyq2iW2tY7tkdQdK5VfG/TFS2+4FK1iZXZDItLjCEpby60uoTlQo9gv7/
 VghwMVRPnhvCyGtBGUqVJ97uKeoeL/h4zPBHQOH8byVAE/IWR+9pL2L
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L and R-Car both use SH_MOBILE_SDHI_SCC_TMPPORT2 but interpret
its bitfields differently. R-Car uses BIT(4) (HS400OSEL) to control
HS400 data output timing, while RZ/G3L uses the lower 16 bits for tuning
delay and does not require the OSEL bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
- No change.
v2->v3:
- No change.
v1->v2:
- No change.
---
 drivers/mmc/host/renesas_sdhi.h               | 1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 6 +++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 ++
 include/linux/platform_data/tmio.h            | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index a93e613e9821..8ae2ec04bd1f 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u32 osel_tmpout;
 	u16 clk_div_mask;
 };
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 56286431fd2c..7dfcf7f970aa 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -333,7 +333,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
 
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
 
 #define RZG3L_SDHI_SCC_HWADJ2_1_8V	0xff
@@ -484,7 +483,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
+			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
@@ -621,7 +620,7 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
+			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
@@ -1233,6 +1232,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
 		mmc_data->clk_div_mask = of_data->clk_div_mask;
+		mmc_data->osel_tmpout = of_data->osel_tmpout;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index eaf21f93f5d3..37eeaa52f011 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -124,6 +124,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -140,6 +141,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	/* DMAC can handle 32bit blk count but only 1 segment */
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rz_g2l = {
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 99b05c8c840a..501ca4355c34 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -72,6 +72,7 @@ struct tmio_mmc_data {
 	unsigned short			max_segs;
 	u64				clk_mask;
 	unsigned int			max_divider;
+	u32				osel_tmpout;
 	u16				clk_div_mask;
 };
 #endif

-- 
2.43.0

