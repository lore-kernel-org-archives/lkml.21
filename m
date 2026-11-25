Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607553;
	b=0emOpBl9FWXrwkTZAAi/7d1R9Hs26PQ8K+cVa6Zpq4WawjRGBMuiPyO5eW1xf/wDNWm9
	 K3yqdTh2Zd2FGHGmLbjE7xIeFDrXwxoo7vczaQQ8zXAXhPEr5GM1vyjmj4qRgsWGAyNkC
	 LNB7qRfff1vUGynjnaqs/zS0eK/stZc7rLb9aSAYTT6+4pntvVZ7bdoLByhKcfbzmH0Yi
	 DU9UqMehkbGrdHIJ3xEcnizGgqGwM3oK5lILaWVYxuMU/d+Iw3u8lp1KlCCCP0zw/bJTb
	 Yt7C9HYOEM2zxWfTpCxHxpY/nfxpZJD6cpylml69bjU+7UjvnmgKR9dOZlHLpR72knQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607553;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YrUqEMm9z5J4jaNe8INgEE9sMz1REWYf5p9yYZc/oOM=;
	b=3u+iUXdHCTdmGvxsfpptbwOQ9hjp7VlMf70osfvk59mHa9MOCypuZo2VZRfL8CzmOrLr
	 UPa/qn5/pYaBVAMOZq+sZsUE0+402FWYFse9eKVkY4GkthLpGGlHRjdtHSu7VaTIN9/xh
	 7BHqyIqBb5MYdAYX5SxS9FoSYi8dDatYE2LqMj6D7KlxpTfyaqn1jLkuEW4G5T6R290wV
	 OO/r50UJ1RrQbtuMqqLfmuzTbcfww5iAK2vPk6BoQdOwRx7PnYBncjheceUliArbOZM4J
	 grEVKuf9uCuVR63O6Zv9MD6IyNpWCJmmbRXnXUdXvlKltTDjUCpxW/gc0L5XKidSsrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NK6wMFG2;
	arc=none smtp.remote-ip=91.218.175.78
Received: from mta0.migadu.com (out-78.mta0.migadu.com [91.218.175.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C30606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C30606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NK6wMFG2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5O5gPTvKN1uioPmvTeSAALfxSrjKERJLwEwvEZL/R/o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795607549; v=1; x=1796212349;
 b=NK6wMFG2CnowpCQWyha/PYUOCGpTb9mBxbTOdErQJ5+gnbIwAW+gX7KgP+CudrRkxCH07DxJ
 j2AIyLjusTqpEK8L0TW8MtQ5FYCdBi7A+AAXZyatznj0Bkr2SYva30drueldBwo5opy5kEvPjfM
 Cc4RvsR83++wdnmvKsCx+ZBQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id dab8a477befd0327;
	Wed, 25 Nov 2026 11:52:29 +0000
X-Mizu-Trace-ID: dab8a477befd0327
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	apopple@nvidia.com,
	byungchul@sk.com,
	david@kernel.org,
	gourry@gourry.net,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	liam@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	matthew.brost@intel.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev
Cc: Usama Arif <usama.arif@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH v4 3/3] fs/proc/task_mmu: account device-private PMDs as present in smaps
Date: Wed, 25 Nov 2026 03:49:59 -0800
Message-ID: <20261125115014.4014507-4-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261125115014.4014507-1-usama.arif@linux.dev>
References: <20261125115014.4014507-1-usama.arif@linux.dev>
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

Device-private PMDs represent mapped pages, but smaps_pmd_entry()
passes present=false to smaps_account(). That treats them like migration
entries: mapcounts are ignored, PSS is charged in full, and exclusive
mappings are accounted as shared.

Match smaps_pte_entry() and mark device-private PMDs as present so
smaps_account() uses mapcounts for PSS and private/shared accounting.

Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Cc: stable@vger.kernel.org
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 fs/proc/task_mmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index cf1732935c73df..9017b312f404ef 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1034,8 +1034,11 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 	} else if (unlikely(thp_migration_supported())) {
 		const softleaf_t entry = softleaf_from_pmd(pmdval);
 
-		if (softleaf_has_pfn(entry))
+		if (softleaf_has_pfn(entry)) {
+			if (softleaf_is_device_private(entry))
+				present = true;
 			page = softleaf_to_page(entry);
+		}
 	}
 	if (IS_ERR_OR_NULL(page))
 		return;
-- 
2.53.1-Meta

