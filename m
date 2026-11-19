Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117020;
	b=t26zMsAlj0P4mYjRENuJq0HIx3WapxjtnIVjdrR0BfxGDT35duvQ7kL9yekBR9LVI7rJ
	 Qp/tdMGNK5BJwETUdmARn179UpkkcIWe0ikBJRwCdbbD5ayqWz0gXTFa40edcSqgiE+cZ
	 PiJe8unO3bcevt0sJX9Jr1IGvyK1AlxhEj7J4qggcEilah6V7zVp32b+XwSKW+o+/TdbQ
	 a3KuxcvyjjLJll3khaowuzrcJiQ9cYK6q7YmN/e8TjrMFo2I30Cs7qpYt+4XIrpg6/Sx9
	 vxqZGP8MJILR7zpoOsZ8rJn3Kpz4uGuuT8xKX5l0wV/SIlhvJKGGBA2fqUewr5MHbRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117020;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nbSaTv00XrnS3z4ynTuPVvGI4QPJtySnEbRJHnCVwLg=;
	b=5Lt3CVXDjgoiMnaUEGuVxK8JcXEtfpYOcvWAhFn5o7SJmG1vYeRxYcSRJnwSi5vo6DiV
	 s9YB9zMVZFLwH88CrJVfs5dglsSGCP65qnv3QLK86phugVKqNBJTULzEzCSmqsWfwcgmu
	 aLwDEOhTFSWrn1EqmeePeKzknKMR2biwMNGhObG/C+r1ElGU3lrY3gmS8A74vxqN56E2Z
	 MTFiGKTBGPRX+ynLWkb5pV61omw8ouCdq6SnCoooBAzP2BjWEJNzfhG6m8O9YxkeUbTxZ
	 T7QhvWljLhG1kvlBI6GtGU9czWS3B59PgdAgaBlvJcX8RxLGEAKpCAFbwT5vTiXtXtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GjEL9/j9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3731E606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjEL9/j9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7701F000C5;
	Thu, 19 Nov 2026 19:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117020;
	bh=nbSaTv00XrnS3z4ynTuPVvGI4QPJtySnEbRJHnCVwLg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GjEL9/j9g/k9ifKAZo2phRjhiZdSeIum7AHbliPM4QvstJODJ614SblVkVz1CDAQQ
	 mC60F3WehuYdg9PEm4VBCOns83QhMyw+5s1EO68ffsj9JwjknZ8kNxp7LiNm3Qeq0U
	 ryCMByRFIolAID10nuVBJJyVUkv+nMW/F1TpQVpsTQuQ2DVrKn3A6s5/me+lTXmJ05
	 LB2jQsm9epFt3tXqUZRxOeZeDz6bxJbCU3jIixUiujHf9KL9akYsvRLE+5Bgch4wx1
	 3HrW6+tcJxGKYOjTpf+sWgNLsoELEN7ILuwjmXzfcjF3DeeraQ3haE2tEFZpO+0ZjZ
	 ccmSiT/beQvww==
From: Chris Mason <mason@kernel.org>
To: hughd@google.com,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	qi.zheng@linux.dev,
	qinyuntan@linux.alibaba.com,
	shakeel.butt@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] mm/shmem: don't use the memcg of an uncharged folio
Date: Thu, 19 Nov 2026 14:36:57 -0500
Message-ID: <20261119193656.88678-2-mason@kernel.org>
In-Reply-To: <20261119193656.88678-1-mason@kernel.org>
References: <20261119193656.88678-1-mason@kernel.org>
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
Signed-off-by: Chris Mason <mason@kernel.org>
---
 mm/shmem.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 10cef89b00b0..4465a43d6f74 100644
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
@@ -928,32 +934,41 @@ static bool is_shmem_unused_huge_match(struct folio *folio,
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
 }
 
 static void shmem_unused_huge_requeue(struct inode *inode, struct folio *folio)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
-	struct obj_cgroup *objcg;
+	struct obj_cgroup *objcg, *old_objcg;
 	int nid = folio_nid(folio);
 
 	objcg = shmem_unused_huge_alloc_lru(sbinfo, folio, GFP_NOWAIT);
-	if (IS_ERR(objcg)) {
-		shmem_unused_huge_drop(inode);
-		return;
-	}
 
 	spin_lock(&info->lock);
+	old_objcg = shmem_get_and_clear_objcg(info);
+	/* The lists for old_objcg exist, the inode was queued under it */
+	if (IS_ERR(objcg)) {
+		objcg = old_objcg;
+		old_objcg = NULL;
+	}
+
 	/* Requeue the inode to shrinklist */
 	list_del_init(&info->shrinklist);
 	shmem_unused_huge_lru_add(sbinfo, &info->shrinklist, nid, objcg);
 	info->shrinklist_objcg = objcg;
 	info->shrinklist_nid = nid;
 	spin_unlock(&info->lock);
+
+	obj_cgroup_put(old_objcg);
 }
 
 static unsigned long shmem_unused_huge_shrink(struct shmem_sb_info *sbinfo,
-- 
2.55.0

