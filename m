Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068608;
	b=Tb2i1xJ252dGwZblP/WOaHQzQL+NlVwCSjvpOZyp6pWlAaFZQeOOQI3ZSH/j3zOpP0Ot
	 f8k8MDChCdY7IgibbcO69ipJRZ2XqrvHMOpsrrIkhQtVDR1A1/eq5r7DW5QnU5q0ss/mk
	 bQuN0lkOYv479d15z9kQ+dT2vQg8FsPwyqcYBpXW6RSjYM7SQPhwuzKhvvqvdkhVK39in
	 TYrNwpzntLl2EtFP0CWEGa4189X5Lldtl1w8dkKDUPbRSKLGZ35itVJfmBDmhoHu0OWPA
	 +0rtPbaQgvTS069nnqLG3sYCBQT4R8N+75M7S+in9asWQTGCA2DvkVRQWXtMoI+dlVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068608;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WI39ktTPHePoOgeX3OHcUCOZpA4jQHeN52RmwOoNcBg=;
	b=EGsThVEJA59WIpjjlCaAKt/omvjFsFye8AJpMgeO68/PfCOBv1pdObQzNhs+hI482PGC
	 2lo1DDxg8I/Y26Xj6lYXRpKMF9Ap2y+Ug6nXjoPE5S64pEq8yHJMom1yUcDmARsvymJCN
	 HgzdUz7D1PHRh4SkmoU5mvlNdsH9hPrzYmQRhoaDjQDdQPIihBRdKoWEngjVTrSVZIzS/
	 o3nxCWUHt2earZWrOaJLQWCx47edptAmEyRZuvhMdIt4Xf8i2ZEubsWT1B3J/p2zNM+EJ
	 UemMFDBFngX5/ashE3aimQX9vk5iy4LYnqPjbHKw0WB8RE5XIJLKEaMgMc5TwRru8bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lvqhWlTF;
	arc=none smtp.remote-ip=95.215.58.226
Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD52606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD52606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lvqhWlTF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QDvhKKgfnXPvK29n7d5fG0PPr3CcrdPy2l7+B+fLbiM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795068604; v=1; x=1795673404;
 b=lvqhWlTFlyXbLV4jpvYOBsOilURJjgwx4IaddwUSsJp3zSxygCaTpF47JpmSERu0TvNeNTo8
 j03ToutfVgDTwQqlA516tYq4ESKqpNVAhu7Oh3ihJISTodCsMm0PZiPWrNoO6AFpMdlrL8FXnlx
 pvN7oZb3ShpJNrEhVuoV/TJw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 367d9de33892feca;
	Thu, 19 Nov 2026 06:10:04 +0000
X-Mizu-Trace-ID: 367d9de33892feca
X-Migadu-Flow: FLOW_OUT
Message-ID: <657f9c70-ce3d-4424-b5f1-264469131b1a@linux.dev>
Date: Wed, 18 Nov 2026 23:09:59 -0700
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
Subject: Re: [PATCH v2 1/2] mm/huge_memory.c: skip zero-page remapping when
 underused THP shrinker is disabled
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>,
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
 <20261025-b4-ksm_fixv2-v2-1-8b61ad0491f1@linux.dev>
 <175e7fae-2254-4e13-a4ba-0d39fb82018a@kernel.org>
 <22894af6-fd2f-4c26-b74b-d950f55a4e1b@linux.dev>
 <8c0ce90d-74d8-4578-bfc9-9218fcae8165@kernel.org>
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <8c0ce90d-74d8-4578-bfc9-9218fcae8165@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/17/26 3:00 AM, David Hildenbrand (Arm) wrote:
> On 11/17/26 00:08, Nico Pache wrote:
>>
>>
>> On 11/16/26 3:30 PM, David Hildenbrand (Arm) wrote:
>>> On 10/25/26 18:39, Nico Pache (Red Hat) wrote:
>>>> The zero-page remapping in __folio_split() was added to support the
>>>> underused THP shrinker. When the shrinker is disabled via
>>>> shrink_underused, gate TTU_USE_SHARED_ZEROPAGE on split_underused_thp
>>>> to avoid scanning subpages for zero content unnecessarily.
>>>>
>>>> Suggested-by: David Hildenbrand <david@kernel.org>
>>>> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when
>>>> splitting isolated thp")
>>>> Signed-off-by: Nico Pache <nico.pache@linux.dev>
>>>> ---
>>>>    mm/huge_memory.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index bd44d58e8684..2d56d1bff0ea 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -4104,7 +4104,8 @@ static int __folio_freeze_split_anon(struct folio *folio,
>>>>    out_no_split:
>>>>        local_irq_enable();
>>>>        if (anon_vma) {
>>>> -        if (!ret && !folio_is_device_private(folio))
>>>> +        if (!ret && !folio_is_device_private(folio) &&
>>>> +            split_underused_thp)
>>>>                ttu_flags = TTU_USE_SHARED_ZEROPAGE;
>>>>            remap_anon_folio(folio, 1 << old_order, ttu_flags);
>>>>        }
>>>>
>>>
>>> I guess the change is not that relevant in practice, because I suspect most
>>> people always run with split_underused_thp=true
>>
>> Yeah these two patches are only tangentially related. Technically with this
>> patch (1), disabling the underutilized shrinker would indeed fix it, as we no
>> longer are doing zero-page remapping. But the root cause is the split initiated
>> from KSM.
>>
>> Most people always run with split_underused_thp=true, but they also run with 511
>> max_pte_nones.
>>>
>>> Th question is whether "split_underused_thp" only determines "that we trigger a
>>> split if underused", or also "what to do when splitting a folio".
>>>
>>> Yes, it was added for the deferred shrinker, but the semantics of the toggle are
>>> not quite clear. I don't think there is any documentation for it ...
>>
>> Yeah Im not really sure if the intentions were to make all the splits do this
>> zero-page remapping. And im not fully aware either of the potential impact to
>> the system (whether positive or negative) this could have system wide. You could
>> argue it keeps better system utilization, but you could also argue the cmp is
>> expensive.
>>
>>>
>>> Disabling the "split to zeropage" entirely with the toggle off (behavior before
>>> the toggle was introduced) makes sense to me.
>>>
>>> But the behavior now already like that in the kernel for a while.
>>>
>>>
>>> I know that I suggested this, but I wonder, is this patch relevant for your use
>>> case and patch #2?
>>
>> Technically patch #2 solves the issue im actually trying to tackle. But during
>> this case we also found this functional change which we werent sure if it was
>> intended or not. As you say its poorly defined.
>>
>> Im ok with or without this patch. Perhaps we can take patch #2 (bar'ing review),
>> and I can try to do some perf testing regarding the effect of this zeropage
>> remapping system wide, and base our judgement off that.
> 
> Okay, then let's focus on patch #3. The semantics of this toggle here are rather
> akward (and I'd suspect we might just get rid of it at some point).

I assume you meant patch #2 ;P Ok sounds good I'll drop this patch for 
now! Thanks

> 

