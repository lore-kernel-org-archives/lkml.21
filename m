Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204262;
	b=FD15o62GhTkJYomNnzykn/LI8UaAElD2lGS773vX4L+MWECpN6+qyrNbkgVHrNFhSsBT
	 4HeXm320vNZJFyEapwqvBIUkTbsji3xCTraVKUPdaMss/CuFydHJ4kJqOVTYPDmVXwD+J
	 V9ck37e/82mUrzyNc7kqhwtlpYDsObsZQc2DV46owtCUgSRFkco8Pi31kvL5Jk4u2W7hW
	 3v9hgLQS83cAScUqyZcMU160Ya4yDK9HKBKyRsOZqslDcZtH1VTlmLrdjoY73yRDI/qeW
	 ouoshTopCuNlDVRqhLUH6Hm7Bv6mWbitaXdeBKHGHqqAkwGO0bvBkJF1FJnswTOI+ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204262;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MTAY5ibAV1uBF9jduuJT+bDCTIoeL+5xkNZ5oxnneLw=;
	b=dC57ApnPd0U3UjX1rFj1UXdFSE7j7CRn3/wCkmRsgHvcvTHtNp4Gp+OMqU95Voh1UERZ
	 Pp6cHrLFfpUr9RTSRQNzSpFM2FgqrdR9OK31/EEiWSwg2j+ImUQ2QGswdxgOUD2UbPt7X
	 wpoBlEqRJZuMFJcxFPOojEgOeaGowd8cfYLJfNY87QAwUL+XSmJYiye3HJk2sNTUy3TUU
	 AAP7UM0KmWdIyYoZSAdB+hQCuSTAhnpM3MyBwu6ARuLvs0RCI3W4TeM4pyoHZninDzW3Z
	 5TuZYjMmJBZzqPRmITwMDfqANP7Zy5fb+IQtzFG2SzA3OE7Cq5bu0VY6PKfx2gdzI+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A/LHCGfe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745E760A2621
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A/LHCGfe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041FF1F000C6;
	Fri, 20 Nov 2026 19:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795204262;
	bh=MTAY5ibAV1uBF9jduuJT+bDCTIoeL+5xkNZ5oxnneLw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=A/LHCGfe7mu4454iMs5fhNiINy54iJwrmXZT5ZmbHZaxSE3qSYofocnuDwsb3nVZP
	 rkrTqjJ/FmgPJB0r+5bSjYluJfO0FJiZYA7LMmg+d6Oap+l/40yOLjj2b4MUmDjrTB
	 NtG/8sIT0VGNBPFd5qtgmzVlnwHDbEMK8LZZEnMH+C+nsXmDc+cHhAGw5K6W4M5XMc
	 F53IjUa+fdgCez2RmrnoqkxwoZd2umDt/RrZyV+2MyPkrOxEed8lbHVET2wgZZ9jrB
	 tlN/4sFAlc7HO7IU/5nIVvTazall6xcsZQD0yQfgKWrsRU4Ujknp1yN9VynbdIW0hS
	 Ni9ATcTdbhHVw==
From: Chris Mason <mason@kernel.org>
To: hughd@google.com,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	qi.zheng@linux.dev,
	qinyuntan@linux.alibaba.com,
	shakeel.butt@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	mason@kernel.org
Subject: [PATCH v2 1/1] mm/shmem: don't use the memcg of an uncharged folio
Date: Fri, 20 Nov 2026 14:50:58 -0500
Message-ID: <20261120195057.50031-2-mason@kernel.org>
In-Reply-To: <20261120195057.50031-1-mason@kernel.org>
References: <20261120195057.50031-1-mason@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The shrinker for unused huge tmpfs folios can dereference a NULL memcg
if it races with the migration of the folio at the end of a file.

folio_memcg_list_lru_alloc() assumes that folio_memcg() is never NULL.
But it is NULL until the folio is charged, and a migration target can be
in the page cache before charging.

