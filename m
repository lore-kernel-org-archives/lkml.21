Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611253;
	b=Ku5sXLoqI5kzBV3JcZO17RdZqmVHHWTaIJpXWdBgsrkNCZob1nhRG6uZnatfPo1Qzsgq
	 FtTDzlPMtUSB9eGG/i/ZnsXvr1ECepnWHTndliCnEkkncmK+wkFEAOph5p2Jfyhau+dzO
	 7SUR7LwdGe83p49ZUQvN9A10C42kN0maivqirP5l+LF1BSxxiBI84HOj5/cg+F+bidDys
	 dIogOG8yFPSStQJxX/o8+12iJ/0zR+v0RSIIGL9hIM+EaUeDaYz6B288F+x4D8VeLqf8D
	 s2vvSooAL30IJj1QggWGK1zQ1Hot2HqW0zVvRpWGwNWlqbSndBnLJ5/M+bc3gAyWa5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611253;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=18hmBrQfpJAG5UTxwsqwNFDo+XibBBB6MlXV+5uOdH0=;
	b=So+oivEg1sfOvNifB1Z4685z0KhX1jfLL7gZqIzQiONFUHbgFg9kPSY6HyQl8wV/wh/G
	 sW3jDOQupwMIJSk9+vrerPx5K3FR1EqNEycJ5mUNwOhhwtLrSg2Knvjd/1EtOX3Lhc2q0
	 +xR1KVzG21JCFfHSgIRPHP3DW0pjQLaLvduzehdAIn53at+LWVLqdUkxz3GD4BqWaLtma
	 qCab+UrnTfJyCZqLcJccNTbBFCxpCGGuyQ3empoe/jvwQ+o05cYcNy2VoqN5CWaYl+Bjw
	 4YPry1y0i6a0h2k7gCUjL/j6lfX9E+KbhUykxb+++W7+IG82FNP8BQ/n+CgPCt7mQoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=O3hLtJHG;
	arc=none smtp.remote-ip=95.215.58.149
