Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489052;
	b=Mt30fVLCThQqQtJWUl5QF5aZADHCV9BSaYQMCT5PmcUvBFw+2h8rAZ48/lVJGZaTTsHY
	 Wou/Hmr4DBJiQ3DEwe9+krvnBnFds+/6UavCDzDZWx95Tm1TLDCGYoxIp8xjHHsaVIBas
	 h19o4lBccROuwbCOg8PhRwCQ+iDBSCmr+h91gRC+CkFCXswOMvLYnmZntyijONxGsmaEp
	 d8JuE7qRlAoJo7INmNF9l4efzjwO/HjkQ8cLLe1HdYXVOa/ACQi6hG6Lm6vxLKy8C/ae0
	 RNK+JpOkQhT1qDaMrrPtMg0SWBG4zwbJSv4JRx7zSIu4hz59aH0SxmHnujxazxLTYJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H+uZoQjS1BIMRWiRpM7snGk69h3ThnDcheT6OPJs5xc=;
	b=T/bVaXNoLsvmCxYuVxMX6eJwXobJJVZG+E8/EP/5WddtZfPHc/MUTBMFqfoQBZ8WLdVj
	 90ZcphBiGO6jmbKB3mqR9yrH2bqa+A+k22omamv9dehWhAZdA/84KqozrOsul3g+qwYtH
	 nTFOnNZnOiWEtJzzKGq+/jXByd2qVFn3InCN0jXZ/dlL+UEwjfk9QmJEQ+MC92z97H+9/
	 ntQkQM7gwO+N7nh4/SlHq7zIq5SKCUKz0vT8p/VfVE/ajd9RkqacbaEvIlHkAgbeR8f5W
	 Mjv2Ug480VGvMVXlhmKYBIrl/67b7p6UWUjK/iWUmuP+32m9WSfHNhAqJnaegZs6JTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaeO0IKH;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C4C606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C4C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaeO0IKH
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f037bc348dso32405005ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795489050; x=1796093850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+uZoQjS1BIMRWiRpM7snGk69h3ThnDcheT6OPJs5xc=;
        b=UaeO0IKH5e7nNIcnmn+4W4A/rp4L2/9vASPuMnByH/OwsqKOctCGR9e/WrKAV18QkL
         YB6q7p24b//D0iRmjp0nRBoK7mdt85Bi87ggyC7dMVi/4F/8QMKst+cNmr8DIQdl74bK
         YOtB7LvAY4bx0tYfnITPg4vBkzaPa9nHHSkEtzd59o8IsKIA+eE+ZPopljSxE3MtYeyk
         /D5k7AIWwOaTKnTlQJz3we76+i0l9yu5NjGIN8sVhqAVJY6XXCYAiX2IgHXI14Xpuptw
         dEvTI7KIAVc7I/FjG+PlKV32AXjF0geaTxL3NjZdDWNbexppAhQcG2fBQwWwTYlFmQVW
         0QEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489050; x=1796093850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+uZoQjS1BIMRWiRpM7snGk69h3ThnDcheT6OPJs5xc=;
        b=RiNs5KMXhrN40uKGgWommeMxymBXGqc2VQNRIlbC29M4ediOxEltdztCOGLC5Iol00
         1uvmMsjy96+ZpEDLes9n9sA+cyh+dSxX3Y1+HHF0K9yKxwNLySo3z/6Cte/Ra0755BQf
         yUPTJ/Kx8rNpMkVofIGc1/bLWx56GfloEv8pLWb8XHt3TX8NXmghbTcv85g2wGILt+is
         42dUDpLxDSZ6bHWRIygQkcak9rBV0YkuFS3B9SOTQaq7um6g9S1sqGD7b93FnGqYC8yA
         +8i6wAle31osKD0Ep1UZXnDFGtMKQzZDPlejqLVaSMHJbM8/g+ZXZgHbnaDEgNb2GMeo
         RXuA==
