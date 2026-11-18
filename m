Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966516;
	b=t/bZzPSgP0krVwPDQB00kHT9dynZNqkAfd3kHu9TS8ZgEpoVKCcziwL9498ilcQM0NSl
	 ZX1FOomSuEkkcetQkxaDlnjS6Ghwgq9Brk/eigXaKFpcw8nS2kiSXbWTgjWu94MvUvzKZ
	 4KehiG2h33IpJHMFL8BCYaND8rJ3hfSgHqBlVQzPG6HPCB6QZpZyVT4Fafc/7deLkApoM
	 LL3Z7ORizyD0sHKabgXaQLCxSLZsIhTcvgq2fszoDgwYLRjSZgzIbjBcF3FsoQyU1WTfN
	 XOFP8ayLb6BGbIdBmM7zIWjB8657GOsOqj1J+BlKNl1IEsAT9OW9VKzcpUF0U6ukViA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966516;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kEsuSwHhmeJEGKRuu1fKD0DbR/1Nao9WbEuVQxgyWZM=;
	b=T85fFEWZ7V+RHxTSc4ouOLBKQXzDrt/oteb3ITJTWzsiUCeKb9CX8YXQijn4b8Tl/3lS
	 Fq0wBmNF5nCfdDNbyPGCL/o3b9UDTgCv5/U3zfk2/Sk4xbEZ6EeJlWl94nC/zepsYDT1M
	 Du4CCYs+Km01gHhYEESJMcJ555R0G94iboApz3j9VyGePcoE82i/aT0EtSUd6kXJZoR2N
	 4bh0PNvqVF0pBTK4CQcHJ/Exk3QGIwXH+A3jYgLNIUz9JddmIGAr3/ZEvumAnj8lhcgJP
	 C/2z9RyVLXgC0n/wL+CpHqSxSjnY0VpPyymz1tztS1l31qmmKDwyqhOilnCayFG5tew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h+MqjvDX;
	arc=none smtp.remote-ip=95.215.58.75
Received: from mta1.migadu.com (out-75.mta1.migadu.com [95.215.58.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF23606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF23606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h+MqjvDX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cipxz3ByaOhwFVVoVY3xs7T+pGiwDTQ+f9P0r9E9li0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794966513; v=1; x=1795571313;
 b=h+MqjvDXMGHHko2yXc8o3a82rh7e7cB9QabP1QfEKZwW1JgYjf/UhxxB6L+87FKipWkOnFAQ
 M52ymobFUSr99U4ta+B9XmNK0PxaRopuRDCZ8VXfNxohCtZ5SrWNVTs7L/gEOA6k9he1ZPmBGWF
 7UhBDGOWYXBux9nmbbZ/4ffg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b13cb621ae958f09;
	Wed, 18 Nov 2026 01:48:33 +0000
X-Mizu-Trace-ID: b13cb621ae958f09
X-Migadu-Flow: FLOW_OUT
Message-ID: <54e548ad-9641-4348-819a-11f29cc35ff4@linux.dev>
Date: Wed, 18 Nov 2026 09:48:14 +0800
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
Cc: hongfu.li@linux.dev, Hugh Dickins <hughd@google.com>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH 2/2] mm/hugetlb: remove the gfp_mask argument from
 alloc_hugetlb_folio_reserve()
To: Muchun Song <muchun.song@linux.dev>
References: <20261117-for-memfd-v1-0-fa68f433171e@kylinos.cn>
 <20261117-for-memfd-v1-2-fa68f433171e@kylinos.cn>
 <DF9FCBFB-C1E3-497F-B7AB-567F44873B05@linux.dev>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <DF9FCBFB-C1E3-497F-B7AB-567F44873B05@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 11/17/26 19:15, Muchun Song 写道:
>
>> On Nov 17, 2026, at 18:53, Hongfu Li <hongfu.li@linux.dev> wrote:
>>
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> alloc_hugetlb_folio_reserve() takes a gfp_mask argument that
>> memfd_alloc_folio() always sets to exactly htlb_alloc_mask(h), which the
>> helper can derive by itself.
>>
>> Derive the mask inside alloc_hugetlb_folio_reserve() as
>> alloc_hugetlb_folio() does, and drop the argument.
>>
>> No functional change intended.
>>
>> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
>> ---
>> include/linux/hugetlb.h |  4 ++--
>> mm/hugetlb.c            |  3 ++-
>> mm/memfd.c              | 13 +------------
>> 3 files changed, 5 insertions(+), 15 deletions(-)
>>
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index 69732e4cc03e..a88c59476e79 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -735,7 +735,7 @@ struct folio *alloc_hugetlb_folio_nodemask(struct hstate *h, int preferred_nid,
>> 				nodemask_t *nmask, gfp_t gfp_mask,
>> 				bool allow_alloc_fallback);
>> struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
>> -					  nodemask_t *nmask, gfp_t gfp_mask);
>> +					  nodemask_t *nmask);
> To be honest, I'm not a fan of this change. This is a memory allocation
> interface, and we shouldn't couple it with a fixed GFP mask. Sorry, I
> can't ack.

