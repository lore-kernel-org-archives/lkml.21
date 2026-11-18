Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986611;
	b=tJowDV9KaPyyrq/7SloS0gpvur/0CSKHbIhbwdYnyRSXajS4GpRWzfP1dhc6iuRNnOZW
	 xaOSlwvAYZId57CyRR2BZnRUYf+QS5lOPMQUAIeOhoeDmKIcie2LTA3ZIcK+nMiA8ZE14
	 aC7yEoHcQLo4xhMR7YkH06jrVkro3/belrkd1UpOZHeEXvHaIohyZ+MyPn3z2b5PIaa5z
	 svJor+PLqDW4izMrABuMYUBJDatifkrvKkOdbKgz9ySHP+YhQmGcXME5MosuOg5sVKvq5
	 zLGbS1fQzGaeeq6L8NXeqBIjTWgWXmwwkglJ7ZpaLH3MsyoqUzJLixI6MVetUhOG4eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cm9VR5YVqOxWxzzBkTFqVK4i/4UtJXohgo7zinGxSKI=;
	b=IDng/8U7CKG+7m/+XH5/67uqDZzKxPbqROmf4/wXr+t3DZ+JoMcPBJTRWuVh3ldrs7rm
	 N3L12rbtfZzCI+a1QuKskF2EW+JcMuNRmvHHxmcA3PotzVTmtXCCeyYuCTxJ7KOiP4n4u
	 1KYCzCkd7FM2ShpaCFpg6uGNsdkeF7ruFO4GTkoi7KuYteJgSaHuW/aVqUhwLxJ/HP/JT
	 spztewoQh9kf+Nfqmprambnholm7kn7FhikDAOm35MHoE8YyJrJGqHISY8M0hNRO9klM8
	 zadX3zEhHbZGdAiuSUhGCHlp4sduvh5V2s7Fxk0MJF+dIUTq7ihO0T+z9fzG/zS0Gpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EC5fitwc;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3877B606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3877B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EC5fitwc
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1008307eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986610; x=1795591410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cm9VR5YVqOxWxzzBkTFqVK4i/4UtJXohgo7zinGxSKI=;
        b=EC5fitwckd2jC1bvadV37uUn/SOpyyfLBhGFSwJnXSIp2N6odKE/Pv0Fq6K6W7f3pa
         qRTUXraxpqWKCvd62AmH/X+Kc3olKPu0ZzwR6V5w2svI1QUm8StZLwBmxrzdWDpoMfvL
         Azp6K3fZ30GEk6o9hhwyrCzgcPCCN59LOnBP1nLH9+MuvaFHKANCQ0PgA/wji/Eek24u
         XyHh5tHJIkpMduuL/ChPscOdh/iAAQJ7Uc12yWW/H6d3VkbHctEusc+ahhR9CbR9dgcI
         naZTKd3iSSU0i7jcM6GWsNp1BjUD4KvB6S6zF7M/fNlW/dfNSwiVwZb4zhuwtrXZMhd8
         Y9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986610; x=1795591410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cm9VR5YVqOxWxzzBkTFqVK4i/4UtJXohgo7zinGxSKI=;
        b=pGGsMyDF53WipuxXJzbSWZjzlnmqLzfYAtlp2d8w6LLJ/xx/5w1M9YJq16WHDYoolP
         ZDWPE6HusUbk5P6KWLFMSzRr4I+I0dzNLkpjz/s7DNcRo1cEj28gZ1/UlKG20+3HJ+HG
         avCmxQycd21c8J/+WvJHQMn7anE9j0wjyb2Tru6wY4P0I5KKFA3qD+QSQxONuEtsQXAg
         ZzooaxiDb4IFVBVsY0Rok1/IB7Vl/iOIXt+VK+px61aKsUJFp94+P3yva/+OzGATtalj
         0ViwXjKF/dD2v+1sNJgxmwF1HKtm8YrNLKx12ihY+ey5Qwlc7xC1w8fcnpodTL5Gx893
         7pyA==
X-Forwarded-Encrypted: i=1; AL+hErHvAfpet0SSTohNPHkzb4vmWZCvlChNtqjGE2xC2GiMT72qt2wm+nzKPKKuzCxyU2LIkmc2IGFgah0rjIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+h+PpTJe4vtCoW+6W8q67AV8I1Z4IsYE68vxsPYEMCkV3LF5BV
	gpwkwVUWnxnx+7mAJQzUWG39zR4qnXbBwu6/6yOgnO+JBfO7YKi0EJfU
X-Gm-Gg: AZFdTZd55UlQytDVTkmQxGZ/lnUnunmNLmZrBhPxQSqxu6Vkyl/lOofsk9fCq0Mxzuy
	mbBRbs3cGsW5biouKUM5pRV/GDqy+Z0uruG//I/4hF5FnX0fD14H3QukOJWl+EQWwOMmSk3HdmZ
	fO5Y3sx+8sttxzKc7cL0dF9qK32b+1PFI6BM6i/r0bJe7XaXdLJdabNBKx3GyjWv0Iz+YPv+pY7
	EcR5ybUdCKZCyiYCavyRWTNu/ZKFpAPdTv90Vwb7O14LFGCOVp5lCUIbTAdKDY40EAHLzGOVi7c
	6yj/um4TwsNFjk50dh6/SPy/qeK0UmQIuhvZWqDA0pH8Id6PvX1nx/X/sePIk7/w9K417+XRkzB
	SQ0IprBJ/6SA9hbuR5GzJrjbYeVO1njPVeB3vyYxNjkEOID4RBGlNvCk+JkWrz2EznLK5iAIBx2
	capRL2qsecizV0+DdJBmfRzK4v/11KHc5RozLZXHdCHigTxmmU7HYNk2dx9dFM5nf/os7NYmAkj
	OLe4hpa/pb8I6W4jtjpFsWMAAtDLty/c1n4FkSPBo1eXjm8Qij/z2Xufb8XamUCcbZn+BHkkgNj
	wQxMTrmfLSToGw/Vj1s/fnvgCnvYvMgkHmNsMM6kW3i6DY/pVRzRy3rTql1J6C7HXS/BkHBuECf
	ZgsQafQhQmCVp+VTeIa1ue/OFa/uMtndD+qhUCtEV
