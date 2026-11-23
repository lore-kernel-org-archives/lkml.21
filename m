Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445573;
	b=osX+f/H92/I4JArzfx/GWyl3Dl3sjPUdSRoNGEBpuXRq4DhzVZqae0s6+e3NpNIECnG0
	 Aw8c94Abi4oUnPoWCtBM2c5wHC655lu3ZVXA8VKO1Lv4/X2YBy8UMgAMnoUdy8+PLbvzC
	 C8D7KSlkwuy4RHky1OP0xKDFae+46yJ25bT9pJOKHXx/QxLUjWLoQE+sLwjycbe2p70tJ
	 1TaFCLWDhf4uBofzXdljVa4arm4RXuxXCeRb5T4s+L/6cWWr+E3ALdyBh7AUkePHsP54W
	 IogufbmoJ9/HAEZyI3Fj976jByWmTjktQiXu2JHYSmdI+XNT/wiZUboqmzT2YEI+w6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=my/e9rVRY0PZrp8Qn9WyVLOhcF3tGqiKq2YRoFGvX+Y=;
	b=QfUuMFYkOlN/A9WwRc+RCzSCD3zeU6dXI/mCcNqsVrJvXOrKqU/cnwfkV07lnZ/xdUBE
	 NNaPfKRUUnl6y8My+X9XWRhuqznmqnmaoQxQ51hk3v14YF3X6T7h/5cxNzr8UTBe98pSH
	 nNLLtgOdmyB4mZsAFk+orhEAOinCDBp00oWyEeVYTibVejF4RJwqQBLXp3I8czPcblsiG
	 eCJx0hcYXaqkLpSxxunheIi+FMIpAVky5MPR4rM+CGDSsjCphGfxs6OX39F56My0UAuAJ
	 Sdakta6g93cmnnnOtcAkBF+DOw29U98+io9qKLIxlvFKUZKiYwJOxXgi3HqURIasyvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qc0S6699;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C5606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qc0S6699
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-862b3a39d0dso1686030a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445572; x=1796050372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=my/e9rVRY0PZrp8Qn9WyVLOhcF3tGqiKq2YRoFGvX+Y=;
        b=qc0S6699MGS7RYfZu3v1TouzhTqr/zOF/BBu0V9fonsw0Qw0yLtdbHeLIOcFQ8wHKd
         R0QQQNhL7IAJDxUbzsTR+EciasKsB6PSaAlo0jf1wsRU48kxrtiTpKAEgwa7myzsB2vS
         hO7CIzDupE84yX3umPIp9I5QLrYX0zTR4QzhC9WC4Oa/STjMTLdIY16lugOSmHB8ugSG
         GBJpBlwOpiVM1DaVENaSzYwEaqGpCwR/0oUY38/N7DBwMTh1PdQhsloi3pdKPFhu06DV
         S+6KJMyGz7WqC0a7ywskb2/7amZFAuRLEvUY+pGHF/cv0U1TJkhpJiOdvc+PHdlAknFU
         uYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445572; x=1796050372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=my/e9rVRY0PZrp8Qn9WyVLOhcF3tGqiKq2YRoFGvX+Y=;
        b=FFLxGZ9Tm8UcHMnnfcxXST1mhRn6FC1VY3lka5faKPe+v4/ULzSZHnVAloaQCXkeq4
         0jg32PmSz2yis+31gF6Jt9s3OdR9nTUA4B3tkUTKUS3E/zn7pYaXOEYlZYi+VQgqrXHZ
         4sIhsJcoUgisILdq58pJdLhWcj4M3AAd8r1AVy2p/RutPuFHty83trmdOlsn0SosU8Sq
         3d/pfxQqugjbeEeWs6fHv7syU0o7OhQBaubmZYvZoJ8os/rDnYWBS2YoMtXgvF9DQCjF
         lKjgEilovpcK+VUymu9c8gXHWiJTPxLJ8bum2qb89jhhDpO+B7K43DgRMfPQONjTNKQT
         P8lw==
X-Forwarded-Encrypted: i=1; AL+hErEgwTLrBJq/hfExWsMN2WmdOmlHI9lliAtTyLuq3C3mSsKJLHgNeoTtp/Bw9dmnu9Zdu+v6GuNuV9jkekI=@vger.kernel.org
X-Gm-Message-State: APuU4Z91xOx6EX6qFjkwLxkAPzXWbnqqvbgBYh2H//O1Zft7xu6e0Ty/
	mnuUQQbvH5kS6mxM6yMEdc2hYA13qrQgLfctAuedfYEwQDoYfHBXHlxq
