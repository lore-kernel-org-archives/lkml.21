Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169353;
	b=V+dY2MnWRWxySl8THaoKWC8WVnJ5QbjvClID1DnI6y2Yje6zEKdhyG6vycoiW0TvpVWE
	 CUI0WGphsP2P34kWuNMGPpWiRJgF7FnWH+slt+325rDQ1ZebqGS5+l9nxLYe+G3vG815H
	 kCV3isjt7RNWYMGsP+XJ5+R2ppjTIjXkfb+/9jsyxtwoWgt6bo861O/oH+IJxmm7HH4vx
	 cxqEVQiAoXS8xTGG8/iY3Csq3mup0E1RbJ8kRT1/f5IuETFuuwulNamqmLipQTxmFUQej
	 Ocpeb0hqG8h5wa+VFQ8Lx/i9tjKJ5Hr0hOjeXqU83zkHKgVn5P0BtBFJ7u0s07j5Bvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tP5tP1XsZQUtWMsij03mPLEQkw2o32O/Ohqtn1xKgnQ=;
	b=H511roCH9JioBadj8C19GBe1m/m4nCFeqvzZhklVFUxEbteQNz8TPNBhU6LXMBN2rXha
	 uphLobOB3zse9jrdhOWMElPUJNIY/7xkJW73XBlADuwlO0eLP53EPe/YPTJb3jhTF6TE3
	 dOrhAnm9GJj8H0QWkeP4KNL7SsnjKk8qoKzHPmXkOomeq3yqAoxZsOxePOF03PltGLEgn
	 dQV2ufGVD1wi4+y+MjtWv7lAlZoC5eawflL+9bnkXi0KvKtZv/dwXniCyY7au9fib7i95
	 gEZxRZk5rFcpQzx8zq0or5fIzvwm2L9JV9ZKsuyBrVj8usqS0Uekiu+q7OVJJ2jI4xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GZNNYjyz;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63779606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63779606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GZNNYjyz
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso328211a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169352; x=1795774152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tP5tP1XsZQUtWMsij03mPLEQkw2o32O/Ohqtn1xKgnQ=;
        b=GZNNYjyzzISd3nTwMB+I/rGH1zkktqWK0cypsHLTX+1iSzi7wgQwoPpLFGS04pslDE
         3nTAJeqNjDlAg6RkJzNHT6KqeN6dotYYkYOLtlw3vIS2XfXN7kgzbiNUNbjeigWY2vZ0
         neMlzbu69KyPHVOFjyT7ae8fDuBdMv4iiNZE0XlR2Eol6b95ulcppl6lyRUZf5qMcbwY
         z93JChI+ahH15Fdp+114ZqMSaVUtCwOi56p58ar/EWCz76X70sg9jGAZ9ECG6+NWEAXZ
         bn4AoHGXBR/9HJG9ki4jtn4MfUYGeQXTAS9pO7AXQqc+B1v3bAgPKqMNKeMTTRITlnSO
         HN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169352; x=1795774152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tP5tP1XsZQUtWMsij03mPLEQkw2o32O/Ohqtn1xKgnQ=;
        b=lG3zDmAvQCa3VTmGlan1qq5KrcOAT8OCiplcHn0G/oJzpOYvghSgNdQ6JQ8xQd4bdq
         TbmUne3AaEXgY6P5OSQWt1S2ZV+jaYB5HYupkiR6efKtgpUiRoghZoE2CQV1SLu9lafv
         AXT3A2Viz2bzKP3gnS9Hg/HHrQIDpf006xk65ot88YBKAiV8w7D5FPxlCZ/6pP4oFfkM
         nVFg6YPkYmD4QLhdvOCFWuJ72/46tKa66+Pa9UfojaYi1iX1LLBWqKDADmQ+rDxw6i9Q
         o5xr7A+oig0jG4k4NevAXx1WlSkmRGSuvjoMDhOL8l49Xdn3d44n7fVLEgqeMEK8uGh6
         jFjA==
X-Forwarded-Encrypted: i=1; AL+hErE5uKPfBLyqXGJ6zeHQLSeuYAxLy8zdTaYkB9FakIJ/ilGZcjNw1RbxNwvrvjECleCSVSRJiucE2wR7JNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DrgW5t7RT3cRlPRzs1f5HQgME+7nCWsQnXav/ExuP6cm3FP/7
	cM5w1UgQFN3/k8zg1FXbtlkWKyhB+U2qCLCZNrdXwAQf21L5o4L0e1PgClfO/udZkl8=
