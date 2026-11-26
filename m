Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712948;
	b=sFAeg8DmCEJdOQ8k54ZoHsYcjPKfYaZ4iNMsEbVXKI6vhAp0IS9M9SqeSF10hsODOciX
	 Q+wCwOV+r515zyaSv52XVPbuKjkeaQTuy4YLdFbhHMUAMv1VanuS2NJvNGMjlkRqYLIj3
	 wUTjlOeGloS0MxCAe8uriWdVxr3HZi2k/JdBSfI73vVZn/jbO8l2YM9Y7R0ZOF2wlq9AR
	 CwvhY8+nHluuOqqTvsiDrqiK56ISlVEZ206FRbRMFumWlmZuIIdHsrSJH2rufvK/oU21t
	 mOO+mfZP22k3pyFnUlnVI6VJ49XXM4ARTNScPIA4El9PWBaaARsJtL9frvzkDGol5fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vKstF87rZS7jRAOkogke099kQZxjaDL1aqxwAUl3KYU=;
	b=ORMAAtJfHT0Qa5EpiTPZ8F3o+RLvPr+Ooq7GaLvEcBrFsN0slcrjagidjAeLYZVu9BSq
	 i7h1IZuVNw6gAemVRXhAxJiHEjmViR+GTLR1/0kd9dbzErVc7axEFt0aseIwhYpfSWN2U
	 xQrTXRxI9B8hcJk5lZFPZMrR1V+ceCmswb7mY2b3LFMQjDRSwYuUSx1D48Nfwpj1FSDud
	 iCmbueCX+QxMIOm3YlRecB2X9W4OPb/W/eMYh+YT6jUGPWlkhOph1XpZtslV83TkCELyC
	 0pOD5jBoLntu1Wb8b6Tg1+dQYYKRnSGJqUbdIpvA3lBYjAmtZ+RIFd+xnQuFGK3n62Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAJUtjg2;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2A9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D2A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAJUtjg2
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4bb7fffc3f9so6902355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795712946; x=1796317746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKstF87rZS7jRAOkogke099kQZxjaDL1aqxwAUl3KYU=;
        b=MAJUtjg2xvLwyhmuLN9eABWjGTmDvOCMrA9+brshQcZnxTp3k939x7LVdMzj0EpUiU
         +h7PvtSfQSENWMVT5xcbYrJEvWItD60973/6uFinatPvwxBtd1oK6x+DoRXCaooPPouF
         1M3bIfTk11bvOU8dJAk9a52XpRt7IWcQz7KKLYEZmgJ0sIp43QyWvrC7WryIspJHHO+0
         k8N3miKZFfPD7ll+0w+1tPXuQvSKfOcLgh5dD7v2xl7Jn+4df9BKvj4dA60oU9H1dilH
         R84+YPv/6Q/FG/J5KgBUtNnvDjJP1TLPj3PCbsCEVRg/HlDFe2zZufPGRjQqT3IfdFBs
         DPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712946; x=1796317746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKstF87rZS7jRAOkogke099kQZxjaDL1aqxwAUl3KYU=;
        b=NtZKkT4wh4lVoDa3L3Q+xHFdjDPhbmInXY3+ueFIVCiwdcu3nomvFiDAWYU025F0dF
         T3ndL8VWsVtnxCCj8xUAJOoiFO4mx7TR6FMfjNnq3R63BXpTx5KLDVv6OfDgZWXUofC8
         ZhAKSFuyZq8xJ6qhjb/uHa8JCGbSHG/wk1UswW08cerF37Yrev4EmqlQXBIbMoQBgVoj
         92ZN7qf3+aTVPUyu8LzmR+jEHiMUeF5ORxdowEKFY+QZVLtq3FC2LEL3lCffYzYaA1xg
         bHh87JlMrsATIH62mZy3pGKMb0jLbH+u56XRD/1EoehLhWMVZXabTv9XJG5T5zF8mj7f
         aIXQ==
X-Forwarded-Encrypted: i=1; AL+hErHzwUaXITrZmjGZr1vb1FmcJ2Z9540DD9PYcPWr2CQIchwoZF9IWkfXNWiO3aqZeRg82pwEjW/st8M3RhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PSTMDnC1fSjkK20B+GcuTuuAp8TvHAH6PErUsYuGf+SCjDmLm
	DI1h1V12l9gG4f/ubv4j3GoOHDpessHOt1CbJkxp58bXrMqJ7hi/gFaK