Hi Muchun,

Thanks for the review. Understood, I'll drop the interface change and keep
the gfp_mask argument in alloc_hugetlb_folio_reserve().

Also, patch 1 is the part I'm least confident about. Your comments on
it would be much appreciated when you have time.

>> int hugetlb_add_to_page_cache(struct folio *folio, struct address_space *mapping,
>> 			pgoff_t idx);
>> @@ -1161,7 +1161,7 @@ static inline struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>>
>> static inline struct folio *
>> alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
>> -			    nodemask_t *nmask, gfp_t gfp_mask)
>> +			    nodemask_t *nmask)
>> {
>> 	return NULL;
>> }
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 88c9aa700533..e84203406da3 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -2221,8 +2221,9 @@ struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
>> }
>>
>> struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
>> -		nodemask_t *nmask, gfp_t gfp_mask)
>> +		nodemask_t *nmask)
>> {
>> +	gfp_t gfp_mask = htlb_alloc_mask(h);
>> 	struct hugetlb_cgroup *h_cg = NULL;
>> 	size_t nr_pages = pages_per_huge_page(h);
>> 	struct folio *folio;
>> diff --git a/mm/memfd.c b/mm/memfd.c
>> index 8905e3e9efc8..08b9d54b0d8a 100644
>> --- a/mm/memfd.c
>> +++ b/mm/memfd.c
>> @@ -69,22 +69,14 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
>> {
>> #ifdef CONFIG_HUGETLB_PAGE
>> 	struct folio *folio;
>> -	gfp_t gfp_mask;
>>
>> 	if (is_file_hugepages(memfd)) {
>> -		/*
>> -		 * The folio would most likely be accessed by a DMA driver,
>> -		 * therefore, we have zone memory constraints where we can
>> -		 * alloc from. Also, the folio will be pinned for an indefinite
>> -		 * amount of time, so it is not expected to be migrated away.
>> -		 */
>> 		struct inode *inode = file_inode(memfd);
>> 		struct hstate *h = hstate_file(memfd);
>> 		int err = -ENOMEM;
>> 		long nr_resv;
>> 		u32 hash;
>>
>> -		gfp_mask = htlb_alloc_mask(h);
>> 		idx >>= huge_page_order(h);
>>
>> 		/*
>> @@ -101,10 +93,7 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
>> 			goto out_unlock;
>> 		}
>>
>> -		folio = alloc_hugetlb_folio_reserve(h,
>> -						    numa_node_id(),
>> -						    NULL,
>> -						    gfp_mask);
>> +		folio = alloc_hugetlb_folio_reserve(h, numa_node_id(), NULL);
>> 		if (folio) {
>> 			/*
>> 			 * Zero the folio to prevent information leaks to userspace.
>>
>> -- 
>> 2.54.0
>>
-- 
Best regards,
Hongfu

