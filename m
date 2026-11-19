Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071600;
	b=5Kg9eBumK06eaviQCwTgctczjbKEHi8TdhXSi9oR4xNbSl+RglmkQa5l8FeMEuL6jecS
	 EAFjaAOrL7MY2xK2BuJdW+5pv0RjGFLLxRQS2fh9nszoTpkmS5Eg+I1she4du77n+cp8q
	 rxA5ajR4n/aIjp2VxpAE9ynRUWQye+W7LRpTL6L7h1zHmpMQLWPxV+Fl+wA0gaeVriu5C
	 URI8AjPGYxdClvdU6SH9bUk3Hz0REWVAAnu+jb48oIE5QFRA5dmXfDpBDh+wcelwCyGBW
	 TIId/3KmQxR3DliN8dJEse/77mKbqwYvbIfTaB+Is8L1XoIunxuuZa3hIMgLbYn/+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=niVF9RygUWyckhWxTzwkqqzSpVkRZGJqdyALrrQwo64=;
	b=Aaiil8c86U6JhdXDb2nHrmuDOtNVJth53s1kB1GA1IqXAjmYQUuoCGx0fu0grIjZZ8hh
	 zoPEpqdgrkarwKKEbM+V5y6NkbB0DiF3qrExiBlPsMsFO4zFc2J6YYKi3d2cy8D7dx7Qc
	 lZI9ob4f1z3LwvvajoT6B3kgoGkl5Hdug0VmFfx4ourLlBiy06kxP6ZpGLc+OvE73P4Qt
	 pYpzmuROysozRwM0E6dImpJWFaXU7P5+5SwXOcbCqmnCUm2rk3kSY0h+8ZQPl2E0hL6vD
	 a/ajjaHWOYaA8SBUelMVgKTAJeGKhdFJJCZVM1lQboyBRUDAR45zUS/44fF+IKjp5aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jaYX+PaY;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D32606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D32606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jaYX+PaY
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so434350a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071600; x=1795676400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niVF9RygUWyckhWxTzwkqqzSpVkRZGJqdyALrrQwo64=;
        b=jaYX+PaY0Pd1nWO7YguC8xp2UHhePRxfQ8T4E6KJVrWyOWB1Mztp3a+GkHGI3YSrge
         Jb7E8OBTkaAArGQKY0XMgk/kgRwdua8Wb2W5XoE4gvpFXQ+ltGNrxOBTxfJrbaUZRcb0
         yKeWVBmraLb0bqpYf3vE629ijv/Ps929NSvRWAYsdHKjGGvXyX23I5LDrU+Cmxf4T0Xw
         qw71n8er31QigiZqRh4MxGUVEtSVqjCZhV0LO88E36IdKOHVtLiTfyML8ltZ6/4eevw4
         dSbf8kjR1hIIKj8274yqgO8eNAShMsWB/TEz3BfJNT1DiBTUXaWAax/OVBEjlD09rJ1d
         YUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071600; x=1795676400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niVF9RygUWyckhWxTzwkqqzSpVkRZGJqdyALrrQwo64=;
        b=VTi1rr/AHWtS4wpg2nb216Ka4HUZnDJhTKD8uCSXBKZXxj/+Q6vr4P3FRlOJTKN/Ei
         XSY+TPwa7SL2qLOzy0SHN9CttpRegfiBfQbv8HOE1yql05joZ7FdQeLGrcjouhXeLPn7
         WvTCQhB5bKxqcCrQ0mS7WdNklQMnaI5BmpneisWrh8biIK4XxkvjtrYY8MPi/DRf1rx+
         CpOKGxbm3gFUlWweGe9x0iUObVaQWlFrQ91TK2JhjxJ170IQt2rqd4n93uSEDaPsLwp5
         oXiwohoZq7vGWZUmsXqfDyuCalumP2x/GgwFfgmzWr03TUvmsEl7Z4lg8/AjpuwTEyDP
         3DRQ==
X-Forwarded-Encrypted: i=1; AL+hErGgylv7MkNB4z9joc+1YPAosko8/gtdXqN6NyLmsyZovtUW6hGhjMC6qJe0OovabvoHEDC8R5oG+z5G8zM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WTflhDtUQtYpJ3fnxjaKuss5fkNSu14n3I0+/CJIsX8BROCAU
	qWgObYJo5ERH0JKBm108HUgL+ZpXVXIYtP4OH7C58GauobpAn0wbY6fTbSkIfF8nzjQ=
