Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035835;
	b=3t8/ltSyTIQuxs014/T5mSmo4Ls7TRX207GCZabFKllGfyskPec83Q/p0qHwBREKOeuP
	 BOjwFNSAibjCvNUEySzY8qAd+u2jYnKGeFsK3uPNkxlvtnFuVBThleIP88rbWAFhSVwl9
	 9eEVno8Kqq9RsqqxvLuOzuSCDaFimAi/025lai+Pfydh/KwROlCwYy/04RijERDzFQFY9
	 sys9L6mBEKp/3fnQkrWeGiHM/II+cKJXXnTe1ikEMnbkjBgBXJz3cAnWD7rt80yss/NgK
	 mvQpB9aX4C4f/y8X8NVswMLwZWe9CiWy9idFGIWZmwIzdTi2JNK6Spzv4KXgepKllbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035835;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OzxS8FucW3HiaXjFt3oHPV/7/cOrPnUfOI6umwv44A8=;
	b=HQWXMnuKoGKlocWhdUJi+l17JP/p3ycOnp0Jkw2NnObzvg0d3DwNFWBU0fOvEfMAJfQA
	 sSqb+SlTScIOr6SfIH9LoCRGIOZimngEhsACeoqWxb8FZBVkdHGInOTARoGrg6sBfO/KX
	 mcnFmDh9c7LXx+kndceqESLgzkltGt9rj3dTjim4ykxR4ArXLlgeL5NW3/IFTW2kdM/KL
	 a8LomxYvz4TYvQnwm/A6GFXJYHDZWAiDvKAm+7rcoSVGbVOBhlsSWdzNhbvytSVn63Ooy
	 dGV3ymqRG0KvQxCkTc0w2Y+YoIHe4M8RDakzsDPVuQsRbDlmV0tq3KJcJRVAXXxWAXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9ClvVtN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC1E60A2620
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9ClvVtN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795035835;
	b=PDotQbiEjryRGAE5XTP9vzNW1FX3L0wLcgPHpt7MpxUvKus6oB9Xu/G61cXCbM3+hvib
	 XDj35tZqFSjz0DDCUPXA8z/qr9ZCLyCtxWgXOJP7c35ELygWEfehcgHD6aFWdyA5Li1Bh
	 955+29f3LQnFxahbnrO2VQjVsJFAxPY8uj4/8hSCAy9IV3mGn1Zp3bemOnzH1Qdsb1nTi
	 sLA+cqbemg4SclZbmdLKZQVzHtkXi3fOVPWqHCqOeAVJcipwXlYGuuiJZFm8oKnNF2+CH
	 guwVoSoUb8uls0kBOIAK7zcwxsiC7RX4rsndfpc7EQ4lCXSsWm5Yb66maNWTVp5wdrQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795035835;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OzxS8FucW3HiaXjFt3oHPV/7/cOrPnUfOI6umwv44A8=;
	b=PRNc5S5Oh0NZxeDVpr2iJl6QfuHZ1Lu+p+4aH5OPZqbtPIWT9gQCqj/ypL0sysGTdk9M
	 1pRzjuiiVa2WbKB5j8X+tYeaKYJ82786io6v4oudOk01gdLPfP+FEIyvBIoVAoFgOrPyH
	 MihVzfrWkFSuum5F4kcXHzwQT74nILblAnUXQAsU6IkIRYNuCnhaVwYUv9EliUeAxoein
	 HfMwhyyNlpmVhIUQOYxcUocm2tDRZQWHABDGUI7FhNwGfKTsNzJZBeP0lufeW4x9usFfV
	 hPMDKh16VWPbslj/rv8QUMVF1g7+PiZGWenfX5ELvjsuBFrGBJPO+CUsfM09Kho8/YQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2DA61F00934;
	Wed, 18 Nov 2026 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035835;
	bh=OzxS8FucW3HiaXjFt3oHPV/7/cOrPnUfOI6umwv44A8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F9ClvVtNoTqTL+Z8gCqbxVUwX5fbNR6erLRWk2rA6bNOpjgi1ea4jdxXJH/TDyChO
	 VEk5v1qHOUJ1N7xb88lIZRpaVGkKYaIq9MrvgqPKB+0ZKuJNEcnuZ7HxHP2Yr4AADD
	 TfaKSHr+85dWa/WgFe6rlcq6naGOjvzcZhb0uhbH92cEw6v01uRrotJUM1IFe4aa2R
	 Ab9jpHOowbVTMRxqtvHcXjLaSaI0ytk+yVvNqt/QT2rG831v4CAhmEVO9Q8CXREe6E
	 fG1b1OG4yXvHT6u5io1gVKKuJsY3B1smNh0xaSmN8K3kddqSA/U3xVBrXdGUH8bDfJ
	 op+dYF726U93g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 53A354AFB4;
	Wed, 18 Nov 2026 21:03:44 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Thu, 19 Nov 2026 05:03:44 +0800
Subject: [PATCH v5 12/17] mm/khugepaged: convert to LRU refs based
 operations for MGLRU
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
Message-Id: <20261119-mglru-fg-v5-12-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
 Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
 Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
 SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
 Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
 Zicheng Wang <wangzicheng@honor.com>, Chen Ridong <chenridong@xiaomi.com>, 
 Tal Zussman <tz2294@columbia.edu>, Kairui Song <ryncsn@gmail.com>, 
 Xiang Liu <liuxiang.277@bytedance.com>, 
 Ehab Ababneh <ehab.ababneh@intel.com>, 
 Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
 Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
 Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
 damon@lists.linux.dev, linux-doc@vger.kernel.org, 
 Kairui Song <kasong@tencent.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795035820; l=1308;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=GSfbPNgLMnXCEtSfL4kSp4PCNV1ejnHpWoKv9fS/jaE=;
 b=fzCjWB4x5yy6GmzZuPiQKuZftrRJcednIvgNY0u6IIjiMANZVD50MXigQUOLXSTn1Tj0Ir4M5
 KAHzmaqS4cFBX+0o23LoWpkoJV6E899oz/mVRQoPRYaHozTcuf+K8pv
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com
Content-Transfer-Encoding: 7bit

From: Kairui Song <kasong@tencent.com>

For MGLRU, PG_referenced is only the lowest bit of the folio LRU refs
count, so folios with nonzero even refs no longer have the bit set.
folio_pte_referenced() testing the raw bit misses hot folios at
refs 2, 4 or 6, under-counting the referenced folios of a candidate range
and aborting otherwise good collapses with SCAN_LACK_REFERENCED_PAGE.

Test the refs count directly when MGLRU is enabled, mirroring the
smaps conversion.  The classical LRU keeps the plain bit test.

Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/khugepaged.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4bbe319ef86f..68f7a30e36be 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -579,7 +579,9 @@ static bool folio_pte_referenced(struct folio *folio,
 		struct vm_area_struct *vma, unsigned long addr, pte_t pteval)
 {
 	/* The folio was referenced previously ... */
-	if (folio_test_young(folio) || folio_test_referenced(folio))
+	if (folio_test_young(folio))
+		return true;
+	if (folio_check_lru_refs(folio))
 		return true;
 	/* ... or the PTE mapping was recently used */
 	return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, addr);

-- 
2.56.1


