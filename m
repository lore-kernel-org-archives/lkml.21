Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795042859;
	b=XNoSSps6NqZ3+czK7lM5qcbprzM9Kjn1YbIw87xuZn0GqZLyojRyliQOk9KpLQJga39a
	 NCpDibfKBVooumaTk96PGlOOOn/UXX9OzJlcKi3gf3bkSztwp/6AzO8uF2RoJZ06GqHPX
	 uFv5uCAWJbtGqfzmSL9era0c5EGGdHLHHPUKRlM5+T8JS8h1NU0qTpcWWMG2o4k+YWalz
	 n5RqNUlXo3LC1lVM4+QE4/IptUy35LO90HNL+xFRQM8QDSNjubdW1sFBhcrAK1ILOq0ut
	 +SqFxN2bAmPJHvdPDXBVM3ABtG1PcX838aWAPV0AIa7rz8vpNf8dSF6ZiTr3F6CbaVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=wtJqh98lptU6ZJP4oIh8FQUdThkTquo5a0UcLNm2kK4=;
	b=gGJfujzv7HMTrr+mGwF03OS8n4C6Nrw8M6i516aWn/5kEsBCzQ+8sdI9coTpiG+29j6h
	 fjl7cj1FKFPh3MINn2JzY58TEynFv4LEXAUhL/iQtJU6n+gisBWV3A8Mvec2LFTfR/L4f
	 YH64pUSM/OAct5/0JuK8tAa2yfTGWd4FTg0gdXjqT5sI7uFtr/vSlorrq9wWMDCdo/D1y
	 0LGl2KHr9nnYot/W8TU8aaTJyU8etE3zoMcRt+IXppTjp0AO6JauNTYwr/Wd+adqJpNlu
	 pgkAfHmHpknY9CMeFC+hDo54wZBz2S3x0JstjlMIUHOvOxIHeNIn5jtMsqFDozFX/uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ciNA0ECU;
	arc=none smtp.remote-ip=209.85.161.69
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE01606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE01606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ciNA0ECU
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-71adbb7d16eso357242eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795042858; x=1795647658; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtJqh98lptU6ZJP4oIh8FQUdThkTquo5a0UcLNm2kK4=;
        b=ciNA0ECUWfrOYzrLOKWDd2k9OCS6XYPk33FycG4AEy3SUTKlCdUKQtdLnBCPFLFRil
         yuG8oD0ZRO1eGn4aOwae2x66IyUrt/3hOmve7QzJGOF1ojNGoDFedYs9cIEll/+Vv/YV
         ceYtx17Ip0rUT7/j7pObMERSw+qeXBeDZMS5xgNQ7k4M/hxosasaH90m7BjA/UfmVjfs
         LKnUQACat0vX7aSr7I53ux4Ev3kHMS+0mDUtRZXBIzmRmmE5gJghp1C9taTVUTavSDIt
         MkVY98kLvLqvNwNo9OKjPbT2UHU/IE+Ju6t36XNsL1/lTQjztKOba1ljQ6rrDD8bEytX
         A76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795042858; x=1795647658;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtJqh98lptU6ZJP4oIh8FQUdThkTquo5a0UcLNm2kK4=;
        b=IFZ0VFnPGoyE1BBuECfe02BC6mlEm+t1ib4K+tHfUphVAlFrMoQVk4zsO83/2fb8cw
         R+4oc9MuXwrW4kmnPFF4nq2VZWnqi7rZGxjrmTePBS6Nzg3v+3eRNMVK1fxJMf1qQHYy
         qYkihkzW76bF2JTomSZIXwHaXNfZE7QNCxtmqjM63qxhm7aUwmIdULfcYOvJThMYi2Dk
         rbmk880qATiKt4NOs1gB4PwgaWWM0Xjk9qGAaXKP34d7+LbP+cDIzz6wKLSzVZrMYXHl
         OpFLfALqCJTAXzA8D6zriRcFTLQvuzBtlInH4klpTKpGBOcBkFg1pIG5Sx6dAQtpZH7Z
         lYvg==
