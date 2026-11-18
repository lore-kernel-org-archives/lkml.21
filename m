Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001049;
	b=PUJ/I4NJOSpv8ni3Bh+hzDhIHqHvxb/j60+fq0nhFQFdMZItVd+Yvsxo01gSN1W9skrs
	 cb9r9quYujQacRdVR9O0+9NlpnQntmcroVnP+9nI23sKpm1BK/RnBBj8v1YGFaanR6/1u
	 odRqU2A8d1py5mNHV5ijRtTuvzPKPRWTd7dDFvb0R19f4tJ/7gw6AHOs1kzErmLMScnwa
	 hXynKfRs9S7iK9w6DJqH0hx4HlQXsz+sdpu9AP9+oly8cv8CCPu/CQ8sLX4TBWGb9GMUG
	 Vu69SLNnt6xV59B4/t7Z+E7hzX2mruzVmY8ZlGoeE229sdHzYjhsosL208ZV6XbtjlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001049;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kGbil/6uybiLL1poJa3GteC+l0GAriycnTYZK5gcfN4=;
	b=rkKU9dt41G/063hYcl4lQmmKBFj2JAFQTwMAKN9iTtk4rj6w5vQba42Ux9OSHiKWYaTz
	 /t/XiQxj7d+BwUydjV9YDvOKTaZMgGqj7OMqxEIW1CCYSrwXg0jUYcRHIoDLTsR/82eN8
	 Kdb1gAdBVVDS74wBK5kg57Kw4M6mXqtsjQQItWbJRMc3DF2J49oF5HzqMvLK0oaj+hb7z
	 iduTPlCaJ9ug3fgrF9VHfsYvxq8ThrtNxO/qt3AFkICcwJhtdNBFQW8MYFj8f9skEgOfG
	 jdsbP5QOEIYKHsAZRbsMpMjxx1Z0B0QLO1UD4YrWRhdE4n9yAZmT8+YwoKSfy6M4aPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lVyk9HkT;
	arc=none smtp.remote-ip=91.218.175.18
Received: from mta0.migadu.com (out-18.mta0.migadu.com [91.218.175.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A11606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lVyk9HkT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ceQJf4xOqkkLiYn2mCtm+HSzCEGYSqHZfwzWPUGAHIY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795001046; v=1; x=1795605846;
 b=lVyk9HkTrctueEmt15F1jiyRMHgiqX1V/tFI4EpAMcVHYh46SloY/QfA3at1qJWfn7PKz/g0
 2tTrnNfvhel7ZiHjtNcUCPSRfl9aWDWk1a5zYGftGKiTrkCl0cRkjAwzlmYZSR4gxpya4KkeFrp
 8i4iROYxx/hnh2OtTDZG1+5U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 35a978f1a9a4df4f;
	Wed, 18 Nov 2026 11:24:06 +0000
X-Mizu-Trace-ID: 35a978f1a9a4df4f
X-Migadu-Flow: FLOW_OUT
Message-ID: <e8ee4599-5006-43da-88c9-5aeaf2306c6e@linux.dev>
Date: Wed, 18 Nov 2026 19:23:56 +0800
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
Subject: Re: [PATCH v9 06/16] mm/mglru: return for unavailable anon reclaim
 earlier
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
 <20261114200803.23129-7-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-7-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> No feature change, just shuffle some code, prepare for later commits.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>   mm/vmscan.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index b3ce4a550a62..f7fbe91fedf3 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5060,20 +5060,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
>   			   struct mem_cgroup *memcg, int swappiness)
>   {
>   	unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
> -	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
> -
> -	/*
> -	 * Proactive reclaim initiated by userspace for anonymous memory only.
> -	 * SWAPPINESS_ANON_ONLY is set only on the proactive reclaim path, so
> -	 * warn if it shows up elsewhere. When anon cannot be reclaimed (e.g.
> -	 * no swap), return 0 to skip the scan entirely, avoiding useless scan
> -	 * work when there is nothing eligible to reclaim.
> -	 */
> -	if (swappiness == SWAPPINESS_ANON_ONLY) {
> -		WARN_ON_ONCE(!sc->proactive);
> -		if (!can_reclaim_anon_pages(memcg, pgdat->node_id, sc))
> -			return 0;
> -	}
>   
>   	lruvec_evictable_size(lruvec, swappiness, sizes);
>   	evictable = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
> @@ -5126,6 +5112,19 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   	int swappiness = get_swappiness(lruvec, sc);
>   	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>   
> +	/*
> +	 * Proactive reclaim initiated by userspace for anonymous memory only.
> +	 * SWAPPINESS_ANON_ONLY is set only on the proactive reclaim path, so
> +	 * warn if it shows up elsewhere. When anon cannot be reclaimed (e.g.
> +	 * no swap), return 0 to skip the scan entirely, avoiding useless scan
> +	 * work when there is nothing eligible to reclaim.
> +	 */
> +	if (swappiness == SWAPPINESS_ANON_ONLY) {
> +		WARN_ON_ONCE(!sc->proactive);
> +		if (!can_reclaim_anon_pages(memcg, lruvec_pgdat(lruvec)->node_id, sc))
> +			return false;
> +	}
> +
>   	nr_to_scan = get_nr_to_scan(lruvec, sc, memcg, swappiness);
>   	while (nr_to_scan > 0) {
>   		int delta;

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

