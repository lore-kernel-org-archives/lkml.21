Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132111;
	b=zS7eICkEVBOrzJtH7FyCsgoINkBMjGQf3hvC+c3faiW8QiUsP+kxl8ffjud8TCZse9l2
	 01PZuXREq4Y7CHVjwBfOBYjmQLxgWUZWquebD3UDxzhSjYv715fJnwNRnqYT/nLWglTAi
	 ZzQc9zmkAQzOaSoyk0/AbqVD625GU90vnWQ4PiZBio5DPRIdHlsOPGQc4yXXDhPW13qwo
	 IcrfZ2/OPwlyyEtXUo3vFKIDfhUjwTduMDznGSGNNbjSut8Om2w6y4mtMK54dv3J2IM2c
	 bqJobJZiS34l9edJoF1Eoe+lWcdrRsww+mXg+CFRD9bVqVA+tVsFD4Femef++ItEjfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YUybhKhz7iS/HEeHDZ9aby2NzinwtFQFRqsE5uPznD0=;
	b=4WndFEdBowezVb5NTyLYeFpxyZHtmiKhR/kKYrDbGz2zn+zUF0ftbzIoP5uvZVsTe/vr
	 SWLPPj1XCgynVwNK7hS7NNyEoK1kTF3f/9w+SAFWiZWLDp1i/K31tOv/cW1hsfvj0OW6y
	 Lj+B+jnHae/bBAwXNoDV6TDaVNZocliMQskCqjsyQP1mI8/ZQf6kayb+q41gcOCxWKcqk
	 y6SjGN7C4qu7fV/KWS2KI1INih/cCpRSH+UF28uCSjcsOLSX6ghlAxDbmHUhFWNffPw29
	 ephckBkUt28CJIRHODNEIc6lYTBe9TF+kw3g/oASWKY13qZcozLsQY5F9ol8LNbKvhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bCuR3rJ9;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1045606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1045606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bCuR3rJ9
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so843195eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795132110; x=1795736910; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUybhKhz7iS/HEeHDZ9aby2NzinwtFQFRqsE5uPznD0=;
        b=bCuR3rJ9nBfCFTt0gHqNBBKqM5t35lscp2X2cNZuWT+I11NokWHBJBiuLddOCNEVTU
         0GtzVy9bj57CSHwL9VPJTSFvshW7YDIFJ5aojjey/UNTO4yIRozJDK+x6sEkN/8m9ZK5
         4HjC+6vIFl35prqF1sWrM4UgG4ir8vc/AYW2Ocjrk4Y8+kZW3v67k3peXnnme2dpNzQ5
         5LHMueXnV2veVi3AV7URbLazcXK/aM3i8ZYn8h/tXVHiF+LEDcSQIkVQMNUyEtTuV4eU
         BpW3uetHw0MgTxWnFq7loKH/ND4tQIPV4wXKw79lpH5vw5yxMisNlmqvWirTNS1Ugl5i
         vcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132110; x=1795736910;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUybhKhz7iS/HEeHDZ9aby2NzinwtFQFRqsE5uPznD0=;
        b=zS6YxjzzSk+b1dnnXNp668SxklDbTBryhdcLHM3bPZ4bWsm2jxMBINx9I4ETQlsfuR
         hVMs+yuddkqkSUf0xrS2EEoetrLX7IESbPhIiCI9wMCtVEc7xTXkeQQtwtZKSz9ZhWB5
         u/DcKUlEH4jyWCr7wanCUUbwwAwClYSSE7T8HiK5wJRehucwKRj1oqJbUi4U9/jBTfnN
         yl8P9T6IwImFAFSNMpAn3p8tyY4gyd3+1hL1bzHO8sTtMT8G53EZFSSesz1lBqSMPjTa
         zJFtw2bTdcutpTTM8C+aMwMC2KSMc83/DcbYdJDrt4i10+3+r07nELkpZ8hogIEe519n
         LFog==
X-Forwarded-Encrypted: i=1; AL+hErEwn8Yyx4ZsdxibBleUmyP3UsblGjEn/6Z6IEJy8cM6L6qh58xpJLXvLknIN7JNkBlvoouJi2OOll10v8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hTVHVR033pAEp+15DIhoFNKaNPhFTih9Ki2Df5wRRZpSyt0ej
	ttXObdbfibsjeaNVUvoYXg+aSklKNMqgw+xQTpU+aYL/q8waMEqh9+8OHWN465YOlKeubdMMzUh
	K+Ydo5L7z+GIZji0bmyTGbA==
X-Received: from dlbsj7.prod.google.com ([2002:a05:7022:f907:b0:1ad:2ffe:151b])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4354:b0:17a:e684:b497 with SMTP id a92af1059eb24-1b55682369bmr1123328c88.5.1795132109309;
 Thu, 19 Nov 2026 15:48:29 -0800 (PST)
