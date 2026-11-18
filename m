Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035838;
	b=0ek3Wsx2P2TxsgKkRP7qL2OrLjnS+iczf31mNFhBGegpYGbPKQz0ZAmy+a6xKttxOACa
	 +WI4N6LFmCkL9xo08r5di7ZJVM1/EZ4phd+A4lhIga+GHSOivTVS9VbwJchdjRTaa5ZrH
	 ErOSXdi5rB39osJvArcRXTCGrIzGXG+ZfwdOJeAB4kSAoLMslELYKTgkxYvhxLCL1uZ+L
	 GTo2PTF0BO17Ut9PksKM2kT6GGANdNIXyg+xV4b+ZyOjm6yk41k9R5y6PZXvKDQk40bpF
	 ZKsKVzcRGA58o/wiz9b1pHqsVMj46nOFOMiVLic9xse8OSPnlIs72vxxQMDwotqBdBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035838;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=umd+xXOtPmpwln7D0djKUtVYi865RTVPW3Jw9yIwv+I=;
	b=jjKgIfsvc7h5crO5aPxRebjdsm7FcIn23mAAixPJOM8F3E7fXwA/SHQ1/bcJjhnSgjkS
	 4RtJ0R8St424buwm2vZYhA7WpfCWix5OQwx+tq08aBBUGXW1o7nHVpJviniPzvE37KL0L
	 613fbhGfnuFEawR1DK/6NDy9U+a8lbTHkokHD2OcxxKS0GLEYSePWTglPySC0RSKyFz6E
	 CwHwFl6Y1ginYmikvL4pf+Xxd5hZsalk6OX8U5kCFuYt1Fyivx1WPA40iO4PbwQb/LmTi
	 xvVjqCnRLa0usVx8chRIDBbI6B2mUhQbUgd0Wl1LgoE/whPY7vk3qiwJBJ+gFWS02pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aTLUCNlz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756960A5BFC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aTLUCNlz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795035838;
	b=k2ekeG8N3o8Gr8lipcLNfumQZ6AS78UXrM0zsHJKgc7JrDZbF0fHLxSaSKA5ByyH3Bmi
	 XI1Qe4gMeC3Q9/LcPGQPggHJM8fIA/fKkLYyql2P0PReA7rOYL1Cvmgz4ggPkUoVQx6En
	 E0xUUZYcQmROm4PDB1F+zooh9sMIFHaNDuD9LEE4sAfOhyhyDSLAJdnf3J208fIulQH56
	 8RO50i3bPT8uguR4/T7JuJNvg1h9oFKpm0Zi6dSnhulQjO4lvBc0f7pWD0AFFqriV9YF9
	 akBy7eHZeA4sBqFZNPrsQSRPAu7H1mcA4Jzc83mezHfiPvKwviQSgwyHo7gMgvDj9Rg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795035838;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=umd+xXOtPmpwln7D0djKUtVYi865RTVPW3Jw9yIwv+I=;
	b=LUxa1W2mf7LXxCFgKtNCZ2qAnhaf9LAsqiFEJFhX5TuP/q58IKTS8NvZema5uRbz5u+v
	 Z/7O9HtLjsvFUD6eao/Nbu80wcdnRTxvT2IJ1A112mCY2xai+5fQVdPfnSzI0x2KyEs2z
	 rinfrXPvYCgy1p5/6qH85DUTc4YhcLtZKJJ6sXW9Sg5M9/yTMJY8NgIeBoolfaO01JKid
	 5gOzZQlNO6H8SGd2qt+NWDkFBp2Uqs1tmS1giejdPppAAkChvYDousGAxBi+ypQC6n1Yh
	 6EbKof1FrncshRcNW4A/B/GpVzSnoVEuEMrGdk3IKSWUb42CFa8o7EZzdkc4rbXBOCQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7CA71F000CE;
	Wed, 18 Nov 2026 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035838;
	bh=umd+xXOtPmpwln7D0djKUtVYi865RTVPW3Jw9yIwv+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aTLUCNlzQsaAyuCeBZUgOc+fqhcDORsuUNpXRlZnbtT1yZyvvjz8XRkgukRN/abG5
	 +1ciI+X0PMdwzReCeuDHIkw6xDg98xz3/NSVxP7oEW/QZO8Ao9OMOA1d5PiDtSYmND
	 sanJL0B96rSwhzIwArBjdEZk90BVrtUkwOfHS8y8BJIXvM3Yl3fT0yT5+DIC1EKJ2a
	 OOHd/s7n5nrXl6bs86CrdefqCxd2GYIQAMfus+Rnfc13vAyr49NjMbx9EPo5Cq038l
	 WSikqkqLCpS7srqwH5o1qSTOjM3Jh7U2aA7NO3m98ZZaGcY4IQEmLRhKd7bjyCy6U/
	 heHxL5j7z2cEg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3B3B04AFB0;
	Wed, 18 Nov 2026 21:03:44 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Thu, 19 Nov 2026 05:03:43 +0800
Subject: [PATCH v5 11/17] mm/damon: convert to LRU refs based operations
 for MGLRU
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
Message-Id: <20261119-mglru-fg-v5-11-9eee2fe97a2d@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795035820; l=914;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=juJQDvh6WPvm4O7BAbP0QPsVPdfMcO7QrejsQWUOq68=;
 b=4R6elM1NZFwkimFZRIG8TAjoSqNylkU4BwWWediOGKFcIWwn5tKSC/YO+Fj18DbSAz4kMZPeo
 2b4D2jz24raDp7tNJsjjsSvda7DyWgkAgvzBwtc53YRgbzeEiQFCSXC
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com
Content-Transfer-Encoding: 7bit

From: Kairui Song <kasong@tencent.com>

damon_pa_pageout() cleared PG_referenced directly, which under MGLRU
corrupts the folio's refs count. That flag is now
bit 0 of the count (LRU_REFS_FLAGS).

Reset the count instead under MGLRU.

Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/damon/paddr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index e89cb14ee17b..411e1d557ba3 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -279,7 +279,8 @@ static unsigned long damon_pa_pageout(struct damon_region *r,
 		else
 			*sz_filter_passed += folio_size(folio) / addr_unit;
 
-		folio_clear_referenced(folio);
+		/* The region is cold, better drop the hotness info. */
+		folio_clear_lru_refs(folio);
 		folio_test_clear_young(folio);
 		if (!folio_isolate_lru(folio))
 			goto put_folio;

-- 
2.56.1


