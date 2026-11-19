Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055378;
	b=2mMJGgP/VgKNGNjysqng6u/PbyIMBHNYhq9C9xIDdNxLS/9lrA7hAdYFZ0VFIAGSEcBD
	 7HDlRNXh/teCXf7Yfg0/j7agbwCFWndMOtJ8pKZBa6xCMPosIM8toKr+vC/73pPVrnGi9
	 9kYRGZtwHGDZQvq+FlThizfNQneU09lKWwlG8cbY2akRK0b+8qvbDAcOe92CD/SWm1IEK
	 7XEHa/E2oj9XM4qJBPUeL56zDxCg2AcIlEOR4oAqUbI8M08sGEHiLAt1VfE5h2HJpUQ6P
	 TeLG2A+7wA8QG/EjxbO6HPMGeXuU6DvuHk2dPqIi6UF4m0pAu1DeK69lF9f/3K7nyJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4Mnuux0cc/mWzzrRAAMjmQoIcIIOPkgjuAFisMHgz18=;
	b=zlxITAUfLuJv1foApDBFDRSYGFxtB9yNBKpUsds6JQ4heo4xQxRFuDAPgy9a56zt+5IN
	 bKRpUOJ/++z/3j8DGIz1mIEr0M6jR5EGJu/67USgsDtZ1oRf+uqDUKdeCzluwGII4Yy7E
	 pEFhAxh4f/qQpn4eqnOuZi/fnjacsiOjtEFp+4gzm+uurkKoHkrYXg8IKDJhpSKR9k0R7
	 Hqn1m244OOyicySv8z1Ilu3MCI2TAIInz9JgjI+axC06pZvVkrZaMaCgiUPRKuaBgeJil
	 KXOlkKjB6inT0/HclkdtMD07pkFmR8VW4g/K8sHiHulMdjHOpvzUlnGTKvkAGi9GbHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8yGNY+Z;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7A8606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7A8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8yGNY+Z
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37198ed3727so557915eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055375; x=1795660175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Mnuux0cc/mWzzrRAAMjmQoIcIIOPkgjuAFisMHgz18=;
        b=E8yGNY+ZWel7/ZWIP1jEW7g++qTkzRkkw1sdJVelkSay6lAizpTDkIGdvck7sO5gdu
         sXjhYnIH89TRuP7ZLEhOSrrNJstE5TYGoK8YF0nbhP/JJyOvl5rlUKA4YcMmryl/SmQc
         EKYd2ul2pabZr83NGIEba5uVEUC/xuAfpq7HaNlIOoH+ZzFPpPFjYkX7UPeVxUH0RbhC
         aSbU8ZzlNK7C4fKdoiBmmoZkrKSV5nJRR4QrbJY4wHwv2WBn1G3THPmbP/bJtlHUzCSQ
         LWJi1YOnX+t/0Ogw+BlCy3kusyqr7w04Zh6R4S/E0xy9AdrZfR7C+Vax5JrVAFXUiS2X
         twKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055375; x=1795660175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Mnuux0cc/mWzzrRAAMjmQoIcIIOPkgjuAFisMHgz18=;
        b=iJbQWHQIVwaRX1HLO0K95X46VM5NwcC58sNCT21YLcnipMzwYQF3eIRRSzAlyfhSTz
         7rxr0dzxL+sBZJWHhvZqiATVNcnf/u+2mUpEVt8M0WUrsjvNWu3Rj9kOKpwGqwDBjJki
         u2UzFzm3MF6dSXOmHmYXcmQURuruT2W2Szf9RH1jXJ5O0z6DKYeCzdCASlLM9qPxDnIG
         bGBdQpxpqjaygz95aZEVYApZ1l+VS/jGfML2YZK0qr4XxTijF8id0/KBLWuTA8e0Nn3W
         6EF+TAjJc1e70uxLejpfTe3Y0MNngZ3u03ZsOqDu2EONWYIS7gfyRNPe1k4GxH0atmsh
         Ldng==
X-Forwarded-Encrypted: i=1; AL+hErGDzJjUPVzdyvvnaRxUBP+BOmqjGYDaQiW6V8cxpp7Y2VIiWMYvBEumBaPw+XMT6W4zjeS3rK2AEI1I9Uc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CEdDX2oOL1ny//es1nT+1y5sxchd9++MDLRi+pFKpTiiYt+qC
	Tg+lG45K0w9F45roHYyh8+qKmBDEmvdqaxRDscKRlcERNzWbxaD4Xrlh
X-Gm-Gg: AZFdTZemcqWQl9uXADi2bJ82JKGPyj2kmBQCzVIwPcMaWC07jJJWxOqUrbs0eyXsPXa
	Ey03hmtpAkT7ZtA2PtC371A/ZgHrhBLNBTRSIsmRccjIpiX2YXYACBJwyQxGsDsZ5ykma6pKhER
	PvXvpUj7zP/bx7xUBTYniFEyLPJP37ehidsG6YLvq8/lT9jqQGDwxbJNtvQIIrRnaJSfZVzUck0
	UHyp5i8glaLA4YWWErcoTGWhKXvaucq6SwEaKGLyrC8AlJbJr1jR11ZTdUeAz4o6FWxeIo4aOVi
	nRq/z4H7e+0w4fbV7ITl85Ba9GPMPWNR3AVM9rAPke2GH9Ka6Lo9niT8kfXd6srJvg0aAYOFI2p
	G8/bpHVTRskuaSmeOobBtvNUKDkY8Rj6MKje1OZvNCH9cD/zN59GdG7bcxlrnb+AHQh0G0MUEr8
	V65zMF06SoLsyMPCOMgTSs8V2nr70QCWQ5x1LYhFHQdC1pXWHlbYy0paOZXBdwbCNq9gzSvCmCa
	440Po0CjbELvbOOiBdeRWdi6gFehLH3NIQUTEGJ/rHr4r4N/N6cKSMi0RuDxdVEfFlcItYvkB/v
	0C4SKaqYJbqGAJWggNKgXRMh9Mb+Byqa6Tddo5dV9DxHD6iOPq/HSXaGj2BiP1kdAAMi3Urvc/m
	aN5qmoPY//VHjhwnqM3svKMIoC1kgC+FUspnKyP6lkw==
