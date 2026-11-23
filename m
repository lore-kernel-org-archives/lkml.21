Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432741;
	b=4OQpzAxALd8kh3DwJsCIcwLobR4+YpE7nInv0GYDTv6EoWvO7P/5TNnrCqJQV8LQVKHl
	 8GPSJjQeep6z+pwswdIZvt23eaFJ/XBcyTXMTmYE79qUzgivoE0tX+jg6X/tcts50hiTW
	 2PrcxPg3Bh2qv1kixI6J0vKFYhj5nE9UZ/gt6ddP1ksimCfzVEC3dljYhPyIJt4PndyTi
	 tFzJKNubSKGy0ZT6u+ils2obMn02QuC0z6gh+0L6uk9XykO+Xz4ofu1nQ8J2dmR45WEwf
	 8C22Q4eceMi8Nat/m5EJt7TK9OWpLAGzUle/FIY8QZU2YFslMaMBUZ7bLwLQcGVmO7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=jwL10KRKcG6XAu94ns6q7rnAqyJIXDIiUk5S1uZsgLw=;
	b=Oi10pJS5uV80OFMbBwSuEKjGhIuuJkudm3Gr1xplM2MxPTGg3L17RAZtM2FIZd/MHMEE
	 nAkasAYq78al/Nc2/sYyX7rjS4cuR4ED3mGmF/evmxV/rit+PUblk2TmNXypXZlOVd1++
	 4a3rswOmpq/hCXHKnjtEQUXOM9EfquxdKhYE2VlP3YDpFLKYINcf4kAZrL6aouaYKOWRW
	 xiAYi9WaP+4x139H2mSEgVsfXFfmTZSvdEFzVU1WaXu8YuZFDnS9/rWT/4pmIXRl2sxKy
	 xGwBeOS3at9ePKKxZptRFpCpQur0Is9f2awdHQCAxX9bL4KS7QIVa9YaXAnR+DIY31A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p03mHj+K;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23F5606A689
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F23F5606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p03mHj+K
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so23738695e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432739; x=1796037539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jwL10KRKcG6XAu94ns6q7rnAqyJIXDIiUk5S1uZsgLw=;
        b=p03mHj+KQHnMbxVVxBmkr6es/n1Xd6oQ/lzs2yVGTxTuB4WG1In2kNf6vBnX+LoGv9
         tyDUv1VGbiGW6cuwWSVmzpeRP944wF/9rLzfeIkJWOq1WOJ1o46IxECRJKPnZNdcVfka
         6cmHU1J73YbHBlvkdqQjNPiiioZpN5xt6pDUYz51ZsA91Tg80oPCCpPaLckvDqIWOGwH
         ssJC4WrIFof8dahDMCv5IGZbaqCFOgB1eaeYdK6Ealzr5U0p7vVYhr21IlPcWtQbsMTd
         ElC8s5tFcv4qJjlJQjeBfvD0RvRyaRF/ymWROAUEV+RAeCYjMdDs3abiThHNr+X4gh6c
         4CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432739; x=1796037539;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwL10KRKcG6XAu94ns6q7rnAqyJIXDIiUk5S1uZsgLw=;
        b=0527Nyea4LGOUqvlik6O1z/Hka3p471M9OelLCJXucZe+fu2aDC6LNqyGPOE0EAVdY
         2a0IucqsaoawsB+bEzUugorhMrn4uoLhBYMHDQNubIWvEHcVdn+FTOq6U4aB9mI3h9cF
         qb/pIruaF6G/J0z1wAQ4wQqv6LWDybWgEDASgWEzz7RYOrvf8FkOl5pNRgZtozARfUVm
         zSfSzuV/0yg+JnzHjBC6NPPUvhjLeYt2hCEpse49ZIac8FMJcuB+PB0gedhnRkxTWzfl
         4lruSegXVVWJAJ38ava5BS6JVqKCwpZKdw8AHX15mec0r/LwnSVt8xERNAwaawYNIrHE
         11ag==
X-Forwarded-Encrypted: i=1; AL+hErERF3oXmHbSAsMAa/psHZUfUTRr++ctCPABMbCzBmza5h9ZqgP24WEHeMte21/hocNkTI5MyczvOcPQijY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QpD91wWFAk0D2jrv+Ny9ZwBOiiFhqQ+XIDlCL5zh15oAn+nzx
	kCGy61ikKRejkHv/PkFzV1WhNaRthNkrzZ1arprp8vMNyBhG6zwaDwHXk3+Cq7JJcX4=