X-Received: by 2002:a05:7301:228d:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3827d81f0cbmr2115527eec.1.1794986609991;
        Tue, 17 Nov 2026 23:23:29 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm4592661eec.19.2026.11.17.23.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:23:29 -0800 (PST)
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
Subject: [PATCH] thermal/drivers/rcar_thermal: wait for IRQs before cancelling work
Date: Wed, 18 Nov 2026 15:23:21 +0800
Message-Id: <20261118072321.1259639-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

rcar_thermal_remove() masks the interrupt sources and cancels the
delayed work of each sensor.  rcar_thermal_irq() reads INTMSK and STR
under common->lock, drops the lock, and only then walks the sensors and
queues priv->work for every sensor whose status changed.

A handler that sampled the status before the mask was written can
therefore reach queue_delayed_work() after cancel_delayed_work_sync()
has returned.  The work stays pending past the end of ->remove(), devres
then frees common, priv and the thermal zone, and rcar_thermal_work()
runs 300 ms later on freed memory.

Waiting for the handler is not enough on its own: rcar_thermal_work()
calls rcar_thermal_irq_enable() once it has updated the temperature, so
a work that is still running when the removal starts re-enables its
source and undoes the mask that ->remove() has just written.

Record the shutdown in rcar_thermal_common under common->lock and make
_rcar_thermal_irq_ctrl() refuse to enable anything once that state is
visible.  The removal then publishes the shutdown, masks all sources,
waits for the handlers with synchronize_irq() and only then cancels the
work, so neither a source nor a work item can be brought back after it
returns.

Fixes: 697ee786f15d ("thermal: rcar_thermal: Prevent doing work after unbind")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (arm64, gcc 11.4).  No R-Car hardware was
available, so the unbind race was not run.
 drivers/thermal/renesas/rcar_thermal.c | 43 +++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index af6d09a75bb6..1d6ee37968e2 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -39,11 +39,17 @@
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
+	bool shutdown;
+	int irqs[RCAR_THERMAL_MAX_IRQ];
+	int nirqs;
 };
 
 struct rcar_thermal_chip {
@@ -301,6 +307,15 @@ static void _rcar_thermal_irq_ctrl(struct rcar_thermal_priv *priv, int enable)
 
 	spin_lock_irqsave(&common->lock, flags);
 
+	/*
+	 * rcar_thermal_work() re-enables its source when it finishes, so a
+	 * work that was still running when the device went away would undo
+	 * the mask that rcar_thermal_remove() writes.  Once the shutdown
+	 * state is visible nothing may enable the sources again.
+	 */
+	if (common->shutdown)
+		enable = 0;
+
 	rcar_thermal_common_bset(common, INTMSK, mask, enable ? 0 : mask);
 
 	spin_unlock_irqrestore(&common->lock, flags);
@@ -376,9 +391,33 @@ static void rcar_thermal_remove(struct platform_device *pdev)
 	struct rcar_thermal_common *common = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 	struct rcar_thermal_priv *priv;
+	unsigned long flags;
+	int i;
 
-	rcar_thermal_for_each_priv(priv, common) {
+	/*
+	 * Publish the shutdown state before anything else: a work that is
+	 * still running re-enables its interrupt source on its way out, and
+	 * has to be prevented from undoing the mask written below.
+	 */
+	spin_lock_irqsave(&common->lock, flags);
+	common->shutdown = true;
+	spin_unlock_irqrestore(&common->lock, flags);
+
+	/*
+	 * Mask the sources, then wait for a handler that sampled the status
+	 * before the mask was written.  The handler drops common->lock
+	 * before it queues the work, so without the wait it could queue
+	 * priv->work after cancel_delayed_work_sync() has returned and leave
+	 * the work running on a priv that devres frees once ->remove() has
+	 * finished.
+	 */
+	rcar_thermal_for_each_priv(priv, common)
 		rcar_thermal_irq_disable(priv);
+
+	for (i = 0; i < common->nirqs; i++)
+		synchronize_irq(common->irqs[i]);
+
+	rcar_thermal_for_each_priv(priv, common) {
 		cancel_delayed_work_sync(&priv->work);
 		if (priv->chip->use_of_thermal)
 			thermal_remove_hwmon_sysfs(priv->zone);
@@ -449,6 +488,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		if (ret)
 			goto error_unregister;
 
+		common->irqs[common->nirqs++] = irq;
+
 		/* update ENR bits */
 		if (chip->irq_per_ch)
 			enr_bits |= 1 << i;
-- 
2.34.1

