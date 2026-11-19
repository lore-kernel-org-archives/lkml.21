Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131086;
	b=kvPF9lBrkK2TmAcqk5ruxgRqE5vk6gCa/Mca9TXJINOTBgRRpNYHoh1uXqOOlm5i6oyM
	 yPAxV/5T7ri4SqcuYsLLrXwpzxqX3OdAqUu9+jkyYZ00N0b9jSEBb18fsiBHwtAExD8tV
	 gCtg0pyGolw6JC/Ssn2MN/QwGf3pqTD1jPCFt6/hStRwiZuV5ZpwliVZd8K5Q17BHVlpU
	 gAHmAQvsmIwEF9WnUeUJnG0vmgUlF4e89NrTEW3/+9+lwAYitNSIB35fw3ztFlf3jRX9A
	 7ze/l6d7gOWNOsxX1YJu/JqkFWovIAyTDgFSVkAwcVj0GyFuFn1FoGkydJz1gJQSCSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Aem+HyjchlD9dlMnLoX3Rsa3iep8drYmdRID51i88Fc=;
	b=gNdXvuFYFdeNzIvWPoQlTD+jBOPaL9WXJWhR5qkT345EbEGZyp6FyfyCeHAC/uXmZ2xl
	 Sm/NbB8VCyhHx50ENWFQgf6I6UgQuYlneDEt34eDtyCDgOpHiNZC7RJ2G93bN+8zLk35X
	 3dXctDquEp5exlVL6xdo0qhhu0GpuyIHLOrrgR5GD7Zn3dCamxVC8BZY3lCxg/mxVJYi2
	 PGkOEMSJsdZdVpCRZ2amDXIEb4iEmmiiC+ySST9Sg090T+YWFKUpQD+loTznsApfJ+dyP
	 e2mDAfkVoS15AtMs90NF3eev70IJ84v8AeCgo5JsuF8h/jBgOnCMYg1IyaU0ULYpnRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=irIwo6Of;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2322F606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2322F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=irIwo6Of
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3a348a6dbso562285c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795131085; x=1795735885; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aem+HyjchlD9dlMnLoX3Rsa3iep8drYmdRID51i88Fc=;
        b=irIwo6OfYFjr0tY9zMTChWdltupwNjesTLkY6coKjPsKgFyz8vdBCzLp1IXE1ZTaw+
         Z2dpHHaK9DpxjUZaynqwcYTYbhdwdWIqJYbU4DpIzX0bk5Hmam0LS8/1m1U/XpfhBNX6
         XjIETzyu+thXWmbyul+5nnB0b3EJ01IXyZbkQ/Vu+RpZWXKviXm/17f3rG+H0Xn/j2j5
         j3o+/qrHQzjuehAmCMSVV9+PemMpE6SU9YFwIYxXLXCjltTKYUxnAW9NJOz3mvR/H5fa
         4aCFdVwoNykO3vx+Ob85YXDDCkMEA/kGTNOHAMu2lsOQhJec6tLwkwGQ58TnWT2Iy1ho
         ROew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131085; x=1795735885;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aem+HyjchlD9dlMnLoX3Rsa3iep8drYmdRID51i88Fc=;
        b=OMEgF2eUrPh4i6YaaWJkKcIduxNvd50sljP3B6jcwjd9elzqIaaKVBqjCMVgPqX9K5
         1nsH2rnCDX/Uvwwok4aAZ8GDakl8XeAFcGXhBGQ6bOuzM8Tktl6tUaISFF0YV58MP5KN
         HQ1EVrELAy263g7PR2xqSUkJwJRJDc0bzxY/D/lGDzkARLxX1/fm8nw76+BJObRE9ENc
         sQe4+5TuS4BRdEB+nWbgncrW/J9UNKQ3bFzVN4NH/IzE8Y94Kv49n13WhelD/v2YCx32
         AFauk4Qb8lebfuMO7yy8ySBF13MX3Umme3htWfZPFvkmHxuwtq0Rt3La9UXLv0uWxdYW
         b2Gg==
