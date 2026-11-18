Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997180;
	b=Mvcw3lTsH8Llv3PZFQfETllQWoxdhMio2D04yOqR2vCfkDcsf39t7l249EGQLRRF7JDF
	 p1VueoHyi4qmJPiN/kx0OfQaU4aieZuNsg2p02Nt8bI7zBLaNdqB8bGwH3zoLkFlNuhIx
	 YWkipwYTl1QsD3pbBkjFduB6xpCOhV58TqUuzFLYJ+RRzLtBZt2sBX5L6uCR3X3NnhrpR
	 ZbFd6jjWr7cyTXXH/Vv4znMEO4xGcoPRnf0zCcWvQDsnrzShLlz3GV1YcLJgArG9syqZR
	 WgaDkaVpB3MCDn/SycxjlMI1d3d/EjnZxx1mYtSS5Wl4GFQT7LdIdGUywypKzfrtPPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aIQPF6ydugV2EGXv5JJhtxIj0diRuKvsDMJ8C4tUohY=;
	b=FGZMItk9usxd6mYTO0VtGWY6ttsomRGRfDK6js2/1XZ4hEZEdjKdDhFnn05K0A2Rs0ZF
	 Ty85/SToz5WReaDIJJ/YnQzEUU+es05FIZv9E70SQLXAJoiI6mKW6I8ricRkK7Fcl8Qe5
	 mF07mwEuCsvQwk9butN9EO0F2Doy/ZCaxKFydb8Y3iP6tLXUwtHbVervQ8I4IEdAcezYd
	 mZ3/Erd2yNsLtk0NLPmf6ppJGJseAg7EboNbHrdwAE7T+k2a6DkiT3PQfVLV+xT2qE0vW
	 A5afHgV7Ke8CmoZ6ikzv6EtorduzQZIL6Y4Q+yyfH0qgnQbdfZ2pJJVqUmNRr4zidFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kGuSBzQP;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7DD606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F7DD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kGuSBzQP
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a079256596so725272b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794997179; x=1795601979; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIQPF6ydugV2EGXv5JJhtxIj0diRuKvsDMJ8C4tUohY=;
        b=kGuSBzQPqR73UQ+SGKRjOX8oLuG9EwlBHQKV3g/DHqgxGEVHyZe/3ykcj7rzU0X0A4
         boNxg91EUULSLh50irY1L+CuXQXukUWrppioiaSh/Ien7bCXwdYNa7QZW1u6ox2iKnDf
         gfdylC0bzajYQF4uaufCQcVl66sKKt0tFYLIBpN9Ne0UiVqFDXXTO4VmeQCyVTT3+joS
         fxVMul2295AjOiXonOrvQX6ku5HI631yzDCKBAXc5uvAtDOxkYmj+KqqlL02kUuVTT0f
         nHvLxMbdNfhuYC9OIGng2L7S76T628NcsmrysB6Ge8ZsdY4k3P5+xVuIHxNiRtS0QX+C
         //kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997179; x=1795601979;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIQPF6ydugV2EGXv5JJhtxIj0diRuKvsDMJ8C4tUohY=;
        b=EtvC/tgpyfft87+sflsTFKCJQiEYDqFYUv1MApWj5iFgi1MNx9wBkINYuWZ6LbbJ6S
         tqUiFQ2efNNc77vgvMFTX7/FIDhjd7pbsZeI+wORrbQrRXhIfK5qlgmmgeCo0rqqUEPQ
         pf6KBJFAh7jzxbSIDQdFCefdbY+yu9a271s88ZE/gR4owmiGv9tRxbXQM/PuP3Z0va6j
         FJ1A0WGDYwoW9wqiHYTgZI/AcmL075HPac7SqU82D7jqbQxkBybvx6hhfZCuQR8Hm3N/
         VPIYXx/CmumjZ5WeE6jdofacTcTH4DDcriP31EgSZU3iw/xKndvSxEDwVRjgia692/3p
         pZYw==