X-Gm-Gg: AZFdTZdMwA9E0EnHHDBnmaFPby8kOEI/e8hFUEVo4zq1uwHNfcShiNHVtsGPzuldxPH
	CS3b0m0ylYAvZVvuQ4aB4bpWgLBYTZqWURuRGfd2SajNlZEGsJGF/8Bwl7Zk670CimmkuASPvyY
	yqqizmLc67qdYoQXHn7mB8AzuLQ2lyYYNh7U2kTw0Tup2MUKODiHHZ52wz1We0x+hPVBcIqPk2p
	pX6yfJ7obH/SJwM7/I8GwP/peQlFNDUeRdXT/YLSdRlQI7eCC8n3a6tkjZAuisiLK7O/FE4q7ot
	0AHgVXqfSr1w2lEUyv9AlF7OIjHbobsYl2+43hWIU305HotT3HSDR/y+/yVpvqtWEP6Z0J78c4N
	BagiauHjxxJZFmAmb5t3etMKe7GrA/btQzmSPvFbJILctg1jFH52pkydc47fhVyIchk+/V+0/CW
	FfsXsXHf6FZHQAvcyAMvNJBR4yoBhgMAtK0T4Q4WNvTOjpO/1klksN0WeQh/wDbS3vjqvHsMewS
	4m4vLmRPAyj2BJQy4GbJfyT8FPffyJoA+N+HkGpFID4uR9Dm560CPTrAvSIToFzL9sYV36CTs1q
	kOTKHYI05PFIm5aWrI7TvYf1k2nVVngKe21+O6fgS8P6gEWIY4/LO4KNDek=
X-Received: by 2002:a17:90b:498e:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b40a32d9c3mr134496a91.39.1795071599193;
        Wed, 18 Nov 2026 22:59:59 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.22.59.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 22:59:58 -0800 (PST)
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
Subject: [PATCH v3 2/7] mm/page_ext: fix client data alignment
Date: Thu, 19 Nov 2026 14:58:07 +0800
Message-ID: <20261119065812.89959-3-songmuchun@bytedance.com>
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

page_ext lays out client payloads consecutively without aligning their
offsets or the final entry size. This happened to work while the active
payload sizes kept the stride naturally aligned, but IOMMU debug page
allocation added a four-byte payload after data requiring eight-byte
alignment.

When page owner and IOMMU debug page allocation are both enabled on
x86-64, struct page_ext, struct page_owner, and the IOMMU payload use
8, 64, and 4 bytes respectively. This produces a 76-byte entry stride,
leaving struct page_ext and page_owner data in every other entry only
four-byte aligned instead of eight-byte aligned.

Align each client offset and round the final entry size to the largest
active alignment so every page_ext entry preserves the alignment
required by all active clients.

Fixes: 466ae6978a5b ("iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
---
v3:
- Cap client alignment at u64 alignment to preserve 64-bit alignment on
  32-bit architectures (reported by Sashiko)
- Open-code the lowest power-of-two factor for readability (suggested by
  Andrew Morton)
- Use a local for the u64 alignment (suggested by Mike Rapoport)
- Simplify the commit message to focus on the alignment guarantee
- Collect Reviewed-by and Tested-by from Chris Down

v2:
- New patch to fix the existing page_ext client alignment bug
---
 mm/page_ext.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index b679a8c1f7d7..39a4464fc979 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -116,8 +116,27 @@ static int __init setup_early_page_ext(char *str)
 }
 early_param("early_page_ext", setup_early_page_ext);
 
+static inline size_t page_ext_data_alignment(size_t size)
+{
+	const size_t align = __alignof__(u64);
+
+	if (!size)
+		return 1;
+
+	/* u64 has the strictest alignment required by page_ext clients. */
+	if (IS_ALIGNED(size, align))
+		return align;
+
+	/*
+	 * A type's size is a multiple of its natural alignment, so its
+	 * lowest set bit is at least that alignment.
+	 */
+	return size & -size;
+}
+
 static bool __init invoke_need_callbacks(void)
 {
+	size_t max_align = 1;
 	int i;
 	int entries = ARRAY_SIZE(page_ext_ops);
 	bool need = false;
@@ -126,6 +145,7 @@ static bool __init invoke_need_callbacks(void)
 		if (page_ext_ops[i]->need()) {
 			if (page_ext_ops[i]->need_shared_flags) {
 				page_ext_size = sizeof(struct page_ext);
+				max_align = __alignof__(struct page_ext);
 				break;
 			}
 		}
@@ -133,11 +153,17 @@ static bool __init invoke_need_callbacks(void)
 
 	for (i = 0; i < entries; i++) {
 		if (page_ext_ops[i]->need()) {
+			size_t align;
+
+			align = page_ext_data_alignment(page_ext_ops[i]->size);
+			page_ext_size = ALIGN(page_ext_size, align);
 			page_ext_ops[i]->offset = page_ext_size;
 			page_ext_size += page_ext_ops[i]->size;
+			max_align = max(max_align, align);
 			need = true;
 		}
 	}
+	page_ext_size = ALIGN(page_ext_size, max_align);
 
 	return need;
 }
-- 
2.54.0

