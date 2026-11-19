Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071643;
	b=MO7X+IZ7MnGfNfC2ZtpgJrU/jPAmSzOfqMNG8GpEVZeQCqyc+AkeqOHvEp27usTh2Gul
	 ld/TlzVSe1SL/cQd+sG8nhWbb7Oj1Ge+M4UdHarVQqZjktqK33slAPJyT0CTsR3zY0v2j
	 SBfIwEVmkfaU5qi3MQOfaBKMqwo1Yklv0i7dHP416vkBnLH9mSndJDTQfDEXcOB6nowtl
	 2g/BrsnHUFs8n56JSIm17rmCofHgeLg4WGzaIYADdgz9zg8EYTWkxNZxvxpP0aa3Py5X3
	 fgL+8JeDkkNfUU/IKXTrQJBQ6/Oa6DIyroOGnA8Fp71aL8C5bjhdzNtFTqVg9AYy8cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+3lWud7DQJXjUbfSMY4r4QoMTzIguNTYupF3jSPDUjo=;
	b=YNx3SgtpZlAdCrAtrq+rVt4OoiU0XtLkKZM1vKKfOhqCws/F/Lo0et9eWvXnNganeQxA
	 ffeFo0UoESe3UysUEWnuikw8dby8XcpJT/zDN1LFY6IgRJ+vtoYQfZrDixAxu9rmKyx3w
	 Db47o/03cWYUg9TuTWYaU2hH7m1qx90psKXmCfVhLV8NFeOOMnkFgjZKmmd4u9zoiWouV
	 B/At0gnEFRQNByP/GV491H2n9124rJS80Njcj1aQ56syI1B1SZgnUoBKxhDkqaOu9XS97
	 YUTv0DumIdME2h1m/dhAQmkmsK/t0kcqjV0hnts5EiO7ZmebyaIVCZL8L1DFmOAEmgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RhN6XcK7;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A366606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A366606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RhN6XcK7
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1117531a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071643; x=1795676443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3lWud7DQJXjUbfSMY4r4QoMTzIguNTYupF3jSPDUjo=;
        b=RhN6XcK7rtTOALBpHLfvjj9XLW2rc/8jOJCdb9xw7TPohqJkzx+2ERhcUMJIgOuiZ4
         meZ8RpNBc1xHvn/BU5yqau6LDQUoj7t1A8ZCvOMGyaiu2pesSFni6DC3RcNNaZkPEKjz
         YdUy65kvhy2CciczTxnwH73KZle/u+u3AKpXOFD2OXHXOc+5kqkujxNLWw5MeUJrRfJM
         tqt2r7dKkRSm6RhtDnUo7NO+7oyiLH1YJz6i9gBZm2pICtDzJNg+i1a0m1Fe055oUiok
         KJ+bYzvm1flbgKv5DTZwYmyQaSZJMIty5logG7vEDdwAu//NNDdsuh7PebHEkSC32PmA
         s1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071643; x=1795676443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+3lWud7DQJXjUbfSMY4r4QoMTzIguNTYupF3jSPDUjo=;
        b=LU3xxMU4+EOGw0nbjcmuLRKg3v3j0n0diM1WDXwLOztzPSEKVlX9slrJ2QHhVygb5q
         UZZZeKuNCgakQH3kVliSEDeFhykfJCEjUbIWd0TWb8Yr3BaqiGeiQ1u62bB6y9sqsCAj
         mEH5fO6MYfo61hEadL9NoQXP5rCtGWqyQVYmMdTeaYxaM5ZJ8PxwcApI5ZYNl3WjC337
         wg0NEj7w+V8ULPffIwfzqj11dvZe6XoQDBPmJ1vz9+mfQVix/zvc6Nr32AZn/fWU/lNt
         ErHuKPb/DlstwufA+FhV83+tRuFbzy+Te/mi31i7zYqWCSrHqu6KJT4JUaF9pnb5+lEh
         XvXg==
X-Forwarded-Encrypted: i=1; AL+hErHYJqQM6fLz6foQTGBZg0pAou2DaEzc3BOOGDnkHdqaRBV1E87jQLp8VgmimnLivIoFNvZywI1kXMmWVEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4bHMNTwTiPLjjEY0Bdhr1bnOe5lOHmaJVB71rvZ+GQrAdTra5
	sz/mVkYFSR11m9JvvPZyK4TTQj/V5q9oTQJ+3Z0I0wGf5h0jDJgMlsl8958jIJkFb4I=
