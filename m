Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419415;
	b=mcjWPcV4l3IJlxlmux0M+ekLORPeA3flnDyAasPMVznVtthsrXpqaYI22eSpb9RPM+K8
	 l7KGjbvsLJlCnK5o7UaBXqLa2RSj/12FPHMIergV2P9+p1QBc/7bsiFjsqNqxRN/Teduz
	 87MnTL61KOCsYsjsPqqjUxL0BlQ4+qucD1vwCID+/lBet9anZBC8eqM6LT8QufvsEi1wk
	 nOPtQfbcrGX1l/FWzOmdXt9O79RNJBxtThJ3rm/VK8n8HwoeS85mXvw14GbXC7XwxZ4eH
	 pNQQ3sH8x74DtNkevzVu1VwkEQwffekM1LklGD5C/AZoUCoopZvDp/k1yWvwPuFW/JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419415;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=81kPDDtvuE4JtMEIOKgmGIVDhK7QJRekDLof38gkIYo=;
	b=d6A6zeVmJAIqDuis8xQNCSzGnbGtrLhN+SsrGtJut6MGvVIAKTlW8qz/TGy3blW1iTrO
	 72zB1FIvCNE0Qdl2W5lznTwWN0rTyhX46eR1AcEyoFMpCQW+L+CeARPHXmDr8t5VTwQ3J
	 AtJoaRDvNFdMie5qOuRuGFv300c6MjIHes4FB36bRzQRgb+p2sxmiucSo5av157Mmw9Kt
	 hI9hSnOIsqX9aFWRAItIQGwDFUKQEiAvKYfH0aBLp0LMi6cFDOSjO9M6TjHjV7p9Wxt0J
	 LpORd5158rM9cJeJUaQ1UWywSN4NZrunRIwsQP/mgjxEaCkS7Dw49P3ej+CzmjbB7kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LkFCWuzw;
	arc=none smtp.remote-ip=95.215.58.160
Received: from mta1.migadu.com (out-160.mta1.migadu.com [95.215.58.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C44D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C44D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LkFCWuzw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Z0+DZ4FEhHpDonNvxmZ+TUvjKPTgnZDclyV2sAUO8uQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795419412; v=1; x=1796024212;
 b=LkFCWuzwvy7MP9EXNHz6uLPt7ONXZq9bO7ivI5WJ0uYHqgO5/fmWts+EDS7aa0l25nNoritP
 lZl0+LZJVSJ9xxgoDCNmx83UjqRJVuNSNLHDcoCUTMTWZQ8b59zBU5dFGEkvQ3vtisIjoQYtOXe
 hScpuE3dQxHyOR9A99KiRIyA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9884a88ac428a34a;
	Mon, 23 Nov 2026 07:36:52 +0000
X-Mizu-Trace-ID: 9884a88ac428a34a
X-Migadu-Flow: FLOW_OUT
Message-ID: <dcf39487-2b7b-4c67-a26c-90f3391e1227@linux.dev>
Date: Mon, 23 Nov 2026 15:36:43 +0800
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
Subject: Re: [PATCH v3 07/11] mm/hugetlb: use common compound page
 initialization helper
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Li Zhe <lizhe.67@bytedance.com>,
 Andrew Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 James Houghton <jthoughton@google.com>, Lance Yang <lance.yang@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-8-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120100856.16929-8-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 6:08 PM, Muchun Song wrote:
> Boot-time gigantic hugetlb folios currently use a separate path to
> initialize their compound struct pages.
> 
> Use memmap_init_compound_page() for these folios so that HugeTLB and
> ZONE_DEVICE share the common compound page initialization path. This
> removes the HugeTLB-specific implementation and improves initialization
> performance.
> 
> ZONE_DEVICE initializes struct pages by walking one contiguous memory
> range. Boot-time HugeTLB instead initializes multiple disjoint ranges,
> one for each contiguous hugepage. Measurements showed that memcpy()
> performed better than memcpy_nontemporal() for the latter access pattern.
> Therefore, use memcpy() for normal memory while retaining
> memcpy_nontemporal() for ZONE_DEVICE.
> 
> The initialization time for 64 boot-time 1G hugepages with 4K base
> pages was measured as follows:
> 
>    arch    without this patch  with this patch  reduction
>    x86-64          195.60 ms          170.40 ms      12.88%
>    arm64           374.40 ms          237.60 ms      36.54%
> 
> Co-developed-by: Li Zhe <lizhe.67@bytedance.com>
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v3:
> - Integrate the template-copy optimization into the common helper switch
>    (suggested by Mike Rapoport)
> - Use memcpy() for normal memory and keep memcpy_nontemporal() for
>    ZONE_DEVICE
> - Update performance results for the integrated implementation (measured
>    by Li Zhe)
> - Add Co-developed-by for Li Zhe
> ---
>   mm/hugetlb.c | 52 ++--------------------------------------------------

Glad to see this.

>   mm/mm_init.c | 10 ++++++----
>   2 files changed, 8 insertions(+), 54 deletions(-)

LGTM, so:

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