X-Gm-Gg: AZFdTZcDfXktVXxhTSD+kWpJpNxDl3UQkIIQqhMJzpNfuN1m9/3DKFlO1MDp6y8Xjdq
	SgwQuDURuLvYs7ag4dW4L2kNtO26PQdukuiF6X0LBhEEMe7d9pDGsbPxe+JWEYfBcqOg9mvHzdl
	1Eaj1T5KAWcyFdORkuNfiehGlDQ+gZ8tV5VNxvCOMcEgL1zhCntDG+G9xvFL1LNhj4o0SLDZqJv
	wPDxBmvNqVf7fGWSLgQtBMy4kr1Qn80zawhiMaEfCxSa+uqgIU+iyxAmRnYlJvZ5huRY6TL/wh/
	/P4L5KMOpROVryQDG80pr911jy9p6QEp530pPgefF50h273V3RBA6KEfRHdN9H4QlEZahF2xx/X
	BfKdWZ5RpcAZkNYIcXFhkcoPDzaWgNVD0DKEmTKDOGFDc9S881W9p+ApJE8mDgJxoblUqs0zZ3L
	B5qDvRIPERVLbwbaCxopB5wjG9rS0mbP6EbldgOfVJe68D9UTevRSQhtkB6AUxKz2iA0WmNs8HJ
	Kc8mSM4MO34U0JSBYAfC2xpY5fSc9JcrsCsECgyK6huDGzbMM4ep1H3FPNuLeXSnK2ryuJXGh8x
	+Io1EmXVTsKiPTGivPOkrYSiMIR2tWQ0oOZyTQ==
X-Received: by 2002:a05:600c:848a:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb8880993amr416476265e9.7.1795712946263;
        Thu, 26 Nov 2026 09:09:06 -0800 (PST)
