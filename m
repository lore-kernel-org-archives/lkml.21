Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455627;
	b=puqJ5xPtdMtOdy3vSCq0+YSaxloIwPwAHwFHiBsDKQNk/GmRaoXV9bcQ5ZDTqK83zdjJ
	 cjxRA1ebOpC2zrCy1kr2o9OwxK+LUKZCOf5sNPFGihu7S4BbqftraMdRsVPbMBaa5EoRH
	 n+/Tl7j0x+w38abDR2tA6cqzjC/Gj48IGz4Wu/JbW9ZywG3uhUfFPMTm+w6D+xJg5zZoU
	 dM6bizSKbIxiu/Aw7QS5MPbAcHIpB4paeovdIKrFW1vGEBm40OvXRT5Y7tyvcvMg82Df1
	 3biZGR4GLe4Z1beMT61psIiHBPUKLxPvzBcikZ8pYM10hrIW/C4hjw/TA+xg7MYXukQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=m7ZQkqoer6i6wo4vX9KRUxRB4qtv9xqBhVPgTvtWcdE=;
	b=oeTgp+UbaxvFOIuS2PJL07LSBPFGYTRp8ItpYtX9c6jO9DPMj3SOwywgG1lVKon/C4ww
	 8tQA1mvEUQJg69r0VJT4L23TN4GLrlc0pguCXZe9WFVpsMZrO1AM60qUv6SGrNib+S2VQ
	 +0dGbPxmK0WKg6OWHS+2DoecuDCZBUeRZLOB+/s0DI2+mN8yPMNdBPIw8wcrlvjkKkPLL
	 74ANSMpDW2r8Mdn17YoLVCka4sMaJM8+WfDGAphOh0pQA/acmjYbaZQU+yOrAla1fOhBt
	 lvEqVhMyabGlCxu5Q90uoy8NZB3C8EHFkcRr52dC1WD9b2ux7fwMkF18LZeiQU3517w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P8TVAA6y;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE46606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE46606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P8TVAA6y
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so4619591a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795455626; x=1796060426; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m7ZQkqoer6i6wo4vX9KRUxRB4qtv9xqBhVPgTvtWcdE=;
        b=P8TVAA6y9ItwwthzfwpqkPpkSVkzkSV4QChfpyp2Gwofxe12vzpt8mhiAXnKuP9SlM
         GSbMe6YIM3tmj7ymCa8exPyYM/Q6nx1DyUtGSjFwY9OS4LgjJjSqajlNAH7X9wvjRLOE
         29cgujohbkgG6IifnrVnXnt8eQoNa04VkngMMfCk+HmG9WDCOshLEPz5X9ZN0bWQXsMy
         Lwxo4VswmpedMmX50WBhODC0EzHsL2Nk0HXqhOn6v0jOsN2+IsErlsMfHVdXIetHCIAe
         oDKJAmL/oFvGlqF8KbI9puD1/kcOI5gVOYN3aJZUvAkV6lAOJjY9m29dUU5B8O263KMi
         kI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455626; x=1796060426;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m7ZQkqoer6i6wo4vX9KRUxRB4qtv9xqBhVPgTvtWcdE=;
        b=1aYlWTlDwL7jVPRY6f/3T+7WUXTyK2eZfmc72TCqk193MGFNSQ1dRS68Ib0IrHOpwI
         2MmK7/aKp/Fts4Vtg6MYQWGzxXn3c5iW8srRVRoyZ1kcwKIdah8AchQT8rwDapim3TxT
         VAviOABZSWAa6C4pbwjLvzE0OMi1paQ1p6eMyMS9fb3TKgL3RNxxAx+hj+Dca05zN9ni
         RQ1J1fbTSwIvipkpvPv5ChUgU46Er39m0hiXwtG3JNY5JYLCPLmZP3JZtmcRPKOQOq8L
         MgMy2a3n9PR+t5cwyKBo2vDdyb7Zf5PkKPVdtutW2m1hQmCtXgteNwDwN2lxqlbZCOXR
         HcfA==
X-Forwarded-Encrypted: i=1; AL+hErHaf9tKAt/tl/IGP38Sxh31M0crvpMQB55QJrDro0z4AjtFI0VSBkpLpBLwRlOr//fi25F0Q4PTwUq+/UQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sp4pHE9v9d3doMJlBxlS0Lot10tjWS+zHuD+pYnO/v0UB566m
	vf6s68lvE4/iHX8c5WVUZGEovPBBuwmgm+jnwCKfwSvpjJwyWX004UaAU93ijl3L86I=
