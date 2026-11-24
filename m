Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531403;
	b=r/ULmTDi7/IXaMDn7O9u+CKDmMwS5NI/u7X7ns00hTh7hLFSLiqajrBkfD++vgC4cQ8E
	 xYQ1MnIQ7DYQIxYsjjEoFdz30/HiDlARFSJzAqdKNiyeuRsO0UhkBVtZJFiU5zT2gTNK9
	 0XVV+ZkWuCxdWGXnF7JEzG369IQBQm6K2lFqYKUHyTNuMuc5lkRgm8BoLT6lP7UGC3TlV
	 3xKiBHefyUXA7idQqE0Pe4f1RyrNjdrCrq/XmPIVWXLFX5urLq3GpdLFpzeBL7RXxxs7C
	 N3xpuaJWQP7ii+qnoPHN/gCgjcSenCPOib7rvnbU7Q2WdX1cd756hF2Kf36jcOlU7bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531403;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=t7LubSWd+iYxlj/XP8vahvIuqfClM9LvXthjnvc2fUY=;
	b=0tsx6duKnsfPKMIAq6zsOPOtTRatgpwKEBGqA840GljZGuPxLsW0IBDeM+pnP/Cv3pM6
	 EJJmT8PQIwjFdZeMO+RkoZGfiuU84ZJEhjT8vDqqJOy4Ys31rgjTgA/GeyHHUQcTrEdbr
	 hoRN0MM9PeV+eKzp5ifgpXLxsXUt06o9W/4hpIRRX+DC5Rf/NgOvJOSqLdoUQY5fy8ivg
	 8Z6dSBAQsRGL4OgzElx9Z19wWk44j/U3+NPfVLLiR7OzNSqBWc90buKTG5rGoFohz8Dk5
	 fduvcL0/i0VtVl0jIbt+U/j4HSZ6hwXRIL81ngeUIi1VqM9Hl/niLiJ28d/ZsUBVefw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PDJrQxmN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E25606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PDJrQxmN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B321F000D1;
	Tue, 24 Nov 2026 14:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531403;
	bh=t7LubSWd+iYxlj/XP8vahvIuqfClM9LvXthjnvc2fUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PDJrQxmNsobCT4kmEB9/+PlLwkxpbPP49gNIU7x1oBDN7BPz9ruvEwFlI4ve6HwKf
	 Z7aeZMBDmvea9r/H78UFL2NQeJdFw+JX3zUG74jBGjd5END/B9U7MTzp4hil6n37Z9
	 c55dV4IGkRiYTbgoEyn04qKMcbhGUtxvdoq/8L4m4NhjGHAElbyk66obxcEtem1H9x
	 zZhFr6SZx4e1Lu7Bqk3Cx4uakJS2/IUwpgTdHqiJGfr8Q5ItN15HvzVkjpqZsOzf53
	 4fgvRrppYkqsA5rgy6o7T9NUfNcFPd4x4HLuubexIEB4mTOESLlsXrflzcSojQYTqc
	 6g/q/Gx5z4dbg==
Message-ID: <9ee51be5-c100-470a-989b-6ef05c534438@kernel.org>
Date: Tue, 24 Nov 2026 15:43:18 +0100
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
Subject: Re: [PATCH v4 0/2] mm/page_alloc: get_page_from_freelist cleanups
Content-Language: en-US
To: Joshua Hahn <joshua.hahnjy@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261123181829.4065581-1-joshua.hahnjy@gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261123181829.4065581-1-joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/26 19:18, Joshua Hahn wrote:
> v3 --> v4:
> ==========
> - Make kswapd_wmark_pages() static inline, as suggested by Vlastimil.
> 
> 2 cleanups for vmscan and page_alloc code. The primary goal is to make
> get_page_from_freelist a bit easier to read, especially after the new
> kswapd zone skip conditions [1].
> 
> Based on the latest page_alloc/for-next branch as of 11/18/2026.
> Notably, there is a dependency on the aforementioned kswapd zone skip,
> 677dfdfad244a "mm/page_alloc: only skip kswapd nodes below their kswapd
> watermark".
> 
> No functional changes intended.
> 
> [1] https://lore.kernel.org/all/CAN+CAwNsqWpPoag_XE6bxbrfi6m71xw1NS_wc3h_ShZjNspSjg@mail.gmail.com/
> 
> Joshua Hahn (2):
>   mm/page_alloc: move the kswapd node skip check into a helper
>   mm/vmscan: consolidate promo vs. high watermark checks

Applied to page_alloc/for-next, thanks!

> 
>  mm/page_alloc.c | 47 ++++++++++++++++++++++++++++-------------------
>  mm/page_alloc.h | 12 ++++++++++++
>  mm/vmscan.c     | 11 ++---------
>  3 files changed, 42 insertions(+), 28 deletions(-)
> 
> 
> base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40

