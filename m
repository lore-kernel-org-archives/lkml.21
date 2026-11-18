Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035838;
	b=NJPwB8K/9EUb3VOZhwbcOL5n1tv9qPJOeWG14dqNzBRmR1WL/3/sc3rzHLgCKxXl80S5
	 GVDMDxVSa1cnAM8/9zE6YuXl5DJ5eQcY9/59VL0sMKtmaIGqJ8zGtmNHwOGW4chXYPQ5k
	 AX8jYNcBeoLDWV5qgcNS3IW5JtIUCrYXnZl9POpScVRfcAxFrOhWfc1SjrzZvadTJ6+d8
	 hebSKG25TrKp6vHJeM6AwixZ+ClsYrogcdTNbD18Ds8isDDeouj4uTu53MI9YY0v4yslr
	 JbiGEU9Tp9wwbIQ48MsqRnOLO0Z3SBDIoE+SpgmmZwao/H4AN5nRgO1es12I+7DVoFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035838;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=E4/9CXaCKwR+a8e+Rb4YtN6Xrcv9L6Zys6gp9ou+drU=;
	b=XtI5jWJS7+vJLtjAY7dWKGUmI8dbU70/DeKfc0M/pEtJ4nRZjz5k5tGQf4zahffUAwO1
	 wfnM0LTx5QIRnvghz+Uu4leAi3vTYiBHHpc6K2YUJKhpfd/svydVEwh4bgo3PLZF4AKF8
	 ObH/YcZaPVzOThzW31NzZXZgmEBKTa8/F749eR+wfkFUfoVAvnHkiGCP65adh9zmEP1mI
	 eELLJ5f4QUIw6tOhCkq8JadTHwt4JY9zgjMyAMhN4ymL6c7l9mM3TEpEfv5h4lIZJ3Avg
	 H+ikPbVLi6W3lyMQDgfPIo2hYswApBS7fkWbeIFbzJS4t758CQ7iqXWPA0puqGigRkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMmvMT1p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164B760A5BCF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMmvMT1p
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795035837;
	b=0nxCS1st4X9vuRaDc0wSTwWBoKnmngqMw7mQq7uuagVaNUTbo+jreGSxHiC2oyIWCFnE
	 wTMrZ4T4F8OHneiAAGIvbR+aqOCzLFWsz+VzL+23YUQSiY2JciVaEUJO6sPa+DAxOovpy
	 Dk3OT3oY6DpcFgCsNyFJnafov0J5+vkgyf9M6xyDST6SXGBLXAVQvLyTo/R86iOtwqirl
	 CSyj1cW7G3C/fl6N7xx2n/+bXOmlpLYu8HMAuDNWTMiD/Lb1xupBCaRmhIVX0efAi0NY8
	 RSNOt8EMsNHPDE8S+w1+TLYtrtlL1KJmHHVE9X37q+ZOuDSUfAo058N4UWZkjbDnKmw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795035837;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=E4/9CXaCKwR+a8e+Rb4YtN6Xrcv9L6Zys6gp9ou+drU=;
	b=C83+h86KR3nZjY1Nbw24K92jSnpM+ddCvDY1r848oIm7GaCrLl6xPZfzMLDaaBlWPklo
	 rkOeXHbqzvLdowhx815Ii3/qtFVHwXvtxLmsAedcREoK0oVgBbsANst2Q85IBILydtpe3
	 2nCuUoC8MyuUMYYrPvg8Ik3kwGuS/m8d0uwzZToIz4jkNeoVgMqrH9AW2Qw/CusgIdoQL
	 GmAZgWIelpAbRYD9dhyrcjouEoewvv4yLgwVRsuwPvS9cRaMZ+54ZmemTdZ+aUQ7nit/2
	 3XL9Xqgy1d+2lny4Gwme/9UUSRY7F7Jfmlnc36BzTHBdu+ABgiCMM8hBoRcI5Jt5aYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F1331F000D2;
	Wed, 18 Nov 2026 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035837;
	bh=E4/9CXaCKwR+a8e+Rb4YtN6Xrcv9L6Zys6gp9ou+drU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CMmvMT1p9ENZ105ODyDSh4HA3azJYgHudUuhJoL8fvj7bQ4vEfjikcbNrRo9Gt1PJ
	 /2cJ/aIrT47UnswLygjJXHEMHgZg1WFYnC7ncGXhtPe+87SWzOAsXTSmSwGat4cWXF
	 MCLOzLKspbw66QrrbBOlmMnxVpAh1+wkaWeZoasNpmmV2CN9n7QC62BzYlkphUS3Ay
	 FYjiTFbXUokB4VavlOUh08wC5+FmAMKzycO69JtIbm9lDA1chJhqplDS0l1IsyhHeE
	 c6Dowgo2Mr93ucUH/6PS01CbXsOtthmLskInN1hGergmThVn6OLpW5MtdRZ+Q+kCYH
	 wImwSWdvKQewQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8367A4AFBB;
	Wed, 18 Nov 2026 21:03:44 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Thu, 19 Nov 2026 05:03:46 +0800
Subject: [PATCH v5 14/17] mm/huge_memory: mark folio as accessed more
 accurately on split
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
Message-Id: <20261119-mglru-fg-v5-14-9eee2fe97a2d@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795035820; l=1979;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=vrmC2+9un5UxKDyFv7OO9k0KgNpOMmdZ6k1J7wplnr4=;
 b=QbYGss5INU4OZp8SggcIPzbLrD6kqcII0Rj4ALNbbDFMY5rCSN4SVyukVmNce4vSBNBwVPH9v
 N2OQruy/P3EAfo691tZIfocByLpuriqA2ipbGuq7KWvtwxZfL2QvItX
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com
Content-Transfer-Encoding: 7bit

From: Kairui Song <kasong@tencent.com>

The behavior of updating the folio's access info isn't consistent for
huge mapping splitting or ordinary unmapping. The page table's young
flag has to be translated into folio's access info.

Right now it only checks and sets the folio's referenced flag, which isn't
enough since folio flag updates on access have their own rules. Ordinary
unmapping (zapping) calls folio_mark_accessed(), and it also checks
if the VMA has recency to avoid false updates.

So first just use the right helper here to be more consistent. Keep
accounting the young PTE as a cache access, sticking to the current
behavior.

Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 0d589be136d2..1a415a6704be 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3104,8 +3104,8 @@ static void __split_huge_pud_locked(struct vm_area_struct *vma, pud_t *pud,
 
 	if (!folio_test_dirty(folio) && pud_dirty(old_pud))
 		folio_mark_dirty(folio);
-	if (!folio_test_referenced(folio) && pud_young(old_pud))
-		folio_set_referenced(folio);
+	if (pud_young(old_pud) && vma_has_recency(vma))
+		folio_mark_accessed(folio);
 	folio_remove_rmap_pud(folio, page, vma);
 	add_mm_counter(vma->vm_mm, mm_counter_file(folio),
 		-HPAGE_PUD_NR);
@@ -3227,8 +3227,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			folio = page_folio(page);
 			if (!folio_test_dirty(folio) && pmd_dirty(old_pmd))
 				folio_mark_dirty(folio);
-			if (!folio_test_referenced(folio) && pmd_young(old_pmd))
-				folio_set_referenced(folio);
+			if (pmd_young(old_pmd) && vma_has_recency(vma))
+				folio_mark_accessed(folio);
 			folio_remove_rmap_pmd(folio, page, vma);
 			add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
 			folio_put(folio);

-- 
2.56.1