X-Received: by 2002:a05:7301:1701:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-384447067damr572794eec.10.1795055375250;
        Wed, 18 Nov 2026 18:29:35 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a172a0a8sm10575722eec.0.2026.11.18.18.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:29:34 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: niklas.soderlund@ragnatech.se,
	rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] thermal: rcar_gen3: release the IRQ handlers before the zones are freed
Date: Thu, 19 Nov 2026 10:29:26 +0800
Message-Id: <20261119022926.1493582-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117145348.1092528-1-shunsheng1218@gmail.com>
References: <20261117145348.1092528-1-shunsheng1218@gmail.com>
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

The interrupt handlers are requested before the thermal zones are
registered, so devres releases the zones first.  When ->remove() returns,
the zones are gone while the handlers are still installed until devres
gets to them, and a handler that runs in that window walks priv->tscs[]
and updates a zone that no longer exists.  The source keeps asserting
because nothing clears REG_GEN3_IRQEN before the hardware goes away.

synchronize_irq() alone does not close that window.  It waits for a
handler that is running at that moment, but the zones are freed before
the handlers are, so an interrupt that is raised just after the wait, or
that is still pending in the interrupt controller, runs a handler
against freed memory.  Removing the handler is what actually closes it,
so ->remove() masks the source and calls devm_free_irq() for every
interrupt that was requested, while the device is still runtime
resumed.

The interrupt numbers live in an array whose unused slots stay negative,
so the partial probe path - which also ends in ->remove() - releases
exactly what was requested without a second counter to keep in sync.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Compile tested only: arm64 defconfig, aarch64-linux-gnu-gcc 11.4.  The
board was not available, so the removal path was not exercised and no
race injection was run.

Changes in v2:
 - Mask the source and release the handlers in ->remove() instead of
   relying on devres plus synchronize_irq(), and explain in the message
   why a single synchronize_irq() cannot close the window.
 - Keep the interrupt numbers in an array whose unused slots stay
   negative instead of a separate count.
 - Use a loop-local index and a named maximum instead of literals.
---
 drivers/thermal/renesas/rcar_gen3_thermal.c | 33 ++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 9c64cbc2ee67..2a6890d2a5da 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -103,6 +103,8 @@ struct rcar_gen3_thermal_tsc {
 	int thcode[3];
 };
 
+#define RCAR_GEN3_THERMAL_MAX_IRQ	2
+
 struct rcar_gen3_thermal_priv {
 	struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
 	struct thermal_zone_device_ops ops;
@@ -110,6 +112,7 @@ struct rcar_gen3_thermal_priv {
 	int ptat[3];
 	int tj_t;
 	const struct rcar_thermal_info *info;
+	int irqs[RCAR_GEN3_THERMAL_MAX_IRQ];
 };
 
 static inline u32 rcar_gen3_thermal_read(struct rcar_gen3_thermal_tsc *tsc,
@@ -468,8 +471,31 @@ MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);
 
 static void rcar_gen3_thermal_remove(struct platform_device *pdev)
 {
+	struct rcar_gen3_thermal_priv *priv = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	/*
+	 * Disable the interrupt source while the device is still runtime
+	 * resumed.  REG_GEN3_IRQEN is only ever written by
+	 * rcar_gen3_thermal_init(); a concurrent set_trips() writes
+	 * REG_GEN3_IRQMSK alone, so it cannot re-enable the source here.
+	 */
+	for (unsigned int i = 0; i < priv->num_tscs; i++) {
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQEN, 0);
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQMSK, 0);
+	}
+
+	/*
+	 * Release the handlers here instead of leaving that to devres.  They
+	 * were requested before the thermal zones, so devres would free the
+	 * zones first, and a handler that runs in between would use a zone
+	 * that is already gone.  free_irq() also waits for the threaded
+	 * handler that may be running right now.
+	 */
+	for (unsigned int i = 0; i < ARRAY_SIZE(priv->irqs); i++)
+		if (priv->irqs[i] >= 0)
+			devm_free_irq(dev, priv->irqs[i], priv);
+
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 }
@@ -489,7 +515,7 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
 	char *irqname;
 	int ret, irq;
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < RCAR_GEN3_THERMAL_MAX_IRQ; i++) {
 		irq = platform_get_irq_optional(pdev, i);
 		if (irq < 0)
 			return irq;
@@ -504,6 +530,8 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
 						IRQF_ONESHOT, irqname, priv);
 		if (ret)
 			return ret;
+
+		priv->irqs[i] = irq;
 	}
 
 	return 0;
@@ -525,6 +553,9 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	priv->ops = rcar_gen3_tz_of_ops;
 
 	priv->info = of_device_get_match_data(dev);
+
+	for (i = 0; i < ARRAY_SIZE(priv->irqs); i++)
+		priv->irqs[i] = -ENOENT;
 	platform_set_drvdata(pdev, priv);
 
 	if (rcar_gen3_thermal_request_irqs(priv, pdev))
-- 
2.34.1

