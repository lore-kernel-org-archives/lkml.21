Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486948;
	b=mvyyNnIsbK6QIlf2GfJkTEzc68NxFt7HR5WtlHB3O7vNfwwIHW5fbuEMAokLLGVjemw8
	 E5jET2m2fjXaVqABDy2+V1yPVXgaWF9tZjAkMK4XraKklGtNN5UcsKC22x7sLbLVQqW+K
	 ZsBwIhp0sgI04Xsp7X3h+W6tzOhzGflPzPXqK6wRuDOr1S+cXHw7DBzMD17v0l7xI0osj
	 70gBod8FWbhKI4varYXjoJMCja1lMVoMjsK0IDTAmtM0WHweKkHGK6b4/NJBOa8wQcTo2
	 4HXeLUgi2k1rQ7WuTWXFRklLTkm/2ZSxj4qzVRrSK5i0UgGT5NzCW16txz+fWRAVGiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fChudSS+GMscnTNQH5lusxdbEKIsc2g9AYrb14IcD68=;
	b=YphfVdIehG0KGv2+iMmN40R7jzcK+aLnSBcWGgVjSn2qtHgdsbKoHgPkfcroHtnt3Ovb
	 pF0aWp4GQ3JseEDFqOKS9tXmUqzQfHaPOlgiifOa+iXFEKmU8wIpuBK0gOaC8N44qGqVc
	 apA1f7R2ofisF/Y2uao4dNpYXfePjHpwq8dJEA7IrKbpwhaVU2w1ih8VaolpAXMpumx3N
	 nugnFcpmikp9ew/EtXgrRfFK2UIoHaQ2aCv5TIdrjxe95lY+HVfL9EQnDz0XXzvemFDFE
	 DenY+/+rVE2d6KRMl2pX5VkChCfePP1Re8k0JysRWwGIFTWRhP5kxXVoAo7YUSmG+0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2qOhPiA;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF69B606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF69B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2qOhPiA
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso1784520a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486947; x=1796091747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fChudSS+GMscnTNQH5lusxdbEKIsc2g9AYrb14IcD68=;
        b=s2qOhPiAJaFEQ7mFpB0amw4oRwesRpeagCjJpzjoW6ozdz2ajRiH3kXJD5weg47+3j
         OLelbcYnmzUIPOPAZb6fogmWtIRSDwQDsHVkEZdukSS5wwZSF6/zmgd9NNHURspk8ahB
         bmL7HBa7dFP3/GmAm6baRVHXVX+M05VcTrCJSM/3Zd2YeVNzLbTC6GTVYlddLO5gLnYT
         NSOo2AfFo1n170PoT6/txYrM8SaPi6oB6O2K0w0yljgGeA7FIUG1KskHfLF7bl9ewgBe
         3h3ATIPL7zzkI8LeNIHg/65GlXyeLH7VuIhS6NeIAydIxzGxgMKyVv6M0MoeYffzTV3L
         oDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486947; x=1796091747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fChudSS+GMscnTNQH5lusxdbEKIsc2g9AYrb14IcD68=;
        b=rbh9pLuvgKo9BQNJ7G2DXrMtc6b0fxkdRhrYJBe9NjCsNySVCn/i1830C77VNUcF1t
         1B714IQ4vLKkbpEZsUn6AN4bNy7+wI5fQPcdRtIMWOOU7ezSrjA8MPpzyxuB217Y2j8D
         6NEmTXcrHhTsSDvQw06YWrtTlp1C1oDOOtgiGAhSzDr+7F+3qNwf+AyMecDAX8jE2PXg
         zmkIjbJOM9NnLAEwchHDXv0z7XJM+2zs/mSiHPZUYWxJmpCvkQCMwtMmfOHM+iRx5yUM
         3n/Ikcj9PrxcAKcjewFRF2Tn0lL0jjFl6BXjNnhgAlaklYhbS+GMEG0225ikXJ8d7Xu/
         2M5w==
X-Forwarded-Encrypted: i=1; AL+hErHIzp4nWc6t5//FPbjGqCiMdi4f1fohfVjStBgdNt1o96rZ4isUPURT00lO8yBnp3tfa5i7UygKd9TZvz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s0e1eu7K+T2ejx5SLRYj0nrV3UwhXcDtrenKYDWVITEq7SWFI
	L28hqcD6Y4Kpi7L8jr5EVkPTxntkHJFV+H0ZwEcl/nVgZJ3Xv/4y5les
X-Gm-Gg: AZFdTZc+Im1wu6DPjxZMCFygg9x1zKKEgEQtfYTUrMWolJYezjSIAG8Ar2BTD6vlv4F
	ROcSrGo6nxJVny6uqfvLi07PdOsY9AQo4bW/beJ4jynmce5/beN6WihVN+pbYckV42mQ26PYNCw
	cW6J+KpeXF8P7vaLXot7y3rq+IVII8C4QcomTN8sqrBdMkRFVFGywF4X280qr0hA6fHrZYduI4J
	eszvOH0mVgiyjiga+SiHIAwWSBW1CqESVyUyu4mrMR7wMxY5sXLuuDoeS1sNf185xVSU6KIzF6J
	jLkiM+0ylAc6ZUDpOFmSTyDnVOP5kFMIIVQCdAt1zsPW/4O5GWsakg7IhGhlv2PqrBmhwQl7hqN
	JNSdMakjkn3eehEUW2G9xl4zYgujLQwfTpgAStepY3yByQafgtf7GVsiFiZlEalYk8xES6as+sJ
	eXgpHkIMXnNGq/eLOHYdhxNxoA7WygcZtEhLLWZruNdOnq//9EoUafXR8YOIyjHc4qWzfgt+BeF
	90oxZ1HXTl6EQaqhFz+YI2a4Hg49LbCpvDfxsQBaOTJXK+t0VbrDXKqbkXPVqB3Mw+qHxY78VZ/
	Y5FRiZS4lOLquXbyxu/V/8v+lLS4V2ptXzUWBfov1gPrWOc4SylMrx8thUNpRCrrWOOlUIQMhvA
	wrsochhJQG8pTVyX5s2kwYjqYy/AXTNDliAkWXP1DZbY50QE=