X-Forwarded-Encrypted: i=1; AL+hErGoIzpg7mtnjTT82ycm5A/00kakmmus+OrgB58yfOIOaaYBLlSLN+lEwj9yYcqflCcA2kwvgXuDA9gj7bU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OVPmJjYX+SO5qrBUjgENKabIqfleCOtzT2RDnPKoFEMQNaY4X
	jdsla/Nn2y4hfNxEdXUhlkoMSnJYMTX72fBfWlbrFfnLuuzkPgKZWs8tbqxkBJITbecAUjIZYAl
	K4pTZnVpzucc7JJuXNRt0Xw==
X-Received: from dldyq15-n1.prod.google.com ([2002:a05:701b:454f:10b0:1b5:1d0c:b35a])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2806:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b5568bbebcmr918980c88.15.1795131084783;
 Thu, 19 Nov 2026 15:31:24 -0800 (PST)
Date: Thu, 19 Nov 2026 15:31:19 -0800
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
Message-ID: <20261119233119.1721789-1-nilayvaish@google.com>
Subject: [PATCH v2] lib/test_hmm: fix alloc tag leak when splitting
 device-private folios
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Balbir Singh <balbirs@nvidia.com>, 
	David Hildenbrand <david@kernel.org>, Zenghui Yu <zenghui.yu@linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Alistair Popple <apopple@nvidia.com>, 
	Zi Yan <ziy@nvidia.com>, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

For device-private memory, test_hmm backs each fake device folio with
real system RAM of the same order, allocated with folio_alloc() in
dmirror_devmem_alloc_page().

When the core MM splits a large device-private folio, the driver's
->folio_split() callback, dmirror_devmem_folio_split(), has to split
the backing memory as well. It does that by hand: clear_compound_head()
on the tail pages, folio_reset_order() on the head page, and
folio_set_count() on each of them. dmirror_devmem_free() then frees
every backing page as an order-0 page.

This open-coded split does not split the allocator's metadata. The
allocation tag and the page_owner record still describe one high-order
allocation, and PG_head stays set on the head page. When the pages are
freed one by one, the tag is debited for only one page when the head is
freed, and the tail pages carry no tag at all. With
CONFIG_MEM_ALLOC_PROFILING, running the HMM selftests and unloading the
module reports the leak:

  lib/test_hmm.c:808 module test_hmm func:dmirror_devmem_alloc_page has 16744448 allocated at module unload

and with CONFIG_MEM_ALLOC_PROFILING_DEBUG freeing a tail page triggers:

  alloc_tag was not set
  WARNING: ./include/linux/alloc_tag.h:164 at ___free_pages+0x2a0/0x2d0

The backing memory is a private buffer of the test driver and nothing
requires it to be a folio. Allocate it with alloc_pages() instead and
split it right away with split_page(), which splits the allocation tag,
page_owner and memcg state and is already exported to modules. It is
still allocated as one high-order block rather than as individual
order-0 pages because the driver finds the backing page of the Nth page
of a device folio by offsetting from the first backing page, so the
backing pages have to be physically contiguous. Every backing page is
then an independent order-0 page for its whole lifetime, so
dmirror_devmem_folio_split() only has to point the new device folio at
its backing page, and dmirror_devmem_free() frees the backing pages one
at a time.

As the backing pages no longer form a folio, take the order from the
device folio rather than from the backing page, and index and copy the
backing pages individually instead of using folio_page() and
folio_copy().

With this patch the device-private HMM selftests pass and the module
unloads without the messages above.

Fixes: 56ef39899643 ("mm/memremap: add driver callback support for folio splitting")
Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
Closes: https://lore.kernel.org/linux-mm/be9a8bae-9223-4966-bba9-2cbe39c8f4de@linux.dev/
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Link: https://lore.kernel.org/linux-mm/8ef6e92d-4cb3-444e-857e-fdbf88c035ea@kernel.org/
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
v2:
- Use plain struct page arithmetic instead of the
  pfn_to_page(page_to_pfn()) round trip (Zi Yan)

