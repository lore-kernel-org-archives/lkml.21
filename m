Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601240;
	b=cdhSkidAS6WITX0f9RGvXp93fQOIUyIi/LbadPUY8C/8ZX8T7ApYmI7lhnkWuktFO8TU
	 cDIIRkQz9Ue8hYRMWO72XZ8jgpI8Qj/7Ast+7330BMKu5gmffWceDtYXDGfPBQvQut2pt
	 aQg5rKp3IuUAm6oP0Lep08jzePs0VDcYtNxPeuKBICX7jCvnE+z6vDt0Q3ffIMrbkdeVr
	 8Kx9qmS8NWN5LJ1aePuW0F2/QUYkUMCoj3VhOCRhNIIvB47vbxmceYQoXy8B1enoVvRVc
	 zyg4sYD9QjPNGIilxhyLmmuB9GNY2BkRgd7n+Z2Mot0OHrsW4yGm/POAHdaY4SaFkWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mWx4O9IoqBZXrSxXrPMmLZ9d1NpcNUKfMxyf4VNB2/k=;
	b=VbPjxYElTnydOkHpzdNpgtlcJSC1hA1My7CYaSH1GUZQCncbs9UWavg1JQwUMHfyZt2r
	 vPgmtrcn2BjT0ikfnG63udbOSXOhmI7Y015kksaFnf2C6Bq1uZDFLGn7GS2kNEFy7cq58
	 QDYtJY98nlG2C1gkp9s6nU9a0L+ghwfDh2OkpxyHD42KQA66z3wYsdbZdgyJQ8nsBPahj
	 nri7lFzt/z6k3wK156OOPH/HVHmA9cHhKiGXxKqH5fMHkN+p7JPlKsT9TbnfKCUeu1A/y
	 BDCjxd5mGqd055KPuUVZ19tCrIkBBc1kvvYeYzM/B5+EOahZ6rZTcaAkJGJLoARYkmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9ro8Hlu;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128CB606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 128CB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9ro8Hlu
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so2384234a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795601239; x=1796206039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mWx4O9IoqBZXrSxXrPMmLZ9d1NpcNUKfMxyf4VNB2/k=;
        b=x9ro8HlujGirtS4n7Kiceqz39P8rBYt2AApwczCy7S59DTac/QhGjF+yenBMEx13/X
         eCCu9ktzaE5ddktgrNbv1KF/0CYetKUTScAiHGiPmje59mF3+4ZbpopnrqxbXGQQOHmI
         hGKFBEShUq7cDUrceli4dKiwHMrkkMsNMGcqKMcaLfTMc36FHn2QzNeuHz+yMKMc2zjL
         /yJXtN8BUXeZ/pEiZ4fW4BVILlII4TwcC9QOrToMQ2vON1LNk8jAoozYn10R/FJRv7xe
         gn6NORYmRatB9Cu1fh3VPmcluhTeADopud+xI5Vz3C5jsIhRX7rY/Nj6r67jQyzWxM01
         h2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601239; x=1796206039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWx4O9IoqBZXrSxXrPMmLZ9d1NpcNUKfMxyf4VNB2/k=;
        b=InQv6ZzfS5E13vJvtJkMxA/jZWeXQqGY0d9a3t6vPSJ1qZrmlWt8adbZNg1dFsuOTN
         R0USCG22VEo3tiZArFgwOV4l1S4uO6FKTnxUyttoUF6wOWojD/1nfiL6WECDUGFFoauH
         vdL6S/E+RkxPY8jJWPBZ32zVpUTHPEGDIIUPTH5SMODVaKqUBcV/xZvltydkeIV9Mojo
         6334wUA008nnrXEz/Ds+4ToFxem4XGI1Jhb4tg0lW+IziZou/TwGc9FIrL9vXVR/Xo7O
         F0gAVOveNl2pDu6H4D2hHigNB3P+1wqHk9jTIc1oY33PuOUw0gXTMODulyK/hKcv5TuP
         R9kg==
X-Forwarded-Encrypted: i=1; AL+hErHpsbCRBNaH+Sq5DVhuqwW82ocumOvA4Cd2u6/FqtdvCLiTMn7838zz/jJqzzE2CBsT7/zt0jjS4l9ZFl0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p6pq2/nFdqWwIC/dwZRlVXUwdzoxI3ulU5BXBfNVg2T0JZrK6
	hZ023VI1MvU0mOMKjtZtl1iibRc88xbM4G1xf9QtjPxReJpkjcttNSz0
X-Gm-Gg: AZFdTZeT1z3iOyrsLYl1R1Jzb4QqTyNNgnru4+Sm28yNNFm5T76O22dtmVhkoTLFYFw
	QFRbsHb8dxukq5MzLLA6k70NnB9LvFs/R2yRr4P3sZrGLo/4K2lKAXV97fT5vAiH88lBym3yuK1
	0mvqFgncZ0lfA6PDIMSPgU/sYO8RZmI9szkFcNPBDzKnf9xCd2BydNfmAFegmJVqktROGSnQGnQ
	meZpwJU+zkfca41Byt4aauJ4/HPYwoo48F+0cGjSDvmbcJ0EPI9c7gd88iJ/5Ak2d34cy2OBqq3
	SIeKCbpVZnvaJt4C7l5+sVtW48IKyax/uhQMslwNxgnzeUojTaeHOj9lqdF4XcRKDZY1zwv1dyl
	WHaa48+WaDIMDT8G4KNfSsfJd1+i/Nqj1bYXNWM2HYVKdxaarJWOS/UCxkpreqrvgEVG4jWWOwl
	R90jQElEVcp8MQrL1Zxfiu/LLsnBPo7z4CK8JxjiENhC56LPBUkDSFW3Q7BcLqbZQIfzYvdSEwS
	skJdSANnPmYXz7gJvm/HrnoA0RUjPFRiyrekRW1C34o7W8DD5o9vOtQe9Ebo6m6gz1MfI2wvqac
	WTj/v/57OHcsPN5jV2q9rMTPXWimshp21tkzYowMNQG/
