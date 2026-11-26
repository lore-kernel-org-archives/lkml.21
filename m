Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.88.81.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658451;
	b=CK2Vc9XMMFobFiKGNdeusFIgO/vXFxj+QDQnDfnb1bQPZCe6Lq0SGYWBI5LXluWO+mrD
	 /Ei6HcO4QdVUoYwg9i/F82YPY/TlZKmdnZhcpUoCbKRgv0FfhQwgaGLVEa7ua8yRzfJ/Z
	 3qfX1mYLDC2FfaxR0nhZLgW9XZ9WG31uOMuZYCdO35i9vjNvixO7xnFnTROFhyYBePRzW
	 Tpb1NHG65y5znTLfZiJhzDMdh21BSmLw39H9ERzpLJ68QrxZ1dmBcE8R16xEbyVIotQNC
	 XlvRBDaEK10KGM9NK2T5DlKUKhfZqKsVruyTJKEhEu5T3CeqWxMjrEu/QyfM5QUOxuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658451;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=dS0nJV7B8FO6nX2XpNE4aq6Htc0TIZReUXjnZBfhFOw=;
	b=BeWcJNyKLmvNIOoy1pniUDujy7hbYzwlS2uJDXq8eWA0r2jkDjdCcmBXPevBzJ7KoeMj
	 PqxXqvPmgzu/Uo09a7ZRlPOmtazvQALD8oorkUkcKLajsRJItFVjbcQMaU+QYj28z4OVa
	 Bmre7u5dpYuEkVn8Ypl8JW9EIMBUk2NZQ6GNrSGOM+RcUDBO4NSfP8k2bfmgptMb2zXVj
	 yXUdnpQK+bc4h1MchAL3AacEGf3M4DoNsx5MYwAU5h28Wf4LKRQLnCm7SrBbxNGf4lmQw
	 Gz2kZ5nk4WS2PmjQJ4drg9yEv0ESJZ7otUR7F0sUBfpWTuqrY97DHrbHQUHyu15fXog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hj-micro.com;
	spf=pass smtp.mailfrom=hj-micro.com;
	dkim=pass header.d=hj-micro.com header.i=@hj-micro.com header.a=rsa-sha256 header.s=default header.b=ZDa1gb98;
	arc=none smtp.remote-ip=47.88.81.169
