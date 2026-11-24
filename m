Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507639;
	b=nVn/VJXEGhSvkk8USJjPIwuyIHuRBjUCHP6JKKi47uQMlXgoaeA/a7dYHi7tMLRAXSLo
	 gQOYoleY6koyhw2P6GKupz9oKeJclV9JH0yRQXZ1/aLmGKid0sONTcLPo8Z3ImNPP9BEJ
	 I4t9w40J1uNiV2x/LBgDpJGUrw8ompGiXfDdj6FIQPEfS3mchOZVxbXO+PnwAK+qhL6G5
	 zXBTAr2yysVArcVC3tEcwLWvs6+ixzyWtb3Oux4GFtSsxm+tQjU8CR97LD2udh7FMQc7P
	 iRzunAAADRfEtJIIrjAn43V7z0UVRYkPQCXxAXk0oYLGmJ2Kv6PhnYz3QtAJIubC2GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507639;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=67vHNWv5XydQCuOWzXnOZHfUdZ5hbczxGbSf1cnDCr4=;
	b=c6JK9BVen2oE39G+F+Cm64tVNL0g0MWbRYHIQJpPT4nVHen9x/jq6HhBjynQHb8gMdNh
	 wsnUNZ//8OmwpAEsPFhoYtnvJ0heRK70MBv5jHdKY+UWfO/OKnvNtR1JbNKmHQF1KQSkM
	 6W+o2QqIKpVmc+oRenfyXm3IWksqLnInKKdZ/gHs6u8GcZFdlsZZnhZNq5sPbu1jThqPG
	 Ce5KUb9YD9ukw0hryZVBmUShgYvUKg0BpEsBxGXJZUETonTT2M2vV1WaHHk4V4lc4KI99
	 b6x+Z0p5NfdAPb2xu6D1GD7jQMFbOCJgmMC3f6XxDZPjfKHL5t668o0lk/uqAZ/NhbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="o2RDp/6v";
	arc=none smtp.remote-ip=95.215.58.231
Received: from mta1.migadu.com (out-231.mta1.migadu.com [95.215.58.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B287606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B287606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o2RDp/6v
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cXjzmosgBA+4GsZx1vbHqYGDv5GQy8T2isKKaaoWxSA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795507636; v=1; x=1796112436;
 b=o2RDp/6vMg9dCJBd5K2vR8eLitzzwzQsZDVVPHNmFoYF2Lfb/nrlf0VUI0ykkQ0WngAdDoRG
 8Rk+UxvIJpJJFYUl9aT2M4DYvVIifQBY/hdVB4zDZuO3jTen+ugwVpl0I5+D0m2T+swd7IbAjCI
 EHDWmnIJjgR6fYcBtwcgQzhE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e41294f2a3451cd8;
	Tue, 24 Nov 2026 08:07:16 +0000
X-Mizu-Trace-ID: e41294f2a3451cd8
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 00:07:11 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Runli <mingyu.he@shopee.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry@kernel.org>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, littleswimmingwhale@gmail.com
Subject: Re: [PATCH v3] mm/bpf: Always flush memcg stats when explicitly
 requested
Message-ID: <20261124080629.GA564737@shakeel.butt@linux.dev>
References: <20261112041348.66915-1-mingyu.he@shopee.com>
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
In-Reply-To: <20261112041348.66915-1-mingyu.he@shopee.com>

On Thu, Nov 12, 2026 at 12:13:48PM +0800, Runli wrote:
> memcg_rstat_updated() stops walking the ancestors when a memcg exceeds
> the flush threshold. A concurrent flush can leave an ancestor below the
> threshold, so the early exit prevents it from receiving further updates.
> 
> Consider root and leaf on a 4-CPU system, with a threshold of 256.
> CPU 0 is flushing another CPU's stats after CPU 1's stats have already
> been flushed. The counts below are shared stats_updates counters:
> 
>   CPU 0 (root flush)                CPU 1 (leaf updates)
>   ------------------               --------------------
>   clear leaf->stats_updates
>                                    add 64 to leaf and root
>   clear root->stats_updates
>   finish flush
>                                    leaf = 64, root = 0
>                                    4 more batches of 64:
>                                      leaf = 320, root = 256
>                                    next update:
>                                      leaf > threshold
>                                      break; root is not updated
> 
> Root remains at the threshold, which is insufficient to trigger a flush,
> while further leaf updates keep taking the early exit. The periodic
> forced flush restores progress, but until then the root's aggregated
> statistics can fall far behind. For example, page cache grows at rate of
> 1 GiB/s, a two-second wait can leave the reported usage about 2 GiB below
> the actual usage.
> 
> Make bpf_mem_cgroup_flush_stats() force a flush without waiting for the
> periodic flusher, while preserving the memcg flush bookkeeping.
> 
> Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
> Link: https://lore.kernel.org/all/avKy9oMwDRjKjfzm@linux.dev/
> Signed-off-by: Runli <mingyu.he@shopee.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