X-Gm-Gg: AZFdTZcJYgINRQN+vc6htVbQctvfCRuSVXXMm6IgjVYShhLoXPvHe0vYS0yfxUIvMu8
	yEK7GquDvkRtvKBU4SOuD5/FrZL5OK59V/JrGsmaB7IPWTrTYCdrqvYkJNw3TBmwJXwSKxHnzOX
	EIPDq6TJRg0MB4cyPuViOlY4mH7p330TX3a3T1QtHysvmP+D9oZMNCrgmjXxESVBEFoOhBnURXR
	qKjKQqeY6Um7f1TJmGr3zK1QMms4He2+gzhAMqOo4qMjf8ngmTlmQ00WfDG2uXSGROrImFkn5MZ
	t7P5y21NFNTZQ8DToFyknRC1a+JXXo02QkKkQS9WtzgJPK2X21i/68OQh6JGJx+H1ZutflnpC2L
	dWsQM/lJTekH8VoTwdJsh9UR6K1IjdzSSP6lz1ay0QXopMHawfKevSOh8KIP97CjiZucmOitEJe
	+10wmf3KXlUBJJFqbtUhA74iR52P45WxucRxGgOtLRq9sVJO0p6EW+ker+puwg0HiTdbbSK+P6J
	IgARXlDInDwLJUsf19QyePl2lc4pAgeopBWdFxhoLRIgkdvyz1lrZN3DYvzj20WJ9fOMDyr3UCQ
	VDIJYVdS4hpeyL+dnwbuto0bQimbRko89rmf3ABcxHdGFq9irjZSQPO5KBtIVi0Wlw0n4Q==
X-Received: by 2002:a17:90b:2f8f:b0:3b3:ba43:54c0 with SMTP id 98e67ed59e1d1-3b41c98a338mr2073390a91.15.1795169351488;
        Fri, 20 Nov 2026 02:09:11 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.09.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:09:10 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 00/11] mm: Unify memmap initialization for compound pages
Date: Fri, 20 Nov 2026 18:08:45 +0800
Message-ID: <20261120100856.16929-1-songmuchun@bytedance.com>
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

Hi,

This v3 is based on the mm-new branch at commit 15f114dac9a7.

This series is split out from the earlier, larger series
"mm: Generalize HVO for HugeTLB and device DAX" [1]. That series
generalized vmemmap optimization across HugeTLB and device DAX. One
remaining piece is the separate compound struct page initialization used
by boot-time gigantic HugeTLB pages and compound ZONE_DEVICE ranges.

In v3, Li Zhe's template-copy work is integrated directly into the
generic compound-page initialization changes instead of being stacked as
two prerequisite patches. The shared memmap_init_compound_page() helper
now covers both compound ZONE_DEVICE ranges and boot-time gigantic
HugeTLB folios. ZONE_DEVICE retains memcpy_nontemporal(), while normal
memory uses memcpy().

The first four patches make the generic memmap initialization code
suitable for sharing. They add zone-consistency verification, factor the
PFN-independent page state, simplify ZONE_DEVICE template setup, and
introduce the common compound-page initialization helper.

The next four patches remove the boot-time HugeTLB HVO special handling,
initialize all bootmem hugepage struct pages in one place, switch HugeTLB
to the common helper, and make the now-local page initializer static.

The final three patches centralize early CMA pageblock setup and move
MIGRATE_MOVABLE pageblock initialization into the shared memmap helpers.

After this series, boot-time HugeTLB and compound ZONE_DEVICE ranges,
including device DAX, use the same helpers for compound-page and
pageblock initialization.

[1] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/
[2] https://lore.kernel.org/20261112112816.55095-1-lizhe.67@bytedance.com/

v3:
- Integrate Li Zhe's template-copy work into the common compound-page
  helper and drop the standalone prerequisite patches (suggested by Mike
  Rapoport)
- Apply the helper naming cleanups and remove duplicate ZONE_DEVICE
  reserved-page initialization (suggested by Mike Rapoport)
- Update the HugeTLB performance results for the integrated
  implementation (measured by Li Zhe)
- Restore managed-page accounting after CMA activation failure
  (reported by Sashiko)
- Correct [2] to refer to Li Zhe's v3 (reported by Lance Yang)
- Collect Reviewed-by from Lance Yang

v2: https://lore.kernel.org/20261113033442.62970-1-songmuchun@bytedance.com/
- Fold in Li Zhe's memmap template helper series, based on its v2 [2].
- Remove __meminit from memmap_init_page_common().
- Add a cleanup to make memmap_init_page_from_template() static.
- Collect Reviewed-by from Mike Rapoport.
- Fix the helper name in the final commit message.

v1: https://lore.kernel.org/20261109095807.41547-1-songmuchun@bytedance.com/

Muchun Song (11):
  mm/mm_init: verify zones for template-initialized pages
  mm/mm_init: factor out common struct page initialization
  mm/mm_init: simplify zone device page initialization
  mm/mm_init: factor out compound page initialization
  mm/hugetlb: drop boot-time HVO handling for gigantic folios
  mm/hugetlb: initialize all struct pages for bootmem hugepages
  mm/hugetlb: use common compound page initialization helper
  mm/mm_init: make __init_single_page() static
  mm/cma: centralize CMA pageblock initialization
  mm/cma: localize init_cma_pageblock() to cma.c
  mm/mm_init: move pageblock migratetype init to memmap helpers

 include/linux/mm.h   |   8 --
 mm/cma.c             |  38 +++++--
 mm/hugetlb.c         | 111 ++----------------
 mm/hugetlb_vmemmap.c |  19 +---
 mm/mm_init.c         | 261 +++++++++++++++++--------------------------
 mm/mm_init.h         |  13 +--
 mm/sparse-vmemmap.c  |   7 +-
 7 files changed, 140 insertions(+), 317 deletions(-)


base-commit: 15f114dac9a7bde1796f0e54e22726fd31cfa8a5
-- 
2.54.0

