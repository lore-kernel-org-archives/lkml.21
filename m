Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999059;
	b=RVLw04271I3VTF89V6h1mDKFNSkEYspdhf3o1FvrybG485pTs2jzyd3QomuKAZkIuFGH
	 KpCU4NC1awxwMCLVVXrM7Z/xlF7OlrU6flbt/fh9HmcqEPD3KZgp8hbpD/K0q9M5fs0pV
	 h5AVRGknkjva4YKwuFcHROjlkssSQbJNPLzMNzAwEP/PZmjo8i3TVoZNrViHBTKz5vOXG
	 9DxtVMwLVOP/vkE+YxXqFWiZ7ygKvAXCto1JSpoPc9s0GPClHD8YiizYKAf1UQoRSl1wX
	 F3BJesblcLHtbmRkXGMVAUc/uveVyduYlFxfxKoATcKTiXjQ1khiHfFGlarkj6u0yIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999059;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Itlfx11zXnBZntjOPS/51jfyw6vtkyZLDdFLWbHwde4=;
	b=Vh28y5y9w7W2mDAgfR75XuaUI04P+PBgGOjMTec+nLiKhae0kKN5wlTZIViVpEaB6IFr
	 a4NXK3HkMD1uivkuY9Oxf4xA0/g66F/AdwjN3LfLHVbo5QH4xWmDp83XoKRSTyeOw/lTm
	 ffIf8fTthmtJgqICXKAYABtnZg/rxBZoYp4wywG+QgSv5PqS+6R1JAJoP6AMyQQMaEqL8
	 DkhVvUUyNonmwR94rY7Uc70i/7Ag2ESC0hLFI5ehYqFR/UB2TORo217sXHxX4TbwAiIJP
	 auW0KF8dwlC/7zAFCp03m8J/oS7N+dUomnUOh6Wdb68aD3lP9Kcrabg3KWeekuGteQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eYAFlMAt;
	arc=none smtp.remote-ip=95.215.58.62
