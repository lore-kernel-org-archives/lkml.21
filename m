Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422013;
	b=ykeldaASacsH06eQywnk8umRoNE5/ieuaRSlXmQ7vv5hSFNhRBks8vzMHB7BYkFRzMrR
	 t53REF/G/BH06a5KEauiAr3AjSz9mwQDnb8urK7xrUpvDGKg9+td+CmdikQD9s0Rcxjlp
	 01n7IR5q5SHDbBAxyiCHvNLLmb+jNXeKWJBqKs1wzSHN+vwOeXhTGNwqBkC1X3qVqDpOp
	 +T6HfogiwtIO4Yzrswt8orjQj7he+lW57wkWmSBx7DRWeBTGsIUJNoXgplWGEHefXmGEm
	 TsKWWAEZNGskogB5wxFPUX3bYV1quS6T7xCjwRGOxfW2/oESaumJgJrISX5Fk3DAH3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422013;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=do3hhy8BivBIPaCIu3eHt8n77a4uOX0QFMSHWM1VMf4=;
	b=sPBnCdLNnvIao6xu/3HZvUa4DJr/155Wiz4PyWJsyu+Xwqbcwd+/98n5s2rysvA1xEJg
	 Ss2vEuaTrr5/O4fG3n5pOHv486cYaNGELwtPGIcubVxv1a8W27UBW111ECrhWlATQYZE+
	 PO5xhfBf2xtCG/WCOI5lKKIKqWzCvah3LOfSII+7igqk4b3Lzz3m9E4UBrYU3lEqUCQtk
	 kjwTXltJLni1Ubt4HO5p68XzCOq3gAby9bze5WJC9XZEGYE+uRRHYWSFGCWk4gMZfw0FL
	 rD9WltUp1ehX8+0yPvVXyrNLfkZohEbnlbXzSdcDWuGaAv1Q7x8D3F3h20uGhT/d3sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TRd9bm4X;
	arc=none smtp.remote-ip=95.215.58.67
Received: from mta1.migadu.com (out-67.mta1.migadu.com [95.215.58.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4C2606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TRd9bm4X
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BjCUR/7yKwN3msaVE1SYKk/w8arWubDM2QA4cpLgvmQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795422010; v=1; x=1796026810;
 b=TRd9bm4Xt5h574M7MX6d5flPWv8/j+JEfyJEmTBzx/aCzG6Rtf6iAHFqe8tciQmYfeKgwLQr
 bB8uZiqjxo3cJ+cg8oGISLH5hJBw/HNikETnl1qx1SBDjAKswSrzcAMk7zc18Z7rLJKQFdyLJe9
 Z1ld3AZC1I3CWvGVqsg9COhE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9bb350d23e260834;
	Mon, 23 Nov 2026 08:20:06 +0000
X-Mizu-Trace-ID: 9bb350d23e260834
X-Migadu-Flow: FLOW_OUT
Message-ID: <a6029d44-7c7e-44b5-9433-452833152de3@linux.dev>
Date: Mon, 23 Nov 2026 16:19:55 +0800
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
Subject: Re: [PATCH v3 11/11] mm/mm_init: move pageblock migratetype init to
 memmap helpers
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
 <20261120100856.16929-12-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120100856.16929-12-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 6:08 PM, Muchun Song wrote:
> ZONE_DEVICE memmap initialization already initializes pageblock
> migratetype after all struct pages have been initialized, while hugetlb
> bootmem folios have their own duplicate bootmem-specific initialization.
> 
> Move the MIGRATE_MOVABLE pageblock initialization into the frozen memmap
> initialization helpers instead, so the ZONE_DEVICE and hugetlb bootmem
> paths can share the same initialization.
> 
> The old hugetlb_bootmem_init_migratetype() skipped CMA folios via
> folio_test_hugetlb_cma(), but the shared helper always initializes
> pageblocks as MIGRATE_MOVABLE. This is safe because cma_activate_area()
> later overrides the migratetype for CMA pageblocks.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v2:
> - Fix the helper name in the commit message (reported by Sashiko).
> ---
>   mm/hugetlb.c | 25 -------------------------
>   mm/mm_init.c | 11 ++++++-----
>   2 files changed, 6 insertions(+), 30 deletions(-)
> 

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