X-Gm-Gg: AZFdTZeL2K53Bw5Bv/RYFNXA9LuK8/4VzBAB+IT75tT6QbKOkU6vPq4xyo2Cltl3gVV
	m6WjaHX1LZiIdC6a5QsuOluUJnAR09z7WicUrjaVVNC067VD0gTRa6Y/HFuPzOsWDPcLR7OEAjj
	w6ENc6gxX/BAqSbQiNWYGjkIacnamQS02VksqywWUpylZAU2TRkkCg6ltxt1Q9ZFIliRX4Xd8b0
	ZlUmJkLIe8hlmFM+B3pTVivmzJzjGdfjAUmkBC+lCGMtA6npARfHZrJ2oKnsVBRlvIucRhnS6Im
	LVVhHgSh5cGyQmMfT59kytVhEWAtHvH5mHFyGwsDHViQH3fc83Jbi5cqo+howfoqsNCEVsJGKvw
	HCdifZl6Xkch5FwMBZT23DOZsP914R1JK0I5q2vbVgjxipYLLS7lnvUY/mIj6Vr1hQeoS6mb0LG
	jvC/KvPmfjrE3W8bezROp51WXgCYljQcKgkVlg/mX04Y4vkvcOdvGk5VDmQddXoQwBcaYArBLhY
	aw9hSWj8BqS8syyaB7KDroKVu3Mu4Y4XhrLHvRnj4txsbdedDMz4fhNFHU/skYy4O2UfnsslAuY
	IOaVluZbBYUA0HwELCqs+DHrgmGy0obOZngHeD/krfCmz8fL+/ZrhKDtZPykhDNFecFBFZ7xMMI
	4vwJUu72Fr4H09K6qhvno1A4zRiwyRMOOF8b1kylKW7srUHI0Havc2vzVCWdJSWGGpG8=
X-Received: by 2002:a05:6830:4103:b0:81a:9522:f00f with SMTP id 46e09a7af769-863158f0dbfmr13041034a34.6.1795445571585;
        Mon, 23 Nov 2026 06:52:51 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dde05sm9169376a34.13.2026.11.23.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:52:50 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] misc: vmw_vmci: Leak queue pair endpoint if detach fails on exit
Date: Mon, 23 Nov 2026 14:51:57 +0000
Message-ID: <20261123145248.194039-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
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

When the VMCI guest device is removed, vmci_qp_guest_endpoints_exit()
asks the hypervisor to detach each remaining queue pair and then frees
its queue pages with qp_guest_endpoint_destroy(), even if the detach
hypercall failed.

If the detach fails, the hypervisor may still have the queue pair, and
the peer may keep writing to the queue pages after they have gone back
to the page allocator. The device reset that follows in
vmci_guest_remove_device() comes only after the pages have been freed.

qp_detatch_guest_work() already handles the same failure by keeping the
entry, because the peer "might still be accessing the shared memory",
and leaves the cleanup to this exit path, which then frees it anyway.

Leak the endpoint instead if the detach fails, and warn with its handle
and the detach result so that the leak is not silent. This also keeps
its handle in the resource table, so the handle is not given to a new
queue pair while the hypervisor may still have the old one.

Fixes: 06164d2b72aa ("VMCI: queue pairs implementation.")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
v2:
- Reworded the comment above vmci_qp_guest_endpoints_exit() as
  suggested by Vishnu.
- Added a pr_warn() with the handle and the detach result when an
  endpoint is leaked (Vishnu).
- Rebased on current mainline (8dac6df92a2e).

v1: https://lore.kernel.org/all/20261106034419.134545-2-oss.patchbox@gmail.com/

Compile-tested only (x86_64 with VMWARE_VMCI, W=1); I do not have a
VMware setup to test it on.

 drivers/misc/vmw_vmci/vmci_queue_pair.c | 27 +++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index ceafda4bf32f..f90d99b14128 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -2387,30 +2387,45 @@ int vmci_qp_broker_unmap(struct vmci_handle handle,
 }
 
 /*
- * Destroys all guest queue pair endpoints. If active guest queue
- * pairs still exist, hypercalls to attempt detach from these
- * queue pairs will be made. Any failure to detach is silently
- * ignored.
+ * Destroys all guest queue pair endpoints. If active guest queue pairs
+ * still exist, hypercalls to attempt detach from these queue pairs will
+ * be made.
+ *
+ * If a detach hypercall fails, the hypervisor may still have the queue
+ * pair's pages mapped. Freeing them can cause a use-after-free bug if
+ * the peer continues to access the pages. The endpoint is therefore
+ * intentionally leaked instead.
  */
 void vmci_qp_guest_endpoints_exit(void)
 {
 	struct qp_entry *entry;
 	struct qp_guest_endpoint *ep;
+	int result;
 
 	mutex_lock(&qp_guest_endpoints.mutex);
 
 	while ((entry = qp_list_get_head(&qp_guest_endpoints))) {
 		ep = (struct qp_guest_endpoint *)entry;
+		result = VMCI_SUCCESS;
 
 		/* Don't make a hypercall for local queue_pairs. */
 		if (!(entry->flags & VMCI_QPFLAG_LOCAL))
-			qp_detatch_hypercall(entry->handle);
+			result = qp_detatch_hypercall(entry->handle);
 
 		/* We cannot fail the exit, so let's reset ref_count. */
 		entry->ref_count = 0;
 		qp_list_remove_entry(&qp_guest_endpoints, entry);
 
-		qp_guest_endpoint_destroy(ep);
+		/*
+		 * If the detach failed, the peer may still access the
+		 * queues, so leak the endpoint.
+		 */
+		if (result >= VMCI_SUCCESS)
+			qp_guest_endpoint_destroy(ep);
+		else
+			pr_warn("Failed to detach queue pair (handle=0x%x:0x%x), error: %d, leaking it\n",
+				entry->handle.context, entry->handle.resource,
+				result);
 	}
 
 	mutex_unlock(&qp_guest_endpoints.mutex);

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1

