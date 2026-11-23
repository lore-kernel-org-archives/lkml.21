Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430508;
	b=M3AD8fi5dYUCGMNBKv3PHt7ogQmvGAAaVJSKaDHHv+uLezAnKUtgk4RJEzARJM+NS3vM
	 HaoYIs/RfUZGWedgbg5IM3BqhHmKugueyES5LkDs68coCxLlFCtr0hjUvv6TvIqXXtz8I
	 DXhAteDdMolEoZnriBNKFIGk58OITSOCCRxJ+vGneQlZyZ2WiLV0D4sZqjeapg+bXGmub
	 ni/n/++9DctnZJ+/5bz9VjE/v4ambD59Zqxst9/0FieM1KkfasqfiHh8djMDLa4DvbhSg
	 Da9Lsk9sC2RV53WYoqI3j4D8g/rFq26W3UvnKOrMVH/I1ORINrJYwGKHDoTJGBV72Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430508;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer;
	bh=MND2gXWBxhr8dXIEz1K7tu3YQTgZtUI14WVbyk/Hlmc=;
	b=zB9wJJrMnU1CfGOUpT85B3PUbYEvxWUbVoN/g31/gwemHbbPpKF5Ck9eJMP1TVkDP2/y
	 dQrWZ4lDSglg0jFiONlw99q2KrpsLtXe04Fmt0ZfAsQxUu3PhSxa7LT18XIAV1qcBU+uP
	 ELl0KGozRp3VEvBJ1V12r825dK8jeG479oA3R1Xz1G1g2RyoZax9U/OJ5RXG5lC3u/PP/
	 yA/eJk7xND11u6mZs8JlFGmZj8/P95yasQVC5woKZXpMBTpe7bXsTgjm/3dLFBftdqC2O
	 OdG19vFDjBIplfwGJudfwmfEJ1Vj7gq5WNGLZr53YWA9hqi7QyPomps0lhdJahfmpxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NJBBIlCN;
	arc=none smtp.remote-ip=91.218.175.68
Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD56606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD56606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NJBBIlCN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y+2aFOJdNqO3B426W22gxsYpUvD57l9xFa8AYlK0V6o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795430506; v=1; x=1796035306;
 b=NJBBIlCN4zr5XONfKo8IG+8jqyMiCzgxWPvoKUa1N6AfhSYsLbmIJUcJk/pJ97xW5oq6biCU
 FM9kfFA16CndOiI2OYDD9ghqEWuWd9lgX1Srn4DC7aU0GPxvZyw2quv561fH0o6VD0M5R976BIp
 KlrLZNq5jHxCprmrD5A4nXnk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 100b1cd08c6c74a4;
	Mon, 23 Nov 2026 10:41:46 +0000
X-Mizu-Trace-ID: 100b1cd08c6c74a4
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Mon, 23 Nov 2026 05:41:38 -0500
Subject: [PATCH] mm/rmap: flush the TLB once per mapping in
 page_vma_mkclean_one()
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
Message-Id: <20261123-feat-mm-mkclean-batch-flush-v1-1-7e998ad13251@linux.dev>
X-B4-Tracking: v=1; b=H4sIAGEYBGsC/x3M3QoCIRBA4VeRuW4gjZXqVaILf8Z1SC10i0B89
 5W9/OBwOjSqTA3uokOlHzd+lwl5EuCiKSsh+2lQZ6WlVBcMZDbMGfPLJTIFrdlcxJC+LaK+aj9
 DebOLgnn4VAr8P+6P5xg7LR5e6m0AAAA=
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Rik van Riel <riel@surriel.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, Kiryl Shutsemau <kas@kernel.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

Writeback calls folio_mkclean() on every folio it writes, which
write-protects and cleans each PTE that maps the folio, so that the
next store through the mapping faults and redirties it.

page_vma_mkclean_one() does this with ptep_clear_flush(), one TLB flush
per PTE. A large folio mapped by PTEs thus costs as many flushes as it
has pages, each an IPI to the other CPUs the mm runs on. Writing an
8 GiB file through a shared mapping on xfs flushes the TLB 2,097,152
times for 65,575 folios, and the writer spends about half of its time
in the IPIs and flushes.

Write-protect and clean the PTEs with ptep_modify_prot_start() and
ptep_modify_prot_commit(), as change_protection() does, and flush the
range they cover once after the walk. The flush still happens before
folio_mkclean() returns: stores through a stale TLB entry complete
before writeback reads the folio, and later stores fault.

Writing an 8 GiB checkpoint to brd through a shared mapping, one file
per writer, then msync(), median of 6 runs:

  fs     writers   before (s)   after (s)   change
  xfs          1         5.57        2.98     -46%
  xfs          8         5.37        2.10     -61%
  ext4         1         7.88        3.90     -50%
  ext4         8         5.10        2.02     -60%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 mm/rmap.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 65646ed6fc453..4c3d9cb47e550 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1127,6 +1127,7 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 	struct vm_area_struct *vma = pvmw->vma;
 	struct mmu_notifier_range range;
 	unsigned long address = pvmw->address;
+	unsigned long flush_start = ULONG_MAX, flush_end = 0;
 
 	/*
 	 * We have to assume the worse case ie pmd for invalidation. Note that
@@ -1156,10 +1157,11 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 				continue;
 
 			flush_cache_page(vma, address, pte_pfn(entry));
-			entry = ptep_clear_flush(vma, address, pte);
-			entry = pte_wrprotect(entry);
-			entry = pte_mkclean(entry);
-			set_pte_at(vma->vm_mm, address, pte, entry);
+			entry = ptep_modify_prot_start(vma, address, pte);
+			ptep_modify_prot_commit(vma, address, pte, entry,
+						pte_mkclean(pte_wrprotect(entry)));
+			flush_start = min(flush_start, address);
+			flush_end = max(flush_end, address + PAGE_SIZE);
 			ret = 1;
 		} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -1193,6 +1195,12 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 			cleaned++;
 	}
 
+	/*
+	 * Flush the write-protected PTEs once rather than one by one, before
+	 * the caller writes the folio back, as change_protection() does.
+	 */
+	if (flush_end)
+		flush_tlb_range(vma, flush_start, flush_end);
 	mmu_notifier_invalidate_range_end(&range);
 
 	return cleaned;

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-feat-mm-mkclean-batch-flush-686d20219b52

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

