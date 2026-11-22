Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350022;
	b=BvPRdWwkPq0QoLJicVFMMCBxpJoNxZwmsktmf8IDSVJhsmvMnB/ykq46hccWH5OjNqd6
	 vevzg2Yq1fhuKV2u2IV8LpxT/FFEuefHkrzGX+sFr9fjmLeqbAQUf4rBTBAbLsgb6uhaK
	 VNr7jhyhvU9OGTLTXa+PoBHJN+I+fDXOi515XGH2C/5eQwma3xlf5tgRfcLtmAUMufCMR
	 6fnCiIeg13ihB9dUJXXT4ShV4XyiRXbLDFJYKMovvHMJQbGBOGV5ucT1qHEflD89hneyU
	 f7z4bOzAXYjWNHxTwbUxTmLqav3aeJiFLOEukeDM7w+SurFTAxa+H72XkXTPqNY4E0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HBuf3DEB5ZqlJpvGsQMe7eJ7vutfXuN9J2TgjKjXyjY=;
	b=fJjcyjitcBPLT6OqjVziY77ymdCuwQ2ebi+aDO/ava2XQuzGL76j3cudLWiIZlPwAXVM
	 LZF1rRBnMoOeteo4ujO0bRCpuknA/vlxUowdAJVtcn1Qw5cJ/XdOv9nHnRVmrcmlLhAsz
	 3mERw30eVS+aHN0/worN7glU7X9ufn0tcCkdPOBoHn9Q7W4ifpzx93X5YfPWiceobYcxm
	 NybDR1V6/CixyBtYxzzrbZc4z5xoZrz3mK0ARlz3hDnzLDoWVxTX22UNtMGraDbYVJMDL
	 ws8o9eK/oAOb3bAYbmPud/phl0/Uc6W6cP850opi16mFEMwg6/f1et5Vjxxs+y6D3jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uf90EpJA;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB3606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEB3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uf90EpJA
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8631e07b756so1166557a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795350021; x=1795954821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBuf3DEB5ZqlJpvGsQMe7eJ7vutfXuN9J2TgjKjXyjY=;
        b=uf90EpJAVSpFRpRE5y7+9rDwPqPb5Z0mfYHI5ulJumfzGF+f4CzcJBY/iKu29fmAYd
         UzFmdgG09XFVXEf95GCeOBfPb3L3LXOBG1jN2s8uAnj9Oro4r+8fVUOV3LR5hy7uZVxW
         0Bv1oR0Ahmv8AkBbOrsADBOKhYGSBC1TrH9WWIfc4cR1hSaj3iEqcfOYc5yfrvjZtRYI
         1MDwWwn29HdCcWLOp0EgmJEFdRuAaVWD6gBaLdxN4dB7kNDtKL5aWxnVnFxEEItnahr+
         liy1sgoP2IXMG8UEDXeFXHm5ONhZ29R+1D7P4vO4xzUcX1Y4uwCOyv255cOwXZmYGK0d
         BW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795350021; x=1795954821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBuf3DEB5ZqlJpvGsQMe7eJ7vutfXuN9J2TgjKjXyjY=;
        b=i9CMaNfOmAMIucP1mpxzL3JbshxqtxAuI56cCDOj6Kt8IwYLbVCRk87q7y3Qb13Q0W
         8PfByczQqJSUZcvWqpcXL/WfWr3VNCR8KPam+I4nLB+DPh6WmBxRu6N4Nb7TQjgwE9MV
         Z6190ZIeHJeg4EYHSmNzGdIPZB6s4rDsoBHChedaXPjOMSQctZ5vLZsD3z4jqsOudEnl
         Zttg2uLak3cBiEjOAzjDjL5vmwqJyAz4MVB7S+3d1lLnZXWc1Lufc5/dpC8aWNCzz3bo
         XxRVIKmav2oiK8GdQV41nmXx8rIX/fiSJMtm4sOh2g4K67NLTp19KkV75C1jzaPzYGsi
         53lQ==
X-Gm-Message-State: APuU4Z+sgLbqMr1HUmnnNzMuqb0mySujx7BphOICpAW95HyTXAGRL0Ge
	NW+bExf5PHEwzZHN96AUEAosvFbO/xVl3QlEBSvc80/0gOcMwbWHoXEm