X-Gm-Gg: AZFdTZfypEHK9BAXpx1n+IiPQcHQdqhR3tqTKeEDNBKecM1H9wz4kK9Z3sc03rlXyXG
	HEG8RNcW2c6PcQ8t43VpU3Cr7uTdAga9FO6q3UtlhgWZ2XLXm9xQDMyeoSEd4FfvK1UlsYhbkrK
	XO8p8j/WzGXVeIEPBkFjUbrnrVlFa2w1mlRp+jIY8yiaTnKs2fyt+HhfqsRftzSzJBwE4L1i3EU
	zzpnS1iuk10OOmgwOIZKVK8bArum8unPRZCJbzPrwE5fMQiKPHqGUk7xrNxACyMbABBSK+S+lue
	YvzQPGaVxXirnGDcYs9xBVAmlLyr/znUAdB8oDPzoDG90EKQgU3/Zhanf1pSbTQf1yy+07o7GUa
	YHNaSO5mdI858OaGHGmlw+mz+aRvXPCw7HzTnrBZ/F2y/58iBd+EC8DU6aas0WMseI7k5jgmJYm
	mE9kj4IhBREnU3RsUvKIv0Cgu6a1WijScYiFEBnCsWkdOHiWQ/FwkKhNjF6GYmVE3DjIYb12XXr
	8ZZMVAyscwMVIlVHtB//p3aCLdVMGSBz6di5vyLJlOF20B7iHMB5vgJ0cZn65IqbxcGw+0xlG9b
	tRevVJMWGXU8Eunk/qaqCO1hlEODYG396xTayethzCytZuYArLLJTouldHTh3YcX4W82Dkej5ZB
	QDlFgSEScRvTbiPH7ktU=
X-Received: by 2002:a05:6402:42c8:b0:6ba:a216:fe0b with SMTP id 4fb4d7f45d1cf-6baa21701bcmr3926014a12.42.1795455625781;
        Mon, 23 Nov 2026 09:40:25 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm3565504a12.30.2026.11.23.09.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:40:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 23 Nov 2026 17:40:24 +0000
Subject: [PATCH] mfd: max77759: set zero DMA mask
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-max77759-dma-mask-v1-1-6f5c8d52904f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAId6BGsC/x3MTQqAIBBA4avErBMaS62uEi0spxqiHxRCCO+et
 PwW770QyDMF6IsXPD0c+DozsCxg3uy5kmCXDbKSGlHW4rDRGKM64Q6bEXahVYNmajVaVUPubk8
 Lx/85jCl96sDjk2MAAAA=
X-Change-ID: 20261123-max77759-dma-mask-65417b861a53
To: Lee Jones <lee@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

During probe of the DT-backed MFD child devices,
platform_dma_configure() calls of_dma_configure() with force_dma=true.
Since the parent I2C client device leaves dma_mask as NULL, both
DT-backed children trigger warnings in the kernel log:

    platform max77759-gpio.0.auto: DMA mask not set
    platform max77759-nvmem.2.auto: DMA mask not set

MAX77759 and its child devices only communicate via I2C/regmap and do
not perform DMA themselves (any I2C DMA uses the host controller
device). Clear coherent_dma_mask and point dma_mask at it before
registering the MFD children, so mfd_add_device() propagates a non-NULL
zero DMA mask to all sub-devices.

Fixes: bb71e40db1b7 ("mfd: max77759: Add Maxim MAX77759 core driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/max77759.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
index 5818ee2811d1..e31af2c0d25a 100644
--- a/drivers/mfd/max77759.c
+++ b/drivers/mfd/max77759.c
@@ -693,6 +693,9 @@ static int max77759_probe(struct i2c_client *client)
 				     "failed to add IRQ chip '%s'\n",
 				     max77759_pmic_irq_chip.name);
 
+	client->dev.coherent_dma_mask = 0;
+	client->dev.dma_mask = &client->dev.coherent_dma_mask;
+
 	ret = max77759_add_chained_maxq(client, max77759, irq_chip_data_pmic);
 	if (ret)
 		return ret;

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261123-max77759-dma-mask-65417b861a53

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