Date: Thu, 19 Nov 2026 15:48:04 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119234804.1740734-1-nilayvaish@google.com>
Subject: [PATCH v2] mm/page_owner: fix double decrement of stack count on unpoison
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Oscar Salvador <osalvador@kernel.org>
Cc: "Jose A . Perez de Azpillaga" <azpijr@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

page_owner counts, for each allocation stack, how many pages allocated
from that stack are still in use. The count is incremented when a page
is allocated and decremented in __reset_page_owner() when it is freed.

A page that is hwpoisoned while in use and later unpoisoned passes
through free_pages_prepare() twice:

  1. On poisoning, the last reference is dropped. free_pages_prepare()
     calls reset_page_owner() but, because the page is PageHWPoison(),
     keeps it off the free lists.

  2. On unpoisoning, unpoison_memory() drops the poison reference and
     free_pages_prepare() calls reset_page_owner() again, this time
     really freeing the page.

__reset_page_owner() decrements the stack count both times, although
the page was allocated only once. The first call clears
PAGE_EXT_OWNER_ALLOCATED, but the second call never checks it.

If this drives the count to zero while the stack is still in use,
stackdepot treats the record as freed and warns on every later
allocation or free that uses the same stack:

  dec_stack_record_count: refcount went to 0 for 92274844 handle
  WARNING: lib/stackdepot.c:517 at depot_fetch_stack+0x5c/0x70
  Call Trace:
   __set_page_owner+0x110/0x290
   get_page_from_freelist+0x1225/0x1440
   __alloc_frozen_pages_noprof+0x1fc/0x1b00
   __folio_alloc_noprof+0x12/0xa0
   alloc_migration_target+0x81/0x1e0
   migrate_pages_batch+0x1f2/0x14c0
   migrate_pages+0x9c3/0xca0
   soft_offline_page+0x189/0x570

A single soft offline followed by an unpoison is enough to trigger it,
because the migration-target stack that the offlined page is accounted
to usually has very few pages.

Fix it by decrementing the stack count only if PAGE_EXT_OWNER_ALLOCATED
was still set, i.e. only the first time the page is freed.

To reproduce, boot with page_owner=on and CONFIG_HWPOISON_INJECT, soft
offline anonymous pages with madvise(MADV_SOFT_OFFLINE), and unpoison
each old PFN through debugfs hwpoison/unpoison-pfn. Without this patch
the first cycle prints the message above and 2200 cycles produce 6597
warnings. With it, the same run is clean and all stack counts return
to their initial values.

Fixes: 217b2119b9e2 ("mm,page_owner: implement the tracking of the stacks count")
Cc: stable@vger.kernel.org
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
v2:
- Expand the comment in __reset_page_owner() to explain the allocated
  check (Oscar)
- Collect Reviewed-by tags from Jose and Oscar

v1: https://lore.kernel.org/linux-mm/20261118212819.403059-1-nilayvaish@google.com/

 mm/page_owner.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index 02bb304b53cf..09a3c2958079 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -320,11 +320,13 @@ void __reset_page_owner(struct page *page, unsigned short order)
 	depot_stack_handle_t alloc_handle;
 	struct page_owner *page_owner;
 	u64 free_ts_nsec = local_clock();
+	bool allocated;
 
 	page_ext = page_ext_get(page);
 	if (unlikely(!page_ext))
 		return;
 
+	allocated = test_bit(PAGE_EXT_OWNER_ALLOCATED, &page_ext->flags);
 	page_owner = get_page_owner(page_ext);
 	alloc_handle = page_owner->handle;
 	page_ext_put(page_ext);
@@ -339,8 +341,15 @@ void __reset_page_owner(struct page *page, unsigned short order)
 	__update_page_owner_free_handle(page, handle, order, current->pid,
 					current->tgid, free_ts_nsec);
 
-	if (alloc_handle != early_handle)
+	if (allocated && alloc_handle != early_handle) {
 		/*
+		 * Not every page that gets here is still accounted as
+		 * allocated: a hwpoisoned page that is later unpoisoned is
+		 * freed twice, and the first free already cleared
+		 * PAGE_EXT_OWNER_ALLOCATED and dropped the count. Only
+		 * decrement the allocation stack's count if the page was
+		 * still marked as allocated.
+		 *
 		 * early_handle is being set as a handle for all those
 		 * early allocated pages. See init_pages_in_zone().
 		 * Since their refcount is not being incremented because
@@ -348,6 +357,7 @@ void __reset_page_owner(struct page *page, unsigned short order)
 		 * their refcount either.
 		 */
 		dec_stack_record_count(alloc_handle, 1 << order);
+	}
 }
 
 noinline void __set_page_owner(struct page *page, unsigned short order,
-- 
2.56.1.750.gf70dc682cf-goog

