Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613558;
	b=oY/Qdict+YHZeswp4rjFJjPrFDdDCp2B7+fVmci+gZ5cpmEB7bFXg0vmeVRgWzw61bKH
	 ZkeIb57vv1LvvE8djtbjcWUjTT2GAsxfkqrhN4eF3/Vsaa+q3wtYA1G3oE3FcRVIzJR+c
	 txNLUkG/3aVvkVRP9+UbtpAw01B/ubfz70BvUX0lddWKHq267E2CIPjDUeCCe7RSqIDCU
	 bsh7kwkJySUqTZfCRt5MxPGwV/1CW2KwyEWuF/LsMK2Bv6NunWqRMZgksWtV6/zfDRZpm
	 VTR4yuYxEpuCMW+x60I6fj5EeJJopxq7tasbbYSEnC2RQ9+sDI/gH0Zzd1z0vTuIHqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1DSASOQGCCfh5J1J8BecOcU+EL/VjWFuk+N+zr85U9w=;
	b=xk+XU3xuXiH8NKci1X5tOmo5sCD2XOLp1VXN3TZYAf4N8BNX1Y30qeXU5+OryDMqc8ad
	 PmE3QgNavKVIE68qrUFBq3mk9RucudDDxcXnyhfflw9R8lCLQpZmO3kGuf6PndqUO4vzq
	 Oxk+TwWfvmVKbJy4GOURvZtXimfLBJUhi0yD5jKNipee/3trsqgDy6yFhSeS9Xd7QRTyS
	 vINr2RqUJcnI8YkKpOIFlzrwCamGWOs8E3XR3VvA96+nnyTjfIoPvQuEcitHc+b3REKFF
	 gRm+UkkLZIddTOOC7PZGeEZ2E0LoOffL2waloChloSp6zLQ0C7NieY+8xAnsyFteX+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=om+xvqIN;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FF0606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50FF0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=om+xvqIN
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b40b3772f0so655819a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795613556; x=1796218356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DSASOQGCCfh5J1J8BecOcU+EL/VjWFuk+N+zr85U9w=;
        b=om+xvqINzuphEzOX1hAwwSg1eCz/y7cD6JAIapln5oRvWDPfGBW2Ntv/CMCDrluj25
         cIB80TSifufPUjX5z/0ro0cI/MUK5RKYKU0pyxo0r+ulvvx3zjcZyBB1bMJxqRqgaHhG
         8uQo2m+Y7ziQagYDQ/RxuCnRDUq0qNzq/bSgrx0JUB8n26IDZCD60ZTlvIgNz5gZWF0+
         htESKdV26vzhRtu6Jj5rAKrrePHPB8rcF9soiYWt+EsQ+AHZk6ZtBuH19r7/fcCD/FiN
         5xMvg1FHvue1d+hEubXaGc8joVYwDl0yYRbeZcQ0i9yxOjMOQsZt3aSRTYnzTIT53jKK
         JFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613556; x=1796218356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DSASOQGCCfh5J1J8BecOcU+EL/VjWFuk+N+zr85U9w=;
        b=iKZrONaP9Wl5E9x/KKY4n98GYGsA+BglHTr7gjHnKYF0n/EYJkXKQej0unlB3KvIHV
         M6iADGh9W9qoP0LD1P2xsBsyjExnBITC3+h2i6KTffJmqNylxpD/XcEZymraICLNixhd
         K8ByEEo5KIQ9i1a0ak5ZcrARxImmDo+ecBZdDJFFU01CtZA/Rf5K/KoXzFMlQgAEeHcb
         W3FRtFLhYqQwo7rp2t5iItJKJxzk6P4FYNzlaHZkwl3hvtjU+OWXehFPjbYPG+OWzW8e
         7D7yo0sWQaD9A4ArY8jGYJDR8hLJDBAFor69WixvX31/LfUdHASxlLHQnlANvFYkEn+R
         y8OA==
X-Forwarded-Encrypted: i=1; AL+hErHLLrYkaopSGUrOOinz4nrGkh5EWOqEvqHLGfHahVkkMrS9pwI+BUxyJ45YJ3SOiWV/nEk3mPryxyajiso=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I96n+aOQxTOVzINyIwmoUQKpPUuRmINo65uMP06a6giAVjiYq
	tBYNY+pn1BnSY/8vh2c+bUlzk6v+yCLJzvabPjCiwF/bbN5Mw/FUM5YZ
