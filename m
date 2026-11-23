Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413962;
	b=2D51qXVx87ibdqQ+SQvlyP90itkTAZl5tU1tmpQzrLtlGXaM7pOM3yXt9T+dxcfGqh2q
	 CWpRpHAPUyUh8Cev0LwpvnGbCYdTdOCWmG7swAd4ZbVfaOrjWRF+3XLI8n0UxRx/JhWg8
	 3StFb75Shkdrv+GWbvvkbDXdr2KLe1nmryU85Qm2mAFzk35K5GEPPrs9HB5NcgPqCEx0j
	 YGRH5kf7fFc4mVLi3WyLvOuVBRQfU8feDsRuiBbg89pAQf727yMiCQL8GlwrVbVwnck4R
	 pOd9lJL3aKc4B5P9QoW5Zk6LjqEuzteEleXzY2Mt1fiR7u7e0avvIJw4Pj4clD5Hv5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413962;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/PuORYyIRteJHQ11GLpV7a3611w1hxaJP4SNy0f1jBM=;
	b=wbxeQm0WwuL3z2IU+8WMF/4kT/Bm+bboTsxaujhGDpz8pgojStbCJYOk4ZNm7Kj1IERr
	 J5tEHcybmsx+q2BXnbVv5SAIqqnzp8vEGJbq/0migLXOblVipTG1ZgeGAepZj6vdphYqJ
	 9zerPv3uabk5Jy1gM5EfvP0IcNWKxr5WE+4mjNlTqDsy2v6dyEXoaoAV55BN2ojVsD9+B
	 GVhCS/zLuVQDKG+Qqf7q5OspAeUQy8hknl9DR08nlBIOXROc7In4Q8O/VJ3sMVr6Rb+pr
	 S9nvBzGDzedCXhpCNdYNwCYXlS++fr5W5PVxVca4LZ6zdj2etss8L3GS8FUmSioTYVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="fOY3WO/a";
	arc=none smtp.remote-ip=91.218.175.183
Received: from mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3649606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3649606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fOY3WO/a
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6VgZ8APOVsZATxmkMTLKbiBq2l/jRInYDz1+DuyOQ5g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795413959; v=1; x=1796018759;
 b=fOY3WO/a0soK8p+g8L6ox7ROdjzFom203CK50EmztSfjCy8r0eDGM4n2v4CioGRsEip99aUl
 0dP8zXe2iLIZN4C4qAUrhxSQEpoVQ+mPXcGZndI5e2v9Und3bLoczm/G6tQBPq/HDwByWjhd820
 3W1YJEmBU03UiJZMrTyEQEfE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a6b9e6724bc2b9ab;
	Mon, 23 Nov 2026 06:05:59 +0000
X-Mizu-Trace-ID: a6b9e6724bc2b9ab
X-Migadu-Flow: FLOW_OUT
Message-ID: <75bc217d-585c-40bb-954e-cf6df80e24f2@linux.dev>
Date: Mon, 23 Nov 2026 14:05:51 +0800
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
Subject: Re: [PATCH] mm: shrinker: stop counting when the seq buffer overflows
To: Xuewen Wang <wangxuewen_ky@163.com>, akpm@linux-foundation.org,
 david@fromorbit.com, roman.gushchin@linux.dev, muchun.song@linux.dev
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261120110538.3256962-1-wangxuewen_ky@163.com>
 <57ef6b0f-e9eb-4484-b07f-63c848ffde4e@linux.dev>
 <56dc7b93-604c-49bd-9e86-f519c7a90b97@163.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <56dc7b93-604c-49bd-9e86-f519c7a90b97@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/23/26 1:45 PM, Xuewen Wang wrote:
> 
> 
> 在 2026/11/21 19:10, Qi Zheng 写道:
>>
>>
>> On 11/20/26 7:05 PM, Xuewen Wang wrote:
>>> From: Xuewen Wang <wangxuewen@kylinos.cn>
>>>
>>> The shrinker debugfs count file uses single_open(), so all memcg rows
>>> belong to one seq_file record. When the buffer overflows, seq_file grows
>>> it and retries the entire record. Queries for subsequent memcgs in
>>> an overflowing pass cannot contribute to the final output.
>>>
>>> Stop the traversal once seq_has_overflowed() is true, using the existing
>>> mem_cgroup_iter_break() path to release the current memcg reference.
>>> Leave the overflow state intact and return zero so seq_file can retry.
>>>
>>> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
>>> ---
>>> In a single-node KVM guest with 1024 cgroups each caching 16 ordinary
>>> files on ext4, the 8865-byte output required three show attempts. Count
>>> callbacks fell from 3075 to 2472 (19.6%). With probes disabled, six 
>>> fresh
>>> guests per variant each performed 101 full reads. The median of guest
>>> medians fell from 128.2 us to 112.2 us (12.4%, about 16 us per read).
>>> Small and sparse outputs had unchanged callback counts. Complete output,
>>> small reads and seek-to-zero rereads matched; concurrent memcg deletion
>>> and signal interruption checks also passed.
>>>
>>> The successful pass still traverses the full list. Early exit skips
>>> count queries for subsequent memcgs in overflowing passes.
>>>
>>> When overflow coincides with a pending signal, the original code can
>>> return -EINTR in the current pass. With early exit, seq_file attempts to
>>> grow the buffer first. The retry can return -EINTR, or buffer allocation
>>> can fail first with -ENOMEM.
>>
>> Would something like the following work instead?
>>
>>           if (!memcg_aware) {
>>               mem_cgroup_iter_break(NULL, memcg);
>>               break;
>>           }
>>
>>           if (signal_pending(current)) {
>>               mem_cgroup_iter_break(NULL, memcg);
>>               ret = -EINTR;
>>               break;
>>           }
>>
>> +        if (seq_has_overflowed(m)) {
>> +            mem_cgroup_iter_break(NULL, memcg);
>> +            break;
>> +        }
>>       } while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
>>
>> Thanks,
>> Qi
>>
> Hi Qi,
> Thanks for your review. I've modified and tested the patch following 
> your suggestions, and will send out v2 shortly.
> 
> Thanks,
> Xuewen
>>>
>>>   mm/shrinker_debug.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)

LGTM, so:

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

>>>
>>> diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
>>> index cafb566301326..3022d103b0b1e 100644
>>> --- a/mm/shrinker_debug.c
>>> +++ b/mm/shrinker_debug.c
>>> @@ -74,7 +74,7 @@ static int shrinker_debugfs_count_show(struct 
>>> seq_file *m, void *v)
>>>               seq_putc(m, '\n');
>>>           }
>>> -        if (!memcg_aware) {
>>> +        if (!memcg_aware || seq_has_overflowed(m)) {
>>>               mem_cgroup_iter_break(NULL, memcg);
>>>               break;
>>>           }
> 

