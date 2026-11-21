Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795232489;
	b=KIMmtB6e/1BSNQNh5iAcYBU6EU0I5/xdXkfskUE22GLACLEaQSCuCnZ+IERQ9a9psJ/u
	 +kS7JByXzWh/m57uxiWyAWZYaimocnNAkC8UnzSzWCsK9xLGlHA66GEj0p1l+n+yF+ZUx
	 /IckHLssPqDB5eh2nLmg9S5SZVIpD/aYsZliw4E7vKfGh6NQILLttT/1FDSZL1avFjf3B
	 Qi50JNyM0Vrs+7AejSVHWcLJ+PQvRUyI9IPG3D9JrVl8exml3HW9t5nFjlZRkYQehyfAf
	 n6fGRwhuzvWrEod2EKgaAQ6HuMmZnIZd/yP9E2PjRdy2qRB9X+dBV20QuYZmbl11Znw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JanZ89QKVqcpMPfV74tPnz9Q9BpRuGoPYgJISEH9VJs=;
	b=dZvjWaH1HBxudhRRq9J/PW7mpRUgXwNajupgoq5M2CeHhE/pJWTKDlULOcGvgWZAl+gn
	 PyEIiQHQ1L0t84/KHnOQaCqNWjGuMMRtapEd/TLRYs5DdNi04QNVv//oVdiu660XjU/Lw
	 EPy2LzpuRxcioA1jaGaq6vtx0rT3zBhdk0P8P9pWS4/iZ1XzHqS+8Lsb87zGa8Ii7mbm0
	 ncTHCLmhfQUOCAQYqEb1eq9wY9cQVPea3cGxUkcomVmDtmni64+wt725WvxxCFQaAWgLA
	 GGYC434I+IVnhpsnHTcAI3+UlpPFC+WhgXrGHnlq04uo7u0bQvnbSQKvzDpUvTsaiPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uE0kBR89;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AF6606A69F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4AF6606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uE0kBR89
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bb5afa736so168183eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795232486; x=1795837286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JanZ89QKVqcpMPfV74tPnz9Q9BpRuGoPYgJISEH9VJs=;
        b=uE0kBR891MguI1S25KGZyQd7XJqCYkhW/S+KFjMDyUoEaym+vvmmZvn3lmtkGmJtFQ
         AaThRWfJ0Cn1NqmmtpPKGRuWmvR7USJ9kXhvJLZhoKONTr9jUExjwqKlipDbPUyyl29k
         6QhydDJXQaltkGKZxelQ58UOQJTeRhxLhU8I1O3u9niBt8eTtbCE6TeYGl5qdlYbdgtN
         JWWol+0l7grWBkCu8urO/lnMhZMucUbhHy3/xdnv41BZy+EehQAVsmxdZuUP5h9xVCbN
         Fq6rkaiRGeoDZ92Gl8o6rRmed66kV9x+xpZpekH3HJsYO9GsVUYvbF/b2QZudvEEe4k/
         dZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795232486; x=1795837286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JanZ89QKVqcpMPfV74tPnz9Q9BpRuGoPYgJISEH9VJs=;
        b=BQ+8jgORWFi80llBklDIlBTru5Ol2NLoAFd75aS+tUbzcWLtSk22c8nwXHqWTLBqJ3
         nR8x3a8Dx0xu5ovJylDGRnYlXdOdtBnvbv/jAP/DjQyUTBxo6yxIUHw970pDckQ4H3Mk
         bMqPIcTRA8j1Yp06RXdB6UcnVWUE4NkhYKPn4T+KHUF0krcM97QerRn0uC7NB1CoHJMJ
         /F+MwaeAwpShGw3M2ygDeIpOKjG/QTw4rbPot/5toAyfKwFnrSq8Qp9OzoKNN6bsthAq
         X4ZdqREsEt7+AQn9Y9lliCHCRtzXl2a9EXOZdFPq+Zc1ea2YLqquwCOyGGVkXCjxc675
         NbPA==
X-Forwarded-Encrypted: i=1; AL+hErEFM0DSmRFjmugnbe/IFUGn4xygd7UUsDWVx+GMRWA0hZh6iyQv9fg6BLS0SuJhCtEjF7Oz7pfNLcLbOu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CFD1hAhBmZe1Fw7UM3IhxZWTYV8GKqJLepdfNxUntkJz1d7Jg
	XZAzun8bOEVK2kSnG/vX4BChcvravihMxOZuWk/67pRYpLFof3r9vNHmPjcPf2cWySQ=