X-Gm-Gg: AZFdTZdPFXshEpZELN0PklDjDE5CZiNJqAavH4w6zpV5Hg80QhIN5rjMuXoDuGJVBjp
	TMdaSRfYaaX8RNAsU9QGdNjV+YiM1bm+tNNgHY0GDHSzc2TtSG1jcn1mKn9pExgyEm72FgLw7e1
	QytIzOpDI0ZCsK3TFfV+5X28uraHc5jfeYYWTlKpBvbxJIu+m7hXqJrk+My/oxnZHCcq/3UJYR7
	oS6kHFkJ8Noga8mgpuBB96EvD6+t258os8k7DAzEtNsp23t5AcRQxwYAgTdIp/1twYCkhmYn7sj
	jeQpNnxxzl1yWrAuXC+AF8qmMEuXqOjl3Xe2z4KYY45VR8V2qHQRMS5a7yC68Ac+2Jx5Qj8f8oo
	lmRSE/DQOtPqS+wECP+o1KGM++e3n93seA43vE+mgSOjGb8HsRfWNT6SBO2lQuyKbHNNWBbcjm4
	l5CLkiy79AWEG0F980QLnr64nkarczU9BhB2w/qXK972IZZ5/FZX8Z6RHPhx7oRyJlbz+QbffLo
	tPFKvXG3hNr6eshe/9Jhic+Mz75w3Ouf+iBXFdIUFtRNeQBhk5CAS1qJRlA1kw3VxXZw25Xthc7
	hsJkRRdiDO/1soFJHzhCpqiHyGx2gs2H6Fd0v1G2sc4lnuGJ//GX2USjxk8=
X-Received: by 2002:a17:90b:3f85:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b3d07ca535mr5027632a91.51.1795071642703;
        Wed, 18 Nov 2026 23:00:42 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.23.00.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:00:42 -0800 (PST)
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
Subject: [PATCH v3 4/7] mm/page_ext: use common allocation and initialization entry points
Date: Thu, 19 Nov 2026 14:58:09 +0800
Message-ID: <20261119065812.89959-5-songmuchun@bytedance.com>
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

FLATMEM uses separate page_ext_init_flatmem() and
page_ext_init_flatmem_late() entry points, while SPARSEMEM performs its
work through page_ext_init().  This exposes the memory model in the
generic boot sequence and obscures the allocation and client
initialization phases.

Rename the early entry point to page_ext_alloc() and use
page_ext_init() for client callbacks in both memory models.  SPARSEMEM
keeps its existing late allocation behavior for now; its
page_ext_alloc() remains an empty configuration stub.

This also moves FLATMEM client callbacks from immediately after
kmem_cache_init() to after vmalloc_init().  The callbacks still run
after the buddy and slab allocators are available, as required by
page_owner.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
---
v3:
- Collect Reviewed-by from Mike Rapoport and Chris Down
- Collect Tested-by from Chris Down

v2:
- Split the common allocation and initialization entry points into a
  preparatory patch
- Document the later FLATMEM client callback timing (noted by Chris
  Down)
---
 include/linux/page_ext.h | 20 +++++---------------
 mm/mm_init.c             |  7 +------
 mm/page_ext.c            |  5 ++---
 3 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 79c53ec45dfa..911a84bbb3db 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -62,13 +62,10 @@ static inline bool early_page_ext_enabled(void)
 }
 
 #ifdef CONFIG_SPARSEMEM
-static inline void page_ext_init_flatmem(void)
-{
-}
-extern void page_ext_init(void);
-static inline void page_ext_init_flatmem_late(void)
+static inline void page_ext_alloc(void)
 {
 }
+void page_ext_init(void);
 
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
@@ -79,11 +76,8 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 	return next_pfn % PAGES_PER_SECTION;
 }
 #else
-extern void page_ext_init_flatmem(void);
-extern void page_ext_init_flatmem_late(void);
-static inline void page_ext_init(void)
-{
-}
+void page_ext_alloc(void);
+void page_ext_init(void);
 
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
@@ -205,11 +199,7 @@ static inline void page_ext_init(void)
 {
 }
 
-static inline void page_ext_init_flatmem_late(void)
-{
-}
-
-static inline void page_ext_init_flatmem(void)
+static inline void page_ext_alloc(void)
 {
 }
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index a9d848c92678..bcc4e7e8cd1f 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2709,7 +2709,7 @@ void __init mm_core_init(void)
 	 * page_ext requires contiguous pages,
 	 * bigger than MAX_PAGE_ORDER unless SPARSEMEM.
 	 */
-	page_ext_init_flatmem();
+	page_ext_alloc();
 	mem_debugging_and_hardening_init();
 	kfence_alloc_pool_and_metadata();
 	report_meminit();
@@ -2725,11 +2725,6 @@ void __init mm_core_init(void)
 	memblock_free_all();
 	mem_init();
 	kmem_cache_init();
-	/*
-	 * page_owner must be initialized after buddy is ready, and also after
-	 * slab is ready so that stack_depot_init() works properly
-	 */
-	page_ext_init_flatmem_late();
 	kmemleak_init();
 	ptlock_cache_init();
 	pgtable_cache_init();
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 6196bab6868c..aff00f4e1bdd 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -185,7 +185,7 @@ static inline struct page_ext *get_entry(void *base, unsigned long index)
 }
 
 #ifndef CONFIG_SPARSEMEM
-void __init page_ext_init_flatmem_late(void)
+void __init page_ext_init(void)
 {
 	invoke_init_callbacks();
 }
@@ -243,9 +243,8 @@ static int __init alloc_node_page_ext(int nid)
 	return 0;
 }
 
-void __init page_ext_init_flatmem(void)
+void __init page_ext_alloc(void)
 {
-
 	int nid, fail;
 
 	if (!invoke_need_callbacks())
-- 
2.54.0