X-Forwarded-Encrypted: i=1; AL+hErHOvxbUygiBxz65SkdCqk2cT2RybCnjgv536/V5vtEn63aa7j342yfengIXacnAY2Uw1dE5ecIvPBaKrU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MXeOUmEzwLMvLlwzKM8KDpXFlww7KHkEGq0gSZukiXGlNWfPN
	pVZOqVCsq00gppAl7xT6AjSt65Z7VTApj/E5nUErdZCvXSRCDZV8hByY
X-Gm-Gg: AZFdTZf5vOKpxRY9IzkwIMxQ1qEm7ohu+4WdAYSZ60DR+tbJIYQjRCDALU3W6I+y2p3
	0Gz+dQX8LLdtaXWbHGeU/tRuueCRTAtYkgJsmpwKCiH7+15ZomSjH79im9cSAUAH5qX3octpvel
	I3raA7MMb2EPqPUzOp6YTUNgLGxVsaCGgUl4ixdc1Nossee55ji793gs3IrPLNC5r6vD6K6UKPL
	bngAYzLW63YygEF+sNznHNCRpg7OVURkL6nfqUrjoJ90Jnq+diVHroBJukFKyrRuoKYyN86fKVG
	UzLPBY/svrwJDfxhcHaj3s3BlSzhFpYCSR+LfbHVJ35gQIBT3psAwS2VEDtAHeYa7yT41DU/izh
	JCJQPX369pdAkgUT7QKkksQleQv4ZPWkTp9Qa2tqpjM/0T9hgAYyn91vOAFMkIbnPc716StB5pL
	Y2h9aHfPe3Ovhx2VjZcBS5DBwqCB2rU12B+EAUjim5y80GG+Sa+3daNQjZ0HVwzU6tANDf5E6FW
	ZhwaWHAwfr5XJfwi7quZ/EKHsW512bzNxJT9Vm9Nt9Y6Q2ZKekhI4aJ4ce2U2Ix8m5QY1adJKdT
	JhhtDplNX6a+QYTUWbDy7JQ8WJ1GRY/pU6HOOvBxPZRRypJ3Z2GCr+g=
X-Received: by 2002:a17:902:f642:b0:2ef:da10:bea3 with SMTP id d9443c01a7336-2f03f1cf4c1mr135650875ad.11.1795489049823;
        Mon, 23 Nov 2026 18:57:29 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm60823275ad.9.2026.11.23.18.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:57:29 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [RFC PATCH v2 1/2] mtd: core: add per-device bounce buffer allocation helper
Date: Tue, 24 Nov 2026 10:57:21 +0800
Message-Id: <20261124025722.1476247-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124025722.1476247-1-leeonion.muyu@gmail.com>
References: <20261119090055.1255028-1-ping.li@horizon.auto>
 <20261124025722.1476247-1-leeonion.muyu@gmail.com>
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

Introduce mtd->allows_vmalloc_bufs and two helpers for the callers:

  - mtd_alloc_buf(): by default buffers come from
    mtd_kmalloc_up_to(), which gracefully reduces the size under
    fragmentation so that drivers never receive a buffer which is
    not DMA-able.  Drivers that only memcpy() the buffer, or which
    bounce it internally, may set the flag in their probe to get
    kvmalloc()'s vmalloc fallback instead, so the requested size is
    kept even when the buddy allocator is too fragmented to serve a
    contiguous block; this avoids degrading large transfers into
    many small ones.  The size reduction is intentionally not kept
    as a last resort for those devices: an allocation failure is
    reported to userspace rather than silently shrinking the
    buffer, so that the declared contract cannot be quietly broken.
  - mtd_free_buf(): the matching release, kvfree() based.

The flag defaults to false (zero-initialized) and partitions
inherit it from their master, so a driver which does not opt in
-- on the master or any partition -- keeps today's behaviour and
can never unexpectedly receive a non-DMA-able buffer.