shmem_unused_huge_shrink() looks the folio up without the folio lock,
so we can race with migration:

    __migrate_folio()               shmem_unused_huge_shrink()
    =================               ==========================
    __folio_migrate_mapping()
      xas_store(newfolio)
                                    filemap_get_entry()
                                      returns newfolio
                                    folio_trylock() fails
                                    shmem_unused_huge_requeue()
                                      folio_memcg_list_lru_alloc()
                                        folio_memcg() is NULL
                                        memcg->kmemcg_id
    folio_migrate_flags()
      mem_cgroup_migrate()
        commit_charge(newfolio)

Fix it by keeping the original objcg around while the inode is isolated.

Fixes: 743e7d025d2f ("mm: shmem: make unused huge shrinker memcg aware")
Suggested-by: Qi Zheng <qi.zheng@linux.dev>
Signed-off-by: Chris Mason <mason@kernel.org>
---

Notes:
    v1->v2: adopt Qi Zheng's suggestion to return early in the
    failure path

 mm/shmem.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 10cef89b00b08..901cfd15bdbd0 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -758,6 +758,13 @@ shmem_unused_huge_alloc_lru(struct shmem_sb_info *sbinfo, struct folio *folio,
 {
 	int ret;
 
+	/*
+	 * A migration target is in the page cache before it is charged. Once
+	 * charged, its objcg can't change while we hold a folio reference.
+	 */
+	if (!mem_cgroup_disabled() && !folio_memcg_charged(folio))
+		return ERR_PTR(-EAGAIN);
+
 	ret = folio_memcg_list_lru_alloc(folio, &sbinfo->shrinklist, gfp);
 	if (ret)
 		return ERR_PTR(ret);
@@ -887,12 +894,11 @@ static enum lru_status shmem_unused_huge_isolate(struct list_head *item,
 		return LRU_REMOVED;
 	}
 
+	/* keep shrinklist_objcg, requeue may need it */
 	list_lru_isolate(lru, item);
-	objcg = shmem_get_and_clear_objcg(info);
 	set_shmem_unused_huge_isolated(info);
 	list_add_tail(&info->shrinklist, &scan->list);
 	spin_unlock(&info->lock);
-	obj_cgroup_put(objcg);
 
 	return LRU_REMOVED;
 }
@@ -928,10 +934,26 @@ static bool is_shmem_unused_huge_match(struct folio *folio,
 static void shmem_unused_huge_drop(struct inode *inode)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
+	struct obj_cgroup *objcg;
 
 	spin_lock(&info->lock);
 	list_del_init(&info->shrinklist);
+	objcg = shmem_get_and_clear_objcg(info);
 	spin_unlock(&info->lock);
+
+	obj_cgroup_put(objcg);
+}
+
+static void shmem_unused_huge_requeue_locked(struct shmem_inode_info *info,
+					     struct shmem_sb_info *sbinfo,
+					     int nid)
+{
+	lockdep_assert_held(&info->lock);
+
+	list_del_init(&info->shrinklist);
+	shmem_unused_huge_lru_add(sbinfo, &info->shrinklist, nid,
+				  info->shrinklist_objcg);
+	info->shrinklist_nid = nid;
 }
 
 static void shmem_unused_huge_requeue(struct inode *inode, struct folio *folio)
@@ -943,17 +965,18 @@ static void shmem_unused_huge_requeue(struct inode *inode, struct folio *folio)
 
 	objcg = shmem_unused_huge_alloc_lru(sbinfo, folio, GFP_NOWAIT);
 	if (IS_ERR(objcg)) {
-		shmem_unused_huge_drop(inode);
+		spin_lock(&info->lock);
+		shmem_unused_huge_requeue_locked(info, sbinfo, nid);
+		spin_unlock(&info->lock);
 		return;
 	}
 
 	spin_lock(&info->lock);
-	/* Requeue the inode to shrinklist */
-	list_del_init(&info->shrinklist);
-	shmem_unused_huge_lru_add(sbinfo, &info->shrinklist, nid, objcg);
-	info->shrinklist_objcg = objcg;
-	info->shrinklist_nid = nid;
+	swap(info->shrinklist_objcg, objcg);
+	shmem_unused_huge_requeue_locked(info, sbinfo, nid);
 	spin_unlock(&info->lock);
+
+	obj_cgroup_put(objcg);
 }
 
 static unsigned long shmem_unused_huge_shrink(struct shmem_sb_info *sbinfo,
-- 
2.55.0