X-Gm-Gg: AZFdTZfxm+0m0eHRhrJhLdDwG/xUgcYrhfZYv1GbZ6ReYSmDD6EfPrLRT+VatERVLtR
	rhzhkTCh20zgtFn8egicgYZqRipxw2fngjoquwW1wn4xEbKstL7664oS3VVgIzWbiTm06MNYm1D
	gQ6WAbTtudqOxZA9KpX+laxB7b4KHMPIiHlVTMil8A61Lo7a53j8AnrGOcPbrVqIfLuRle5xdv/
	Uw505i8SPRwLuNrYctZBwAlqzrcctVtS+lX1i5+N5j5Uqgo6tj6tRkYCS9n5izbQRwkZDXNkJfK
	EHFjzwdic7vW+2vBkRDIh3O7de3FVgfBgnJ2y3daMlv1TdtBbDXSyPpidmHat8dBCB6o1ME8Y6d
	PLbiwKANmhoHJI4x48NOgQcNQ2ow2eTotYTs5chOI4H5ve283U7C4cw+osbfNbtdMYqxY6WEc++
	A57emMmHCjO9OkjaIoYCSVM5UdFLrm/sktcMvvUteVHhoXgUw/5Tjq0GxgSjzcJVqYDUhfj9mnE
	nSle4OiP7yVgKexVI9gVwzNB3ui1asuteZSRKIKPiP5yHrR7LuxKIbVXUuyNnXBaKRWcaqrB6FA
	WK7O/4JLHhnA8No5hgdlt43gXpHK3Zhzwdkn0yrDblCelWa9lpYd+BYkw2rky6IlnHjUlN2PcYT
	k+pUnnYIvEpkxu6Ug
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr221401195e9.6.1795432739420;
        Mon, 23 Nov 2026 03:18:59 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb85399e2esm393577795e9.7.2026.11.23.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:18:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 01/17] mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used locally
Date: Mon, 23 Nov 2026 12:17:59 +0100
Message-ID:  <eb63d4f97f6ca7b02843ae7f847e05f638da7244.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=exzuZn6/A2flHssSAn+wVJWquiw1+beBF6wV3QD1uzg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDpWobcWgfJETkKzicHPb9yb1Q1GEbAd3fRS P06FmSW3syJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg6QAKCRCPgPtYfRL+ TqnRCACB34VmkH/Zrf4kcZRTb8jyWXVRlaCXFu9f9mPWr4O6yveUz5kyugfZc3cc6JKYSC8vT9M h6MbSNuPXyVYUUJjlfyqfnF1pRoQ8FfnOZmfxZI+nkx03Kmw58dG19VasOBEvWJD0WkluRQgYiO MtH4WUtCqLkeMhZYh7GC6xhdAKG0F0FHALVNvjHkpo6UyyLBnlAIK+U0VS3kgXZS5tsHdrCuE/2 iwH5uL2w3Hqh4F0/jCuAn+vG01VkNGmISzwXdH0emgTbs6DYBGBNif/mLlcXhAmzlYp97yMNJB4 2TeYN7/s/DXqGRTGr3IE6+cxSTfuGBgIp/4zArY6PUnkZtXb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
replaced by a local variable.

With that change enum bcm2835_soc is only used in the mfd core driver and
so the definition can move there.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/bcm2835-pm.c       | 11 +++++++++--
 include/linux/mfd/bcm2835-pm.h |  7 -------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 14b18dc38058..f21d5689561a 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -69,10 +69,17 @@ static int bcm2835_pm_get_pdata(struct platform_device *pdev,
 	return 0;
 }
 
+enum bcm2835_soc {
+	BCM2835_PM_SOC_BCM2835,
+	BCM2835_PM_SOC_BCM2711,
+	BCM2835_PM_SOC_BCM2712,
+};
+
 static int bcm2835_pm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct bcm2835_pm *pm;
+	enum bcm2835_soc soc;
 	int ret;
 
 	pm = devm_kzalloc_obj(dev, *pm);
@@ -81,7 +88,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pm);
 
 	pm->dev = dev;
-	pm->soc = (uintptr_t)device_get_match_data(dev);
+	soc = (uintptr_t)device_get_match_data(dev);
 
 	ret = bcm2835_pm_get_pdata(pdev, pm);
 	if (ret)
@@ -98,7 +105,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	 * bcm2835-pm binding as the key for whether we can reference
 	 * the full PM register range and support power domains.
 	 */
-	if (pm->asb || pm->soc == BCM2835_PM_SOC_BCM2712)
+	if (pm->asb || soc == BCM2835_PM_SOC_BCM2712)
 		return devm_mfd_add_devices(dev, -1, bcm2835_power_devs,
 					    ARRAY_SIZE(bcm2835_power_devs),
 					    NULL, 0, NULL);
diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index d2e17ab1dbfc..f70a810c55f7 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -5,18 +5,11 @@
 
 #include <linux/regmap.h>
 
-enum bcm2835_soc {
-	BCM2835_PM_SOC_BCM2835,
-	BCM2835_PM_SOC_BCM2711,
-	BCM2835_PM_SOC_BCM2712,
-};
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *asb;
 	void __iomem *rpivid_asb;
-	enum bcm2835_soc soc;
 };
 
 #endif /* BCM2835_MFD_PM_H */
-- 
2.47.3

