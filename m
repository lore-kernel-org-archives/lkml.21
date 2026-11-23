Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430510;
	b=pcOXy5avBvbDmuXJUyl12J0CsGb8NY1kQjpYSnro+dd7fxPQy6V7J/kjp4cnz9AbHWCn
	 y/wtj91EXMUoUqdFefETWz8ll1bkXwDU1XfQX721KUUnv6J9JKuly52jRjzXQsK7maRo3
	 WFUd21yIDLr4zZnXKj0hQlePowckzDAiW0zDx0FJvO6Xu0RATTeIptcuRp2KBsiyP2UUT
	 DA6Y031wDmKR+IrAEvwTnJ67NFzSO8J8lMy7OIqfb4TRlktYPGDl/HV0XZHWuKnwjbHy3
	 m6+DNc/SbEC+/IM4jzCkF9bSGlI09/8lITRIIwqfLmTvZPhscSkaZfs2JAw/ABT7AsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430510;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jpGiLd/SR0KkHuW916oaPvPankpE2lAPzBwsA+0eEUo=;
	b=glYjUztMdb/7TYBlz860tWDW5YExyb+lOxH49AgPwEzp0HbAWTMDzjdgb+giyDMmUIMe
	 Ms5NFHh777UDRH0KVFEwRiK1Z8CYNxu2BZvjkRaYYSQo157C5WTjaEVOr8IiQEXWsJdkb
	 77ZKsPw+kkHU8q9f4Z2F2ZOOgSjMbt/QAyIedBEgRtMhwU//RhI/Gt1sQwgiM+UJoZYtb
	 jZMqt5Ojhy/px7HOfaphDZm7kDyF/EF0kUVqirziZ+uqKuDQyhLeHHR7L2F8ETfCUJ5af
	 DZWgB0I0jXbCRcOdCIJUtnnORwf5+RJqvDFxreZ0aIyvpZRmQIafeMGjPhr39mcZx5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fS944Ga+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF204606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF204606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fS944Ga+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36CC4143D;
	Mon, 23 Nov 2026 02:41:46 -0800 (PST)
Received: from [10.163.157.54] (unknown [10.163.157.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02EBC3F632;
	Mon, 23 Nov 2026 02:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795430509; bh=+Uc9s5vRzOrMEMBjecGU+IR5j76w9s/5x+FEreLson4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=fS944Ga+GVS89oCilc07YUDOHzrGxgD/x1uVGnqJPQlpAGss8pw0pHiDOiZIOeWQT
	 /bUJ+Dz9KlLvnnf+AxCR5wLpoKa86/bSdeSIp2SyRQa7yXtBjiiz6XgfCcLJUrvglk
	 eCzLfNKth+PIlOteVECJ7r5T5WTKzYyMqAdUfp80=
Message-ID: <38d06816-e138-4edc-b26d-499617870506@arm.com>
Date: Mon, 23 Nov 2026 16:11:37 +0530
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
From: Dev Jain <dev.jain@arm.com>
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
Content-Language: en-US
In-Reply-To: <av7_n5llADUbJI-r@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 19/11/26 7:32 pm, Kiryl Shutsemau (Meta) wrote:
> On Wed, Nov 18, 2026 at 01:40:17PM +0530, Dev Jain wrote:
>> So let us do something like: we have zone_watermark_ok_for_alloc. It will call
>> zone_watermark_ok, which will only handle the watermark computation (so this is a
>> refactor for the code ending at if (!order) line in current zone_watermark_ok).
>> Then it will also scan the freelists for the correct order, correct migratetype etc.

I think my wording was unclear. By "correct migratetype etc." I did not mean
"only the requested migratetype". I meant the same rules being enforced
below the if (!order) check in current __zone_watermark_ok(), in relation
to the migratetypes and orders while scanning the freelists.

> 
> A count-only zone_watermark_ok() does not work for three callers that
> pass a high order: kswapd's pgdat_balanced(), kcompactd's
> __compact_finished() under defrag_mode, and should_reclaim_retry(). They
> ask whether the zone has a free page of that order regardless of
> migratetype. They need the free list scan without the migratetype
> filter, so neither of your two helpers fits them.
> 
> So the split is not count vs scan. It is the zone as a whole vs one
> request, as the comment above __zone_watermark_ok() says. The _mt variant
> is the one that takes the request's migratetype. Callers that only want
> the count already pass order 0.

Although I thought a lot last week and my approach would cause more churn due
to changing lots of places to _for_alloc, so I am fine with your approach for
now. But read on.

Currently you pass migratetype and you say in the comment in patch 1:

"Use __zone_watermark_ok_mt() instead to check whether a particular allocation
can be served."

But, for the existing callers who pass order > 0 , aren't they also checking
whether the allocation can be served? It is confusing me that both alloc_flags
and migratetype are logically part of the "allocation context" but some
callers are doing alloc_flags & ~ALLOC_NOFRAGMENT ... I am not sure whether
the below Sashiko report is related to that, I didn't check in detail:

https://sashiko.dev/#/patchset/20261116125103.2894162-1-kas%40kernel.org



> 
> I am not particularly tied to the _mt() name, but _for_alloc() is a
> mouthful.
> 

