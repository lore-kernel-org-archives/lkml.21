Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373108;
	b=s84nGoigbhraHz6sNrsYMo/NgNhuhiKoZmvMjtyZZa9/i7zcuuIAGlpczjz63mQFuTMC
	 urf4Hh7tijM1tqDQ7qWGa/afkcr7yLmGY+6MsTWfnVDWWHbO+MabaP+9ryvXYkWjq/w/N
	 pYa61LiI+8ULaOKB3EoVhT/Xglk4/Ir86ed01b3wxFDsLqCuvVZNMNKlT+CiHDMFrzGZQ
	 7mxDqNXvXdAKJ/Y4lWG2chrvRxJH3C+0glcSFiMKNF2IgvuZf8JDimYfIZFfGxKn/zhkQ
	 mYrQmAhhkc1f6ECakvch9ApgzFgxtFb6mlilgKhTE11F1tFXOtXlQhcrDfaJv/LFxiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=sy99F9v1h+ZocL+7gIZompqknwKF5VmSur7QJmb24aY=;
	b=4zs1mfMm4mtWej/UyHNAmT84YQ2Kgxhts55Mye1S4nP8dezefUx5u/EnFXn5ESOrAw/U
	 qf6BfWCVyY+TP8zb52D5+h1rL1t01Y1t7/QbX/isWe07wjANDu8DhzYQJJeEd1JzkeoB2
	 /Chd9+lhHLQoWqSiTDhbLd3Q0XkHv5sCumJAmwqfIju2/mVRVB1ah7AnSzbIf0YZh0yzK
	 co26tkGey2NgFnP9OnHicKGhr+uo+JNw96W+HwJ1wP051/Cszz1wIc+3UwMmOxVycA+b5
	 oECYwJfmeTdFLuoKTtFLyIlEUHnZmo6heRvVhkhBR6tz7NmNIH+7T05g1SqEVGZif7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TzSw80uw;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7C606A6A7
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB7C606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TzSw80uw
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so4198851a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373108; x=1795977908; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sy99F9v1h+ZocL+7gIZompqknwKF5VmSur7QJmb24aY=;
        b=TzSw80uwX5MiMn73p7p7eDKA1JC7Z26oBa94du3ZOj9q7dl+JXYCxA4V+WD8mf+Iul
         W7tlKKtg7/NrVgmO7UY0ju+SXv0+ukrlQagLoBV6vM3r4FBieQ7OfhlLEVb12DAEB4+z
         4xSXdQKBaX57qzW4G+nU+gM/88W2Yo71ZCq3wUPwqvmHkdrdcK25IGYNbGb1DMzbhZM5
         BwbKtc1qxuP1YkFeGkGXT9U4z/Ksi7XJ3G/7CUvnobrW0IG3DR3bG/s82MJVZqOvaNf/
         hPwDL3XWwVA2pzRKOMhCaITtqg5IrDzb/l86qOSRP1vgegPVSwnEJ8Hy/rS+X8CpfcTj
         QtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373108; x=1795977908;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sy99F9v1h+ZocL+7gIZompqknwKF5VmSur7QJmb24aY=;
        b=LpznP4h9MijTArmUT4BDcAMnepuZ4FfNROhIOenliRRbF7ByO9eHSICj9LcoNkK5t4
         82BXzu7KPdsk0L+aXNCcGA7Gcn5jr4+GG/1RkWFFK/BXBvzd+nM4Ew6q1hTSwWMhnLmQ
         GKTai0sUEr6MTlKypyb/h+LSJu4ntPI8f/vT342vs3hIhZPrMKso+pt2LMykDpguMQ2h
         aly40OBweqXxr5Hyt1MWf9tC/qEFNpbZK1GgJxLK/gFbVxWLebs2ykM2sEWIJmmtn7FV
         +irlJXC4PBC/EZNFZcbORuBaZd6p6FBgV9jGCAAOQ7tDBQMpH5J6Eiaxtl/Fp+oARYiX
         DZwA==
X-Forwarded-Encrypted: i=1; AL+hErGdv6e8kfafqhf0387b1c1CTfNx11eKit/sJ8X7/GZ9ezMqaMPpl1z5wHhPi4LxeXgIdJz56+Yh4GAt+Ik=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O/Gc4rKpzkFywKUYe8ZZKQX4EKtPMPJkqP5IJ4NVBRVIitets
	ldpVKo2dgD/9Pmu5y/u2u/Cnzjo9iUXgOxQnYMjz2hakDI4Q6EBMFOExz1yhABbd2vUgv51/FN7
	Qd8fqIuVZRPhk26jCEFGH+w==
X-Received: from pgbx7-n1.prod.google.com ([2002:a05:6a02:63c7:10b0:cdc:b85b:3d46])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:57cc:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b41c9b2d2emr9616562a91.10.1795373107406;
 Sun, 22 Nov 2026 10:45:07 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:42 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-9-jthoughton@google.com>
Subject: [PATCH v3 08/19] hugetlb_vmemmap: Expose whether HVO is enabled to
 architecture code
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Architectures that select
CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO may configure the
system at boot depending on whether HVO is enabled, e.g. arm64 may
require all CPUs to support hardware access flag updates only if HVO is
enabled.

Add hugetlb_vmemmap_optimize_enabled() so that they can check. It is
declared before <asm/hugetlb.h> is included, so that it can also be used
from inline helpers there.

It only reflects the hugetlb_free_vmemmap= kernel command line parameter
(and the sysctl, when writable), not whether the architecture supports
HVO.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/hugetlb.h |  9 +++++++++
 mm/hugetlb_vmemmap.c    | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 0d5414392d87..b2a6441bcd84 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -22,6 +22,15 @@ struct node;
 
 void free_huge_folio(struct folio *folio);
 
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+bool hugetlb_vmemmap_optimize_enabled(void);
+#else
+static inline bool hugetlb_vmemmap_optimize_enabled(void)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_HUGETLB_PAGE
 
 #include <linux/pagemap.h>
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 142f2975846b..fb6da64bd80d 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -452,6 +452,24 @@ static int __init hugetlb_vmemmap_optimize_param(char *buf)
 }
 early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_optimize_param);
 
+/**
+ * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
+ *
+ * This only reflects the hugetlb_free_vmemmap= kernel command line parameter
+ * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the architecture
+ * supports HVO (see arch_support_vmemmap_remap()).
+ *
+ * The value is final once early parameters have been parsed only if the
+ * architecture selects CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO;
+ * otherwise it may change at any time through the sysctl.
+ *
+ * Return: true if HVO is enabled.
+ */
+bool hugetlb_vmemmap_optimize_enabled(void)
+{
+	return READ_ONCE(vmemmap_optimize_enabled);
+}
+
 static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 					   struct folio *folio, unsigned long flags)
 {
-- 
2.56.1.809.ga0b61035b5-goog

