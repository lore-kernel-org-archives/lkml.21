Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417061;
	b=GJ6ssNyKYW7ar5GgixlTCkiqi8niPpAbqwF67HWapJcMbpl+ogf64N3kdmm2yrxsx5EB
	 vddeOhIABIc3HYPNE9zHNQOTrnRDmdqQthvdMtxBhAGGBWuNpEIkZelqJybbAeapMG2IP
	 aIb9OzQX8E3wQ0i05nzhiHrY+V7B4lQvAbja2twL/xRgF+PHKYrFC5wn5ojcNZpdE5zlv
	 nusq82pMQ27korv6RWnT6sj1xEJcw2p44o+aIu8fmPU7CxNXMamup8VeReZohB88MO9Oc
	 BCg0IxnrhdHdCtucwy9AjvPkkTihpVG6feoGtoGbs+lnzDW7nGqxenesn3xjETY28yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fQmPDHR50ny9yG8I6ZWZCZxGsKK1lbvYAkLm3ZuJw50=;
	b=uWBgF+wkkdFOV33YuXaqxMkKgwqdDoQPeE7Y/JidwnZw7Mhtqbv0dk3HF3yNmN3l6Dlk
	 sfS94rY87PU+AT7CPKu5ebXagNoqlFgh2VBYgZ8uIjnsoVxJiqt08g0ZLOFVdr3S9JH6t
	 wyiJDJLCfAZ1AGFjoHBzlaBQBbaHYvtHgEnRbDMx5VMrEnpE2biGqoHtr3eVx3AIbNUtN
	 ZoFSeMUK4yvmKI73Edslh9Q94Fnq6qkvFuHYHKbq3KLSM0coQxA70EJbJmkTIIkczNi5F
	 0k5nckI6/toqyOwan00p7UhLp31ui+NQySF24S5tgH6npGNAU1OJiQI+qxF3uC4NGLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tO3CRHq1;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E60606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tO3CRHq1
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f066a193bbso13353745ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417060; x=1796021860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQmPDHR50ny9yG8I6ZWZCZxGsKK1lbvYAkLm3ZuJw50=;
        b=tO3CRHq1YBCUdDIJGzgdPBBNZ9TLMJaG4M9RxWZ7I+FE1bWdDwwFkIX8/IfoQ+Y2Vs
         rdBCj4t4P1tkgZ5HIYGNCCK8E5IUWr8rlHmV/p6UbAYboqm6Lp9GfaO3rTCnoXfBGFHK
         3BFGBqkMLAIgQ/a/Y+PGF4Pb4G9Y5mnpkV1Q8Dj4fbmK+8Jfdg31Z3cl06d5YGCHgTF3
         mpU5NMIlGiJGfvCTz3WPlAhyeYfCnc9a8xOgo3A21GvM1kHwrms/ysr0RlfVaNTOC+0H
         +Y6ducA+cZFTui8lWDKFkeo8Z57i10INw1Um/T6oZn2MXsVESIybOYeeC70/mqqHoNVU
         cuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417060; x=1796021860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQmPDHR50ny9yG8I6ZWZCZxGsKK1lbvYAkLm3ZuJw50=;
        b=QPUhju7ny3vcan/FrFoG5LqSmUz8krZ292Z1b7z20Ft/HiHZmIoO3TuweWzLpdgtPX
         2cTRU0xZ5N1bkQQUAzIlVYbq5IMyw+5Qu92kkxFISHN5vwWPc0Oj4VYxK+vB/5GdCNAx
         /j5kGJVsNUFM/m62NlQuu4n/C+xbbVWWN5VZO4Y63fDNDmBSgjHatEN64ozJ5ggU5lu6
         qCy58A18Sj6m81f+ZQlE4tx41cLyOIucaNTykWV+eN430FNYCcdxPJNpwukIaaNwXbTc
         pqCVZiXKWHthl9GRQ7WuZFhvgHdvzIVtrQXZPuiO4IBiKec7fksu8CN+olDLcZhTZr5R
         Z1Hg==
X-Forwarded-Encrypted: i=1; AL+hErHky5j9AJcp06wAyYpBhGENJgANjKR537PWo0317y3Oe02VrG7UrDH9CSjp38m2N56q0yeRartYyKVW0xA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uBUBtKO67qBwIhq2jlEY9naj1n+CSzyJV4nw8zu2J2dbHugc7
	YmJLy2OUOoNvLDKNSPaW0SCvX4YMPY9/mKs9fyhfFTJNly9rD61clA6q
