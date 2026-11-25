Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595160;
	b=fYokWfTff+A98O7Lucqr1zFphRB9uNZADWdVVR9GbEjBpfDE/j/fG58xPCZvcZ6cEGfn
	 GbxEldQO2TYiwAUlXSIiHxr0cZ9mwt34SeNU4OZQ6bY9w72cnvlgAdCvvB4V4/bc3pi9Q
	 ZpuNNRk7hcl1/yDgf2Lxe/4RL8S/trfBJZvmnmbX7XCEISamXY9ELHPRJ+nUd7pkdKPX0
	 0UJ/elceqQFhOCzfd3i5G1Wjecab7pnIZPm1UVtxw5jYaCUZGr08gMbbhFrncJW8qNYUP
	 fUSbBqimCHdKHhy55Go2TrfSrkM7uVaVe0Al1XQ/OLsE57dfieQqJUWQJmmfiw4Fj3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595160;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=04pywlPggVjZZXsvKKiktE10oUk8nyW7nRcN3gWRmzc=;
	b=A8yQUuGEJMLnTJ5cY1Iy0nYE6sl0XNHrsLV7Xfxlw5cHLQPWiOqxwW4Bli+IVqP/atLJ
	 tqxcgWr+ZxQ3x/2A7969u+FKQecQsI9LRhjJTJq5K7K476klJsx7OOpN3DNjxuPNwR8EL
	 0o2Fc09+yVO6W2hkt7+8EaBBELhm8sAYNQYVTqWrmStwMXdah5cwkuBUTxmSTDr21Ed+T
	 IHnf5Z4Hx3ElMzJTwGHWWP2D4CBwRsEH1knU0sIQCdjVdgD7mV+DlOWCNF3NwPonGkWWK
	 8h/snyAcj+iSkkcbTOnGXzOGEYmyptIWJAjH3WQ2cAWFKxM5ceRWqN6yP+wPEhyGW7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b48+ppwE;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F3F606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97F3F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b48+ppwE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83E3D339;
	Wed, 25 Nov 2026 00:25:54 -0800 (PST)
Received: from [10.164.19.73] (unknown [10.164.19.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D55943F86C;
	Wed, 25 Nov 2026 00:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795595157; bh=uiMswwfCXJIy2pRDFuaBVv+NGaTY4TCXsaeQwexIUOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b48+ppwEd7Q/s01C/r5AKqqQm3kBnoOUiXuuicvTXvotWqA5KAkCDJb2AraZLfZvI
	 gxfMfw419n+HZMgqnCAhirgvICkVUAf1F1o+pUir+JHh/NWd4qQ0ieXNJK64o9ZMUC
	 90QtVVmIPfTIjygiO5pVh6vT7lVDFNVbyELFtAqo=
Message-ID: <ddd9f940-0e12-4b55-a76a-47cf4b1dd5d7@arm.com>
Date: Wed, 25 Nov 2026 13:55:48 +0530
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
Subject: Re: [PATCH v3 2/3] mm: page_alloc: make the high-order watermark
 check honour ALLOC_NOFRAGMENT
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>, Harry Yoo <harry@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261116125103.2894162-1-kas@kernel.org>
 <20261116125103.2894162-3-kas@kernel.org>
 <a066d403-1608-4c0b-b06b-0b786e71b12d@arm.com>
 <av7_n5llADUbJI-r@shutemov.name>
 <38d06816-e138-4edc-b26d-499617870506@arm.com>
 <awRS1q5WvQyKLAf3@shutemov.name>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <awRS1q5WvQyKLAf3@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23/11/26 8:25 pm, Kiryl Shutsemau (Meta) wrote:
> On Mon, Nov 23, 2026 at 04:11:37PM +0530, Dev Jain wrote:
>> But, for the existing callers who pass order > 0 , aren't they also checking
>> whether the allocation can be served?
> 
> No. kswapd's pgdat_balanced() and kcompactd's __compact_finished() have
> no allocation to serve. They are woken with an order and balance the
> zone for it. There is no migratetype to pass.
> 
> should_reclaim_retry() has an allocation, but it asks whether it could
> succeed once everything reclaimable is freed, not whether it can be
> served now. Its order-0 part already counts reclaimable pages as free.
> 
>> It is confusing me that both alloc_flags and migratetype are logically
>> part of the "allocation context" but some callers are doing
>> alloc_flags & ~ALLOC_NOFRAGMENT ... I am not sure whether the below
>> Sashiko report is related to that, I didn't check in detail:
> 
> Only should_reclaim_retry() clears it, and that is what Sashiko flagged.
> It keeps what the check did there before the series: it never filtered
> by migratetype.
> 
> Filtering would send movable order-2/3 requests, like 16K/32K mTHP
> faults in a MADV_HUGEPAGE region, to compaction retries and the fallback
> sooner. That is a behaviour change of its own and needs its own numbers.
> Out-of-scope for the patchset.

Okay I read the function again and it makes sense, thanks for explaining.


> 

