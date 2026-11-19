Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073379;
	b=D1vtDHIzckQTpJ7oUgPauBiCnMK+1xjxIP6VsbWkRLKrSIBgf0xduzBd5+NklqovWEuY
	 KCBA3r+2kaZ8TGUJnZL473kMOXMmBXe2UkwwxygiYrwLWyFUM5R93xFayqueORuc9LlmT
	 DRZsg+OyIdIluwm+UehCDHE9grmRhEB8JE8vE7lI6WP5I7veI4h8sgOOjHizpB6zfI4tv
	 z44IrxDEq2ip27S3hkcVqn0Sc38d7LM40xO1gtYULlJilVGIKSHK9glkKb5ATPMCqfqmC
	 Aro5nItjhP0waepcJ6iainYIvno+fpuE6DsaPGWe5Q6VWv8pf+7Wg8bnIkjBPGWLjrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073379;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=N3HLKreulGVvKzYXhYVLR8WoQPfJSmrNsNBKCFc/Lbs=;
	b=rMIJGK10Gs316ogiKNJIf8fRI3LNE2FwNvpQiZLAx3Jf0sucFRBfxGV/3Pe4Tqt+o0WA
	 T0d0oLJ1+jHCS1mnyEH/L6wx1JSL5y3ImMNy30sCoflRYWLHCL1h68RGmT+yhfjZbjCuu
	 J8mh2q0pq6ngk6x7JtjZfLdtEy3MAWOEcxn5uyhvQQEfFdpoLbw8Riej6KggB6oqjohua
	 T8YD8wS89/iS56P7JK12tXmiOjkD4FqaFfDlzB0FRdgxlT7bt0hPJt5RryYdYA0tdNTLG
	 k35jiEK0CFlAtREQpuHHtXe7l3qRwwa8adfcezh+IaR8mgg/11YyzumAvDth1bSfQcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YamEjt0o;
	arc=none smtp.remote-ip=95.215.58.105