X-Gm-Gg: AZFdTZfW0m+MjrSSgeHtO/azlImfhUfgmUZiTRmYwyaiHZJm44y5GXftU/YmbIwSr14
	hlNsA8ZXZHZ+UmJlI+qdZmTCi/eFeGbof5oFhgpBGn3UAX+iGCYxEzYXQdESkmlFVU2KblUYsds
	SjFIiUGdQEUDpHkEGZ4Y1DMOCCIP89MVs0J6R7e+u55vwVOlZOXnABplrXZz0u4ZozPn/KBPOKF
	xPff1uLoL+E7Ve1XnAoq8N+T94UMNeyrwo/utlzrrKP0kpyYaC/Xezed1QSIOr9O8CYgP0S6kBM
	9VPOFMhttdArPe90gZH8hOMRI/8/ABYcfqcruK8YmgM/gcdmEuVQY9mk3YfvN0n0giwJgOFHoN2
	+kaNNWj6Ie91M1ZZu+Dxp4w+Qvp/gCpOtsE7pARe9/sFuyUns2IIjTQLSky1N95jhxcz+NE0k9z
	DjcR+Z/wCTgUakYVbMw8fgkrsIuNsQz5ZIRcyi58oYsnpuyshc+i4VYukTqo8BZ8/dCMdnJ1yI2
	gk/LodS2Ra/I2J2wP9wBrqBRnokAPKD5w4Cut524lOSksL88QyGSzvH4/crfC7wCepBAKekef5A
	nkYfS4F2Im5qsIh83Xj1sd+gk8q4LjNrpwxLGKePEoYYL8MNd+KvCZCocA==
X-Received: by 2002:a17:902:ec8a:b0:2ef:e25e:e13c with SMTP id d9443c01a7336-2f03efb015amr114577535ad.5.1795417059794;
        Sun, 22 Nov 2026 22:57:39 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215d7sm46393385ad.65.2026.11.22.22.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:57:38 -0800 (PST)
Message-ID: <4eb6d496-4100-42db-8322-2b8f7f4ee36d@gmail.com>
Date: Mon, 23 Nov 2026 14:57:27 +0800
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
Subject: Re: [PATCH 1/3] mm: factor out common softleaf offset PTE batch
 scanning
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: david@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com
References: <20261120032949.2036731-1-chenwandun1@gmail.com>
 <20261120032949.2036731-2-chenwandun1@gmail.com> <awBnU0jVXCS2hj1S@gremlin>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <awBnU0jVXCS2hj1S@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 23:34, Lorenzo Stoakes (ARM) wrote:
> On Fri, Nov 20, 2026 at 11:29:47AM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> Extract the consecutive-offset scan from swap_pte_batch() into
>> __softleaf_pte_batch() to prepare for migration PTE batching in a
>> subsequent patch.
>>
>> No functional change.
>>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>  mm/internal.h | 22 ++++++++++++++--------
>>  1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 3a1643afedc0..9f78c12882cb 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -512,29 +512,26 @@ static inline pte_t pte_next_swp_offset(pte_t pte)
>>  }
>>
>>  /**
>> - * swap_pte_batch - detect a PTE batch for a set of contiguous swap entries
>> + * __softleaf_pte_batch - detect a PTE batch for contiguous softleaf entries
>>   * @start_ptep: Page table pointer for the first entry.
>>   * @max_nr: The maximum number of table entries to consider.
>>   * @pte: Page table entry for the first entry.
>>   *
>> - * Detect a batch of contiguous swap entries: consecutive (non-present) PTEs
>> - * containing swap entries all with consecutive offsets and targeting the same
>> - * swap type, all with matching swp pte bits.
>> + * Detect a batch of contiguous swap or migration entries: consecutive
> 
> You mean softleaf entries?

Yes.

> 
>> + * (non-present) PTEs with consecutive offsets/PFNs and the same entry type,
>> + * all with matching swp pte bits.
> 
> Maybe 'softleaf bits'? Ah I wish I finished the softleaf conversion properly :P

Yes, that would be more appropriate, both will update in next version.

> 
>>   *
>>   * max_nr must be at least one and must be limited by the caller so scanning
>>   * cannot exceed a single page table.
>>   *
>>   * Return: the number of table entries in the batch.
>>   */
>> -static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>> +static inline int __softleaf_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>>  {
>>  	pte_t expected_pte = pte_next_swp_offset(pte);
>>  	const pte_t *end_ptep = start_ptep + max_nr;
>>  	pte_t *ptep = start_ptep + 1;
>>
>> -	VM_WARN_ON(max_nr < 1);
>> -	VM_WARN_ON(!softleaf_is_swap(softleaf_from_pte(pte)));
>> -
>>  	while (ptep < end_ptep) {
>>  		pte = ptep_get(ptep);
>>
>> @@ -546,6 +543,15 @@ static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>>
>>  	return ptep - start_ptep;
>>  }
>> +
>> +static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>> +{
>> +	VM_WARN_ON(max_nr < 1);
> 
> I wonder if max_nr should be nr. Or is it a maximum range to examine I guess?

It is a maxinum range to examine.

> 
>> +	VM_WARN_ON(!softleaf_is_swap(softleaf_from_pte(pte)));
> 
> Since you're getting a softleaf_t here...
> 
>> +
>> +	return __softleaf_pte_batch(start_ptep, max_nr, pte);
> 
> ...Does the batching need the full PTE or can you just pass the entry?

The batching need the full PTE.

For example, two swap PTEs with consecutive offsets but different UFFD
flags must end up in separate batches, otherwise, some PTE flags would
be lost.


Thanks,
Wandun

> 
>> +}
>> +
>>  #endif /* CONFIG_MMU */
>>
>>  void __acct_reclaim_writeback(pg_data_t *pgdat, struct folio *folio,
>> --
>> 2.43.0
>>
> 
> --
> Cheers, Lorenzo

