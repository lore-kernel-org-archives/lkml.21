Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071629;
	b=KD8lUMfaSgzzCPJAarUd8PO/mebWlHOzLugCN4GfBHJ0xZbjbaXD8mXYfZvQ5fFeI85L
	 6C9uezbwxJ4Ggex9XK0HN6KVXiP3zExDn3kqJWPO+WRF8N+XMxRY0g0vlDdQBlyEgWmUB
	 EtztPGd1Fun8sltbG/4WYExm7EOQG5mtUJWvEMP2tDw+Q1pq6v562V2sDwRHVC8nbHMpf
	 2w+HaoEWpOjT6Y2XkC81Sj2x09YdPIMDqa36DiQhUCne14Ah1rUylu2yM75fhbh1h/4OK
	 uZ88RUSiHjG5IjB3st369Umn9Kqn+uq4PUdqCkaOz52wVpEiv3mpLOVGZIjHZM8pU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kPhQ9i3kP4x8JhqjD5K1C3dirUBtl6z9jPgg1a9BJHE=;
	b=rtjn3DNgRg8bt7xERYES8FdXPwKl7LCkGXmzYufgNhWK3PWJ9LvUAoL6wRc0pwhqVu5C
	 UqohaRXWrV3nAJf3tId2fMKFtBOR3zwu3VwY+BuFgZQu8CD/fFSa0BkmLtUE8ggIIPMHR
	 PfeqcfVDGzCmAdvdkUMk06KGa+LvKgY8CANc+35J/KVZL13D7ByXoFkhHwxU16N2RlACZ
	 2ul7uiNj/Joolw7O66iQvBO+0RgOGMSIsb75grr1i96ZtiStADDBAR2isz2l+Nqislylw
	 gtqQ3mAYEYV5p6ZC/vvFPD5PwBtEhwphyhnp2QcEyNBVKNJq7xmPIuQsm4IWg6ih0+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F1rIzOtX;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE757606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE757606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F1rIzOtX
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2efd7259872so11387775ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071621; x=1795676421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPhQ9i3kP4x8JhqjD5K1C3dirUBtl6z9jPgg1a9BJHE=;
        b=F1rIzOtXCvjl2Jq/oghLxtlwdQ9a2gCPhLAcYFzPlLXNAMLCwnuJUVxLdxdnUdlpWy
         jpEY7nwp3sAbRx8obBJdvUyFgOZTbeGqE9pHgAechX2HVenkuSqu3Ojaho1s7sWSppaZ
         lB/+iY3z7NwKMAQD3GK4M+xKVnis0PiZgzTYxGMlLZ6RUgkhRyJ87b0ti8Zd1A7O97/c
         4rCMfsgwBJbIsS0sIyNlnDpcGpgry/3JwQc8t850zU3gz5NM7hw+EQxp83uML2Z9UtAh
         Szb1dgI/pwt2wFfDrPfibm1KPeLFNFN2NZp8IDOJhbzU6zLCYFRfBxlhIjAMnTi+7b7r
         BURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071621; x=1795676421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kPhQ9i3kP4x8JhqjD5K1C3dirUBtl6z9jPgg1a9BJHE=;
        b=m8hQEl/vWbBZF5I1EeFNJCa5AOGbw5u9rxFRDWyJ2fmyoWZQfr3NVWtVIkzvEQmT1M
         0Y2cp/plO5Gs7XkEQJTHurVlo8gVQ8oLPBSFNzpnFvZGk3k2jwfpPyywluQVqPABbH3f
         Pnpl+CJ7syI467+WE/gMHcGSlZx44EsC/mw38PDdJXJ7ZX1Y2Sa20sOcomwfgi5xOz7t
         NB23E88+wydNBvsyLJpTXGLxPwjVahLx7+iq55qvxdWQiuuyY2pPLcxeZfLiyTA0O29Y
         iWBT8uNqBG9sfqrZF18irJu7eRG+OoUxt6qqPW7UgM3op1+BvBi2AXdlS4tZzCNTkYQK
         v10Q==
X-Forwarded-Encrypted: i=1; AL+hErFQtIXXQMGQBFevsyAgsLl12vWoTLWcr8rHyyeeTE1IvkpUSG7hZaMsSVAcSRSZa3YSS3Eog2ONoqp53Zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BRX1EH4fmMEWLlLdzMlSbvRVhqSth+f+pzkskLmPUqjJsdlCR
	J9H1dHBHtQqxwCjBm4CuLFhYvyddLArQyXyZEnPk9LtPh7jko8vG8RzeN1DM/csWXCk=