X-Forwarded-Encrypted: i=1; AL+hErF8QIT/EFfmKRXdPMMhthU2Srv7gtDp0DZzl7N65tW6T73nL/KFoT9cNnaHkM/alIWSeBvXtE0jJclQJq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pTNz+zdyJy2m8HFEkzZbu6uX8oKXIahDTucKaOA0X2DBTSv4X
	OLqo3gfXAbQG6zeMdVK/O/ROL6nzDi7R4rYcFdkL1kN37V1BsxXoey0YIpS5O9snroKteci0rDz
	S9zPhI30dUwbv19x+73vctCvgcw==
X-Received: from pffm11-n1.prod.google.com ([2002:a05:6a00:c30b:10b0:8c5:614:d2c8])
 (user=amitamishra job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:f08:b0:899:465d:c8ef with SMTP id d2e1a72fcca58-8c5d268fcfamr1976341b3a.14.1794997178562;
 Wed, 18 Nov 2026 02:19:38 -0800 (PST)
Date: Wed, 18 Nov 2026 10:19:13 +0000
In-Reply-To: <20261118101913.3135869-1-amitamishra@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118101913.3135869-1-amitamishra@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118101913.3135869-3-amitamishra@google.com>
Subject: [PATCH 2/2] perf/smmuv3: Add runtime PM support
From: Amita Mishra <amitamishra@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	amitamishra@google.com
Content-Type: text/plain; charset="UTF-8"

On SoCs where an SMMUv3 PMCG resides in a switchable power domain,
probing the PMCG attaches and powers on the domain, but without runtime
PM support the domain remains permanently powered on even when no perf
events are active.

Add runtime PM support for PMCG devices attached to a PM domain:
- Enable runtime PM while holding a reference before setting up the IRQ
  and registering the PMU, then drop the reference once probe completes
  so an idle PMCG can suspend.
- Resume and hold a runtime PM reference in smmu_pmu_event_init() for
  each active event and release it in event->destroy().
- Register runtime PM callbacks to disable the PMU on suspend and reset
  it on resume.
- Guard smmu_pmu_enable(), smmu_pmu_disable(), and smmu_pmu_handle_irq()
  with smmu_pmu_in_use() because perf_ctx_enable()/perf_ctx_disable()
  and shared or late IRQs can still run after the last event is removed
  and the PMCG is powered off. Keep unconditional register disable in
  __smmu_pmu_disable() for reset, runtime suspend, and active shutdown.

Signed-off-by: Amita Mishra <amitamishra@google.com>
---
 drivers/perf/arm_smmuv3_pmu.c | 134 +++++++++++++++++++++++++++++-----
 1 file changed, 115 insertions(+), 19 deletions(-)

diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 97440b6233c6..e9da99b4a086 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -50,6 +50,7 @@
 #include <linux/of.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/smp.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
@@ -151,15 +152,33 @@ SMMU_PMU_EVENT_ATTR_EXTRACTOR(filter_stream_id, config1, 0, 31);
 SMMU_PMU_EVENT_ATTR_EXTRACTOR(filter_span, config1, 32, 32);
 SMMU_PMU_EVENT_ATTR_EXTRACTOR(filter_enable, config1, 33, 33);
 
-static inline void smmu_pmu_enable(struct pmu *pmu)
+static inline void __smmu_pmu_enable(struct smmu_pmu *smmu_pmu)
 {
-	struct smmu_pmu *smmu_pmu = to_smmu_pmu(pmu);
-
 	writel(SMMU_PMCG_IRQ_CTRL_IRQEN,
 	       smmu_pmu->reg_base + SMMU_PMCG_IRQ_CTRL);
 	writel(SMMU_PMCG_CR_ENABLE, smmu_pmu->reg_base + SMMU_PMCG_CR);
 }
 
+/*
+ * perf keeps calling ->pmu_enable()/->pmu_disable() for a PMU in a CPU context
+ * after its last event there is gone, and a shared or late interrupt can call
+ * the IRQ handler. Without counters in use, no event holds a runtime PM
+ * reference and the PMCG may be powered off, so its registers must not be
+ * touched. used_counters only changes in ->add()/->del() on the event's CPU.
+ */
+static inline bool smmu_pmu_in_use(struct smmu_pmu *smmu_pmu)
+{
+	return !bitmap_empty(smmu_pmu->used_counters, smmu_pmu->num_counters);
+}
+
+static inline void smmu_pmu_enable(struct pmu *pmu)
+{
+	struct smmu_pmu *smmu_pmu = to_smmu_pmu(pmu);
+
+	if (smmu_pmu_in_use(smmu_pmu))
+		__smmu_pmu_enable(smmu_pmu);
+}
+
 static int smmu_pmu_apply_event_filter(struct smmu_pmu *smmu_pmu,
 				       struct perf_event *event, int idx);
 
@@ -174,12 +193,18 @@ static inline void smmu_pmu_enable_quirk_hip08_09(struct pmu *pmu)
 	smmu_pmu_enable(pmu);
 }
 
