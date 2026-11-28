Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873786;
	b=pIPQv7PajFfHmFJLrEaLJAp7L6vM4WwZmcUSa8qgqmCh32j2x9pt/s7AErus7ozxnn2n
	 ZcRvqq6j/NdvbbschjPtIpl4S5sjL25QLTrgWOwcQ9CrH7yfoyYkq155vITA0vUUkdxcF
	 oKLaAdFXW/2bXDZ/aTh9nmiJn3KEt1R3DL8wRGMHHL+KtO8fl4xTY6X/vy9mQpTkK8bgJ
	 z1xCArvzGoqpcgc2QI0//m08FWaojrxgtHInhpdK/0TxXpY8G6dFHPm+Z3UFM5upEYajU
	 KI1xBsLTeIqIcsowilw4tt6Uq3NbwncupKUm+6tN/kouqQgx6kc+AGG+ZUcfr2QS7Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873786;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=0XRj/5ylRTKZDnOisrYrKBufdMEybEnbGLZKnqy/h20=;
	b=QqcGBQT7HO2oI0eOU6rS3VoTq58r/JhLND2Or7r2Y6+wdIVr81NDDyZTKlgif/3Ntclp
	 +MfgEEOFzN9PwGtNWtFllXQLdTBA0wRoen9hMN2FUbBZ8q6gtVOfryPHsVKVPoyJhkYJy
	 yiZzglZ3e0rHPP5H5EeW0SL1u4R/qM41QlBfs1qkD8aWkO48vrd1jkCRilsqGkufIbBaX
	 2kA0UZQ8z4RHZ3ojeNB9YPhZvvFb3aMlta3WqpoS2tLRDW0UuvXD9tHIUB4xs+Qy4c015
	 2QwCPBXl7I9hYH+QUGIrYtMgO+KDuQYmxr0SDT8MbdUJHlMQG/C6yuyPvsljYT1wjRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=StRtmFZG;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A145606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A145606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=StRtmFZG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0X
	Rj/5ylRTKZDnOisrYrKBufdMEybEnbGLZKnqy/h20=; b=StRtmFZGkYAsJiPPYD
	sviE2oqhrCJv2fSs1fBFeTe8OpFwlsneYgDllCHxAEFIAyddf41538bg/SLmm512
	Uo0saejkh1vV2JYU1ON09/xDMBy9mGFJ/ryVpoW0tjNd3PVuGtat0ug5/+CwE7+P
	oVS8h+vFu7D6gI2mB2YUnVhgA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3D9fH2wprmd2MKg--.54225S2;
	Sat, 28 Nov 2026 21:48:55 +0800 (CST)
From: albin_yang@163.com
To: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com
Cc: nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	albin_yang@163.com,
	albinwyang@tencent.com
Subject: [PATCH] mm/swap: skip devices without SWP_PAGE_DISCARD in swap_sync_discard()
Date: Sat, 28 Nov 2026 21:48:10 +0800
Message-ID: <20261128134810.3203203-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
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
X-CM-TRANSID:_____wD3D9fH2wprmd2MKg--.54225S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4fAryDCFy5Zw47XryxKrg_yoW5Cr4Dpr
	sIgasYka1UWrySkw4UZr4xWryrW3ykCF45Jr15Cr4a9w1fGry3GrWvk3W7try5Krs3GFZ8
	WFWvqasrAF4jkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRdgA5UUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbC8AeFKGsK28fIbwAA3A

From: Wei Yang <albinwyang@tencent.com>

swap_sync_discard() walks swap_active_head and, for every device, drops
and re-takes the global swap_lock and does a get/put_swap_device()
round trip.  A device without SWP_PAGE_DISCARD can never make this
function return true, because swap_do_scheduled_discard() is only
reached under that flag.  For such devices all of that work is pure
overhead.

Skip them without dropping swap_lock.  A skipped device cannot affect
ret or any global state, so folio_alloc_swap() behaves identically.
Holding the lock keeps 'next' on the list (plist_del() takes the same
lock), so the plist_node_empty() re-check below is unnecessary here;
visited devices still unlock/relock and re-validate as before.
SWP_PAGE_DISCARD is only set or cleared at swapon/swapoff time.

We backported the upstream swap sync-discard changes into our 6.6-based
kernel.  LTP/stress-ng swap stress testing then drove swap 100% full
and triggered a hung_task panic: the vmcore showed 17 of 256 CPUs
spinning on swap_lock here, with 25 active devices and none carrying
SWP_PAGE_DISCARD, while the mmap_read_lock holder starved on block
tags.

With swap full, each failed folio_alloc_swap() on an order-0,
non-swapcache folio walks all N devices, costing 1+N+N+1 global
swap_lock operations plus N get/put round trips.  The walk is over
swap_active_head, so an empty avail list no longer lets it exit early.
The same code is present in current mainline.

Measured on v7.4-rc4, strictly paired on the same machine (26 x 256MB
swap devices, 16 concurrent workers, 512MB MADV_PAGEOUT chunks, swap
100% full), unpatched vs patched:

  folio_alloc_swap avg      32.745 us  ->  1.505 us   (21.8x)
  allocations in 30s         916,734   ->  6,216,609  (6.8x)
  per-page                   30.2 us   ->  4.0 us     (7.6x)
  spinlock slowpath/alloc     27.1     ->  1.87       (14.5x lower)

The per-allocation cost used to grow linearly with the device count
and is now independent of it.

Semantics are unchanged: swap stayed 100% full in both runs, so
allocation outcomes were identical, and swap_do_scheduled_discard()
had 0 hits.  A separate test with 25 no-flag devices plus one enabled
with --discard=pages confirmed that flag-bearing devices still take
the original path: swap_do_scheduled_discard() was called once per
folio_alloc_swap() call, with no hung tasks or regression.

Fixes: 9fb749cd1507 ("mm, swap: do not perform synchronous discard during allocation")
Signed-off-by: Wei Yang <albinwyang@tencent.com>
---
 mm/swapfile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 226230dda0aa..e553bd2c20a7 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1509,6 +1509,8 @@ static bool swap_sync_discard(void)
 	spin_lock(&swap_lock);
 start_over:
 	plist_for_each_entry_safe(si, next, &swap_active_head, list) {
+		if (!(si->flags & SWP_PAGE_DISCARD))
+			continue;
 		spin_unlock(&swap_lock);
 		if (get_swap_device_info(si)) {
 			if (si->flags & SWP_PAGE_DISCARD)
-- 
2.43.7