Received: from serhat-ubuntu ([212.253.223.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm589214455e9.4.2026.11.26.09.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:09:05 -0800 (PST)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: jgg@ziepe.ca
Cc: bharat@chelsio.com,
	larrystevenwise@gmail.com,
	leon@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rolanddreier@rivian.com,
	serhatkumral1@gmail.com
Subject: [PATCH v2] RDMA/cxgb4: Use dealloc_driver op to fix ioremap leak on alloc failure
Date: Thu, 26 Nov 2026 20:08:41 +0300
Message-ID: <20261126170841.11048-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123165128.GL179082@ziepe.ca>
References: <20261123165128.GL179082@ziepe.ca>
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

In c4iw_alloc(), if c4iw_rdev_open() fails, the previously ioremapped
BAR2/on-chip memory (bar2_kva / oc_mw_kva) is leaked because
ib_dealloc_device() does not unmap it.

Refactor c4iw_dealloc() to take struct ib_device * and register it as the
.dealloc_driver callback in c4iw_dev_ops. Move ib_set_device_ops() and
the xarray/mutex/waitqueue initializations earlier in c4iw_alloc() so
that all ib_dealloc_device() error paths invoke c4iw_dealloc(). Guard
c4iw_rdev_close() with dev->rdev.free_workq so it is only called when
c4iw_rdev_open() succeeded.

Update c4iw_register_device() and c4iw_remove() to rely on
ib_dealloc_device() and ib_unregister_device() rather than calling
c4iw_dealloc() directly, and handle the case where cancel_work_sync()
cancels reg_work before registration runs.

Fixes: c6d7b26791a2 ("RDMA/cxgb4: Support on-chip SQs")
Fixes: fa658a98a2d0 ("RDMA/cxgb4: Use the BAR2/WC path for kernel QPs and T5 devices")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/infiniband/hw/cxgb4/device.c   | 66 +++++++++++++-------------
 drivers/infiniband/hw/cxgb4/iw_cxgb4.h |  3 +-
 drivers/infiniband/hw/cxgb4/provider.c |  7 +--
 3 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/drivers/infiniband/hw/cxgb4/device.c b/drivers/infiniband/hw/cxgb4/device.c
index 24ac9871ce67..336747080abd 100644
--- a/drivers/infiniband/hw/cxgb4/device.c
+++ b/drivers/infiniband/hw/cxgb4/device.c
@@ -931,22 +931,23 @@ static void c4iw_rdev_close(struct c4iw_rdev *rdev)
 	c4iw_destroy_resource(&rdev->resource);
 }
 
-void c4iw_dealloc(struct uld_ctx *ctx)
+void c4iw_dealloc(struct ib_device *ibdev)
 {
-	debugfs_remove_recursive(ctx->dev->debugfs_root);
-	c4iw_rdev_close(&ctx->dev->rdev);
-	WARN_ON(!xa_empty(&ctx->dev->cqs));
-	WARN_ON(!xa_empty(&ctx->dev->qps));
-	WARN_ON(!xa_empty(&ctx->dev->mrs));
-	wait_event(ctx->dev->wait, xa_empty(&ctx->dev->hwtids));
-	WARN_ON(!xa_empty(&ctx->dev->stids));
-	WARN_ON(!xa_empty(&ctx->dev->atids));
-	if (ctx->dev->rdev.bar2_kva)
-		iounmap(ctx->dev->rdev.bar2_kva);
-	if (ctx->dev->rdev.oc_mw_kva)
-		iounmap(ctx->dev->rdev.oc_mw_kva);
-	ib_dealloc_device(&ctx->dev->ibdev);
-	ctx->dev = NULL;
+	struct c4iw_dev *dev = to_c4iw_dev(ibdev);
+
+	debugfs_remove_recursive(dev->debugfs_root);
+	if (dev->rdev.free_workq)
+		c4iw_rdev_close(&dev->rdev);
+	WARN_ON(!xa_empty(&dev->cqs));
+	WARN_ON(!xa_empty(&dev->qps));
+	WARN_ON(!xa_empty(&dev->mrs));
+	wait_event(dev->wait, xa_empty(&dev->hwtids));
+	WARN_ON(!xa_empty(&dev->stids));
+	WARN_ON(!xa_empty(&dev->atids));
+	if (dev->rdev.bar2_kva)
+		iounmap(dev->rdev.bar2_kva);
+	if (dev->rdev.oc_mw_kva)
+		iounmap(dev->rdev.oc_mw_kva);
 }
 
 static void c4iw_remove(struct uld_ctx *ctx)
@@ -954,12 +955,12 @@ static void c4iw_remove(struct uld_ctx *ctx)
 	pr_debug("c4iw_dev %p\n", ctx->dev);
 
 	/* c4iw_register_device() may still be using ctx->dev. */
-	cancel_work_sync(&ctx->reg_work);
-	if (!ctx->dev)
-		return;
+	if (cancel_work_sync(&ctx->reg_work))
+		ib_dealloc_device(&ctx->dev->ibdev);
+	else if (ctx->dev)
+		c4iw_unregister_device(ctx->dev);
 
-	c4iw_unregister_device(ctx->dev);
-	c4iw_dealloc(ctx);
+	ctx->dev = NULL;
 }
 
 static int rdma_supported(const struct cxgb4_lld_info *infop)
@@ -990,6 +991,19 @@ static struct c4iw_dev *c4iw_alloc(const struct cxgb4_lld_info *infop)
 	}
 	devp->rdev.lldi = *infop;
 
+	xa_init_flags(&devp->cqs, XA_FLAGS_LOCK_IRQ);
+	xa_init_flags(&devp->qps, XA_FLAGS_LOCK_IRQ);
+	xa_init_flags(&devp->mrs, XA_FLAGS_LOCK_IRQ);
+	xa_init_flags(&devp->hwtids, XA_FLAGS_LOCK_IRQ);
+	xa_init_flags(&devp->atids, XA_FLAGS_LOCK_IRQ);
+	xa_init_flags(&devp->stids, XA_FLAGS_LOCK_IRQ);
+	mutex_init(&devp->rdev.stats.lock);
+	mutex_init(&devp->db_mutex);
+	INIT_LIST_HEAD(&devp->db_fc_list);
+	init_waitqueue_head(&devp->wait);
+	devp->avail_ird = devp->rdev.lldi.max_ird_adapter;
+	ib_set_device_ops(&devp->ibdev, &c4iw_dev_ops);
+
 	/* init various hw-queue params based on lld info */
 	pr_debug("Ing. padding boundary is %d, egrsstatuspagesize = %d\n",
 		 devp->rdev.lldi.sge_ingpadboundary,
@@ -1050,18 +1064,6 @@ static struct c4iw_dev *c4iw_alloc(const struct cxgb4_lld_info *infop)
 		return ERR_PTR(ret);
 	}
 