X-Received: by 2002:a17:90b:390b:b0:3ad:eb38:9778 with SMTP id 98e67ed59e1d1-3b41c93e5dfmr11355114a91.48.1795486946762;
        Mon, 23 Nov 2026 18:22:26 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7d36bcsm8210837a91.3.2026.11.23.18.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:22:26 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] thermal/drivers/rcar_thermal: disable the work before masking the interrupt
Date: Tue, 24 Nov 2026 10:22:19 +0800
Message-Id: <20261124022219.1834499-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119022903.1493494-1-shunsheng1218@gmail.com>
References: <20261119022903.1493494-1-shunsheng1218@gmail.com>
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

For the handler itself, synchronize_irq() is not enough on a shared line:
it waits for the invocation that is running, but the line stays registered
and another user of it can take the interrupt again afterwards, which calls
our handler once more - with the sensors and the zone already unregistered.
devm_free_irq() removes the handler from the shared descriptor first and
waits for the invocation that is in progress second, so after it returns
neither a running nor a new invocation can touch the driver state.

Every sensor that the removal walks has been through INIT_DELAYED_WORK()
before it is linked into common->head, so no uninitialised work is touched.

Fixes: 697ee786f15d ("thermal: rcar_thermal: Prevent doing work after unbind")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested: arm64, aarch64-linux-gnu-gcc 11.4, CONFIG_RCAR_THERMAL=y.

The ordering was exercised by a controlled test on a KASAN kernel built from
this tree (x86_64, QEMU/KVM; 17 checks, all passing).  The test uses the real
delayed work, workqueue, wait and signal machinery and a simulated interrupt
line shared by two handlers (irq_sim):

 - a work queued after cancel_delayed_work_sync() has returned is accepted
   and runs; the same queue attempt after disable_delayed_work_sync() is
   rejected and the work never runs;
 - a work that is running when the mask is written re-enables its source
   afterwards, so the mask is undone; disabling the work first and masking
   afterwards leaves the mask in place;
 - after synchronize_irq() returns, another user of the shared line raises
   it again, our handler is invoked and queues the work, which then runs;
   after devm_free_irq() the handler is not invoked again, while the other
   user still receives the line.

The test re-implements this removal ordering rather than compiling the
driver, which would need a real platform device, MMIO and a thermal zone, so
rcar_thermal's own removal path was not executed.  No rcar hardware was
available and no race injection beyond those constructed interleavings was
run.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.

Changes in v3:
 - Reword the RCAR_THERMAL_MAX_IRQ comment without referring to .nirqs.
 - Declare the loop index in the for statement and make it unsigned.
 - Reduce both comments in rcar_thermal_remove() to one line each.
 - Explain in the commit message why a shared line needs devm_free_irq()
   and not synchronize_irq(), and point at the test that exercises it.

Changes in v2:
 - Drop the shutdown flag and the separate IRQ count.  Niklas asked for less
   state, so the removal now disables the delayed work before the source is
   masked and unregisters the shared IRQ instead of waiting for it once.
 - Keep the interrupt numbers in an array whose unused slots stay negative.
---
 drivers/thermal/renesas/rcar_thermal.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index af6d09a75bb6..374c953471e0 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -39,11 +39,15 @@
 /* THSSR */
 #define CTEMP	0x3f
 
+/* Maximum number of interrupts supported by any of the chips */
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
@@ -377,9 +381,22 @@ static void rcar_thermal_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rcar_thermal_priv *priv;
 
-	rcar_thermal_for_each_priv(priv, common) {
+	/* Drain the work before masking the source it can re-enable. */
+	rcar_thermal_for_each_priv(priv, common)
+		disable_delayed_work_sync(&priv->work);
+
+	rcar_thermal_for_each_priv(priv, common)
 		rcar_thermal_irq_disable(priv);
-		cancel_delayed_work_sync(&priv->work);
+
+	/* Unregister shared IRQ handlers before releasing the zones. */
+	for (unsigned int i = 0; i < RCAR_THERMAL_MAX_IRQ; i++) {
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
@@ -413,6 +430,9 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	spin_lock_init(&common->lock);
 	common->dev = dev;
 
+	for (i = 0; i < RCAR_THERMAL_MAX_IRQ; i++)
+		common->irqs[i] = -ENOENT;
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -449,6 +469,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		if (ret)
 			goto error_unregister;
 
+		common->irqs[i] = irq;
+
 		/* update ENR bits */
 		if (chip->irq_per_ch)
 			enr_bits |= 1 << i;
-- 
2.34.1

