Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071555;
	b=yO5snZEhW5vNw0/lmw24yyLesmTEajry6RcydhJ+KIeBHVJn6qmI2ZwtHFZmV410qZM1
	 ZqnzODg0xsp8V1X8+doEt49Ab1/xphFa9DWXNyvIQCxcldf84sNegH9zV5kh/ovo8d6M4
	 uSXZya2F/JMJtMOnixl5OwDrmY2/6zm2veF2pBOhXeTEIfBodhMrrGrXsCHa7LriGF8mg
	 9nIR6OyujwhIFjM8dTO2JZafSU/8DefjDogHqgcVk1eXjSxlNWimn+z2uRMy2vgDDn5ft
	 v8XkMysB9GsA7oyClJMy0yMFPWDiE+9+spWpfaAhvLdKPdTbXqPLAr5MEfCfKAr5eAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EpkpAe8MEN5BuQD0iXz34+1elSDBS0pp25xEYHL3/ks=;
	b=M+Ta25eu4ApyD/OgtbHk0rfJUxkckurTqqz7TcDe0qA39C69jGgC9i9zDefbFgTVXW3f
	 FyPmOKJzHj7cXpJG6ATHo4gyoVO5tVf4YQ65G193II43CR0RNUnr8DEpyAxBUK8oRIT4K
	 aAiQci+b2xQrA3+ekSbS73b00MefIZyrtJzdEbOT/HLdaGsMY+1v1JYL17lV4kPPGYrjj
	 xiOPjByRaN6qXzeaiTYcZZomHjmVBa74qY7rjiYSxZXd6INBen/ObQ2EvkZeu8XWRE9BK
	 JJi4twWVuWX/qUYgsuBcSh5Nay4yDrJBZS6A2u59AXAg6tjBEv1te7N/NovlhxhkmQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Rn8IstEl;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE491606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE491606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Rn8IstEl
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1104141a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071554; x=1795676354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EpkpAe8MEN5BuQD0iXz34+1elSDBS0pp25xEYHL3/ks=;
        b=Rn8IstElCPGCJXfmKbA2/cCAR9Ln8L3tdEsLJTVvjD32rri1ZAD8W3XEEDtJxYDlKT
         Ic2tzXcdG1z7WmGAYft0HUoPrd62eRdzvjIkmFg9OuwgnLH3qbxu66d8QD1u7iZ5ITOU
         ngIR/cA0VHv8xfo18aNjjUi1ZiD3BhE//91Jmwh86iHEQeVWbC1P7K3YfQww6wogHhUi
         nJIy6HUgla1oFRXGDS2clN2+Qus3Fv1sBU1xadxteaXndpRDAh9d4i0OF3dtWD9aPvOL
         J3BYXzMQ11K7eFWTAst4mj5vCvrxmjsSPe+ZDvlzP40vVyvD18/tdGGSziddZsQ6jFa3
         NWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071554; x=1795676354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpkpAe8MEN5BuQD0iXz34+1elSDBS0pp25xEYHL3/ks=;
        b=MwbIYo/9Kqy59p9r9QaACaQ3DKGRw78OxCIeyDSLhGwsB0x7hIljNJH7ueVhloLxkS
         xT+BIO8kqZisAmXf4DJ1Vj57ncfcg3Dj183IrSfBvSwu2sl51Xp56QSL4G/Ubz5b4D+s
         C3gev1pycrMo77Fv0LnI/h1OvYwvjHAqsGx1Eib6qr3Nh8oXHCqX+r0ddykm26V27QCc
         krZrpmzXjhyQzOULsUCFeBQe4LjUWL6hH/pE5iTtobdVqYT44d9ehY+fSmMzsdvkDvCl
         7QWJ6t/3BRHg0E+MdIcsUi3kmcYqX1ce2iNopvlUolzhbgIEcyScp2iZZ7tsDu/Tgo6q
         D+wQ==
X-Forwarded-Encrypted: i=1; AL+hErGxvIV7KdloUkjEjZPR+b1JlPdQCFdE1h1ojmgjdqSgvX9wX10+AD8P3C9nXFvrQl8niv/rfnTTInhHQzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hfLxKdy8EYA8s81DKn2drmErke9UWiI/ZoyCvoeYhgE5Pqz5M
	FUsBniXQRBzHsjorHu9t7SZqllZruEZiM/1sdNYwTcHjvI+cDAmRILXiCIB++U8nY9U=