Received: from mta1.migadu.com (out-105.mta1.migadu.com [95.215.58.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167C2606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 167C2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YamEjt0o
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Hk6Lvv4k7WqHWElEU0SMIJ3sc8Gw2+rdf3W4yBWpAD8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795073373; v=1; x=1795678173;
 b=YamEjt0o6+NDqWAmBj8Kz4gEA1SJFP1W+5N2mV9Q23JhFiFpQHRBF6rl9bzkApTKHlxFpWtz
 CozfyrWdlZZG4RfLiLElvGp3RCTYLiI37evIj2pkTADPt2EMddFYgYuL2uwcAopc3UANMJk0aCw
 yVd04+SKfBA1tdWBBz5Sv45g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 812d8d13544af841;
	Thu, 19 Nov 2026 07:29:33 +0000
X-Mizu-Trace-ID: 812d8d13544af841
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 15:29:27 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Harry Yoo <harry@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm: mglru: reset the mm iteration cursor in
 try_to_inc_max_seq_nowalk()
Message-ID: <av6lVy5fW47XPxre@fedora>
References: <20261117113700.453044-1-hui.zhu@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117113700.453044-1-hui.zhu@linux.dev>

On 11/17/26 at 07:37pm, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> iterate_mm_list_nowalk() and try_to_inc_max_seq_nowalk() both advance
> mm_state->seq without walking the mm_list, but only the former drops the
> cursor. When the latter races with an ongoing page table walk, head is
> left pointing into the middle of the fifo.
> 
> The next walker reads that as "this generation already started": it skips
> reset_bloom_filter() and resumes after the cursor. Every mm before the
> cursor is skipped, and none of them have bits in the filter being read, so

Nit:
Isn't it that mm after the cursor is skipped, none of them have bits in
the filter being read? Because bits in the filter are set in the last
generation iteration, mm after cursor didn't iterate, so no bites set
for them? 

> walk_pmd_range() descends into none of their PMDs and harvests no accessed
> bits. try_to_shrink_lruvec() ignores the failed try_to_inc_max_seq() and
> keeps evicting, so those hot folios become reclaim candidates and refault
> in the parent memcg, until head wraps around a generation later.
> 
> Factor the pattern into skip_mm_iteration(), which carries the rationale
> that used to sit in a comment in try_to_inc_max_seq_nowalk(), so the two
> callers cannot drift apart again. The wrap-around in iterate_mm_list() is
> left open-coded on purpose: there head is already back at the fifo, and
> tail has to survive for the force_scan test. Dropping the cursor is safe:
> get_next_mm() holds an mmgrab() reference, and a concurrent walker bails
> out at "walk->seq <= mm_state->seq" before touching head again. The
> unwalked part of the fifo restarts from the head next generation, as
> iterate_mm_list_nowalk() already does.
> 
> Only reachable from memcg_reparent_objcgs() -> max_lru_gen_memcg(); not a
> memory safety issue, since lru_gen_del_mm() repoints head and tail under
> mm_list->lock.
> 
> Fixes: f304652609ea ("mm: vmscan: prepare for reparenting MGLRU folios")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
>  mm/vmscan.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 6a1af9b92349..0dc4017b87e4 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3235,6 +3235,7 @@ static bool iterate_mm_list(struct lru_gen_mm_walk *walk, struct mm_struct **ite
>  	do {
>  		mm_state->head = mm_state->head->next;
>  		if (mm_state->head == &mm_list->fifo) {
> +			/* head is back at the fifo; keep tail for force_scan below */
>  			WRITE_ONCE(mm_state->seq, mm_state->seq + 1);
>  			last = true;
>  			break;
> @@ -3263,6 +3264,18 @@ static bool iterate_mm_list(struct lru_gen_mm_walk *walk, struct mm_struct **ite
>  	return last;
>  }
>  
> +/*
> + * Advance mm_state->seq without walking the mm_list. The cursor must be
> + * dropped as well: iterate_mm_list() resumes from head, and resets the Bloom
> + * filter only when head == &mm_list->fifo.
> + */

This looks like a good catch, while the function name here is a little bit
confusing. From the code block inside, we can't see it's doing iteration,
just a pair of pointer resetting and a max_seq advancing. I would rather
not wrap up them if no good name is concluded. Personal opinion.

Other than the nits, 

Reviewed-by: Baoquan He <baoquan.he@linux.dev>

> +static void skip_mm_iteration(struct lru_gen_mm_state *mm_state)
> +{
> +	mm_state->head = NULL;
> +	mm_state->tail = NULL;
> +	WRITE_ONCE(mm_state->seq, mm_state->seq + 1);
> +}
> +
>  static bool iterate_mm_list_nowalk(struct lruvec *lruvec, unsigned long seq)
>  {
>  	bool success = false;
> @@ -3275,9 +3288,7 @@ static bool iterate_mm_list_nowalk(struct lruvec *lruvec, unsigned long seq)
>  	VM_WARN_ON_ONCE(mm_state->seq + 1 < seq);
>  
>  	if (seq > mm_state->seq) {
> -		mm_state->head = NULL;
> -		mm_state->tail = NULL;
> -		WRITE_ONCE(mm_state->seq, mm_state->seq + 1);
> +		skip_mm_iteration(mm_state);
>  		success = true;
>  	}
>  
> @@ -4686,15 +4697,11 @@ static void try_to_inc_max_seq_nowalk(struct mem_cgroup *memcg,
>  	DEFINE_MAX_SEQ(lruvec);
>  	bool success = false;
>  
> -	/*
> -	 * We are not iterating the mm_list here, updating mm_state->seq is just
> -	 * to make mm walkers work properly.
> -	 */
>  	if (mm_state) {
>  		spin_lock(&mm_list->lock);
>  		VM_WARN_ON_ONCE(mm_state->seq + 1 < max_seq);
>  		if (max_seq > mm_state->seq) {
> -			WRITE_ONCE(mm_state->seq, mm_state->seq + 1);
> +			skip_mm_iteration(mm_state);
>  			success = true;
>  		}
>  		spin_unlock(&mm_list->lock);
> -- 
> 2.53.0
> 