Received: from mta1.migadu.com (out-62.mta1.migadu.com [95.215.58.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861A9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 861A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eYAFlMAt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jURBODj3t0kFMsYUQPyoSVho8qNObWqngSiKtSuGKU8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794999056; v=1; x=1795603856;
 b=eYAFlMAtxY29YXjIMdemdCWgpIyxjvRqjYRTnDmDeAKezT3UY0Yg7uJ1+ea+xuePWWgnZnez
 VGJiDS7G5FrSgoL2hc3d6T/K1qYz4IQLfI618qiiQYsr+ZnPTj64yPLzWdpWYxuDT/1oDnyGp0j
 QiqUyayCJge2Y5pwsaR6m1jQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a7c0abf208a54be0;
	Wed, 18 Nov 2026 10:50:56 +0000
X-Mizu-Trace-ID: a7c0abf208a54be0
X-Migadu-Flow: FLOW_OUT
Message-ID: <923bb35e-df40-4c67-923d-f518290ccce3@linux.dev>
Date: Wed, 18 Nov 2026 18:50:38 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/16] mm/mglru: lift the forced protection of
 reclaimer
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: axelrasmussen@google.com, baolin.wang@linux.alibaba.com,
 baoquan.he@linux.dev, hannes@cmpxchg.org, hui.zhu@linux.dev,
 kasong@tencent.com, kunwu.chan@gmail.com, liam@infradead.org,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org,
 liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org,
 mhocko@suse.com, qi.zheng@linux.dev, rppt@kernel.org, ryncsn@gmail.com,
 shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com,
 zhuhui@kylinos.cn, sidchintamaneni@gmail.com
References: <20261114200803.23129-1-baohua@kernel.org>
 <20261114200803.23129-5-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-5-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> When a type is drained down to MIN_NR_GENS gens, the reclaimer will
> fail to make any progress on that type without aging.
> 
> However aging comes with a cost, and it will take time to finish. Even
> if we do aging more proactively, when under great pressure, gens will
> still be drained very fast so the new gens produced by aging can't catch
> up with the consumption. With MIN_NR_GENS setting blocking the reclaim,
> we will run into OOM. This OOM can be reproduced by the previous test
> program [1] used for fixing another aging problem [2]. When running in
> great pressure, certain workloads will keep seeing premature OOM with
> MGLRU, and never see any OOM with classical LRU.
> 
> This might get worse if we implement async aging, or avoid hotness
> inversion in aging, as they will slow down the aging process even more.
> 
> To fix this, let's first drop the get_nr_gens() == MIN_NR_GENS early
> return and let the raised-priority scan bound cover max_seq itself.
> 
> Mapped folios will still survive as the rmap PTE check will keep them.
> Unmapped cache folios may thrash more under heavy memory pressure.
> This should instead be addressed through refault-distance and
> frequency-aware promotion [3].
> 
> Link: https://github.com/ryncsn/emm-test-project/tree/master/file-anon-mix-pressure [1]
> Link: https://lore.kernel.org/linux-mm/20260428-mglru-reclaim-v7-0-02fabb92dc43@tencent.com/ [2]
> Link: https://lore.kernel.org/linux-mm/20260502-mglru-fg-v1-0-913619b014d9@tencent.com/ [3]
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>   mm/vmscan.c | 34 +++++++++++++++++++++++++---------
>   1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 1197e15065fe..603fb7c73f94 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4677,7 +4677,7 @@ void lru_gen_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent,
>    ******************************************************************************/
>   
>   static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc,
> -		       int min_gen, int tier_idx)
> +		       int min_gen, int max_gen, int tier_idx)
>   {
>   	int gen = folio_lru_gen(folio);
>   	int type = folio_is_file_lru(folio);
> @@ -4694,12 +4694,22 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_c
>   	if (!folio_evictable(folio))
>   		return false;
>   
> -	/* promoted */
> +	/* promoted, or moved due to reparenting. */
>   	if (gen != min_gen) {
>   		list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
>   		return true;
>   	}
>   
> +	/*
> +	 * We are reclaiming the last gen left. Folios in this gen can no
> +	 * longer be promoted or protected, so just isolate them. The one
> +	 * exception is lru_gen_reparent_memcg(), which is handled above.
> +	 */
> +	if (min_gen == max_gen) {
> +		VM_WARN_ON_ONCE(zone > sc->reclaim_idx);
> +		return false;
> +	}
> +
>   	/* protected */
>   	if (tier > tier_idx || refs + workingset == BIT(LRU_REFS_WIDTH) + 1) {
>   		gen = folio_inc_gen(lruvec, folio, min_gen);
> @@ -4754,15 +4764,16 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   		       struct list_head *list, int *isolatedp)
>   {
>   	int i;
> -	int gen;
>   	enum node_stat_item item;
>   	int sorted = 0;
>   	int scanned = 0;
>   	int isolated = 0;
>   	int skipped = 0;
> +	int gen, max_gen;
>   	unsigned long min_seq;
>   	unsigned long remaining = nr_to_scan;
>   	struct lru_gen_folio *lrugen = &lruvec->lrugen;
> +	DEFINE_MAX_SEQ(lruvec);
>   
>   	VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
>   	VM_WARN_ON_ONCE(!list_empty(list));
> @@ -4775,18 +4786,24 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   	if (sc->priority == DEF_PRIORITY)
>   		min_seq = lrugen->min_seq[type];
>   	else
> -		min_seq = lruvec_populated_min_seq(lruvec, type, lrugen->max_seq - MIN_NR_GENS + 1);
> -
> -	if (get_nr_gens(lruvec, type) == MIN_NR_GENS)
> -		return 0;
> +		min_seq = lruvec_populated_min_seq(lruvec, type, lrugen->max_seq);
>   
>   	gen = lru_gen_from_seq(min_seq);
> +	max_gen = lru_gen_from_seq(max_seq);
> +
>   	for (i = MAX_NR_ZONES; i > 0; i--) {
>   		LIST_HEAD(moved);
>   		int skipped_zone = 0;
>   		int zone = (sc->reclaim_idx + i) % MAX_NR_ZONES;
>   		struct list_head *head = &lrugen->folios[gen][type][zone];
>   
> +		/*
> +		 * If there is only one gen left, rotating the unreclaimable
> +		 * zone become meaningless, just skip them.
> +		 */
> +		if (gen == max_gen && zone > sc->reclaim_idx)
> +			continue;
> +
>   		while (!list_empty(head)) {
>   			struct folio *folio = lru_to_folio(head);
>   			int delta = folio_nr_pages(folio);
> @@ -4797,8 +4814,7 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
>   
>   			scanned += delta;
> -
> -			if (sort_folio(lruvec, folio, sc, gen, tier))
> +			if (sort_folio(lruvec, folio, sc, gen, max_gen, tier))
>   				sorted += delta;
>   			else if (isolate_folio(lruvec, folio, sc)) {
>   				list_add(&folio->lru, list);

LGTM.

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