X-Gm-Gg: AZFdTZdZMKmW1np3Rg/o5tyv8wpUf9QboHsXc5btz2LYLgpjGALXDXGWECoR8LuseS1
	WMGpiwV6ML2fOiMUT13pVfRakJz7qe3neqr2/Y7mGxzEDb5d+638+7pjFhRGxwxemWbVBuUrunQ
	MwZ54J5/VjnVG3eD4vBESXc/295j1DWg5duwRGRfYBSDXkDSXfBEQzp6xDK0D8jzY1Bi4ksrhEC
	JMicPsC6zK0DCQ87zrz/j+1lhlixaZvfdN4Osnp5H4JMdBg4uHr6mVh6dmRF4PkU1ceAVpO7+U3
	Gx4FF4y7UW1Dd5mu1ce5AGEgTOADUnzaJKUi6jePadcd2e3AABqb7oZRmo1slxhHLWqy3ZPonUg
	K0sANRnOs81SAVaRkSMGIZbf5p/7MVnJ1WAND8c951cyGbNcf/V8i0HPitfCzl1if2h6VJUyqEL
	5acFvOZhIv49euFUvEpYqnEvB1otajCP8L5RqdJyictZnszpDsNuQgAwClstPbBrnxml6WBWTGa
	zTjGUjJZmo0KOnItG8MKFME1FFcvYGQ7ErKdMLIkAz2AolOLr9E19qqD/sO7sggJA0bJNLjt09e
	h/2lMOPByoCxWKL4GANEXyz+xd7v2vfYQLyCI3D0IWmCaoetMQiB4GjewxM=
X-Received: by 2002:a17:90a:d60f:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b3d063e959mr4839420a91.1.1795071553983;
        Wed, 18 Nov 2026 22:59:13 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.22.58.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 22:59:13 -0800 (PST)
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
Subject: [PATCH v3 0/7] KMSAN: Move per-page metadata out of struct page
Date: Thu, 19 Nov 2026 14:58:05 +0800
Message-ID: <20261119065812.89959-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

This series fixes a KMSAN metadata-loss bug triggered when boot-time
gigantic HugeTLB pages reinitialize their page descriptors after
kmsan_init_shadow(). KMSAN currently stores each page's shadow and
origin pointers in struct page, so the later initialization drops the
metadata mappings and leaves their backing pages unreachable.

Preserving the pointers around the HugeTLB initialization would add
KMSAN-specific state handling to the memmap path. Moving
kmsan_init_shadow() later is not viable either, because it allocates
metadata from memblock while gigantic page descriptors are initialized
after memblock teardown.

Move the metadata pointers to page_ext instead. page_ext storage is
independent of struct page contents and is made available before
kmsan_init_shadow(), so later page-descriptor initialization cannot
erase the mappings.

The series first decouples KMSAN metadata access from its storage, then
makes page_ext safe and available during early boot, and finally moves
the metadata pointers. The move also shrinks struct page from 80 to 64
bytes on x86-64 KMSAN builds, allowing HugeTLB Vmemmap Optimization to
be used with KMSAN.

v3:
- Fix page_ext client alignment on 32-bit architectures by using u64
  alignment as the cap (reported by Sashiko).
- Open-code the lowest power-of-two factor and use a local for the u64
  alignment (suggested by Andrew Morton and Mike Rapoport).
- Use DIV_ROUND_UP() for page_ext accounting instead of relying on the
  caller's size alignment (suggested by Mike Rapoport).
- Simplify the page_ext alignment commit message.
- Collect Reviewed-by and Tested-by tags from Chris Down for patches
  1-4, 6, and 7, and Reviewed-by for patch 5.
- Collect Reviewed-by tags from Mike Rapoport for patches 3-5.
- Rebase onto mm/mm-new.

v2: https://lore.kernel.org/20261117120627.50601-1-songmuchun@bytedance.com/
- Fetch shadow and origin through one masked metadata resolver
  (suggested by Chris Down).
- Add a fix for pre-existing page_ext client misalignment.
- Use vmalloc for runtime SPARSEMEM page_ext backing
  (suggested by Mike Rapoport).
- Unify page_ext allocation and initialization entry points and document
  the later FLATMEM callback timing (noted by Chris Down).
- Allocate all boot-time SPARSEMEM page_ext from memblock
  (suggested by Mike Rapoport).
- Keep memblock allocations above DMA and suppress per-section free
  messages (suggested by Chris Down).
- Inline the unchecked page_ext lookup while keeping page_ext.c
  instrumented (suggested by Chris Down).
- Update the KMSAN metadata documentation and describe HVO enablement
  (suggested by Chris Down).
- Expand the series from three to seven patches.
- Drop all v1 Reviewed-by tags because the affected patches were
  substantially reworked and split.

v1: https://lore.kernel.org/20261114104150.58424-1-songmuchun@bytedance.com/

Muchun Song (7):
  kmsan: encapsulate per-page metadata access
  mm/page_ext: fix client data alignment
  mm/page_ext: always use vmalloc for section page extensions
  mm/page_ext: use common allocation and initialization entry points
  mm/page_ext: allocate page extensions early for SPARSEMEM
  mm/page_ext: inline unchecked page extension lookup
  kmsan: fix metadata loss during HugeTLB struct page reinitialization

 Documentation/dev-tools/kmsan.rst |   8 +-
 include/linux/kmsan.h             |   2 +
 include/linux/mm.h                |  12 +-
 include/linux/mm_types.h          |  12 --
 include/linux/page_ext.h          |  61 +++++++--
 lib/Kconfig.kmsan                 |   1 +
 mm/kmsan/shadow.c                 | 199 +++++++++++++++++++--------
 mm/mm_init.c                      |  11 +-
 mm/page_ext.c                     | 221 ++++++++++++------------------
 9 files changed, 290 insertions(+), 237 deletions(-)


base-commit: 3dfc09a9493ddaa5e7722a29165d8450b55b4d3f
-- 
2.54.0