X-Gm-Gg: AZFdTZc5O+92W2HAAAsYlLw6FLNO9NXoWUCzP7XUgkcGdC7NPuX3RBptCOsxGK2Zmop
	KUyUTZXBQY8sBp58rP2BxGVCL/L4ogJMzkIRBOgQqaVsJGYtc7KhTt6x5fbDo96OAKJGbnkUgG1
	zMTCxNoRWTNW7ez4E0CoFHXSKBF1yOjGXde/LNPE0aWcu/V5fHdAeiSOhA2JSQIPJF8sPR8QiRi
	so+wJOpdwd3IslJ/qgODff+/pdioK21Gke3Ot2dVr9dJ/00Kx+DvBsS5qAuI0B2JONZo1l25+o9
	zWg65B3KMqcsuI1GIjf3cA6/ONs4kDlh9kkoN4axYwViVLtcJOtBnUqSd9iX27qD7AE8LZZm8zo
	TjO4nkgxY9KdtnYuIoDwSXeut/QDvXQfUBZJpncosKJHdgEPkyswgRzIMaUAuR2JXcHezrJUF97
	NX28yQrEgUM6ae43g5bY8FWo6Ki9CbK3Rxo7PvLGRMVi+VT6XHX09mtGY8h1Q2Op/uo8PgtQ8RN
	XL5bRGaBecK163CmLoyjNFuBWj7nWO8eRcAdmn3SGXGXrJCYR8+A7TomyapSmEsmwlKdI2+6BaA
	4XH7vPV/d3qe3XVPMRQqfZS4CbKpCauinwR2QHQ7Y9w=
X-Received: by 2002:a05:6808:1305:b0:4c4:d8a0:2773 with SMTP id 5614622812f47-57a0a9142cfmr9672467b6e.32.1795350021271;
        Sun, 22 Nov 2026 04:20:21 -0800 (PST)
Received: from localhost.localdomain ([121.134.184.225])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35655a5bsm6734024b6e.13.2026.11.22.04.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 04:20:20 -0800 (PST)
From: Unsung Lee <unsung0317@gmail.com>
To: linux-cxl@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>
Subject: [PATCH] cxl/port: Do not queue a memdev detach when the memdev unbinds itself
Date: Sun, 22 Nov 2026 21:20:14 +0900
Message-Id: <20261122122014.2194208-1-unsung0317@gmail.com>
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

Binding a memdev to cxl_mem right after unbinding it often fails: the
probe returns -EBUSY, or the bind succeeds and the memdev is unbound
again a few milliseconds later. In the second case the bind write
returns success, so nothing tells userspace that the device ended up
unbound.

cxl_endpoint_port_probe() registers schedule_detach() as a devm action
of the endpoint port, so that a memdev whose endpoint port, or a port
above it, goes away is detached. Unbinding cxl_mem deletes the endpoint
port itself (delete_endpoint()), which runs that action too and queues
cxlmd->detach_work although the memdev is already going away.
detach_memdev() later calls device_release_driver(&cxlmd->dev), which
takes the device lock and releases whatever driver is bound at that
point. A bind that runs before the work makes cxl_mem_probe() fail its
work_pending(&cxlmd->detach_work) check with -EBUSY. A bind that is in
progress when the work runs is released by it as soon as it completes:

  bash     echo mem0 > unbind: cxl_mem removes endpoint2 and its decoders
  kworker  detach_memdev(): device_release_driver(mem0) waits for the lock
  bash     echo mem0 > bind: cxl_mem_probe() returns 0
  kworker  releases mem0 again, endpoint2 and its decoders go away

Mark the memdev while delete_endpoint() removes the endpoint port and
skip the detach in schedule_detach() then, dropping the reference the
work would have dropped. A memdev with ->attach still gets the detach,
since there it releases the parent device, which depends on the
memdev being attached. Losing the endpoint port or a port above it
otherwise still detaches the memdev as before.

The problem was found by an automated test harness driven by an LLM
coding assistant. The analysis and the fix are my own.

Fixes: 8dd2bc0f8e02 ("cxl/mem: Add the cxl_mem driver")
Signed-off-by: Unsung Lee <unsung0317@gmail.com>
---
Question: is the detach meant to be queued on a cxl_mem unbind too? For
memdevs with ->attach the patch keeps it, as there it releases the
parent; I have no such device to test.