X-Gm-Gg: AZFdTZf1hby1x12YOXerO1x5lbkM3S35jerRlMe+KfOs13VMIivqxZPpP0tT/ZK8Eep
	MgNjpqNZNzYyvEEhno9M8ra00IYPBduXRU2vwyWQFnLb5gbpp3+5AxTGImTtpxaV9acupPvnDDa
	A390dFsOyvldf9p686jFUxqRUev68TEXsqBJ9KVJPEKfXi8aU6Bm7Navw8LXGfh1SyeI2CtdypV
	vhpNmidYIihh12DBiMfbXvBliQpRHr4phr80m5OKRsQsjmSNhosrgBVcrkasvyVbt38S8wk/Axa
	w+aZep5ZAY9Xjx5tMmz8L6I/KE2q8E8RSSpYd3xVxhPiGngsS5/KIXY1RdyzZBUSgdz6BmQUS+3
	L/M8AholD5hnOfSKFNCbg7yGUAfZRunlVBW67shfu0SytBUfflFVcytyrt9kkWQzYNGwwaMxtJG
	cJ5oZrs5FEBcUuDHL69jI0+F3B7YJ7XvJKxyHwW0zS4n1R89xmEyxKMMl2Lm0qLdMUmMQrvZ2Na
	FvpGR+JaulU0jfdFPAV1dv+ieBiYUDcf1ot/ZuoVyVHpm/D8JEWvBI+HD66mICI60mDoi3ydQFe
	rVvH8vn0nFMjYphAj/cdsxvWHnhB8fYCvaZ6aTfFntmHU4HYjpU7xSJwQXc=
X-Received: by 2002:a17:90b:1802:b0:3b1:922a:7b22 with SMTP id 98e67ed59e1d1-3b3d07c66b8mr5528227a91.60.1795071620802;
        Wed, 18 Nov 2026 23:00:20 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.23.00.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:00:20 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>,
	kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 3/7] mm/page_ext: always use vmalloc for section page extensions
Date: Thu, 19 Nov 2026 14:58:08 +0800
Message-ID: <20261119065812.89959-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119065812.89959-1-songmuchun@bytedance.com>
References: <20261119065812.89959-1-songmuchun@bytedance.com>
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

SPARSEMEM currently tries to allocate each section's page extensions
from the buddy allocator before falling back to vmalloc.  Boot-time
section allocation happens after vmalloc is available, and memory
hotplug allocations do not require physically contiguous backing.

Use vzalloc_node() directly and remove the buddy-specific allocation,
free, and kmemleak bookkeeping.  This leaves one runtime backing type
and lets a later change add memblock as the distinct boot-time path
to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
---
v3:
- Collect Reviewed-by from Mike Rapoport and Chris Down
- Collect Tested-by from Chris Down

v2:
- Add a preparatory cleanup that always uses vmalloc for SPARSEMEM
  section page extensions (suggested by Mike Rapoport)
---
 mm/page_ext.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index 39a4464fc979..6196bab6868c 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -290,15 +290,9 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 
 static void *__meminit alloc_page_ext(size_t size, int nid)
 {
-	gfp_t flags = GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN;
-	void *addr = NULL;
-
-	addr = alloc_pages_exact_nid(nid, size, flags);
-	if (addr)
-		kmemleak_alloc(addr, size, 1, flags);
-	else
-		addr = vzalloc_node(size, nid);
+	void *addr;
 
+	addr = vzalloc_node(size, nid);
 	if (addr)
 		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
 
@@ -344,19 +338,10 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 static void free_page_ext(void *addr)
 {
 	size_t table_size;
-	struct page *page;
 
 	table_size = page_ext_size * PAGES_PER_SECTION;
 	memmap_pages_add(-1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
-
-	if (is_vmalloc_addr(addr)) {
-		vfree(addr);
-	} else {
-		page = virt_to_page(addr);
-		BUG_ON(PageReserved(page));
-		kmemleak_free(addr);
-		free_pages_exact(addr, table_size);
-	}
+	vfree(addr);
 }
 
 static void __free_page_ext(unsigned long pfn)
-- 
2.54.0