-	xa_init_flags(&devp->cqs, XA_FLAGS_LOCK_IRQ);
-	xa_init_flags(&devp->qps, XA_FLAGS_LOCK_IRQ);
-	xa_init_flags(&devp->mrs, XA_FLAGS_LOCK_IRQ);
-	xa_init_flags(&devp->hwtids, XA_FLAGS_LOCK_IRQ);
-	xa_init_flags(&devp->atids, XA_FLAGS_LOCK_IRQ);
-	xa_init_flags(&devp->stids, XA_FLAGS_LOCK_IRQ);
-	mutex_init(&devp->rdev.stats.lock);
-	mutex_init(&devp->db_mutex);
-	INIT_LIST_HEAD(&devp->db_fc_list);
-	init_waitqueue_head(&devp->wait);
-	devp->avail_ird = devp->rdev.lldi.max_ird_adapter;
-
 	if (c4iw_debugfs_root) {
 		devp->debugfs_root = debugfs_create_dir(
 					pci_name(devp->rdev.lldi.pdev),
diff --git a/drivers/infiniband/hw/cxgb4/iw_cxgb4.h b/drivers/infiniband/hw/cxgb4/iw_cxgb4.h
index e17c1252536b..2ab852e611c6 100644
--- a/drivers/infiniband/hw/cxgb4/iw_cxgb4.h
+++ b/drivers/infiniband/hw/cxgb4/iw_cxgb4.h
@@ -1003,7 +1003,8 @@ struct ib_mr *c4iw_alloc_mr(struct ib_pd *pd, enum ib_mr_type mr_type,
 			    u32 max_num_sg);
 int c4iw_map_mr_sg(struct ib_mr *ibmr, struct scatterlist *sg, int sg_nents,
 		   unsigned int *sg_offset);
-void c4iw_dealloc(struct uld_ctx *ctx);
+void c4iw_dealloc(struct ib_device *ibdev);
+extern const struct ib_device_ops c4iw_dev_ops;
 struct ib_mr *c4iw_reg_user_mr(struct ib_pd *pd, u64 start,
 					   u64 length, u64 virt, int acc,
 					   struct ib_dmah *dmah,
diff --git a/drivers/infiniband/hw/cxgb4/provider.c b/drivers/infiniband/hw/cxgb4/provider.c
index 904a5323a693..8fa9b88f3b2a 100644
--- a/drivers/infiniband/hw/cxgb4/provider.c
+++ b/drivers/infiniband/hw/cxgb4/provider.c
@@ -460,7 +460,7 @@ static void get_dev_fw_str(struct ib_device *dev, char *str)
 		 FW_HDR_FW_VER_BUILD_G(c4iw_dev->rdev.lldi.fw_vers));
 }
 
-static const struct ib_device_ops c4iw_dev_ops = {
+const struct ib_device_ops c4iw_dev_ops = {
 	.owner = THIS_MODULE,
 	.driver_id = RDMA_DRIVER_CXGB4,
 	.uverbs_abi_ver = C4IW_UVERBS_ABI_VERSION,
@@ -472,6 +472,7 @@ static const struct ib_device_ops c4iw_dev_ops = {
 	.create_cq = c4iw_create_cq,
 	.create_qp = c4iw_create_qp,
 	.create_srq = c4iw_create_srq,
+	.dealloc_driver = c4iw_dealloc,
 	.dealloc_pd = c4iw_deallocate_pd,
 	.dealloc_ucontext = c4iw_dealloc_ucontext,
 	.dereg_mr = c4iw_dereg_mr,
@@ -552,7 +553,6 @@ void c4iw_register_device(struct work_struct *work)
 	memcpy(dev->ibdev.iw_ifname, dev->rdev.lldi.ports[0]->name,
 	       sizeof(dev->ibdev.iw_ifname));
 
-	ib_set_device_ops(&dev->ibdev, &c4iw_dev_ops);
 	ret = set_netdevs(&dev->ibdev, &dev->rdev);
 	if (ret)
 		goto err_dealloc_ctx;
@@ -566,7 +566,8 @@ void c4iw_register_device(struct work_struct *work)
 err_dealloc_ctx:
 	pr_err("%s - Failed registering iwarp device: %d\n",
 	       pci_name(ctx->lldi.pdev), ret);
-	c4iw_dealloc(ctx);
+	ib_dealloc_device(&dev->ibdev);
+	ctx->dev = NULL;
 	return;
 }
 
-- 
2.53.0

