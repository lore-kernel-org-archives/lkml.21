Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081801;
	b=YKeCD6xd8oacRiYvYlJlCLWhUqKWvrKkDKf0EY5TnPwcZZytfx2VP/KR9ohwFmx+XvHP
	 GOyFyOI+EX0Ga6R/F6jAkC2wvgGpuKIEkDyTBCVOqeUvmyB3BOInfyxaS0WRaziCQhn2e
	 oF3GwCYjMREGQZwgQyVdMErMw9wAms4uH77d8XRWwPmxbhIKhPnut4AuVYdQRER5CDTYN
	 OBqnNtohMglNh9p4z6+1ASMlItwg1t4e4xpEMdWNX/dD+HCu7VLl3VrQKg1Rlb6PYYmhM
	 N2u1hJtuxy62XX0BSABjdh/NeEzGeAGDr7s66+UF3NxZ39HqBXBRwL310PmMdvJw1HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081801;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uMV/YbC1T9wZCTexlk+7aUQd9lga1zoOzARqeGciJEo=;
	b=Ig1DBHyLf64QH+DDbH9lSPgK6gVljhke4cYrOuCcIv1qHYNqPEkyWcF7c+WYIiJeDj3Y
	 cu8awcww6KweKXBhFM5Exhp4UkgHXvff4T8nvdewqEjmyiYf7B5h3e32HqMuWFVCWJoub
	 9nGfkN6klzrUbqMRzX1JIuFrMkJfWCj9wMGTxvNGn31jXDyl2jhdUf4SewI0HqBUNn+vT
	 nPxWX2AjLwHY4/tEAs6ZplrVoGYU/4+2Dt70wQLBQ2hEkXR1lYo2ER36/lnOSYA51Vp8Q
	 dPE28Y/PlA5fIRIwpeZavSj9ABPsumN9sITFJ2TiJIWLGVExJmBNioi8h0AwLNxGTfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fNpIs9MS;
	arc=none smtp.remote-ip=95.215.58.221
Received: from mta1.migadu.com (out-221.mta1.migadu.com [95.215.58.221])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8FD606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8FD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fNpIs9MS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zkskeSdhW3TcS/2san0Si9bwLAdnX8f9uTPSC2iFSPY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795081799; v=1; x=1795686599;
 b=fNpIs9MSy//LBNQGej4oODQkKsE1OiQfzd+WZhn+PTGJ3May0gdPLRqz8obK1HeKsJjno9/K
 ZYAx2OY9jXd/iMXHmarqUP4w6WALdRneZR8EiyVzeynEcu2d6T+nEY+ceobh1CfeMkwOdxSkNHQ
 XejDei0ltUFEvs2IHF4JVwYI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 38b48c34a8ee2f37;
	Thu, 19 Nov 2026 09:49:59 +0000
X-Mizu-Trace-ID: 38b48c34a8ee2f37
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
Date: Thu, 19 Nov 2026 17:49:45 +0800
Subject: [PATCH v2] mm/memfd: drop redundant hugetlb allocation mask
 narrowing
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
Message-Id: <20261119-for-memfd-v2-1-59f2d8c9752d@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBAAv0L2bA0L0hpP/sNwwHYrq9KaFomE9
 O9SvHqcZDKzQKTAFOFULBBo4sjerVDtCtB9524k2KwMVVlJRFTC+iAGGqwRhChVQ8aSbGD1X4E
 sf7bWpf1xfF/vpMccyEbPcfRh3mYTZu9fd0JRCtvJoz3UNSqk82N+svNxrx20KaUvcEYrRrUAA
 AA=
X-Change-ID: 20261117-for-memfd-e11675edfe65
To: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: hongfu.li@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Hongfu Li <lihongfu@kylinos.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081791; l=3005;
 i=lihongfu@kylinos.cn; s=20260915; h=from:subject:message-id;
 bh=I6EXz3yTFi+5DiIhQ6bxj5zpp5g3cWn4Qhu2YkBihlA=;
 b=KvGioQFIbxMHLTERdkukEbgP2tq2kNvdz9SAcw7BzrXSwvd2RA1bjZJf0q3c/+4z9ayNU9w0v
 Is6mz8fNveNDR0DPgG7CEsfS9XgEk5wjLIfSfFYrfoiqsUrZzH6vR+o
X-Developer-Key: i=lihongfu@kylinos.cn; a=ed25519;
 pk=rUpDSpB3neoNZRlGG6dHlFb3RepiJakcev+ucyqaZzw=

From: Hongfu Li <lihongfu@kylinos.cn>

memfd_alloc_folio() derives its allocation mask from htlb_alloc_mask()
and then clears __GFP_HIGHMEM and __GFP_MOVABLE. This mask handling was
introduced by commit 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios()
for pinning memfd folios"), when the fallback path in
alloc_hugetlb_folio_nodemask() could still call
alloc_migrate_hugetlb_folio() and reach the buddy allocator, so the mask
decided the zone and migratetype of freshly allocated pages.

Since commit 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios
resv_huge_pages leak"), this call site uses alloc_hugetlb_folio_reserve(),
which only dequeues folios from the existing hugetlb pool and never falls
back to the buddy allocator. The mask therefore no longer decides where
any page comes from.

Long-term pinning safety no longer depends on the mask either:
memfd_pin_folios() obtains its folios (dequeued from the pool, or freshly
allocated) under memalloc_pin_save(), so PF_MEMALLOC_PIN makes
dequeue_hugetlb_folio_node_exact() skip any folio that fails
folio_is_longterm_pinnable(), and current_gfp_context() already clears
__GFP_MOVABLE from any page allocator request made under PF_MEMALLOC_PIN.

Clearing __GFP_HIGHMEM was a lowmem constraint for these folios, which
were meant to be accessed by a DMA driver. It is not required any more:
the users of memfd_pin_folios() work on pages and scatterlists, which
support highmem, as does the shmem path with its default
GFP_HIGHUSER_MOVABLE mask.

Drop the narrowing, which has had no effect since 26a8ea80929c.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
Changes in v2:
- Drop patch 2.
- Remove the now stale comment about the zone and migration constraints
  in patch 1.
- Update the commit message to explain why __GFP_HIGHMEM can be removed
  in patch 1.
- Link to v1: https://patch.msgid.link/20261117-for-memfd-v1-0-fa68f433171e@kylinos.cn
---
 mm/memfd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/mm/memfd.c b/mm/memfd.c
index 0e3ff3eebfa8..4c359d0fa923 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -72,12 +72,6 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 	gfp_t gfp_mask;
 
 	if (is_file_hugepages(memfd)) {
-		/*
-		 * The folio would most likely be accessed by a DMA driver,
-		 * therefore, we have zone memory constraints where we can
-		 * alloc from. Also, the folio will be pinned for an indefinite
-		 * amount of time, so it is not expected to be migrated away.
-		 */
 		struct inode *inode = file_inode(memfd);
 		struct hstate *h = hstate_file(memfd);
 		int err = -ENOMEM;
@@ -85,7 +79,6 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 		u32 hash;
 
 		gfp_mask = htlb_alloc_mask(h);
-		gfp_mask &= ~(__GFP_HIGHMEM | __GFP_MOVABLE);
 		idx >>= huge_page_order(h);
 
 		/*

---
base-commit: 0bce4c3c7589a80b09a4f21fcb41811cca5153a1
change-id: 20261117-for-memfd-e11675edfe65

Best regards,
--  
Hongfu Li <lihongfu@kylinos.cn>