X-Received: by 2002:a17:90b:2ecb:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b41c98a1d1mr14557905a91.16.1795601239179;
        Wed, 25 Nov 2026 02:07:19 -0800 (PST)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm26804572a91.4.2026.11.25.02.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:07:18 -0800 (PST)
Date: Wed, 25 Nov 2026 18:07:00 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Tal Zussman <tz2294@columbia.edu>, Kairui Song <ryncsn@gmail.com>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Subject: Re: [PATCH v6 06/18] mm/mglru: skip the flags cmpxchg when nothing
 changes
Message-ID: <627ebddc-87b8-468b-b0c3-0503494f357d@gmail.com>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-6-8ffea39934a6@tencent.com>
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
In-Reply-To: <20261124-mglru-fg-v6-6-8ffea39934a6@tencent.com>

On Tue, Nov 24, 2026 at 02:52:58AM +0800, Kairui Song via B4 Relay wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
>
> folio_update_gen() and folio_set_lru_refs() always end with a
> try_cmpxchg() on folio->flags, even when the new value equals the old
> one. The locked instruction still takes the struct page cacheline in
> exclusive state.
>
> That is common in practice: a folio mapped by many processes is visited
> once per mm during a page table walk, and after the first visit it is
> already in the youngest generation with refs cleared and PG_workingset
> set. isolate_folio() and the eviction paths also call
> folio_set_lru_refs(folio, 0) on folios whose refs are already zero.
>
> Break out of the loop when the flags would not change. The update is
> complete at the point of that read: the flags already hold the target
> value, and a concurrent change to them is ordered after it. When the
> cmpxchg would have succeeded, the value written is the same, so no new
> state becomes reachable.
>
> What the patch drops is the retry. A retry re-reads the flags and
> recomputes new_flags from the newer value, so it overwrites a concurrent
> update with what this CPU wanted. For folio_update_gen(), a walker that
> read an older max_seq can lose the cmpxchg against a promotion done by
> another CPU, and then write its older generation back on the retry.
> folio_set_lru_refs() can likewise clear a refs increment that raced with
> it. Breaking out keeps the newer state.
>
> No caller relies on the full barrier that the locked instruction
> implied on the skipped path: the eviction and isolation callers run
> under the LRU lock, and the others (page table walks,
> folio_mark_accessed(), lru_gen_clear_refs()) only care about the
> resulting flags value, which is already in place. Note that
> lru_gen_inc_refs() already returns without any atomic when refs is at
> LRU_REFS_MAX and the folio is in the workingset.
>
> Tested on an i7-13700HX with turbo disabled and the performance
> governor. N processes map the same 2GiB tmpfs file (huge=never) and
> read every page, then one aging pass is triggered on their memcg
> through /sys/kernel/debug/lru_gen ("+ <memcg_id> 0 <max_seq> 200 1").
> Time per aging pass in ms, median of 5 runs of 10 passes each, averaged
> over 2 boots of each kernel:
>
>   processes    base   patched
>           1    32.9      31.7   -3.5%
>           8   195.1     160.2  -17.9%
>          32   755.8     592.2  -21.7%
>          64  1597.2    1260.6  -21.1%
>
> With one process, every visit changes the generation, so there is
> nothing to skip. Before the patch, perf annotate attributes 53-58% of
> the walk_update_folio() samples to the lock cmpxchg in the inlined
> folio_update_gen() in this test.
>
> Reviewed-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> [kasong: adapted and rebased for the series]
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> Tested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 2 ++
>  mm/vmscan.c               | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 46beded51c7d..2571b3f01226 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -233,6 +233,8 @@ static inline void folio_set_lru_refs(struct folio *folio, unsigned int refs)
>  	do {
>  		new_flags = old_flags;
>  		lru_set_refs_flags(&new_flags, refs);
> +		if (new_flags == old_flags)
> +			break;
>  	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
>  }
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 202e0f874b23..15df5618a3cf 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3274,6 +3274,8 @@ static int folio_update_gen(struct folio *folio, int new_gen, int *type,
>  		lru_set_gen_flags(&new_flags, new_gen);
>  		lru_set_refs_flags(&new_flags, 0);
>  		new_flags |= BIT(PG_workingset);
> +		if (new_flags == old_flags)
> +			break;
>  	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
>
>  	*type = folio_flags_is_file_lru(&old_flags);
>
> --
> 2.56.1
>
>
>

I have done similar tests before, simply skipping the identical old/new
flags, and was able to get very good results.

Makes sense to me.

Reviewed-by: Vernon Yang <vernon2gm@gmail.com>

--
Cheers,
Vernon