X-Gm-Gg: AZFdTZddJw2aKuD5C2WkrVQztPYaqj/eGAYOwGJ+sVUOL0ttzB23Td0aOspcqLjVSMy
	Oo6VzmRxeZpLvCL+2eCBztbQkZsnwLJN4i6oR9T684TkDg70NXVvXlLItiQeAJQQNgGcw0d1MA/
	HCETpetEqO7VfRn7FMoZer1xEnWli1lkeBpFN/BsiVUvAr2bads181eKjW2S/UigvvBYvQrlXc2
	4ZZtvAzdRkS8Z19pIV4bnLhLjVT2SqOkGhyszh8lChE+9VS7oTGPnUr+O4gpfLkyo/8iJd9yw4U
	sIQedZYFn9K0Z8K3BLlfWyVwIW/6eCxel1JLIjs8jIcTy+TyX8GDrdBrqpVVirbdGKaC8Fh17oL
	EWwow9CQC+yXwh1yKU8NmJ7llVNZpmUNeAdsWOaVckrcCA9DGFXLhmhKc+1KoHaAlyBgb5ec1Hz
	QrvR/rQxxeJCyQpAYCnsplTQ4Oj+4fO+5S4N0iJLsk+xuMTQHA9lRoyt1GWfXfD7PLSt5RgescN
	/V9D128X5AeWfqOcCbVlmTtHynIQ4avGTi3fp4J8RFsx7jw+CVEhALYfnrbHuPXWLpSuW+B2kJq
	pQKlyZ6kDOdrSA2NgXUtZRCGgo7YnmjineHtXM8mBg==
X-Received: by 2002:a17:90b:2701:b0:3b3:ab75:c947 with SMTP id 98e67ed59e1d1-3b41c7b60aamr25994146a91.1.1795613556207;
        Wed, 25 Nov 2026 05:32:36 -0800 (PST)
Received: from gmail.com ([124.127.221.136])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm30902029a91.12.2026.11.25.05.31.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:32:35 -0800 (PST)
From: Ziyu Zhang <ziyuzhang201@gmail.com>
To: vinicius.gomes@intel.com,
	vkoul@kernel.org
Cc: dave.jiang@intel.com,
	Frank.Li@kernel.org,
	kevin.tian@intel.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	ziyuzhang201@gmail.com
Subject: [PATCH v2] dmaengine: idxd: Fix deadlock on interrupt handle revocation
Date: Wed, 25 Nov 2026 21:31:23 +0800
Message-Id: <20261125133123.98687-1-ziyuzhang201@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

idxd_misc_thread() handles the misc MSI-X vector and completes device
commands when IDXD_INTC_CMD is set. On an IDXD_INTC_INT_HANDLE_REVOKED
interrupt, it allocates a work item with GFP_ATOMIC. If that allocation
fails, it calls idxd_wqs_quiesce() inline. This takes wq_lock for each
enabled kernel work queue and can block behind a command submitter
holding that lock while waiting for cmd_done. The misc thread cannot
complete the command while blocked on the lock, resulting in a deadlock.

This potential deadlock was found by our experimental static analysis
tool, which analyzes lock usage and completion-based synchronization.

Embed the work item in struct idxd_device and queue it asynchronously,
removing the allocation and its synchronous quiesce fallback.

Revokes received while the work is pending are coalesced; the queued
work refreshes all valid interrupt handles. A revoke received while the
work is running can queue another execution to refresh handles that
have already been processed. Reusing the same work item on the same
workqueue also serialises revoke handling.

Initialize the work once in idxd_setup_internals(), since interrupt
setup runs again during FLR recovery. During interrupt cleanup, block
new revoke enqueues and synchronize the misc IRQ before cancelling the
work. This accounts for IRQ handlers that have already passed the stop
check. Cancel the work before releasing the misc IRQ so that the IRQ
handler remains available for command completions while waiting for a
running work item to finish.

Fixes: 56fc39f5a367 ("dmaengine: idxd: handle interrupt handle revoked event")
Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
---
Changes in v2:
- Initialize the embedded work once, rather than on each interrupt setup.
- Stop new enqueues and synchronize the misc IRQ before cancelling work.
- Cancel revoke work before freeing the misc IRQ.

v1: https://lore.kernel.org/r/20261125113553.94215-1-ziyuzhang201@gmail.com

 drivers/dma/idxd/idxd.h |  3 +++
 drivers/dma/idxd/init.c | 10 ++++++++++
 drivers/dma/idxd/irq.c  | 28 +++++-----------------------
 3 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
