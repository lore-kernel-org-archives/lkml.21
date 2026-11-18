Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996650;
	b=XXP23vKTkSxU07ZBmIV8uY8Gc3oNtXHIzgIqM1o5e9zFRdW4Wmhq9TVeNk4DqHcAtXXR
	 xixCsZ/fumGkExjXZR5xUYLGIpwRgjfL2PuSaoFDVzXOMMnByvyvcjBNsG9jE2CzuIP0K
	 lvUW8pekJWLZTR2FxvtU2GxzPNwRQxECzXoUo16vQcnIlPI6DUr25gwXD5wNynWVwV49D
	 LN5WhOR4SurAhsgfvleGUxiF6kEtc2TmejpfwObSVwQ8m2HbQY0y6+PTE52DYH9poMwhd
	 14vqkiRGgNRMWVq8Y2RbxF/Od1vaG4+aLvCHV4ZqCxTVn5ROHpF+qmFg9oiXyw9YReA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996650;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5xQ2uInXZNMm0R6AQn2LPL3rDrnpuIT1agq9O7VBa0A=;
	b=DsfvMJG31uD860jqS9M/GpABW7Ywf3hRGvQzNizs962BXp/hJ0INH8zE+SCuZ3+71NJT
	 7A/HqHGj5uXG8jzP477FJu60K0YBq/Tsr0Thg+E5hoehyI9oCKUrd+dETIicfHjX6Pwn0
	 5DOpt87jyBdkemdN0pcoyb9geSCXgxRR8QPmvNT3W9184oZIFVMc1f2Q/bKMUk7jKPcAt
	 L8U/32w5jPjl4DZevNtKlLswPmOCpTAdWRkyZ8Cf6SOaO337GtewtS4m6lJXKe0t34yqx
	 Mhwx7B8DYJvI9Ua5Ku2cZPcETOYYelXsbCUmpnhP0N+1swStv2II3cmn2CgDNPKP1PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HllsBS6e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A19606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HllsBS6e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBBD1F000C8;
	Wed, 18 Nov 2026 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996649;
	bh=5xQ2uInXZNMm0R6AQn2LPL3rDrnpuIT1agq9O7VBa0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HllsBS6eEh3h2hm7iSzKWXKDhZSKfZFbSOL4EvlBLLjbfVzybvCnjlX3BBbTQKv9H
	 4f5i8la0iI006jW+YPVH9Thkaj33eA5s6+rLD6IPjhtjHgQmhIF6mSRurwk1ERRY/L
	 VTKsAV8mESstu9DYLXSdG/CynNlMGVri/hOP+kYm7FutJj94HfXyTe1bnhAGHTAjx6
	 4JKIRJDezEfobxJe5bJlGNs+mU2ULYfKik3NP+Lijue0jwlMwWbjjuzHHdyKDRDAuB
	 cLQRVqWnQ6n3m9czgQM75ViKqRBAgYh/SeU9r9D2+sarp+9jKD0aHGqKiJ8efNWxiW
	 5zDD6SoLkPbHw==
Message-ID: <5541ef01-f9c0-4ce1-b77a-5bb81c6cfdd4@kernel.org>
Date: Wed, 18 Nov 2026 11:10:45 +0100
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
Subject: Re: [PATCH v2] mm/page_ext: remove unused page_ext_iter_get()
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shivank Garg <shivankg@amd.com>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Luiz Capitulino <luizcap@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
 <e745f91b-3312-47b9-965c-510bf0a0b7f7@kernel.org>
 <20261117111336.ee49c0d4722a042c071c68b0@linux-foundation.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261117111336.ee49c0d4722a042c071c68b0@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 20:13, Andrew Morton wrote:
> On Tue, 17 Nov 2026 19:50:09 +0100 "Vlastimil Babka (SUSE)" <vbabka@kernel.org> wrote:
> 
>> On 11/17/26 17:26, Shivank Garg wrote:
>> > It was added in commit 9039b9096ea2 ("mm: page_ext: add an iteration API
>> > for page extensions") but has never had a caller.
>> > 
>> > Signed-off-by: Shivank Garg <shivankg@amd.com>
>> 
>> Added to page_alloc.git for-next, thanks!
> 
> Thanks.  Helps.
> 
>> Hm page_ext.h should be added to the PAGE ALLOCATOR section. Wonder if
>> Andrew's patches adding various missing bits included that too.
> 
> Nope.  I'll add the below.
> 
> A few things under mm/ include page_ext.h so perhaps more mentions are
> needed.

Thanks! Stuff that includes it are its users and not necessarily page
allocator itself. Nothing jumped at me.

> I'm presently carrying no patches which alter page_ext.h or page_ext.c
> 
> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: MAINTAINERS: add page_ext.h to MEMORY MANAGEMENT - PAGE ALLOCATOR
> Date: Tue Nov 17 11:05:44 AM PST 2026
> 
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> 
>  MAINTAINERS |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- a/MAINTAINERS~a
> +++ a/MAINTAINERS
> @@ -17779,6 +17779,7 @@ F:	include/linux/compaction.h
>  F:	include/linux/gfp.h
>  F:	include/linux/page-isolation.h
>  F:	include/linux/pageblock-flags.h
> +F:	include/linux/page_ext.h
>  F:	include/trace/events/compaction.h
>  F:	include/trace/events/page_isolation.h
>  F:	include/trace/events/page_ref.h
> _
> 