Received: from mta1.migadu.com (out-149.mta1.migadu.com [95.215.58.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596B0606A69F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596B0606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=O3hLtJHG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ovCyAeWyuFaTW58PgPzA1TUj7418UnVnjzM69URWLP8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795611243; v=1; x=1796216043;
 b=O3hLtJHGi4tR56GOBETUH7a4U9tLEMegC6iA0RoNnZOiVkU+MFNVAF8S9CjBdlIRTq32LRPi
 nWHOTMNtyWlNkUQCyqoC4bbzvNXTVM426zUzZcSDQMVaJ9+WSxRSfdX787HG00plUrtWYGCQZ2X
 LeCirW55f8grwqA/Sb94kxUs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f98bec9bc042860a;
	Wed, 25 Nov 2026 12:54:02 +0000
X-Mizu-Trace-ID: f98bec9bc042860a
X-Migadu-Flow: FLOW_OUT
Message-ID: <13af506e-fa83-4c35-8467-a07a26e1fa02@linux.dev>
Date: Wed, 25 Nov 2026 20:53:47 +0800
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
Subject: Re: [PATCH v9 11/16] mm/mglru: Run aging when one type is drained
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
 <20261114200803.23129-12-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-12-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> We may have remaining scan budget for anon or file but no folios
> in populatable generations to scan. In this case, `scan_folios()`
> may repeatedly scan that type without making progress, even when
> the other type still has populatable folios.
> 
> Run aging when a type is drained to make more folios available for
> reclaim. This also helps honor the scan budget distribution
> determined by swappiness.
> 
> Move aging after eviction to detect a lack of scan progress and
> avoid unnecessary aging when eviction can still make progress.
> 
> To avoid excessive aging, allow drained aging only once per
> `try_to_shrink_lruvec()` invocation. Also skip drained aging if
> another reclaimer has advanced `max_seq` during eviction.
> 
> At extreme swappiness values such as 1 and 200, reclaim initially
> focuses on the preferred type. Rely on imbalanced aging once
> `sc->priority` reaches `DEF_PRIORITY / 2`, rather than triggering
> drained aging for the unpreferred type. This avoids unnecessary
> aging and has shown better performance in testing.
> 
> If `evict_folio_lists()` returns zero, retry eviction once if
> `max_seq` has advanced since the aging decision.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>   mm/vmscan.c | 49 +++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 37 insertions(+), 12 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 1450542d709c..6d942f192e63 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5175,7 +5175,8 @@ static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
>   }
>   
>   static long evict_folio_lists(unsigned long nr_to_scan[], struct lruvec *lruvec,
> -			     struct scan_control *sc, int swappiness, unsigned long max_batch)
> +			     struct scan_control *sc, int swappiness,
> +			     unsigned long max_batch, bool *drained)
>   {
>   	int type;
>   	unsigned long batch, scanned, total_scanned = 0;
> @@ -5191,6 +5192,8 @@ static long evict_folio_lists(unsigned long nr_to_scan[], struct lruvec *lruvec,
>   		batch = min(nr_to_scan[type], max_batch);
>   		scanned = evict_folios(batch, lruvec, sc, type, swappiness);
>   
> +		if (drained && !scanned)
> +			*drained = true;
>   		nr_to_scan[type] -= min(nr_to_scan[type], scanned);
>   		total_scanned += scanned;
>   	}
> @@ -5206,9 +5209,15 @@ static long evict_folio_lists(unsigned long nr_to_scan[], struct lruvec *lruvec,
>   static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   {
>   	unsigned long nr[ANON_AND_FILE];
> -	bool need_rotate = false, should_age = false;
> +	bool need_rotate = false, should_age = false, retried = false;
>   	int swappiness = get_swappiness(lruvec, sc);
>   	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
> +	/*
> +	 * Avoid aging the lagging, unpreferred type at extreme swappiness;
> +	 * rely on imbalanced aging once priority reaches AGING_PRIORITY
> +	 */
> +	bool allow_drained_age = sc->priority < DEF_PRIORITY &&
> +		swappiness > MIN_SWAPPINESS + 1 && swappiness < MAX_SWAPPINESS;
>   
>   	/*
>   	 * Proactive reclaim initiated by userspace for anonymous memory only.
> @@ -5226,22 +5235,17 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   	lru_gen_prepare_scan(lruvec, sc, memcg, swappiness, nr);
>   
>   	while (nr[LRU_GEN_ANON] > 0 || nr[LRU_GEN_FILE] > 0) {
> +		bool drained = false, do_drained_age;
>   		DEFINE_MAX_SEQ(lruvec);
> +		unsigned long new_seq;
> +		long scanned;
>   
>   		if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
>   			need_rotate = true;
>   			break;
>   		}
>   
> -		if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
> -			trace_mm_mglru_aging(lruvec, sc, swappiness);
> -			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
> -				need_rotate = true;
> -			should_age = true;
> -		}
> -
> -		if (!evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH))
> -			break;
> +		scanned = evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH, &drained);
>   
>   		if (should_abort_scan(lruvec, sc))
>   			break;
> @@ -5253,6 +5257,27 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   		if (root_reclaim(sc) && should_age)
>   			break;
>   
> +		/*
> +		 * Allow drained aging only once per invocation and skip it if
> +		 * max_seq advanced concurrently during eviction
> +		 */
> +		new_seq = READ_ONCE(lruvec->lrugen.max_seq);
> +		do_drained_age = drained && allow_drained_age && max_seq == new_seq;
> +		allow_drained_age &= !do_drained_age;
> +		if (do_drained_age || should_run_aging(lruvec, new_seq, sc, swappiness)) {
> +			trace_mm_mglru_aging(lruvec, sc, swappiness);
> +			if (try_to_inc_max_seq(lruvec, new_seq, swappiness, false))
> +				need_rotate = true;
> +			should_age = true;
> +		}
> +
> +		if (!scanned) {
> +			/* Retry once if aging advanced max_seq */
> +			if (retried || new_seq == READ_ONCE(lruvec->lrugen.max_seq))
> +				break;
> +			retried = true;
> +		}
> +
>   		cond_resched();
>   	}
>   
> @@ -5885,7 +5910,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
>   		lru_gen_balance_scan(lruvec, swappiness,
>   				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
>   
> -		if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH))
> +		if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH, NULL))
>   			return 0;
>   
>   		cond_resched();

The logic looks correct to me, but try_to_shrink_lruvec() now carries
quite a few temporaries (need_rotate, should_age, retried,
allow_drained_age, drained, do_drained_age, new_seq), and it took me a
while to follow how the drained aging, the regular aging and the
retry interact. Not a blocker for this series, but it might be worth a
follow-up to move the aging decision into a helper, so the loop only
scans, ages and checks for exit.

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

