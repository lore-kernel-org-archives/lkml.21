Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386049;
	b=RF2wqWasUvlal55Wzgqg69YVrIRd2BxCjInuVMTfkNyOr9TmJZoy82gu6TYMSRwTVR9K
	 GZ85Xxh0GqHAIVuzO4ZiSaQDNPDfdsRzjKrqgcDuJcHjBh4wnNvVyIVODCvG0YO7mPoqh
	 DqAkUxVziv53xXQG/oBtX21RTj4XH4VEhA74lA1kKlsisvWVsitFdY50qcpnmzazNnxfn
	 NNoDGxr2iNLBKYty2FcTfGyCbhCnxbPgTtzWFcQuywV7TiESEnvdeS8wHWivToYbpn+cg
	 CQanONc19HwDnsve9bL2Gy9PHES6amTrKwb/IUxXx5uuhPqkqOXwUrO15vf75IVNhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386049;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=lc6fUtsCWmeV+5/+DCrLem52MZY6l2sSFs8DDA0bUS0=;
	b=a3DBEZHbRkKw4InnHVCy/GYC4JXvoivjsy6Kx+ZKpryxrXjifUaAeVQ/p/43S76vkcyi
	 TJ6ivLRVnvujtusm4cRhQyoQsqnhO5vUVWC5o0CATEBibtRNRHEEdy+kH5eZY02hNt4Ql
	 eYaGq1cKuEW/OuehXnoxFERncQSQ61Y4+Iqf8hHgq1H7O+AqeoPk6QfgobjWVpc/dGVFQ
	 Hu1clVsQomaGuLQ/2Fi+N3qML6wFUz6bvL7RhxyNKr8k3PsX99A0bgaAP9lYE1E2d+z47
	 Q41pL6SZ+qQnvvibplQmJ/qNTu7MpigNw+QKVskX6iMTSx+dq6xQry17pxnrXZHCtgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Lh82JeeL;
	arc=none smtp.remote-ip=91.218.175.186
Received: from mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B8606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Lh82JeeL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UYOxhiiES+py02IgKFMURgWV6dfWF2tHLsN1Lp7J5FQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795386046; v=1; x=1795990846;
 b=Lh82JeeLemmM0UYjtA/NFJZxNWK91MVjMZukChWSlaMtTjaOHk8l6ryx7EDFzvlyQGT28vWe
 PXneeVJXf5ZIjVIXIGfceD/XJTnEknxqiVWmJT0GbImwalz4TlQA1ZFx5pPQN0zBaFGaU9mi4LS
 mPG5F6wMZjn7M1pUKAVOu5uU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f9332ef0a593abfd;
	Sun, 22 Nov 2026 22:20:46 +0000
X-Mizu-Trace-ID: f9332ef0a593abfd
X-Migadu-Flow: FLOW_OUT
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Date: Sun, 22 Nov 2026 15:20:27 -0700
Subject: [PATCH v3] mm/ksm: prevent zero-page remapping during
 ksmd-triggered THP splits
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-b4-ksm_fixv2-v3-1-f78ea7779746@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbU07YiOuvIchhtJBRgVMCw2G9
 O4WXJvM5uX//2YBT47JwzlbwFFgz0Of4LDLoG6r/k6CbWJAiVpJPAqTi6fvbg3PAQWaRmqkAot
 cQ5q8HaVg013LH/vJPKgeV8faaNmPg/ts/wKuvT/qdFKcjFaVlXmhGnV5cT/Ne0sByhjjFywnx
 0m6AAAA
X-Change-ID: 20261025-b4-ksm_fixv2-2bf062e92946
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usamaarif642@gmail.com>, 
 aarcange@redhat.com, "Nico Pache (Red Hat)" <nico.pache@linux.dev>
X-Mailer: b4 0.17-dev

