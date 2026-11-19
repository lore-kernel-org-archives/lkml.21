Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055355;
	b=rpw6ZX2klZpAD6ifbvGebD8U4SohM58EjuTqDb98DrixH7Gvf4jLdOsDKlQbjKWT1A6b
	 0pylqRbtwEy9aum88kJw9Mkn/pbZxV4Usc9LTSy2+Yvb0e8vlQtMMErUQOcsV4JX/yeiE
	 Xfy7T2YFaCjWYvINE+OIJ/uG9uROaXhzCr6c9OLX8kKiXOsXmPfpUaxokHv9hDdbpWOTI
	 U8W9YRk3qSvBqKBlQFieGIT4R1wFVzvoH2otZuELjrx3NtnsY0pvXTOlrZJ7Hr+Mqd7Wo
	 sj1K7ZI3fXHKugQhT8zp5WRWUl97UWSwiRVz4uU0Q5slDFaZlFpE3Zb6oZf1Gy3AD1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jf4u6WrHRBEz+rPw92oXhHCCYEyYYwuCte9W9COqiwg=;
	b=c7FHtxAyoWyn8q50TbNr5577EQ4+fthre5k/jIDyojR4NhhwqZzrBNRa9uca6JQpheC4
	 HJX/7ADLQH/lRqfQI3KuQZyZ7UZxcUvoPLSQXpOwJNRjVJTUClBXV5/QDmHnPHBNLsYgt
	 E9QCCpG+EtU+OJysP0wPZg5wvGQzTG6mJgNYnVesxRSxfdqML7fT0xQS5Nfy8cDAG2nxX
	 w2U5eAOlZCfj66oXzmVq0a2TLpTVo/92B5WzrPBvagHTluFHfj7t6ad9oVti6qeulKtmH
	 UPJfVXRTeyZ9kKWujokK0UDNxb5AIzUomC1Jl2YR8Vz1CCCuAN25H4oYBL9vOij+HZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDvcu9l4;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E65F606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E65F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDvcu9l4
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1562638c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055351; x=1795660151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf4u6WrHRBEz+rPw92oXhHCCYEyYYwuCte9W9COqiwg=;
        b=IDvcu9l4Ql+lH7/tSPgv9W9HfcOc/IlSoDXSzqw2Ogvz67xObeBNwdANsGavByYeqR
         KLInUZZRA8fvMR5BH+qjegeycnrJnF2idXQf80J85vtVzSf5bv2kUVT0DUS82R6a0W1X
         mIIrlHVvcAOW0086g2Eg2jWaIyh1AY7je2ufJb19IJEkwnGHJ4WoAAZBAqxqO+Q09otm
         FAkm8yJCLPD0sbiGlKOfWcH4JeNqTM3/kP/BdSeg1kAurOcHfPvbfg8vid66HxuGrTUP
         CHFLXd6SuScxyvZTeO17Pu/hf3SVvU+6dOs2cuXvZ9EaBdfIgYPoVlRUYSwEtlhWnOoC
         pwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055351; x=1795660151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf4u6WrHRBEz+rPw92oXhHCCYEyYYwuCte9W9COqiwg=;
        b=G6UEdS8jByP53pCvgxFgolPdt4+KzLUqfqvWNTLWNxTrFggqC/vWGa0ASD9UMEfqcr
         ZRau+So4IKh21llVy4v5sgEjqgjSXD2ck11XTG/HsBW8Jmu2J5QPdOqduTVSssqcqfev
         i/v5WtImXuMEglCdNb6nyHrEVs4+Q2V5Y9qxKRam9qJhPH7G8gPnab9aEmX2vjJ3RIX2
         /OdMu6jqK8c5y8phX9yv3qKpUM0ry72DRULf9nfZDRkDr1kxnQmDM0HI+ChTY7Ts3h0D
         2DaZFB+JT2B0TX1w1y2lhGBUX6l5MinqqBjxqtP7+7A2pHq75pL8OlJt78slMslq3l74
         zueg==
X-Forwarded-Encrypted: i=1; AL+hErGbuIvsNkZMVm7L0CIzxil2OLl5dF8d04vPLhCiWWu7CowkMf7DxXrn5PlWDsK/6UPDLRrqH5Eibc+S5Fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EVrc/Innd/J2ACsJW/rZMC6KWb915c/8rXxNMsrlYhLKedqNR
	9a4JwMqIntcb09HvsxsV15qotEdqoqlYUvZ2S43RjETYAi2GSBmQ3XJN
X-Gm-Gg: AYBFou3quY2tj7TZJaqAEjZf118sl11i3mJPc2NxPR5II6CtcIT83cF2aVM2M8unzF/
	APX/PZj9BLMPVLGLD6uew0JkzwPEXybiumdY8+xIzOFftmqFO/vb+WGW0owTHSLR5ZXIgiAJ5P/
	bTntzmCSc6ri0cT4x79jnRrDqCYmxVtOl4y9o4d/+LmMnDos6f8D7w9A81j8SmcQeFRxACLz1uS
	w6jmONnLEvJeQox1U0qF5btYPHspjWUWoII3un5kbqDyEq6XwXphi+C6XFqpwLFPFBWETBVEb1E
	h7YLQKJuZfz4uwNMPYuCoy2jQgz/kwQoXUGEWi9bgG81xaxWIoJzrsmyTrSjsVkYNS8Jdmx+/bB
	/TED8Oy6dTzsgsVPonMhrlH9mqonth8jnlA7V5nM5u6KvWQe5j6L3bX47LlqIRXXCMLn1THUmAo
	NJezsHtvEHWXzCG6ZitnrupMSz/lGtzapQ1kng7suChm/nd8DBheZl/M9qlOQFvQ4Tf8s7QBg6g
	f4oDvkA4HzbR2S9ANwNSe1kPHq8eLmHmsQqci2iZ+leQqzArRryjyK/I+HJKCtut3zne64Q6IVe
	z5Tol3SRj8TX1+avBQTcnR/MjTKUlGMnZCea3lxmQfFjoTl0CqnEtiGRhhXkJ25Epv0XRiMqquI
	wMgM286WgBTFmnuYzRQHztzSOCH7pdfIN/cvV5nkw