+static inline void __smmu_pmu_disable(struct smmu_pmu *smmu_pmu)
+{
+	writel(0, smmu_pmu->reg_base + SMMU_PMCG_CR);
+	writel(0, smmu_pmu->reg_base + SMMU_PMCG_IRQ_CTRL);
+}
+
 static inline void smmu_pmu_disable(struct pmu *pmu)
 {
 	struct smmu_pmu *smmu_pmu = to_smmu_pmu(pmu);
 
-	writel(0, smmu_pmu->reg_base + SMMU_PMCG_CR);
-	writel(0, smmu_pmu->reg_base + SMMU_PMCG_IRQ_CTRL);
+	if (smmu_pmu_in_use(smmu_pmu))
+		__smmu_pmu_disable(smmu_pmu);
 }
 
 static inline void smmu_pmu_disable_quirk_hip08_09(struct pmu *pmu)
@@ -392,6 +417,14 @@ static bool smmu_pmu_events_compatible(struct perf_event *curr,
  * the core perf events code.
  */
 
+static void smmu_pmu_event_destroy(struct perf_event *event)
+{
+	struct smmu_pmu *smmu_pmu = to_smmu_pmu(event->pmu);
+
+	/* Only set when smmu_pmu_event_init() took a reference. */
+	pm_runtime_put(smmu_pmu->dev);
+}
+
 static int smmu_pmu_event_init(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
@@ -439,18 +472,26 @@ static int smmu_pmu_event_init(struct perf_event *event)
 
 	hwc->idx = -1;
 
-	if (event->group_leader == event)
-		return 0;
+	if (event->group_leader != event) {
+		for_each_sibling_event(sibling, event->group_leader) {
+			if (is_software_event(sibling))
+				continue;
 
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (is_software_event(sibling))
-			continue;
+			if (!smmu_pmu_events_compatible(sibling, event))
+				return -EINVAL;
 
-		if (!smmu_pmu_events_compatible(sibling, event))
-			return -EINVAL;
+			if (++group_num_events > smmu_pmu->num_counters)
+				return -EINVAL;
+		}
+	}
 
-		if (++group_num_events > smmu_pmu->num_counters)
-			return -EINVAL;
+	/* The same condition smmu_pmu_probe() enables runtime PM on. */
+	if (dev->pm_domain) {
+		int ret = pm_runtime_resume_and_get(dev);
+
+		if (ret < 0)
+			return ret;
+		event->destroy = smmu_pmu_event_destroy;
 	}
 
 	return 0;
@@ -692,6 +733,9 @@ static irqreturn_t smmu_pmu_handle_irq(int irq_num, void *data)
 	u64 ovsr;
 	unsigned int idx;
 
+	if (!smmu_pmu_in_use(smmu_pmu))
+		return IRQ_NONE;
+
 	ovsr = readq(smmu_pmu->reloc_base + SMMU_PMCG_OVSSET0);
 	if (!ovsr)
 		return IRQ_NONE;
@@ -779,7 +823,7 @@ static void smmu_pmu_reset(struct smmu_pmu *smmu_pmu)
 {
 	u64 counter_present_mask = GENMASK_ULL(smmu_pmu->num_counters - 1, 0);
 
-	smmu_pmu_disable(&smmu_pmu->pmu);
+	__smmu_pmu_disable(smmu_pmu);
 
 	/* Disable counter and interrupt */
 	writeq_relaxed(counter_present_mask,
@@ -910,10 +954,21 @@ static int smmu_pmu_probe(struct platform_device *pdev)
 
 	smmu_pmu_reset(smmu_pmu);
 
+	/*
+	 * Runtime PM must be enabled before the IRQ handler and the PMU go
+	 * live: from then on ->event_init() takes a reference for each event.
+	 * Hold one until probe is done.
+	 */
+	if (dev->pm_domain) {
+		pm_runtime_get_noresume(dev);
+		pm_runtime_set_active(dev);
+		pm_runtime_enable(dev);
+	}
+
 	err = smmu_pmu_setup_irq(smmu_pmu);
 	if (err) {
 		dev_err(dev, "Setup irq failed, PMU @%pa\n", &res_0->start);
-		return err;
+		goto out_rpm;
 	}
 
 	smmu_pmu_get_iidr(smmu_pmu);
@@ -922,7 +977,8 @@ static int smmu_pmu_probe(struct platform_device *pdev)
 			      (res_0->start) >> SMMU_PMCG_PA_SHIFT);
 	if (!name) {
 		dev_err(dev, "Create name failed, PMU @%pa\n", &res_0->start);
-		return -EINVAL;
+		err = -EINVAL;
+		goto out_rpm;
 	}
 
 	if (!dev->of_node)
@@ -947,7 +1003,7 @@ static int smmu_pmu_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(dev, "Error %d registering hotplug, PMU @%pa\n",
 			err, &res_0->start);
-		return err;
+		goto out_rpm;
 	}
 
 	err = perf_pmu_register(&smmu_pmu->pmu, name, -1);
@@ -962,10 +1018,19 @@ static int smmu_pmu_probe(struct platform_device *pdev)
 		 smmu_pmu->global_filter ? "Global(Counter0)" :
 		 "Individual");
 
+	if (dev->pm_domain)
+		pm_runtime_put_sync(dev);
+
 	return 0;
 
 out_unregister:
 	cpuhp_state_remove_instance_nocalls(cpuhp_state_num, &smmu_pmu->node);
+out_rpm:
+	if (dev->pm_domain) {
+		pm_runtime_disable(dev);
+		pm_runtime_set_suspended(dev);
+		pm_runtime_put_noidle(dev);
+	}
 	return err;
 }
 
