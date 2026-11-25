Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575823;
	b=iwGb5Sxj67jhHFgNZteuBWqB8Xy+VN4GPck+/l6OYELpI5fxFLREBH0c8z75LJRSLfc3
	 cuauOp9nDU42HarUGoRKGqZtGNtDqimFp4JU/rGF5AsQ1LiSFWKIFv1fZbumR15+f1yK0
	 CzbIMsZ33WN0bvZ2exPTeRikC1E6KRnGwimZ8UvcjmZCwVc2RuvjPbCs8ebL/rjtt9TQn
	 f6O3tZN5iJzV+3ZAvyo0aNlmNJKEsGlLJcaaSLT6dnQxAx6FEmOQngbrhod/isURwVW2F
	 AnQqxkLdYrqc08/L0EYK8wUYvzQrvKE+mFd8Gzx2sL2f1XMZ5ixS8vNip73WtiOBvMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aObshDLUDkI5DYfLUeDOOwlZtaV71Oz7yE0ISv0Zs5o=;
	b=kzkBgYUr2b4tT6ksZPrUW7HqTPBHScFviZJiI1mexWQg/yrwbUZXI82S/jKJEqv9H+dP
	 RVohq1+pYqLT7REOqc/CNd5ZV6SALoKMjFYdkL4WDRL2sQFP6WSZz0OnCOCmb6j1q/jI6
	 6qmrgUCJeqejTNjca+UJczDHj0+jGpdAJWPogidklaN+wUqmcBhAelewJGWF8ePmKABVJ
	 naeWeByUBk1pkLmtnRzXgdGL+e8DGBbQEHx6VXD3l3yizf5/mfgrZReJppKx0KqWj2YGP
	 joZ5b4OVG5m7QjI/LksfW1lZIni5tXeU3lYRyI1POAPPKYoeQqsHKezXZecjqQfYZHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDZ6Q0wf;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87D606A339
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D87D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDZ6Q0wf
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so5546852c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575823; x=1796180623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aObshDLUDkI5DYfLUeDOOwlZtaV71Oz7yE0ISv0Zs5o=;
        b=LDZ6Q0wfQlvvGbJjWLDPZnYrk492UiL1Dh3GsI9JvPsxEIOLue4hUCgxw31lKe4icI
         2V2yGnT2NqXS28IhxhzYIAKgOiEFqFIDaM6hdh/sWwosMmxYrRUTvzx3dJuMvVCgetbL
         QbOuwtprPJFaKgmo/Zxjzb30HYWhaRgTUPq3i8QACs72ki3DmkCnBkkzw9UQOVHWWSH6
         qlyrXon4M74/xoKWHq2DjSEhwqaKxO40o/erAtrdX8vOIyQYWoUe6CdEXKau+0GjJFx+
         2+3RUTHZ0UGytVOc2wC659oqLXi1V37QR8EvAnOIgYaxhXC9QA+EPvYD4Z2llrgSaYyf
         01Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575823; x=1796180623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aObshDLUDkI5DYfLUeDOOwlZtaV71Oz7yE0ISv0Zs5o=;
        b=oaSWBhnR9otveFfuofsGp/lhCmaAmRABPR58aq9NkFt/xK+h+ih0Bkie0R8GT78Eyb
         J19prhwg46ZiBvHEhZkbzMUUGVn1fZn7PhL6uXiWpr/N4XWrPCr56uQaLO2PmWOR8hqM
         txjom2xFAkFtbT4YAxp9tJWcV0dmBGepgrd3C+jot2zOD62TfYJQV8P6ndzLHWKF2FZW
         rJCP86/km5FTAAYLKuoN+UnTbYhGkrIVceQhgRFwkDp8YDq9yH/yqQ8If4p6uopYv5Ji
         iqqB5L9Nw6XWKNqor0SWKfuOsX5jYBsXANX8MukvUM0NMRRaB+wUluEwWSYkrppzVMaA
         Y97A==
X-Forwarded-Encrypted: i=1; AL+hErGbuaLtZdj1GNZOzJTy07iVZnDY4P9EaBknsNWmB8PLQQKHtWeOeI0JDcx8DP57iefo1zi2lLipnxZ7nT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G+7qHzyBhEjMZ0cX5nKyypry7iCgDr1aeTmQxIdu+QbhzCQsb
	VSPgufyj5cT5qt/pXtUWfqwVVmENtvSPSFjS2xcGr8VQSIGRXaWBmpaT
