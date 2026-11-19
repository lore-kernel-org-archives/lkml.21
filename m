Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053922;
	b=VKRnQoLE+IXwrKCihB8+jMdMf9lxRXxQ6k5SkaCnWOu4IL5p5zjrD8o0un4zkUMXhuve
	 tkRD4xAJHVl9hs+TF94W2FKiB8uKngdgBPy8GCMEhgrXIMdt6rf50GW9LGUSNpIWXlbDk
	 B23MVnTNh1EyLky1D1iRnp6kuP81RU6I1puQBLGwj+1D12O6CD4PAxMk/d3XOVf8aXCfM
	 d0mqLnHPh9CxtTHwkP2sHh72kq+SgnI/ThwtTk0+DCZP9fbgNFuGEfgGisJ6a/OW/S45Q
	 KBZKdl+p4yZ5Sq66xLMvizKQS26Y4Hc2f+y15c87zDSrBNRP0wF+Kt7fkvOzZP+C1Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053922;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4tgWbt2Z1SnQ+uqrEBj9Epjmo8yeetyzDn0kN1B/Hto=;
	b=tWD+CXiwmEAA0+Eh9nMRDb9+JLXzN9VDbz/+OJOkpZHbgyYFfNUzaarsp9820Ykd8ulh
	 exFOp0hTB2i9T7SfSQJODZFuzqvpICzN+D6ghhiY18XKokr5bjldPQRFEXYwoYNHgFhDH
	 3tphLdZFnI4LKh1z+2tRGTCnGY5CfilY9P08ymceGqZEEUZW9JgiENfUDupwolANGNor/
	 JlN5eYDszApkgNAFGBBDmk7+DBxfSyTpJkt5TEwpluRGJLo0GbabpcV1zCcsn798+AG4f
	 0y9t/pdA+uYbtdB4uZcfBAkygAuKfWeR6QlJwIOJpW/dtEmHfG1qKAiuDogU+PURzXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vXNZMZ8C;
	arc=none smtp.remote-ip=95.215.58.82
Received: from mta1.migadu.com (out-82.mta1.migadu.com [95.215.58.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F831606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F831606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vXNZMZ8C
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bDmNCJobEh3kLoFNq205gwpfko5U2ASzt8zgMKTUjKY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795053919; v=1; x=1795658719;
 b=vXNZMZ8C96ZXrS+cOPJ/LiaKBfRy+NFncMsZeB+TkOvtEhnQcFdqI13phRE9o4MHBHa2BcLk
 tRqon18yvq718CTWV9C03z116i6ETIDLM7sr9pGy+IAKRs+0hbKmOOk7n6iC+xfE30GZiFC/QXC
 HYsKqJHUnuiG2wbwAoT6wTL8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 09ad55c582dccd0b;
	Thu, 19 Nov 2026 02:05:18 +0000
X-Mizu-Trace-ID: 09ad55c582dccd0b
X-Migadu-Flow: FLOW_OUT
Message-ID: <ec86fecf-0919-4da7-b675-3a9be49b50f5@linux.dev>
Date: Thu, 19 Nov 2026 10:05:13 +0800
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
Subject: Re: [PATCH v3 0/3] mm: hugetlb: fix CMA-related issues
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev,
 akpm@linux-foundation.org, osalvador@suse.de, azpijr@gmail.com,
 lance.yang@linux.dev, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1794046188.git.zhengqi.arch@bytedance.com>
 <b1c1c835-180a-49e2-86c0-bc3f65981728@kernel.org>
 <7e733c3b-2aa2-406e-a5ca-cd9a2c872f9f@bytedance.com>
 <bc6ffcff-3aaa-43da-91b4-82f27513c761@linux.dev>
 <1e0aa28d-f81b-411f-92a3-6038c3961443@kernel.org>
 <c3906ff3-c5ee-4672-8bab-2318185268c8@linux.dev>
 <3e4b8ed8-c435-4fb6-ac74-b3a9eb40504d@kernel.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <3e4b8ed8-c435-4fb6-ac74-b3a9eb40504d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/26 11:24 PM, David Hildenbrand (Arm) wrote:
> On 11/17/26 07:55, Qi Zheng wrote:
>> Hi David,
>>
>> On 11/16/26 8:07 PM, David Hildenbrand (Arm) wrote:
>>>
>>> Hi,
>>>
>>> sorry somehow I missed your mail.
>>>
>>>
>>>
>>> Ugh, what a hacky mess people created.
>>>
>>>
>>> That would be cleanest. Would it break existing setups?
>>
>> Yes, this requires an existing user to explicitly configure a 32M memory
>> pool.
>>
>> But in practice there shouldn't be such a user today, otherwise the
>> misalignment issue would have surfaced long ago, wouldn't it?
>>
>>>
>>>
>>> Another quick-fix idea could be to always allocate larger folios first.
>>>
>>> That way we should avoid any holes, right>
>>
>> Ah, this looks feasible. How about the following?
>>
>> (If that looks good, this could go as a stable-first fix.)
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 6fba92b0f6749..32e65ce347c90 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -4556,6 +4556,22 @@ void __init hugetlb_bootmem_set_nodes(void)
>>    		node_set(nid, hugetlb_bootmem_nodes);
>>    }
>>
>> +/* Return the largest early-CMA hstate below the given order. */
>> +static struct hstate * __init
>> +hugetlb_next_early_cma_hstate(unsigned int order)
>> +{
>> +	struct hstate *h, *next = NULL;
>> +
>> +	for_each_hstate(h) {
>> +		if (!hugetlb_early_cma(h) || huge_page_order(h) >= order)
>> +			continue;
>> +		if (!next || huge_page_order(h) > huge_page_order(next))
>> +			next = h;
>> +	}
>> +
>> +	return next;
>> +}
>> +
>>    void __init hugetlb_bootmem_alloc(void)
>>    {
>>    	struct hstate *h;
>> @@ -4571,9 +4587,19 @@ void __init hugetlb_bootmem_alloc(void)
>>    	for_each_hstate(h) {
>>    		h->next_nid_to_alloc = first_online_node;
>>
>> -		if (hstate_is_gigantic(h))
>> +		if (hstate_is_gigantic(h) && !hugetlb_early_cma(h))
>>    			hugetlb_hstate_alloc_pages(h);
>>    	}
>> +
>> +	/*
>> +	 * CMA ranges are aligned to the largest supported size. Allocate larger
>> +	 * sizes first to keep the early reservation cursor aligned without gaps.
>> +	 */
>> +	h = hugetlb_next_early_cma_hstate(UINT_MAX);
>> +	while (h) {
>> +		hugetlb_hstate_alloc_pages(h);
>> +		h = hugetlb_next_early_cma_hstate(huge_page_order(h));
>> +	}
>>    }
>>
>>    /*
> 
> I think this should do. Best to send out a proper patch.

Okay, will post a proper patch.

Thanks,
Qi

> 

