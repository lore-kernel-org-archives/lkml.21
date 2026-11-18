Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035827;
	b=lLq+XsCcQgIGQsDDMrKhQwXUXmJ99M5iYjiDrpzvOfjFb46nBwOtqPLW1uiwp2G4GuBU
	 zLRtQx1UWWO3pAqh0j1MQOWvNlEpFl/g/I8cS+9zIJvXrPVgtgI9TyaDOSKPI2R62GMtk
	 MVms7I38GEct8tk+54y9k3Nk7OyDNNkMIWEJCPLKsp+proiqHZ7pBpVvZjKXBpl9hgTvW
	 XMm/BDUOgBWUdWLy6Vnc3enIIQIGQDLkKgLogAl6sSnKWcD/C99AWaE46brHHzY/0ljh1
	 hEN7yuXPIYPgdHA6SYhToPd9f/CV3djCJfePUwZRhkYMJHOtj0rzxamcPLuo1m+QhlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035827;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Rn/XVV3lJb0TjTij3sIrE+aEoTpSeaOajKlzbk7waNE=;
	b=4fi0iY38PsLu8uxP/H0z2nEdRatJlHmaxQagwb3ukPQrqWVgT1/nn8xjzZ6gOTIeViPs
	 Cemtj5XQ+gepP0buhMht6ZncdAM1HllwkuUPbh12QR0cR042K8UqHeNOitn1bxXW2JGol
	 r7qm8VWwyoatguARf+72+O/m8Z8kH1C7L0x7ZTsUN1SgzPs/8yWlPpEdbdn1wjWflpTm8
	 IjgkwqWr/Q209arz/j4W97Z/rLBw4kRIbHc9TP1FKNAGCXvHP6qQCXwrq3R02GboLMhzA
	 /oalRU+8zQIMuk/sHwy+KJ49a+3xUxLCG51DCUbKvLNZgtJgakzn18HwK7qFHN5HoKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8ZB35oU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD5960A2606
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8ZB35oU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795035827;
	b=ySZj+2kiiPVcvPJHs2L6nRfKxlAqsoKglkc6KRqUTVfAPz6fb77cXz0xD0h/W3I9gAOB
	 6fqRwyjiyK/xBQ0zgKnZucZ0Ok3dTrKLgyM2bNKeW9EIiagI4t86uKHQf4G1j8uYgAInF
	 +0zLslmTx+jXvDP88mFVzJW7jdXh8GCGH0avVdLmQ9mnrNIjrSZ53TgRmWjsM3uJyNQCR
	 twF71WMkkRx5tWaPahjlFH70Ov0MpY4qpBenMZqMPGRZAX4JYG6slAh3JZZ78xwJBfRrn
	 CHWLNqgwyH34TAC1x06w6dh0D+qsQyeiRkZQ36nmbz9x2CE7gPEwcO9QIh1jePSW9Tw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795035827;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Rn/XVV3lJb0TjTij3sIrE+aEoTpSeaOajKlzbk7waNE=;
	b=thKwjAJpHQLk7imeBagChkHhSDt1YGIsN1NfdfqTXGvWfNCZM4/UhwdcE79a5YEUTkIg
	 8JtgQghAoM7inWCDIdEIOVp3VZmpWycvuAw07GnynDNzwt0pKP25EZm4YcFLk0/8P3v1P
	 tRGF4vpSnL5mIvmMX/JFBeWjx024pwqVSGPT4vfRAFOT9FSVNSIQ5N6wTdsTQmwBDwpUa
	 4GUFXQ1iON8IWm6oPYiJwgRdZ7/DmD9eNlyjGiAn0kupeMxg7hUYxnM6h1Bj1uQvRSIFs
	 3dBKCVKoDqrLUknL4LoDuYwRkTjjxLzfNqYva1dDKqc4Pduf88awllEi/mu5Mq9DSEA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E92C81F000C5;
	Wed, 18 Nov 2026 21:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035827;
	bh=Rn/XVV3lJb0TjTij3sIrE+aEoTpSeaOajKlzbk7waNE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j8ZB35oUQuWCDXJwYRu8CMI0Zp8kPRn//xfoxUrCBlmE3BLEp1ir2lzJAtHrLc8Qb
	 ig7ul0ZCLj07TKk4ZAFIeAZwPXMhdmwt9Hg7h9Xu585wcG1GV1Bj9bmS0h2rEACWAO
	 shp2cbhQx7RbPQnHGZhsZYJXjVxttGAOW1U1y+J066x4QW1NDlG7UfxpoKnjfXIksm
	 fOXUcM3qbZriQIRmb4l4+cEgVdUsADpxQD8FEKzH0LFrgpEVDasGwZz8ag/WbvzLoA
	 3VjJphFyhPnnq4P1BNIhZjPhwUQfkMyr87yhtDyFC0ocWHwbIHuqDLOvOfCrHATeXp
	 xjhnguhnqhLQA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 44A1D4AF8C;
	Wed, 18 Nov 2026 21:03:43 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Thu, 19 Nov 2026 05:03:34 +0800
Subject: [PATCH v5 02/17] mm/memcontrol: allow update of LRU statistic
 without holding LRU lock
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
Message-Id: <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795035819; l=1182;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=G0nnA5K3vgx6DnvgX5PBKRNHiMmd0ZDMM0I+7unVnUs=;
 b=Or384oTYmhezGr12VgUCqXcg3RIjHRi1VIREbML7u8xdTtJvzi8P8v1XYtrkZ/MyxcN22pjLV
 ZU7Emfb4fcGBc4PgU9uzX0rG1VNuzCTFopsvPnTDBNOyD35qOIS9jAr
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com
Content-Transfer-Encoding: 7bit

From: Kairui Song <kasong@tencent.com>

To enable moving file pages in folio_mark_accessed directly and lazily
for MGLRU, allow updating the LRU statistic atomically without holding a
lock. It may cause temporary counter underflow, which should be fine as
the counter is eventually consistent and only serves as an estimate.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/mm_inline.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 2395ca8ee305..2edb9beef6d3 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -47,12 +47,11 @@ static __always_inline void __update_lru_size(struct lruvec *lruvec,
 {
 	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
 
-	lockdep_assert_held(&lruvec->lru_lock);
 	WARN_ON_ONCE(nr_pages != (int)nr_pages);
 
 	mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
-	__mod_zone_page_state(&pgdat->node_zones[zid],
-				NR_ZONE_LRU_BASE + lru, nr_pages);
+	mod_zone_page_state(&pgdat->node_zones[zid],
+			    NR_ZONE_LRU_BASE + lru, nr_pages);
 }
 
 static __always_inline void update_lru_size(struct lruvec *lruvec,

-- 
2.56.1