X-Forwarded-Encrypted: i=1; AL+hErEG9m2HD1oHGIkvVtfQBRv0DB0H/EFS2GbRpSnETjFT3pPAr7gw/43TC7lMq/HeOQ6ddpcVvalJxU5JSgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wOYZiCN/0DK3a9vBuiSz2SG0tco8hVf0k1oIwHrbVfV5HgFmP
	8y7UL9p4YtB1Mo8w7D+QrkrAyMXkOXHeJcBNpZTx7qNXOaziyw4yVfMzQ5rYWE2bF8ZIcwwZCVE
	TPYwWMgA5HtKWGuJeighazA==
X-Received: from oajz19.prod.google.com ([2002:a05:6870:3213:b0:4a9:9e93:8ee0])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a4a:e84b:0:b0:71b:1c76:150f with SMTP id 006d021491bc7-71b2e150d73mr175490eaf.5.1795042857188;
 Wed, 18 Nov 2026 15:00:57 -0800 (PST)
Date: Wed, 18 Nov 2026 15:00:44 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118230044.683221-1-nilayvaish@google.com>
Subject: [PATCH] lib/test_hmm: fix alloc tag leak when splitting
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
 lib/test_hmm.c | 41 +++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index b409c42bfe6f..371ead009f8a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -201,6 +201,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	migrate_device_range(src_pfns, start_pfn, npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
+		unsigned int j;
 
 		spage = migrate_pfn_to_page(src_pfns[i]);
 		if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE))
@@ -227,7 +228,9 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
 		if (order)
 			dst_pfns[i] |= MIGRATE_PFN_COMPOUND;
-		folio_copy(page_folio(dpage), page_folio(spage));
+		for (j = 0; j < (1U << order); j++)
+			copy_highpage(pfn_to_page(page_to_pfn(dpage) + j),
+				      pfn_to_page(page_to_pfn(spage) + j));
 	}
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -805,7 +808,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
 	 * data and ignore rpage.
 	 */
 	if (dmirror_is_private_zone(mdevice)) {
-		rpage = folio_page(folio_alloc(GFP_HIGHUSER, order), 0);
+		rpage = alloc_pages(GFP_HIGHUSER, order);
 		if (!rpage)
 			return NULL;
 	}
@@ -827,6 +830,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
 			goto error;
 	}
 
+	if (rpage && order)
+		split_page(rpage, order);
+
 	zone_device_folio_init(page_folio(dpage),
 			       page_pgmap(folio_page(page_folio(dpage), 0)),
 			       order);
@@ -1029,10 +1035,9 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		WARN_ON_ONCE(end_pfn < start_pfn + nr);
 
 		rpage = BACKING_PAGE(dpage);
-		VM_WARN_ON(folio_nr_pages(page_folio(rpage)) != nr);
 
 		for (i = 0; i < nr; i++) {
-			entry = folio_page(page_folio(rpage), i);
+			entry = pfn_to_page(page_to_pfn(rpage) + i);
 			if (*dst & MIGRATE_PFN_WRITE)
 				entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
 			entry = xa_store(&dmirror->pt, pfn + i, entry, GFP_ATOMIC);
@@ -1130,8 +1135,8 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			goto next;
 		}
 
-		spage = BACKING_PAGE(spage);
 		order = folio_order(page_folio(spage));
+		spage = BACKING_PAGE(spage);
 		if (order)
 			*dst = MIGRATE_PFN_COMPOUND;
 		if (*src & MIGRATE_PFN_WRITE)
@@ -1722,14 +1727,12 @@ static void dmirror_devmem_free(struct folio *folio)
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
+			__free_page(pfn_to_page(page_to_pfn(rpage) + i));
 		rpage = NULL;
 	}
 
@@ -1833,34 +1836,24 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
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
+	rpage_tail = pfn_to_page(page_to_pfn(rpage) + offset);
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
2.56.1.708.g77570a6a1d-goog

