Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145415;
	b=KkB4W3URvfC2HOxXx3XYLOy+Wnv/BqEo+54cOOq9sp90vLjcbdtESZP0EWKySt68XLGS
	 U4nqBkjIOzVINaibJWOkagJJ1/PuvuLZtoG2j2SQN2BKT5TjB6vQSCUeg6mUvnvM8PLd4
	 3qQ4asF7PJD/aj1qisewfb2NPhgkR9K/5Mb1oZ6IMB10vbFSTu4XfraCOVIDBiSv/mCDO
	 r6HXZKo+M9YDTULJWj6fZkexah2mzctdjJeYW+/81Fof2TP1ba9+Mj53eIlpZjpCMBbIu
	 RROozVUKxj4IWuWx9NbTBl06HPQndvOCplqCCxRWCXqLoMxY2y7NReVsDY7eEyZQOkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5KQryppcZTCndUvPMmTnDA5Zo+dmCbnx/qPrbhLEgfM=;
	b=cg6vvnnKwZ4ye74Esvok/EgNqVXgV8w7/Y3pFI5SU+PON7ZGc7EtEUmkVHPVpRvv9zei
	 U6GGjJfYjj6PRAMEAiYa+ZSyP6j+nuIR4lMFaz7ngvLyYnacuo83QG6Vjb471zYEFuMn0
	 T1Jg/tms9fvgz06OapTpMgVpAsaJNbaCBR7PI3dcS05D74WCWH+c9W/Duq5NF2sAhEior
	 a7CmP3lSitDbRJV6C87qMbi7wcv1JZcUpf1CAgRBZNaxTJ5m1KHtDen1nZ8QH66tyGuLp
	 Yccablgcy7ItYN8jrOOnQXHw0Sf237j5+bvBU09KItwLXsbOKjeShU35s23/kssHiPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UlLB5oh+;
	arc=none smtp.remote-ip=74.125.229.139