X-Gm-Gg: AZFdTZfJm8VBlltgNfs7EqbvTvkFWWvMeBAbwLuT7hrDqDnjzdFazB0MRSxMTrJQ6sZ
	Ixm7mh8sGN9rBUeBl7gjOdZvuFIV9JszEdayO04Psi7OPp5jZLrbYRMNC7Agxekp2DgkzWyCGsw
	nq3mkueu5OZL1cyVNYUwZaFj8fKmOjvT+sk8uRmbXQ4qa2BkDt7tUAyB537zIH+nA9CSG61+hQB
	NEUgTeTalkyoqOpzgu8jhd1PeEVfg0kg0prE1ly/kCEOedBGSdZN8lGFZfwKmS/goNCLL0y+63m
	4CL5QWozv5suH1rhBsO1qrmJDqttWAJpBztFBLNInyadjdc0anCiTk+vdguYNignNvBiG1kB+Si
	VXTJvZxvXk3KPGZVDk8EkkVGefZ9kX6Pp6TNPoxPR72DYHDjUUl5X55ehcCuaP5igx4DPmvT6BF
	vIpM1mlRDMU4joKAkRj6rnckApz9OSZCcXoSwmxVuzE8cO/F7QnbV9UyNoUo98DWHLMHeMc8X/S
	C6BfffyzwgkbaQLU6cZsxjV3XZT/edavC5jU+N7Dp4qOV9rbS2jvzQvPpELTDFqMl8tSg8JFudv
	wmdJF41amxYpWCAggWz/B10s+yjbLLTkA6JnQi8SNsS3wJ33dGcs2Q3yW2fjfvsIW2JbNK9VCqe
	VEg0ZMvLSdCArJoBgMgSh3L2uYjT/9NHezi2bPftxb5MorOs=
X-Received: by 2002:a05:7300:ec8e:b0:386:a97c:f80d with SMTP id 5a478bee46e88-386ce3a8f03mr1204501eec.27.1795575822378;
        Tue, 24 Nov 2026 19:03:42 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm52243475eec.14.2026.11.24.19.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:03:41 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] thermal: rcar_gen3: release the interrupt handlers from ->remove()
Date: Wed, 25 Nov 2026 11:03:26 +0800
Message-Id: <20261125030327.953450-3-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125030327.953450-1-shunsheng1218@gmail.com>
References: <20261124095110.131258-1-shunsheng1218@gmail.com>
 <20261125030327.953450-1-shunsheng1218@gmail.com>
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

The interrupt handlers are requested before the thermal zones, and
devres releases the managed resources in the reverse order, so the
handlers outlive the zones they report to.  The handler walks every
sensor and calls thermal_zone_device_update() through tsc->zone, which
is not cleared when the zone is unregistered.  Masking the interrupt
sources neither waits for a threaded handler that is already running
nor removes the action.

Release the handlers from ->remove(), which runs before the runtime PM
reference is dropped and before devres unregisters the zones.
free_irq() also waits for a running handler, and after it returns the
handler cannot be invoked again.

Record the interrupt numbers as they are requested, so that a partial
request is undone as well: if the second handler cannot be registered,
the first one is released and the driver falls back to polling, as
before.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4,
CONFIG_ARCH_RENESAS and CONFIG_RCAR_GEN3_THERMAL.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.
---
 drivers/thermal/renesas/rcar_gen3_thermal.c | 38 ++++++++++++++++++---
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index a96f02d4a8ad..37348f4413b6 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -107,6 +107,8 @@ struct rcar_gen3_thermal_priv {
 	struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
 	struct thermal_zone_device_ops ops;
 	unsigned int num_tscs;
+	int irqs[2];
+	unsigned int num_irqs;
 	int ptat[3];
 	int tj_t;
 	const struct rcar_thermal_info *info;
@@ -466,9 +468,25 @@ static const struct of_device_id rcar_gen3_thermal_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);
 
+static void rcar_gen3_thermal_free_irqs(struct device *dev,
+					struct rcar_gen3_thermal_priv *priv)
+{
+	while (priv->num_irqs)
+		devm_free_irq(dev, priv->irqs[--priv->num_irqs], priv);
+}
+
 static void rcar_gen3_thermal_remove(struct platform_device *pdev)
 {
+	struct rcar_gen3_thermal_priv *priv = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	unsigned int i;
+
+	for (i = 0; i < priv->num_tscs; i++) {
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQEN, 0);
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQMSK, 0);
+	}
+
+	rcar_gen3_thermal_free_irqs(dev, priv);
 
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
@@ -491,22 +509,32 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
 
 	for (i = 0; i < 2; i++) {
 		irq = platform_get_irq_optional(pdev, i);
-		if (irq < 0)
-			return irq;
+		if (irq < 0) {
+			ret = irq;
+			goto release;
+		}
 
 		irqname = devm_kasprintf(dev, GFP_KERNEL, "%s:ch%d",
 					 dev_name(dev), i);
-		if (!irqname)
-			return -ENOMEM;
+		if (!irqname) {
+			ret = -ENOMEM;
+			goto release;
+		}
 
 		ret = devm_request_threaded_irq(dev, irq, NULL,
 						rcar_gen3_thermal_irq,
 						IRQF_ONESHOT, irqname, priv);
 		if (ret)
-			return ret;
+			goto release;
+
+		priv->irqs[priv->num_irqs++] = irq;
 	}
 
 	return 0;
+
+release:
+	rcar_gen3_thermal_free_irqs(dev, priv);
+	return ret;
 }
 
 static int rcar_gen3_thermal_probe(struct platform_device *pdev)
-- 
2.34.1

