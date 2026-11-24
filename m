Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509262;
	b=Hws+Td/xJrJxZ38p+f5/UVoQ3gwiQG2CBgSI3AEqeHGFBFgH16+jobmbtRx9Q8VSZRxk
	 vtDdlDV6XQn4PArhM3ETiGVrV1o8iy0i56qxnYycniguDjGwnDKrGfEgdwYGSTLfMb43Z
	 A8Ui+cw22CAWnwsShZvha/v9qfPk/gXK/Zj3pKahxxewD8Zk7p9mJXmLTd0j5SP08Np1o
	 VptgefJhkaNyksoRLcS/vGkT59Ifv62Or3ohtXhensdR+GZeQzxi9YpvPro4/GEE7XT4P
	 Gvxegy1kbgWFwvwCwl7XD6Y1Qb0DivAJ3zA9vf+IzXZEiXKrGpUSKloeDq19PgHI1Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509262;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=K7WfdCMMRCOuD5ycNmdQ5yCGlPPSWFzHbHH6Cd/QbH0=;
	b=PXBiuI6TMVQa72fKQ3CVtgeT5L8aHc/l5TJOmqAc1p7cW4CchXqr07VlW4bxXMeqamf3
	 sVkxgXMfL3UF1SrdQLbApxQ6ZmDgsWDjs7WKMibqbld/fU42S2ZfivwKOAzi5IeXhqYnn
	 x3rOISMGj00nP8I7vyxLaumuG84Xh3fTgLO/0pbSQG3scC8SYFI7lv9Hx/dFXXX7g54gj
	 Nr4yB4P7R5NKQ2aXuzM6PduIBXEMMikQEzDAUOAyeNIxZM9Cth0/R6Z3qi4EETrEpyVrp
	 N84JN+y9sZjDfM4Q2BVIbq5HphtWTkkgbzroE5pRqyE4wgD7/+uez3tq23j6OgpP2FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ep6nvdu1;
	arc=none smtp.remote-ip=91.218.175.140
Received: from mta0.migadu.com (out-140.mta0.migadu.com [91.218.175.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B78A606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B78A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ep6nvdu1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qoHhrk9Sl3EhFD+MHGeYcSOXmqUjqg0h5hTx5ClbPdc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795509257; v=1; x=1796114057;
 b=ep6nvdu125Y+SWS4EygrYlF4UkJIQhlLmKCYXAu3v3dUyX+iffpoS77NN+4FiO+Whf4sEtza
 jw9kNX2wENhqiuiAMJtgDSKy6YrR2M5QN3rU4pzW/v2kIgf2BQ9kMEWPDUFm4+E9FVJiaujvJlL
 8sGNpNa7LG0MnkFf0qZYs4Vo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 23c9c215f8cde8b8;
	Tue, 24 Nov 2026 08:34:17 +0000
X-Mizu-Trace-ID: 23c9c215f8cde8b8
X-Migadu-Flow: FLOW_OUT
Message-ID: <d5b7be4a-0137-4fe7-88ef-5cbcc23d0855@linux.dev>
Date: Tue, 24 Nov 2026 16:34:08 +0800
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
Subject: Re: [PATCH v2] Docs/mm: fix stale split page table lock references
To: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)"
 <david@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <6E11B4A6A6E0DCF9+20261123030904.57369-1-zhaozhengzhuo@uniontech.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <6E11B4A6A6E0DCF9+20261123030904.57369-1-zhaozhengzhuo@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/26 11:09 AM, zhaozhengzhuo wrote:
> The USE_SPLIT_PTE_PTLOCKS and USE_SPLIT_PMD_PTLOCKS macros were turned
> into Kconfig options, and CONFIG_SPLIT_PTLOCK_CPUS was replaced, but two
> Documentation/mm files still refer to the old names.
> 
> Update both references.  Point readers to mm/Kconfig for the dependencies
> instead of restating information that can become stale.
> 
> Fixes: 394290cba966 ("mm: turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig options")
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
> ---
> Changes in v2:
>   - Point to mm/Kconfig instead of restating SPLIT_PTE_PTLOCKS dependencies,
>     as suggested by David.
> 
>   Documentation/mm/process_addrs.rst         | 2 +-
>   Documentation/mm/split_page_table_lock.rst | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi
