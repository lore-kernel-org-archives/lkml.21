Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606635;
	b=QdxMwIFYPXEGSPSTpfIOJvLzQZ1eM5ur3MBpLp1gpmL7m6fXcvL9eLaqID3FnGbPgfZV
	 PN/UXuBvZAZe5pyQ9drPlhnT2EcDJZglHr/THASKVKlxcevJ5nB/O6uxqfNjUiChYjbR0
	 NWJmFnIvzsLz5cFa6HGXfvhjnwkgGYEq2WZnAUpC8Ut7AX0tgSzN8DbXI1V+Qh7OLpr4N
	 Eicw1eBfNmzGEthCjcAmLvPDt+bqDRmhG9DNseOT2DGLo9zkDEruZJ/xrLuru/dSxe2pu
	 M8O/kvh8TDAf5XK9K0NzZKBXp7bPri7MdF0UmsZZhhjZCa1VFFSLs6Vn5kJoiLDBq+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3rGjea6nUknwVphXD39fnbsFzrZc+7G/LRSnT77AgSg=;
	b=qObxxJUJjGh5VAmovPQe+DxDdt6wnUnbPjBiIqXmzxyHHoQREDiqp7/by0sHvG0RKPdU
	 Zaun+KiavA3lvow00LvbSeBPFKcde6sZv62izCW7XCXQ3GooVJLS+LW7QblT1JtPT6yCp
	 kHiQsTKzw3vzJ9QEL0PVg0cGUdTdXS0erwG0/1RfwIIraNgH26zwcVK3GCnMadaKmEbub
	 +y3Euw+eEoFMePQenCGBazQgkwN+BoRYKJN43qg8A4Jf9ytKggNplo0J32pIwxqlF4LKK
	 7z1pRL0YEq/9KwbKJYN6YewYeFCT9LTDOs/LC6NXHhQAPIOg0e0xMJgZKWhimvunKwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV8+w4Fy;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1483B606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1483B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV8+w4Fy
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b43d6c3485so657478a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606634; x=1796211434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3rGjea6nUknwVphXD39fnbsFzrZc+7G/LRSnT77AgSg=;
        b=KV8+w4FyuiXxVDrO7Y0ECYk04tVbli7h7QqoBT0EgIoLIIlLOJBxiRiKCOscjyLtTa
         exaRA0O3X5FM70xY4NfFsa04SPQK00uaIeEyVHsgQGFM11v8HOslXcZXSTcF8jm2Ngq6
         +rU83k7SH7zd+7Zbx4JxXVZfPzAnF02/lUSQpsdRZumPuE+w/7G5UDlGQqQYKuaeM2id
         Fws1uEmztTt+c/DahBl3TplTK3B+tZ6Vb6nLeSi7IQU9ThbbFMwdldxu7FOnfROkJQcW
         yAryC91AdoNU03D57OT6+m92g9iujMh/yTMvp0qH4BGx4FS9HxFORtoTZD68Hj/77Lkv
         i/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606634; x=1796211434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rGjea6nUknwVphXD39fnbsFzrZc+7G/LRSnT77AgSg=;
        b=QbsxasKArIu7YZHBp/tdj9d2uW946pXLE8ZOFI3ydbLhqFpaSYs6GML0oqX3mZv6Ye
         W8Cz20uPPQZjhxjtM8zEbSZoTSVa/1Xr79PXd4HevfHkvAAvpy0mnjK8ZsS/3SaZVypC
         152uuNLD5SABfPdGRc6JEJSHf8Oda9VAY02Q/j9hpicN55wdSbgw1a2A9vNVo2RYKc3J
         FJMQ0740WJnH65k1lO9MNf4P68DbrfTKCiWpIZ7dAqkzMoL0cTriswbMsAbgpCCHMh5n
         i2cua4NOPSF2bd1tqoDIiL42DD0cv+jFCzqUUHwmOAoBt+2ZdWNFWH5jSIe5rBuiqrbl
         /ZAg==
X-Forwarded-Encrypted: i=1; AL+hErEZhOcb/e4IraYHWpUFBWUBCJT3UxTVZ76la1Cls6NXWpWypZGbUGsct+ovmmjmXI8Sl4b1Q6m9g44Vy8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SdejpvXsI++nfyiNRIIXJPnXhcLP1DX+5V80OHCVst2YWn5/d
	jClkrWdIg3YS10XLvFfwvLI38ReqKhTJR+BG+vk+QfwThpLY7FF5cuXK
X-Gm-Gg: AZFdTZdytbQUp46JUtXVuv0XRagsClnW1sJu9/btsP1d9QFcxY6pa/Zr6/Mo0pkmOc/
	IrACl7CpQlvnjniek3VF05FT/ZWD/Cc6Oi8G235kxa21mL5AnMNLpxZJA5Mlphhca/Me+Xi0NEd
	ShuvQtKCMWB6BJOXW/2hLJLa+n+ce3EG4Nta4yCBAMAVNMJSI1/eFZ38t0lYJHUO3fFrVXrUnaD
	98HRxwxls8/rXYVT6K18/V0cXX7WSK36ejqzP7NGSn5W0voC2loHpb4pY4KZ7xaUezkbHCkcoYV
	Q3XPX7h4u2aaez1ujsC+feI8eANVtgrpSiD69youkhtX+4Y+fZ6EoYSqmg9Sg6Epq6peBiXs6dr
	2FViIjM+HVKkcHG51PWq/IhbdFauXdtkHauBhqAx+F8ZQy+lDkkzLyBiV9gVLET1umXPY9Q4xVj
	A3i0TyrhYuAS19K8PFc8KwlhWIckvv9M2NehnVeiId/BZb+AidwaLY5ePBmeTngorJ9eEwAqI+y
	E9UlVlLVt1UXo3GMb/EY2jN9eYEtA5QI7a37pbQ9HXt3VjKv9bZxpwNXndateFjqPo=
X-Received: by 2002:a17:90a:e70c:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b41c58aebdmr27233958a91.0.1795606634132;
        Wed, 25 Nov 2026 03:37:14 -0800 (PST)
Received: from gmail.com ([124.127.71.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm29534485a91.16.2026.11.25.03.37.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 03:37:13 -0800 (PST)
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
Subject: [PATCH] dmaengine: idxd: Fix deadlock on interrupt handle revocation
Date: Wed, 25 Nov 2026 19:35:53 +0800
Message-Id: <20261125113553.94215-1-ziyuzhang201@gmail.com>
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

idxd_misc_thread() is the threaded handler of the misc MSI-X vector and
the only context that completes idxd device commands: it calls
complete(idxd->cmd_done) for IDXD_INTC_CMD.  On an
IDXD_INTC_INT_HANDLE_REVOKED interrupt it allocated a work item with
GFP_ATOMIC and, if that allocation failed, called idxd_wqs_quiesce()
inline to fall back.  The quiesce takes wq_lock of every enabled kernel
work queue, so the misc thread can block there behind a command
submitter that holds wq_lock and waits for cmd_done, which only the
misc thread can complete.  Nothing bounds that wait.

This potential deadlock was found by our experimental static analysis
tool, which analyzes lock usage and completion-based synchronization.

Embed the work item in struct idxd_device and queue it unconditionally,
removing the allocation and its synchronous quiesce fallback.

Revokes received while the work is pending are coalesced; the queued
work refreshes all valid interrupt handles. A revoke received while the
work is running can queue another execution to refresh handles that
have already been processed. Reusing the same work item on the same
workqueue also serialises revoke handling.

Fixes: 56fc39f5a367 ("dmaengine: idxd: handle interrupt handle revoked event")
Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
---
 drivers/dma/idxd/idxd.h |  2 ++
 drivers/dma/idxd/init.c |  1 +
 drivers/dma/idxd/irq.c  | 27 ++++-----------------------
 3 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
index ce78b9a7c641..03a73da22596 100644
--- a/drivers/dma/idxd/idxd.h
+++ b/drivers/dma/idxd/idxd.h
@@ -366,6 +366,7 @@ struct idxd_device {
 	struct idxd_dma_dev *idxd_dma;
 	struct workqueue_struct *wq;
 	struct work_struct work;
+	struct work_struct int_handle_revoke_work;
 
 	struct idxd_pmu *idxd_pmu;
 
@@ -762,6 +763,7 @@ int idxd_load_iaa_device_defaults(struct idxd_device *idxd);
 
 /* device interrupt control */
 irqreturn_t idxd_misc_thread(int vec, void *data);
+void idxd_int_handle_revoke(struct work_struct *work);
 irqreturn_t idxd_wq_thread(int irq, void *data);
 void idxd_mask_error_interrupts(struct idxd_device *idxd);
 void idxd_unmask_error_interrupts(struct idxd_device *idxd);
diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 4b827a329756..f3ade8036ddb 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -108,6 +108,7 @@ static int idxd_setup_interrupts(struct idxd_device *idxd)
 	}
 	dev_dbg(dev, "Enabled %d msix vectors\n", msixcnt);
 
+	INIT_WORK(&idxd->int_handle_revoke_work, idxd_int_handle_revoke);
 
 	ie = idxd_get_ie(idxd, 0);
 	ie->vector = pci_irq_vector(pdev, 0);
diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
index 6a25e1fd0e62..6d3355ce88f7 100644
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
@@ -504,20 +496,9 @@ irqreturn_t idxd_misc_thread(int vec, void *data)
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
+		queue_work(idxd->wq, &idxd->int_handle_revoke_work);
 	}
 
 	if (cause & IDXD_INTC_CMD) {
-- 
2.34.1