X-Gm-Gg: AZFdTZeUJbx3rhcUQJ4WvlQzNi0wZhBPRcOPriU07khho44SRDcUIRPmolN/iIZJFAl
	Ub5MP3g2NvCaYhoP5yhpOZ6dh2MqLrciJA2DeaEvDgEQoZamoQn5xLUyu7yIJ+js6VKB/48TuQE
	h5a4kdjZt6g0l7/H60qPumjqUrXYEvRBfBR+3C6iMY/HzAgCLkkQdO/LbFGGyUMHHKzp1jBonSP
	5ukXiHzOuDr5ibE++H2IVwgl31FcTbANPzTPAQm2+ZJRH0hbSbjEva2HdXLzcpR+l4zZUYLZ+5J
	XZbRxdPKpz2vE9lj1CS9MCJYxjD8r0nkXiqg9UBukFalNNqMT3irlQiexfbZLoDi2vH4bkjmcJg
	w9SByeEaiv7SUMHXnv/gyLVcSz9mR3Bc4aJIq1Hs+J17Dznbg1e9GxrBDSanhy8JaY+b4Jy3Wse
	Fs5NkbngDT027ETS4BlcGQTfCm0t2wLsEc3iFFa6LmRQz4tqZMmmDT4oPsvCNoWgg9wtLIcck9I
	0luvKb6ugEkOwsGw9ACOprsK/rUgldWxFlKOKiyfekM+Uji66zEgbacZZMkNXZ3Nr2NwbPGpSEN
	jQeZtjmnh91h0T4Tjpk5fZ6Z3ij90UkVMraoUYnF2P0pVmrN355aGKU4CchWUY631pZTuQPwFFZ
	E9NoCxrMuBdHtip04sxqBdo5AXE98j/T8SF3H9uKVqN4HCOOC2Sz0D57Mj+Vb8iiCuzOpuSdRTj
	WOaGekWoE+etDVscRg47uFO36b8pHCItgw
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr7470845eec.0.1795232485519;
        Fri, 20 Nov 2026 19:41:25 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([188.253.120.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm13879164eec.28.2026.11.20.19.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:41:25 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: jgg@ziepe.ca
Cc: kevin.tian@intel.com,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommufd: Keep group state in the attach handle
Date: Sat, 21 Nov 2026 11:41:18 +0800
Message-ID: <20261121034118.74460-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The attach handle is created per iommu_group and PASID by the device
that attaches, and it is freed when the attachment is replaced or its
last device detaches.  It stores a struct iommufd_device pointer,
which is the device that created the current handle.

That device can be unbound while the handle is still in use.  If one
device detaches while other devices in the group stay attached, the
handle is kept but its device pointer is left dangling.  A later MSI
setup on a remaining device reaches iommufd_sw_msi(), which reads
handle->idev->igroup and dereferences freed memory:

  BUG: KASAN: slab-use-after-free in iommufd_sw_msi
  Read of size 8 at addr ...
  Allocated by iommufd_device_bind
  Freed by iommufd_object_remove <- iommufd_device_unbind

The fault read path has the same problem when it composes
hwpt_fault::dev_id from the same pointer.

Store the iommufd_group instead.  It is reference counted for as long
as any device in the group is bound, and iommufd_sw_msi() runs under
the iommu group mutex, which also keeps the handle from being replaced
or freed during the call.

The fault path needs a device ID and there is no longer a device to
take it from.  Cache the ID of the device that created the current
handle at attach or replace time.  This preserves the existing choice
of ID while allowing the fault read path to use it after that device
has been unbound, so this patch alone removes every use of the stale
pointer.

Fixes: b7d8833677ba ("iommufd: Fault-capable hwpt attach/detach/replace")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 drivers/iommu/iommufd/device.c          |  6 ++++--
 drivers/iommu/iommufd/driver.c          | 11 +++++------
 drivers/iommu/iommufd/eventq.c          | 14 ++++++--------
 drivers/iommu/iommufd/iommufd_private.h |  9 ++++++++-
 4 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 1b0bdf57ac8a..43ee9610e6d1 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -581,7 +581,8 @@ static int iommufd_hwpt_attach_device(struct iommufd_hw_pagetable *hwpt,
 	if (!handle)
 		return -ENOMEM;
 
-	handle->idev = idev;
+	handle->igroup = idev->igroup;
+	handle->dev_id = idev->obj.id;
 	if (pasid == IOMMU_NO_PASID)
 		rc = iommu_attach_group_handle(hwpt->domain, idev->igroup->group,
 					       &handle->handle);
@@ -654,7 +655,8 @@ static int iommufd_hwpt_replace_device(struct iommufd_device *idev,
 	if (!handle)
 		return -ENOMEM;
 
-	handle->idev = idev;
+	handle->igroup = idev->igroup;
+	handle->dev_id = idev->obj.id;
 	if (pasid == IOMMU_NO_PASID)
 		rc = iommu_replace_group_handle(idev->igroup->group,
 						hwpt->domain, &handle->handle);
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index e4d17a748178..601a5aeced95 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -274,26 +274,25 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 
 	handle = to_iommufd_handle(raw_handle);
 	/* No IOMMU_RESV_SW_MSI means no change to the msi_msg */
-	if (handle->idev->igroup->sw_msi_start == PHYS_ADDR_MAX)
+	if (handle->igroup->sw_msi_start == PHYS_ADDR_MAX)
 		return 0;
 
-	ictx = handle->idev->ictx;
+	ictx = handle->igroup->ictx;
 	guard(mutex)(&ictx->sw_msi_lock);
 	/*
 	 * The input msi_addr is the exact byte offset of the MSI doorbell, we
 	 * assume the caller has checked that it is contained with a MMIO region
 	 * that is secure to map at PAGE_SIZE.
 	 */
-	msi_map = iommufd_sw_msi_get_map(handle->idev->ictx,
-					 msi_addr & PAGE_MASK,
-					 handle->idev->igroup->sw_msi_start);
+	msi_map = iommufd_sw_msi_get_map(ictx, msi_addr & PAGE_MASK,
+					 handle->igroup->sw_msi_start);
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
 	rc = iommufd_sw_msi_install(ictx, hwpt_paging, msi_map);
 	if (rc)
 		return rc;
-	__set_bit(msi_map->id, handle->idev->igroup->required_sw_msi.bitmap);
+	__set_bit(msi_map->id, handle->igroup->required_sw_msi.bitmap);
 
 	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
 	msi_desc_set_iommu_msi_iova(desc, iova, PAGE_SHIFT);
diff --git a/drivers/iommu/iommufd/eventq.c b/drivers/iommu/iommufd/eventq.c
index b8a54454dd17..3c3282fd5b93 100644
--- a/drivers/iommu/iommufd/eventq.c
+++ b/drivers/iommu/iommufd/eventq.c
@@ -83,11 +83,10 @@ void iommufd_fault_destroy(struct iommufd_object *obj)
 
 static void iommufd_compose_fault_message(struct iommu_fault *fault,
 					  struct iommu_hwpt_pgfault *hwpt_fault,
-					  struct iommufd_device *idev,
-					  u32 cookie)
+					  u32 dev_id, u32 cookie)
 {
 	hwpt_fault->flags = fault->prm.flags;
-	hwpt_fault->dev_id = idev->obj.id;
+	hwpt_fault->dev_id = dev_id;
 	hwpt_fault->pasid = fault->prm.pasid;
 	hwpt_fault->grpid = fault->prm.grpid;
 	hwpt_fault->perm = fault->prm.perm;
@@ -128,7 +127,7 @@ static ssize_t iommufd_fault_fops_read(struct file *filep, char __user *buf,
 	struct iommufd_eventq *eventq = filep->private_data;
 	struct iommufd_fault *fault = eventq_to_fault(eventq);
 	struct iommu_hwpt_pgfault data = {};
-	struct iommufd_device *idev;
+	u32 dev_id;
 	struct iopf_group *group;
 	struct iopf_fault *iopf;
 	size_t done = 0;
@@ -157,11 +156,10 @@ static ssize_t iommufd_fault_fops_read(struct file *filep, char __user *buf,
 			break;
 		}
 
-		idev = to_iommufd_handle(group->attach_handle)->idev;
+		dev_id = to_iommufd_handle(group->attach_handle)->dev_id;
 		list_for_each_entry(iopf, &group->faults, list) {
-			iommufd_compose_fault_message(&iopf->fault,
-						      &data, idev,
-						      group->cookie);
+			iommufd_compose_fault_message(&iopf->fault, &data,
+						      dev_id, group->cookie);
 			if (copy_to_user(buf + group_done, &data, fault_size)) {
 				xa_erase(&fault->response, group->cookie);
 				iommufd_fault_deliver_restore(fault, group);
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index eb2e85b27e42..6d02599ebd9e 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -589,9 +589,16 @@ struct iommufd_eventq {
 	struct wait_queue_head wait_queue;
 };
 
+/*
+ * Devices attached to the same PASID in an IOMMU group share this
+ * handle until the attachment is replaced or its last device detaches.
+ * Each bound device holds an igroup reference, so the group remains
+ * valid even if the device that created the handle is unbound.
+ */
 struct iommufd_attach_handle {
 	struct iommu_attach_handle handle;
-	struct iommufd_device *idev;
+	struct iommufd_group *igroup;
+	u32 dev_id;
 };
 
 /* Convert an iommu attach handle to iommufd handle. */
-- 
2.54.0 (Apple Git-157)