v1: https://lore.kernel.org/linux-mm/20261118230044.683221-1-nilayvaish@google.com/

 lib/test_hmm.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index b409c42bfe6f..15db569eb721 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -201,6 +201,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	migrate_device_range(src_pfns, start_pfn, npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
+		unsigned int j;
 
 		spage = migrate_pfn_to_page(src_pfns[i]);
 		if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE))
@@ -227,7 +228,8 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
 		if (order)
 			dst_pfns[i] |= MIGRATE_PFN_COMPOUND;
-		folio_copy(page_folio(dpage), page_folio(spage));
+		for (j = 0; j < (1U << order); j++)
+			copy_highpage(dpage + j, spage + j);
 	}
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -805,7 +807,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
 	 * data and ignore rpage.
 	 */
 	if (dmirror_is_private_zone(mdevice)) {
-		rpage = folio_page(folio_alloc(GFP_HIGHUSER, order), 0);
+		rpage = alloc_pages(GFP_HIGHUSER, order);
 		if (!rpage)
 			return NULL;
 	}
@@ -827,6 +829,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
 			goto error;
 	}
 
+	if (rpage && order)
+		split_page(rpage, order);
+
 	zone_device_folio_init(page_folio(dpage),
 			       page_pgmap(folio_page(page_folio(dpage), 0)),
 			       order);
@@ -1029,10 +1034,9 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		WARN_ON_ONCE(end_pfn < start_pfn + nr);
 
 		rpage = BACKING_PAGE(dpage);
-		VM_WARN_ON(folio_nr_pages(page_folio(rpage)) != nr);
 
 		for (i = 0; i < nr; i++) {
-			entry = folio_page(page_folio(rpage), i);
+			entry = rpage + i;
 			if (*dst & MIGRATE_PFN_WRITE)
 				entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
 			entry = xa_store(&dmirror->pt, pfn + i, entry, GFP_ATOMIC);
@@ -1130,8 +1134,8 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			goto next;
 		}
 
-		spage = BACKING_PAGE(spage);
 		order = folio_order(page_folio(spage));
+		spage = BACKING_PAGE(spage);
 		if (order)
 			*dst = MIGRATE_PFN_COMPOUND;
 		if (*src & MIGRATE_PFN_WRITE)
@@ -1722,14 +1726,12 @@ static void dmirror_devmem_free(struct folio *folio)
 	struct page *page = &folio->page;
 	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
-	struct folio *rfolio = page_folio(rpage);
-	unsigned int order = folio_order(rfolio);
+	unsigned int order = folio_order(folio);
+	unsigned int i;
 
 	if (rpage != page) {
-		if (order)
-			__free_pages(rpage, order);
-		else
-			__free_page(rpage);
+		for (i = 0; i < (1U << order); i++)
+			__free_page(rpage + i);
 		rpage = NULL;
 	}
 
@@ -1833,34 +1835,24 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
 {
 	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
 	struct page *rpage_tail;
-	struct folio *rfolio;
-	unsigned long offset = 0;
+	unsigned long offset;
 
 	if (!rpage) {
 		tail->page.zone_device_data = NULL;
 		return;
 	}
 
-	rfolio = page_folio(rpage);
-
-	if (tail == NULL) {
-		folio_reset_order(rfolio);
-		rfolio->mapping = NULL;
-		folio_set_count(rfolio, 1);
+	if (!tail)
 		return;
-	}
 
 	offset = folio_pfn(tail) - folio_pfn(head);
 
-	rpage_tail = folio_page(rfolio, offset);
+	rpage_tail = rpage + offset;
 	tail->page.zone_device_data = rpage_tail;
 	rpage_tail->zone_device_data = rpage->zone_device_data;
-	clear_compound_head(rpage_tail);
-	rpage_tail->mapping = NULL;
 
 	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
 	tail->pgmap = head->pgmap;
-	folio_set_count(page_folio(rpage_tail), 1);
 }
 
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
-- 
2.56.1.750.gf70dc682cf-goog