Received: from mail-dl2-f11.google.com (mail-dl2-f11.google.com [74.125.229.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5B9606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5B9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UlLB5oh+
Received: by mail-dl2-f11.google.com with SMTP id a92af1059eb24-1b345449fcbso17627c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795145414; x=1795750214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KQryppcZTCndUvPMmTnDA5Zo+dmCbnx/qPrbhLEgfM=;
        b=UlLB5oh+VF6i7P5nkDY0/lJCLfAvVn0K9ALBEqTgHJqXiS99gMdeoWAzOh66dKSKaW
         Lij3L/QMDwteypE3weF79alRJm4TyjZePCMCbtSzMrniRUJGPXVV0mela3eQuf8JtsdL
         vV7JqmyUhdhqD05iuFZvzRZtezJ+5+SwPzj81mjQRClQB0nChvw/H+PdDIxfd1ueT5fa
         kZINFlHg2TNQMoULloswUK5dvWlMNY1A+dnAA5ILY53jRyMVo7RT0Dw2l57YqjEPmUYQ
         WfIlh7fRu66b5In1Onf7vlwDgzmxPm5RmOkr8m8C/5D3QRFc+tr5YTPc3hVtD/zD8H9T
         DHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145414; x=1795750214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5KQryppcZTCndUvPMmTnDA5Zo+dmCbnx/qPrbhLEgfM=;
        b=2lvaAsH33mHxgootoVNIrEJoFuJAY0p9uLcrKa1L0EP5t4bdm5MBpUpmrIE5EqIjem
         ajcVCOuvc7YgO7erG+g6TGwrsrKOC8rxIsmRove9lhuvcGeFW9zAoZbjX4GFL5uIu1XN
         l5TOUNLYNuh7ypd0K0BS6G1MAN4QJ3+7nvdhjjceHC7EIp4RaFfBQAxMIArXZE+GNcgQ
         9G2dhCHaARBV7tLgEIf/I94fH66EVE79fOkpw/1FDJR8PXuLpRA0gkhKW2dV1eQzZOwF
         3hyhsnG6RCzTo31kfRL1Ar2BA/g7v2yrYCwmHDrL9Zmx/bYDXkRLvVQgVQYVkW+nBnLZ
         CmRA==
X-Forwarded-Encrypted: i=1; AL+hErHVQ427wA2o4+9UyZVrMLpsH67NnmOCuUUuJquNag3zepAxOnZ0FU7e5bxV23HBqNgLho5lw0bPzYoe21U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qmCfIVF+UvemeS+HRiEaPKGWhbpisZ6dGPms74+NUK/h9WTg4
	nU5TD8RrP/9UVqCMZqAG5/5BvVUlOgRgNUOOt85yxv1KotNWDkXPLCWu
X-Gm-Gg: AYBFou2nblDoM7Edk36Y+Xf5dacnUmPt3o2lIbux5eNyTXUJCHOLvlGlcs+wtimu56r
	Ept9MCDa1h0sT21UE1YuyVIC6TrXm3roaZKIh4cmDOoBV0B7ySysRypxQWATRQbO1Pp7g68onSB
	BibdFtVC1zjUDfY7k9fI+DwDKdDnGabUQ262E5JwyCax2H0YemC/igqvcp04S9vLn5RKyAFTuzA
	T8nw6PHdo6gYoP4lL/TxyH0UofDH1FmAiHhXq5Jsm0uDV53X+MYAH5nlvqwUvOq/yOASKDil0aS
	jC2P++hSwwCIPidi36wUddHCzgCObp3fPbFYD2LJA3Y0zrkK+akNGkvT7bikAfwrabr1VaS6KO6
	dSRcsRg5NLD/ZvXiaMc6hzeDtEmVazreLYIzaJ/suGlV993/KPcziDtxH6mpFhp6jZph2uGf9E0
	skVzk3CsY+wzx4Ot6898g+8+6zftT6Qb7g+lBUGgc5DGgt1dCl9ScDEmvSLzGpeAwcebqflAF0k
	bSVGMVnFlkgBQ9iOYWQWs/FYcDtZRgtbmwZ77V3RfpNyUdxBes9qR0dlCsfo9IX1MJpjsnTcidM
	Mo9nnmlQ9UglnuOgGh4DSb5vRnpfsJQpz6i6JVmlEaCZN5iMhFSYVFWp2HV1wAc=
X-Received: by 2002:a05:7023:a5b:20b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1b5568b9f5dmr1447318c88.28.1795145413793;
        Thu, 19 Nov 2026 19:30:13 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e644dsm4362507c88.5.2026.11.19.19.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:30:13 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com
Subject: [PATCH 2/3] mm/migrate: batch PTE restoration in remove_migration_pte()
Date: Fri, 20 Nov 2026 11:29:48 +0800
Message-ID: <20261120032949.2036731-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120032949.2036731-1-chenwandun1@gmail.com>
References: <20261120032949.2036731-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

remove_migration_pte() restores PTE-mapped large folios one PTE at a
time, constructing each new PTE and updating the folio references and
rmap separately.

Add migration_pte_batch() to find adjacent migration entries with
consecutive PFNs and matching type and flags.

When a batch covers the whole folio, the rmap helpers already call
mlock_vma_folio(). Skip the explicit call to avoid double mlock
accounting.

Device-private PTEs encode PFNs as swap offsets. set_ptes() does not
handle this encoding when constructing subsequent PTEs, such as on
arm64 with a 16KB page granule, leaving device-private destinations
unbatched. The next patch enables batching for these entries by
advancing their softleaf offsets.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Link: https://lore.kernel.org/lkml/5f9c449e-43b3-4732-9c14-8199418cace0@kernel.org/
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 mm/internal.h |  6 ++++++
 mm/migrate.c  | 35 +++++++++++++++++++++++++++++------
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 9f78c12882cb..e6ecf307d532 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -552,6 +552,12 @@ static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
 	return __softleaf_pte_batch(start_ptep, max_nr, pte);
 }
 
+static inline int migration_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
+{
+	VM_WARN_ON(!softleaf_is_migration(softleaf_from_pte(pte)));
+
+	return __softleaf_pte_batch(start_ptep, max_nr, pte);
+}
 #endif /* CONFIG_MMU */
 
 void __acct_reclaim_writeback(pg_data_t *pgdat, struct folio *folio,
diff --git a/mm/migrate.c b/mm/migrate.c
index 3c39d309e6bd..e000ef77ea87 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -358,6 +358,7 @@ static bool remove_migration_pte(struct folio *folio,
 	while (page_vma_mapped_walk(&pvmw)) {
 		rmap_t rmap_flags = RMAP_NONE;
 		unsigned long idx = 0;
+		int nr = 1;
 		softleaf_t entry;
 		struct page *new;
 		pte_t old_pte;
@@ -441,17 +442,34 @@ static bool remove_migration_pte(struct folio *folio,
 		} else
 #endif
 		{
+			if (folio_test_large(rmap_walk_arg->folio) &&
+			    !is_device_private_page(new)) {
+				unsigned long end_addr = pmd_addr_end(pvmw.address, vma->vm_end);
+				unsigned long max_nr = (end_addr - pvmw.address) >> PAGE_SHIFT;
+
+				max_nr = min_t(unsigned long, max_nr,
+					       PTRS_PER_PTE - pte_index(pvmw.address));
+
+				max_nr = min_t(unsigned long, max_nr,
+					       folio_nr_pages(rmap_walk_arg->folio) - idx);
+
+				nr = migration_pte_batch(pvmw.pte, max_nr, old_pte);
+			}
+			if (nr > 1)
+				folio_ref_add(folio, nr - 1);
+
 			if (folio_test_anon(folio))
-				folio_add_anon_rmap_pte(folio, new, vma,
-							pvmw.address, rmap_flags);
+				folio_add_anon_rmap_ptes(folio, new, nr, vma,
+							 pvmw.address, rmap_flags);
 			else
-				folio_add_file_rmap_pte(folio, new, vma);
-			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
+				folio_add_file_rmap_ptes(folio, new, nr, vma);
+			set_ptes(vma->vm_mm, pvmw.address, pvmw.pte, pte, nr);
 
-			ptes++;
+			ptes += nr;
 		}
 		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
 			if (folio_test_large(folio) &&
+			    nr < folio_nr_pages(folio) &&
 			    ptes == folio_nr_pages(folio) &&
 			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
 				mlock_vma_folio(folio, vma);
@@ -462,7 +480,12 @@ static bool remove_migration_pte(struct folio *folio,
 					   compound_order(new));
 
 		/* No need to invalidate - it was non-present before */
-		update_mmu_cache(vma, pvmw.address, pvmw.pte);
+		update_mmu_cache_range(NULL, vma, pvmw.address, pvmw.pte, nr);
+
+		if (nr == folio_nr_pages(folio)) {
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
 	}
 
 	return true;
-- 
2.43.0