index ce78b9a7c641..88921f07b439 100644
--- a/drivers/dma/idxd/idxd.h
+++ b/drivers/dma/idxd/idxd.h
@@ -366,6 +366,8 @@ struct idxd_device {
 	struct idxd_dma_dev *idxd_dma;
 	struct workqueue_struct *wq;
 	struct work_struct work;
+	struct work_struct int_handle_revoke_work;
+	bool int_handle_revoke_stop;
 
 	struct idxd_pmu *idxd_pmu;
 
@@ -762,6 +764,7 @@ int idxd_load_iaa_device_defaults(struct idxd_device *idxd);
 
 /* device interrupt control */
 irqreturn_t idxd_misc_thread(int vec, void *data);
+void idxd_int_handle_revoke(struct work_struct *work);
 irqreturn_t idxd_wq_thread(int irq, void *data);
 void idxd_mask_error_interrupts(struct idxd_device *idxd);
 void idxd_unmask_error_interrupts(struct idxd_device *idxd);
diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 4b827a329756..620de170ff18 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -153,8 +153,16 @@ static void idxd_cleanup_interrupts(struct idxd_device *idxd)
 
 	ie = idxd_get_ie(idxd, 0);
 	idxd_mask_error_interrupts(idxd);
+
+	/* Drain IRQ enqueues before cancelling work, keeping command IRQs live. */
+	WRITE_ONCE(idxd->int_handle_revoke_stop, true);
+	synchronize_irq(ie->vector);
+	cancel_work_sync(&idxd->int_handle_revoke_work);
+
 	free_irq(ie->vector, ie);
 	pci_free_irq_vectors(pdev);
+
+	WRITE_ONCE(idxd->int_handle_revoke_stop, false);
 }
 
 static void idxd_clean_wqs(struct idxd_device *idxd)
@@ -433,6 +441,8 @@ static int idxd_setup_internals(struct idxd_device *idxd)
 	int rc;
 
 	init_waitqueue_head(&idxd->cmd_waitq);
+	/* Once per device: idxd_setup_interrupts() runs again after FLR */
+	INIT_WORK(&idxd->int_handle_revoke_work, idxd_int_handle_revoke);
 
 	rc = idxd_setup_wqs(idxd);
 	if (rc < 0)
diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
index 6a25e1fd0e62..26b06a47680a 100644
--- a/drivers/dma/idxd/irq.c
+++ b/drivers/dma/idxd/irq.c
@@ -24,11 +24,6 @@ struct idxd_resubmit {
 	struct idxd_desc *desc;
 };
 
-struct idxd_int_handle_revoke {
-	struct work_struct work;
-	struct idxd_device *idxd;
-};
-
 static void idxd_device_reinit(struct work_struct *work)
 {
 	struct idxd_device *idxd = container_of(work, struct idxd_device, work);
@@ -127,17 +122,15 @@ static void idxd_abort_invalid_int_handle_descs(struct idxd_irq_entry *ie)
 	}
 }
 
-static void idxd_int_handle_revoke(struct work_struct *work)
+void idxd_int_handle_revoke(struct work_struct *work)
 {
-	struct idxd_int_handle_revoke *revoke =
-		container_of(work, struct idxd_int_handle_revoke, work);
-	struct idxd_device *idxd = revoke->idxd;
+	struct idxd_device *idxd =
+		container_of(work, struct idxd_device, int_handle_revoke_work);
 	struct pci_dev *pdev = idxd->pdev;
 	struct device *dev = &pdev->dev;
 	int i, new_handle, rc;
 
 	if (!idxd->request_int_handles) {
-		kfree(revoke);
 		dev_warn(dev, "Unexpected int handle refresh interrupt.\n");
 		return;
 	}
@@ -216,7 +209,6 @@ static void idxd_int_handle_revoke(struct work_struct *work)
 			udelay(100);
 		idxd_int_handle_revoke_drain(ie);
 	}
-	kfree(revoke);
 }
 
 static void idxd_evl_fault_work(struct work_struct *work)
@@ -504,20 +496,10 @@ irqreturn_t idxd_misc_thread(int vec, void *data)
 	}
 
 	if (cause & IDXD_INTC_INT_HANDLE_REVOKED) {
-		struct idxd_int_handle_revoke *revoke;
-
 		val |= IDXD_INTC_INT_HANDLE_REVOKED;
 
-		revoke = kzalloc_obj(*revoke, GFP_ATOMIC);
-		if (revoke) {
-			revoke->idxd = idxd;
-			INIT_WORK(&revoke->work, idxd_int_handle_revoke);
-			queue_work(idxd->wq, &revoke->work);
-
-		} else {
-			dev_err(dev, "Failed to allocate work for int handle revoke\n");
-			idxd_wqs_quiesce(idxd);
-		}
+		if (!READ_ONCE(idxd->int_handle_revoke_stop))
+			queue_work(idxd->wq, &idxd->int_handle_revoke_work);
 	}
 
 	if (cause & IDXD_INTC_CMD) {
-- 
2.34.1