@@ -975,15 +1040,45 @@ static void smmu_pmu_remove(struct platform_device *pdev)
 
 	perf_pmu_unregister(&smmu_pmu->pmu);
 	cpuhp_state_remove_instance_nocalls(cpuhp_state_num, &smmu_pmu->node);
+	if (pdev->dev.pm_domain)
+		pm_runtime_disable(&pdev->dev);
 }
 
 static void smmu_pmu_shutdown(struct platform_device *pdev)
 {
 	struct smmu_pmu *smmu_pmu = platform_get_drvdata(pdev);
 
-	smmu_pmu_disable(&smmu_pmu->pmu);
+	if (pdev->dev.pm_domain) {
+		if (pm_runtime_get_if_active(&pdev->dev) <= 0)
+			return;
+		__smmu_pmu_disable(smmu_pmu);
+		pm_runtime_put(&pdev->dev);
+		return;
+	}
+
+	__smmu_pmu_disable(smmu_pmu);
+}
+
+static int smmu_pmu_runtime_suspend(struct device *dev)
+{
+	struct smmu_pmu *smmu_pmu = dev_get_drvdata(dev);
+
+	__smmu_pmu_disable(smmu_pmu);
+	return 0;
 }
 
+static int smmu_pmu_runtime_resume(struct device *dev)
+{
+	struct smmu_pmu *smmu_pmu = dev_get_drvdata(dev);
+
+	smmu_pmu_reset(smmu_pmu);
+	return 0;
+}
+
+static const struct dev_pm_ops smmu_pmu_pm_ops = {
+	RUNTIME_PM_OPS(smmu_pmu_runtime_suspend, smmu_pmu_runtime_resume, NULL)
+};
+
 #ifdef CONFIG_OF
 static const struct of_device_id smmu_pmu_of_match[] = {
 	{ .compatible = "arm,smmu-v3-pmcg" },
@@ -996,6 +1091,7 @@ static struct platform_driver smmu_pmu_driver = {
 	.driver = {
 		.name = "arm-smmu-v3-pmcg",
 		.of_match_table = of_match_ptr(smmu_pmu_of_match),
+		.pm = pm_ptr(&smmu_pmu_pm_ops),
 		.suppress_bind_attrs = true,
 	},
 	.probe = smmu_pmu_probe,
-- 
2.56.1.703.gf848ed807c-goog