Reproducer, as root in a QEMU guest with one type3 device
(-M q35,cxl=on,cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=8G
 -object memory-backend-ram,id=vmem0,share=on,size=8G
 -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1
 -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2
 -device cxl-type3,bus=root_port13,volatile-memdev=vmem0,id=cxl-vmem0):

  M=mem0; D=/sys/bus/cxl/drivers/cxl_mem
  for i in $(seq 40); do
          [ -e /sys/bus/cxl/devices/$M/driver ] || { echo $M > $D/bind; sleep 1; }
          echo $M > $D/unbind
          echo $M > $D/bind 2>/dev/null; rc=$?
          sleep 1
          [ -e /sys/bus/cxl/devices/$M/driver ] && s=bound || s=unbound
          echo "bind rc=$rc $s"
  done | sort | uniq -c

Without the patch 7/40 and 11/40 fail on cxl/next 32af781935 (2 of
the 11 with the bind returning 0 and mem0 unbound after), 14/40 on
v7.3.1.

With the patch on cxl/next (release and KASAN/lockdep builds) and on
v7.3.1 (KASAN/lockdep): 120/120 stay bound on each kernel, unbinding
the endpoint or host bridge port still unbinds the memdev, and 3
minutes of racing memdev and port unbind/bind gave no warnings.

Not tested: memdevs with ->attach, switches, real hardware. Regions were
only checked on v7.3.1: cxl/next creates no root decoder for QEMU's
CFMWS (restrictions 0x2f, "cannot have both HDM-H and HDM-DB").

 drivers/cxl/core/port.c |  3 +++
 drivers/cxl/cxlmem.h    |  2 ++
 drivers/cxl/port.c      | 14 +++++++++++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/cxl/core/port.c b/drivers/cxl/core/port.c
index fffcb9954d..4960a288a1 100644
--- a/drivers/cxl/core/port.c
+++ b/drivers/cxl/core/port.c
@@ -1514,9 +1514,12 @@ static void delete_endpoint(void *data)
 
 	scoped_guard(device, host) {
 		if (host->driver && !endpoint->dead) {
+			/* @cxlmd is going away, see schedule_detach() */
+			WRITE_ONCE(cxlmd->unbinding, true);
 			devm_release_action(host, cxl_unlink_parent_dport, endpoint);
 			devm_release_action(host, cxl_unlink_uport, endpoint);
 			devm_release_action(host, unregister_port, endpoint);
+			WRITE_ONCE(cxlmd->unbinding, false);
 		}
 		cxlmd->endpoint = NULL;
 	}
diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
index 4cf8a0f6cf..0d566b8e32 100644
--- a/drivers/cxl/cxlmem.h
+++ b/drivers/cxl/cxlmem.h
@@ -41,6 +41,7 @@
  * @cdev: char dev core object for ioctl operations
  * @cxlds: The device state backing this device
  * @detach_work: active memdev lost a port in its ancestry
+ * @unbinding: the endpoint goes away because this memdev is being unbound
  * @cxl_nvb: coordinate removal of @cxl_nvd if present
  * @cxl_nvd: optional bridge to an nvdimm if the device supports pmem
  * @endpoint: connection to the CXL port topology for this memory device
@@ -58,6 +59,7 @@ struct cxl_memdev {
 	struct cdev cdev;
 	struct cxl_dev_state *cxlds;
 	struct work_struct detach_work;
+	bool unbinding;
 	struct cxl_nvdimm_bridge *cxl_nvb;
 	struct cxl_nvdimm *cxl_nvd;
 	struct cxl_port *endpoint;
diff --git a/drivers/cxl/port.c b/drivers/cxl/port.c
index 96fade0299..092b138827 100644
--- a/drivers/cxl/port.c
+++ b/drivers/cxl/port.c
@@ -26,8 +26,20 @@
  * PCIe topology.
  */
 
-static void schedule_detach(void *cxlmd)
+static void schedule_detach(void *data)
 {
+	struct cxl_memdev *cxlmd = data;
+
+	/*
+	 * A detach queued while @cxlmd unbinds itself would run after it
+	 * and could release the next binding instead. With ->attach the
+	 * detach releases the parent, which still has to happen. Read
+	 * without the host lock when the endpoint port is unbound directly.
+	 */
+	if (READ_ONCE(cxlmd->unbinding) && !cxlmd->attach) {
+		put_device(&cxlmd->dev);
+		return;
+	}
 	schedule_cxl_memdev_detach(cxlmd);
 }
 
-- 
2.34.1