Received: from mail-m81169.netease.com (mail-m81169.netease.com [47.88.81.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3385606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3385606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hj-micro.com header.i=@hj-micro.com header.a=rsa-sha256 header.s=default header.b=ZDa1gb98
Received: from 1clarkelill.hj-micro.com (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5608fe53a;
	Thu, 26 Nov 2026 10:00:43 +0800 (GMT+08:00)
From: clarke.li@hj-micro.com
To: james.morse@arm.com,
	ben.horgan@arm.com,
	andre.przywara@arm.com
Cc: reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	srivathsa.rao@oss.qualcomm.com,
	jonathan.cameron@oss.qualcomm.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] arm_mpam: Share error IRQ actions among MSCs
Date: Thu, 26 Nov 2026 10:00:29 +0800
Message-ID: <20261126020029.686144-1-clarke.li@hj-micro.com>
X-Mailer: git-send-email 2.55.0
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
X-HM-Tid: 0aa215956b6f09d6kunmb3e276a1b696e7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTB9CVkMYT0NCH0pPHkNLHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=ZDa1gb98nPE6AbzC4xtnLskdPa0XgqnBEnRvmOqXb8z2ykbRhx2/DnI6TbY92yV2lpiCuhw7BG9u1T+Nygky+77z7MGvivOHGNKuVwJqQ3WOKohTefZfdz61fwc8RHb+wVjvpL2L1m5taKyHS0odRGm68/pVcXi6qhV2bPW6Ohw=; c=relaxed/relaxed; s=default; d=hj-micro.com; v=1;
	bh=dS0nJV7B8FO6nX2XpNE4aq6Htc0TIZReUXjnZBfhFOw=;
	h=date:mime-version:subject:message-id:from;

From: Hongnan Li <clarke.li@hj-micro.com>

On our arm64 platform, 128 L3 cache MSCs share one error interrupt. The
MPAM driver registers an IRQF_SHARED | IRQF_ONESHOT action for each MSC.
On this 64-bit system the IRQ core has 64 ONESHOT thread-mask bits per
IRQ, so registering the 65th MSC fails with -EBUSY and MPAM does not
initialize:

  mpam_msc.195: error -EBUSY: request_irq(58) ...
  mpam_enable_once: Failed to register irqs: -16
  mpam_disable: MPAM disabled due to Failed to enable.

MSC 195 is the device identifier in the log; it was the 65th MSC
requesting this shared IRQ.

Register one action per shared Linux IRQ and dispatch it across the MSCs
protected by the existing SRCU list. Process MMIO MSCs in the hard
handler and firmware-backed MSCs in the thread. Preserve the ONESHOT
masking required by firmware accesses and release the shared actions
after disabling the MSC interrupt sources.

On the test platform, running a kernel based on Linux 7.4-rc4, MPAM
initialized and /proc/interrupts showed one MPAM action for the IRQ
shared by 128 MSCs. Basic resctrl L3 allocation and occupancy monitoring
also worked.

An error was injected into one of the MSCs sharing that IRQ. The driver
reported the expected MSC and error, disabled MPAM, and released the
shared IRQ actions. No IRQ storm or kernel warning was observed in this
test. Error-path testing has so far covered one MMIO MSC; firmware-backed
MSCs and all teardown scenarios have not yet been tested.


Fixes: 453654684a0d ("arm_mpam: change MPAM-Fb error IRQ to use a threaded IRQ handler")
Signed-off-by: Hongnan Li <clarke.li@hj-micro.com>
---
We could not find a limit on the number of MSCs sharing an interrupt in
either the MPAM MSC specification or the MPAM ACPI specification.

Should the driver support platforms where more than 64 MSCs share an
interrupt? If so, does grouping the MSCs under one IRQ action look like
a reasonable approach?

 drivers/resctrl/mpam_devices.c  | 125 +++++++++++++++++++++++++-------
 drivers/resctrl/mpam_internal.h |   1 +
 2 files changed, 100 insertions(+), 26 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 27abf60f4d67..e0f14f33868e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2959,49 +2959,124 @@ static irqreturn_t mpam_ppi_handler(int irq, void *dev_id)
 	return __mpam_irq_handler(irq, msc);
 }

+/* One action per shared Linux IRQ, regardless of the number of MSCs. */
+struct mpam_shared_irq {
+	struct list_head list;
+	int irq;
+	bool requested;
+	bool has_fb;
+	atomic_t hard_handled;
+};
+
+static LIST_HEAD(mpam_shared_irqs);
+
 /*
- * MMIO based MSC accesses must run in non-preemptible context, as they
- * might have affinity requirements to check.
- * MPAM-Fb based MSC accesses must NOT run in hard-IRQ context, as they
- * can sleep.
- * So split the IRQ handling up, depending on the MSC access type.
+ * The MSC list is protected by SRCU, including during device removal.
+ * MMIO accesses must run in hard IRQ context for the CPU affinity check;
+ * firmware accesses must run in the thread because they can sleep.
  */
 static irqreturn_t mpam_shared_hard_irq(int irq, void *dev_id)
 {
-	struct mpam_msc *msc = dev_id;
+	struct mpam_shared_irq *shared = dev_id;
+	struct mpam_msc *msc;
+	irqreturn_t ret = IRQ_NONE;
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (msc->error_shared_irq != irq || msc->iface != MPAM_IFACE_MMIO)
+			continue;
+		if (__mpam_irq_handler(irq, msc) == IRQ_HANDLED)
+			ret = IRQ_HANDLED;
+	}

-	if (msc->iface == MPAM_IFACE_MMIO)
-		return __mpam_irq_handler(irq, msc);
+	if (!shared->has_fb)
+		return ret;

+	/* Preserve hard IRQ handling for the threaded spurious-IRQ accounting. */
+	if (ret == IRQ_HANDLED)
+		atomic_set(&shared->hard_handled, 1);
 	return IRQ_WAKE_THREAD;
 }

 static irqreturn_t mpam_shared_thread_irq(int irq, void *dev_id)
 {
-	struct mpam_msc *msc = dev_id;
+	struct mpam_shared_irq *shared = dev_id;
+	struct mpam_msc *msc;
+	irqreturn_t ret = IRQ_RETVAL(atomic_xchg(&shared->hard_handled, 0));

-	if (msc->iface == MPAM_IFACE_MMIO)
-		return IRQ_HANDLED;
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (msc->error_shared_irq != irq || msc->iface == MPAM_IFACE_MMIO)
+			continue;
+		if (__mpam_irq_handler(irq, msc) == IRQ_HANDLED)
+			ret = IRQ_HANDLED;
+	}