X-Received: by 2002:a05:7022:1708:b0:1b2:4b42:1870 with SMTP id a92af1059eb24-1b543cff066mr3748180c88.31.1795055351102;
        Wed, 18 Nov 2026 18:29:11 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b549e398e4sm5790186c88.15.2026.11.18.18.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:29:10 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	edubezval@gmail.com
Subject: [PATCH v2] thermal/drivers/rcar_thermal: disable the work before masking the interrupt
Date: Thu, 19 Nov 2026 10:29:03 +0800
Message-Id: <20261119022903.1493494-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118072321.1259639-1-shunsheng1218@gmail.com>
References: <20261118072321.1259639-1-shunsheng1218@gmail.com>
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

rcar_thermal_remove() masks the interrupt sources and then cancels the
delayed work of each sensor.  rcar_thermal_irq() drops common->lock before
it walks the sensors and queues priv->work for those whose status changed,
so a handler that read the status before the mask was written can still
queue the work after cancel_delayed_work_sync() has returned.  The work
then runs after ->remove() has finished and devres has freed common, priv
and the thermal zone.

Waiting for the handler alone is not enough either: rcar_thermal_work()
re-enables its interrupt source once it has updated the temperature, so a
work that is still running when the removal starts undoes the mask that
->remove() has just written.

Disable the work before the source is masked.  That makes the
queue_delayed_work() calls in rcar_thermal_irq() no-ops and guarantees
that the re-enable in rcar_thermal_work() has already happened, so the
mask that follows cannot be undone.

The interrupt line is shared, so waiting for the handler once does not keep
it from running again later; unregister it in ->remove() instead of only
calling synchronize_irq().  devm_free_irq() waits for a handler that is
running right now as well, and the slot is marked unused so that the probe
failure path, which also ends here, cannot release it twice.

Every sensor that the removal walks has been through INIT_DELAYED_WORK()
before it is linked into common->head, so no uninitialised work is touched.
The interrupt numbers are recorded in an array whose unused slots stay
negative, instead of being counted separately.

Fixes: 697ee786f15d ("thermal: rcar_thermal: Prevent doing work after unbind")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4, CONFIG_RCAR_THERMAL=y.
No hardware was available, so the removal path was not exercised and no race
injection was run.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.

Changes in v2:
 - Drop the shutdown flag and the separate IRQ count.  Niklas asked for less
   state, so the removal now disables the delayed work before the source is
   masked and unregisters the shared IRQ instead of waiting for it once.
 - Keep the interrupt numbers in an array whose unused slots stay negative.
---
 drivers/thermal/renesas/rcar_thermal.c | 37 ++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index af6d09a75bb6..3310ed4a8bda 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -39,11 +39,15 @@
 /* THSSR */
 #define CTEMP	0x3f
 
+/* .nirqs of every supported chip is at most this */
+#define RCAR_THERMAL_MAX_IRQ	2
+
 struct rcar_thermal_common {
 	void __iomem *base;
 	struct device *dev;
 	struct list_head head;
 	spinlock_t lock;
+	int irqs[RCAR_THERMAL_MAX_IRQ];
 };
 
 struct rcar_thermal_chip {
@@ -376,10 +380,34 @@ static void rcar_thermal_remove(struct platform_device *pdev)
 	struct rcar_thermal_common *common = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 	struct rcar_thermal_priv *priv;
+	int i;
 
-	rcar_thermal_for_each_priv(priv, common) {
+	/*
+	 * Stop the work from being queued again and wait for a running one to
+	 * finish before the interrupt source is masked: rcar_thermal_work()
+	 * re-enables its source when it is done, so it has to be gone before
+	 * the source is disabled for good.
+	 */
+	rcar_thermal_for_each_priv(priv, common)
+		disable_delayed_work_sync(&priv->work);
+
+	rcar_thermal_for_each_priv(priv, common)
 		rcar_thermal_irq_disable(priv);
-		cancel_delayed_work_sync(&priv->work);
+
+	/*
+	 * The handler is shared, so waiting for it once is not enough: another
+	 * user of the line can invoke it again after that, when the zones and
+	 * the sensors it walks are already gone.  Unregister it here; that
+	 * waits for a handler that is running right now as well.
+	 */
+	for (i = 0; i < RCAR_THERMAL_MAX_IRQ; i++) {
+		if (common->irqs[i] < 0)
+			continue;
+		devm_free_irq(dev, common->irqs[i], common);
+		common->irqs[i] = -ENOENT;
+	}
+
+	rcar_thermal_for_each_priv(priv, common) {
 		if (priv->chip->use_of_thermal)
 			thermal_remove_hwmon_sysfs(priv->zone);
 		else
@@ -413,6 +441,9 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	spin_lock_init(&common->lock);
 	common->dev = dev;
 
+	for (i = 0; i < RCAR_THERMAL_MAX_IRQ; i++)
+		common->irqs[i] = -ENOENT;
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -449,6 +480,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		if (ret)
 			goto error_unregister;
 
+		common->irqs[i] = irq;
+
 		/* update ENR bits */
 		if (chip->irq_per_ch)
 			enr_bits |= 1 << i;
-- 
2.34.1