Since commit b1f202060afe ("mm: remap unused subpages to shared zeropage
when splitting isolated thp"), splitting an anonymous THP remaps all
zero-filled subpages to the shared zeropage via TTU_USE_SHARED_ZEROPAGE.
This flag is set unconditionally for every anonymous folio split,
including splits triggered by KSM.

When KSM is enabled with THP=always, this causes two regressions:

1. use_zero_pages=1: KSM calls try_to_merge_one_page() which triggers
   split_huge_page(). The split remaps all 512 zero-filled subpages to
   the shared zeropage at once, freeing the entire 2MB THP when KSM only
   intended to process a single 4KB page. This bypasses KSM's
   pages_to_scan rate limiting, causing ~1GB to be freed almost
   instantly.

2. use_zero_pages=0: The same split side-effect occurs through the
   stable/unstable tree merge paths. Each pages_to_scan iteration
   triggers an expensive split_huge_page() that silently frees 2MB,
   while the scanner wastes cycles on tree searches for zero-filled
   pages that were already freed as a side-effect.

Introduce current_is_ksmd(), to check if the current task is the KSM
thread. Use it in try_to_map_unused_to_zeropage() to skip zero-page
remapping when the split is triggered by ksmd. Allow remapping during
reclaim running in ksmd's context.

Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
---
This patch fixes a bug in KSM where the pages_to_scan limit is
bypassed and the policy (use_zero_pages) is ignored.

Commit b1f202060afe ("mm: remap unused subpages to shared zeropage when
splitting isolated thp") added zero-page remapping when an anonymous
folio is split, including splits triggered by KSM.

Skip zero-page remapping when ksmd triggers the split, while allowing
remapping during reclaim running in ksmd's context.

Changes in v3:
- Drop the patch gating zero-page remapping on shrink_underused.
- Allow zero-page remapping during reclaim running in ksmd's context
- Add a comment explaining the ksmd check (David Hildenbrand).

V2: https://lore.kernel.org/all/20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev
V1: https://lore.kernel.org/all/20260609114619.144416-1-npache@redhat.com/
RFC: https://lore.kernel.org/all/20260508170509.640851-1-npache@redhat.com/
---
 include/linux/ksm.h | 6 ++++++
 mm/ksm.c            | 5 +++++
 mm/migrate.c        | 8 ++++++++
 3 files changed, 19 insertions(+)

diff --git a/include/linux/ksm.h b/include/linux/ksm.h
index a0d358a1feb6..23c8e9f60118 100644
--- a/include/linux/ksm.h
+++ b/include/linux/ksm.h
@@ -17,6 +17,7 @@
 #ifdef CONFIG_KSM
 int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 		unsigned long end, int advice, vm_flags_t *vm_flags);
+bool current_is_ksmd(void);
 vma_flags_t ksm_vma_flags(struct mm_struct *mm, const struct file *file,
 			  vma_flags_t vma_flags);
 int ksm_enable_merge_any(struct mm_struct *mm);
@@ -144,6 +145,11 @@ static inline int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 	return 0;
 }
 
+static inline bool current_is_ksmd(void)
+{
+	return false;
+}
+
 static inline struct folio *ksm_might_need_to_copy(struct folio *folio,
 		struct page *page, struct vm_area_struct *vma, unsigned long addr)
 {
diff --git a/mm/ksm.c b/mm/ksm.c
index d24b129932bf..60656b05419a 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2873,6 +2873,11 @@ static int ksm_scan_thread(void *nothing)
 	return 0;
 }
 
+bool current_is_ksmd(void)
+{
+	return kthread_func(current) == ksm_scan_thread;
+}
+
 static bool __ksm_should_add_vma(const struct file *file, vma_flags_t vma_flags)
 {
 	if (vma_flags_test(&vma_flags, VMA_MERGEABLE_BIT))
diff --git a/mm/migrate.c b/mm/migrate.c
index 65869b8acec5..b0949f43ed5c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -305,6 +305,14 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 	if (PageCompound(page) || PageHWPoison(page))
 		return false;
 
+	/*
+	 * When a split is triggered by KSM, let KSM take care of scanning for
+	 * and deduplicating the shared zeropage. Reclaim in the ksmd context
+	 * should still be able to reclaim zero-filled pages.
+	 */
+	if (current_is_ksmd() && !current->reclaim_state)
+		return false;
+
 	VM_BUG_ON_PAGE(!PageAnon(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(pte_present(old_pte), page);

---
base-commit: 2dc60bd9975fc8666a13d58410499e06e6799ba9
change-id: 20261025-b4-ksm_fixv2-2bf062e92946

Best regards,
--  
Nico Pache (Red Hat) <nico.pache@linux.dev>