-	return __mpam_irq_handler(irq, msc);
+	return ret;
+}
+
+static int mpam_add_shared_irq(struct mpam_msc *msc, int irq)
+{
+	struct mpam_shared_irq *shared;
+
+	list_for_each_entry(shared, &mpam_shared_irqs, list) {
+		if (shared->irq == irq)
+			goto found;
+	}
+
+	shared = kzalloc_obj(*shared);
+	if (!shared)
+		return -ENOMEM;
+	shared->irq = irq;
+	list_add_tail(&shared->list, &mpam_shared_irqs);
+
+found:
+	msc->error_shared_irq = irq;
+	if (msc->iface != MPAM_IFACE_MMIO)
+		shared->has_fb = true;
+	return 0;
 }

 static int mpam_register_irqs(void)
 {
-	int err, irq;
+	struct mpam_shared_irq *shared;
 	struct mpam_msc *msc;
+	int err, irq;

 	lockdep_assert_cpus_held();
+	lockdep_assert_held(&mpam_list_lock);

 	guard(srcu)(&mpam_srcu);
+	/* Complete every group before any shared IRQ can invoke its handler. */
+	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		irq = platform_get_irq_byname_optional(msc->pdev, "error");
+		if (irq <= 0 || irq_is_percpu(irq))
+			continue;
+		err = mpam_add_shared_irq(msc, irq);
+		if (err)
+			return err;
+	}
+
+	list_for_each_entry(shared, &mpam_shared_irqs, list) {
+		err = request_threaded_irq(shared->irq, mpam_shared_hard_irq,
+					   mpam_shared_thread_irq,
+					   IRQF_SHARED | IRQF_ONESHOT,
+					   "mpam:msc:error", shared);
+		if (err)
+			return err;
+		shared->requested = true;
+	}
+
 	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
 				 srcu_read_lock_held(&mpam_srcu)) {
 		irq = platform_get_irq_byname_optional(msc->pdev, "error");
 		if (irq <= 0)
 			continue;

-		/* The MPAM spec says the interrupt can be SPI, PPI or LPI */
-		/* We anticipate sharing the interrupt with other MSCs */
+		/* The MPAM spec says the interrupt can be SPI, PPI or LPI. */
 		if (irq_is_percpu(irq)) {
 			if (msc->iface != MPAM_IFACE_MMIO) {
 				dev_err(&msc->pdev->dev,
@@ -3018,14 +3093,6 @@ static int mpam_register_irqs(void)
 			smp_call_function_many(&msc->accessibility,
 					       &_enable_percpu_irq, &irq,
 					       true);
-		} else {
-			err = devm_request_threaded_irq(&msc->pdev->dev, irq,
-							&mpam_shared_hard_irq,
-							&mpam_shared_thread_irq,
-							IRQF_SHARED | IRQF_ONESHOT,
-							"mpam:msc:error", msc);
-			if (err)
-				return err;
 		}

 		guard(mutex)(&msc->error_irq_lock);
@@ -3041,8 +3108,9 @@ static int mpam_register_irqs(void)

 static void mpam_unregister_irqs(void)
 {
-	int irq;
+	struct mpam_shared_irq *shared, *tmp;
 	struct mpam_msc *msc;
+	int irq;

 	guard(cpus_read_lock)();
 	guard(srcu)(&mpam_srcu);
@@ -3062,13 +3130,18 @@ static void mpam_unregister_irqs(void)
 			if (irq_is_percpu(irq)) {
 				msc->reenable_error_ppi = 0;
 				free_percpu_irq(irq, msc->error_dev_id);
-			} else {
-				devm_free_irq(&msc->pdev->dev, irq, msc);
 			}
 			msc->error_irq_req = false;
 		}
 		mutex_unlock(&msc->error_irq_lock);
 	}
+
+	list_for_each_entry_safe(shared, tmp, &mpam_shared_irqs, list) {
+		if (shared->requested)
+			free_irq(shared->irq, shared);
+		list_del(&shared->list);
+		kfree(shared);
+	}
 }

 static void __destroy_component_cfg(struct mpam_component *comp)
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..698632ee7859 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -83,6 +83,7 @@ struct mpam_msc {
 	bool			has_extd_esr;

 	int				reenable_error_ppi;
+	int				error_shared_irq;
 	struct mpam_msc * __percpu	*error_dev_id;

 	atomic_t		online_refs;
--
2.43.0