No functional change yet; mtdchar is converted in the following
patch.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/mtdcore.c   | 44 +++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdpart.c   |  1 +
 include/linux/mtd/mtd.h | 16 +++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b170c3144ca8f..83365c0fbf063 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -2566,6 +2566,50 @@ void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size)
 }
 EXPORT_SYMBOL_GPL(mtd_kmalloc_up_to);
 
+/**
+ * mtd_alloc_buf - allocate a bounce buffer for an MTD device
+ * @mtd: the MTD device the buffer will be used for
+ * @size: requested size, updated to the size actually allocated
+ *
+ * By default (see mtd->allows_vmalloc_bufs) buffers come from
+ * mtd_kmalloc_up_to(), which gracefully reduces the size under
+ * fragmentation so that drivers never receive a buffer which is not
+ * DMA-able.
+ *
+ * Drivers that declared themselves vmalloc-safe (they only memcpy()
+ * the buffer or bounce it internally) get kvmalloc()'s fallback
+ * instead, so the requested size is kept even when the buddy
+ * allocator is too fragmented to serve a contiguous block; this
+ * avoids degrading large transfers into many small ones.  The size
+ * reduction is intentionally NOT kept as a last resort for those
+ * devices: an allocation failure is reported to userspace rather
+ * than silently shrinking the buffer, so that the declared contract
+ * cannot be quietly broken.
+ *
+ * Buffers must be released with mtd_free_buf().
+ *
+ * Returns a pointer to the allocated buffer on success; otherwise, NULL.
+ */
+void *mtd_alloc_buf(const struct mtd_info *mtd, size_t *size)
+{
+	if (!mtd->allows_vmalloc_bufs)
+		return mtd_kmalloc_up_to(mtd, size);
+
+	*size = min_t(size_t, *size, KMALLOC_MAX_SIZE);
+	return kvmalloc(*size, GFP_KERNEL);
+}
+EXPORT_SYMBOL_GPL(mtd_alloc_buf);
+
+/**
+ * mtd_free_buf - release a buffer allocated with mtd_alloc_buf()
+ * @buf: buffer returned by mtd_alloc_buf()
+ */
+void mtd_free_buf(void *buf)
+{
+	kvfree(buf);
+}
+EXPORT_SYMBOL_GPL(mtd_free_buf);
+
 #ifdef CONFIG_PROC_FS
 
 /*====================================================================*/
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ddded0dbe77e0..9c245ad421a55 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -75,6 +75,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	child->oobsize = parent->oobsize;
 	child->oobavail = parent->oobavail;
 	child->subpage_sft = parent->subpage_sft;
+	child->allows_vmalloc_bufs = parent->allows_vmalloc_bufs;
 
 	child->name = name;
 	child->owner = parent->owner;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e8300..4296d255c15d8 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -368,6 +368,20 @@ struct mtd_info {
 	 */
 	bool oops_panic_write;
 
+	/*
+	 * Low-level drivers that only memcpy() the data buffers received
+	 * from the MTD layer, or which handle non-linear-map buffers
+	 * themselves (internal bounce), may set this to receive vmalloc'd
+	 * buffers, keeping the requested size intact even under heavy
+	 * memory fragmentation.
+	 *
+	 * Defaults to false: buffers always come from
+	 * mtd_kmalloc_up_to(), which gracefully shrinks the size under
+	 * fragmentation, so drivers never unexpectedly receive a buffer
+	 * that is not DMA-able.
+	 */
+	bool allows_vmalloc_bufs;
+
 	struct notifier_block reboot_notifier;  /* default mode before reboot */
 
 	/* ECC status information */
@@ -699,6 +713,8 @@ struct mtd_notifier {
 extern void register_mtd_user (struct mtd_notifier *new);
 extern int unregister_mtd_user (struct mtd_notifier *old);
 void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size);
+void *mtd_alloc_buf(const struct mtd_info *mtd, size_t *size);
+void mtd_free_buf(void *buf);
 
 static inline int mtd_is_bitflip(int err) {
 	return err == -EUCLEAN;
-- 
2.34.1

