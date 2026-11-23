Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418741;
	b=eLQRkRKyxpDbkMJzGPdX//1rT53Cf/qIqFmY/CIZuP0ibNJ6lGP1F1kgmuhU6vzQ0H4C
	 67NYA7p8rOe6XJ++C7ZcqOoN8tgvX/97t8kHJf7CyeJfKcHeMbCVu+NxKPzEMMPdVq5Rr
	 SBKBetfykJoIQ31xvufcQZSS1nXixahFrO89rGosl/swpR4aDqGgykuIAFseQl9yvBClI
	 e7y5jZIMaWeWet0En3stCMFXsS/gqVCZ2p0m+wRLms7S9LbmnsJSs3BqLrI8+ibbzNTvs
	 EwP6jAZTy6db01SgPWn9JSN8Sv/BcTrVF0ifAnvJ3N0qqr8hCM/STyxe1bJ6LNPa54g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xAiUeAKaDme4Hx48xxb6Qw9mh2vqwyP0H2nnKCqn8CE=;
	b=C2njTciBr02TDhW9nkmGOsRqZ02EP1PrmbMQERou+qCSFc3AAPrW2Vj7yjWWqMBXWTkt
	 Jm60aHX9wk1CfzlVxrnZp6hvBEMxdJP4xlBcPWjArBPelkAOmtV7ZokaRoncnIYBV2W0y
	 RwhtdAc1IEoa46KT8xUPrbw2rW46YYgWyBeh++himW11Ymsc5YTzIKjPhqzLcEirtJY5I
	 We2s0bqBKum+bsDDmfwgdtJOcOPP2v809D5I4r21vXy+ta0ZDh9n1A97/CdxjAu4ufmy1
	 P58594jAAAZXetyQSOWmG8O+XOmI9MYpC0g5ej83f9j25OJz48FgndpjG1WYku6Loeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbcpXoxq;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62010606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62010606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbcpXoxq
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2ed216ed287so17975445ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795418741; x=1796023541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAiUeAKaDme4Hx48xxb6Qw9mh2vqwyP0H2nnKCqn8CE=;
        b=FbcpXoxqEJJ6/ILySSwib928iV1Ki7GPb7U+az3hFyf0/wf/KXwN5tCOx17+LwqDm/
         +5t6QIlYDnPhyACLsCgBFV6BHlHJLUhWGgyp/OMu5vDhWSGl3VJ9imK+xgwHO09DThBJ
         XdhmJqnGX+vGkrufznc7QuUYfDAfa2/+DXncvYCOwKaUKtfpr91KYhImk5uz2HngUsER
         Da1p31CvpcqhdUJ2j4WNlhOvljGWWInek+EuMhs3NjrMM46U3Anaj2MqZYmlspi/SuC9
         cZ7XBf+0gFS1gl8TDbBxRx/bPDvczYIEC6Gz2iR68rFf5icW2rWxT9P2Ez9oQbh+PlLQ
         7Gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418741; x=1796023541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAiUeAKaDme4Hx48xxb6Qw9mh2vqwyP0H2nnKCqn8CE=;
        b=BYLIUEDOTtiIf6gA9VqiVbwWAebMcJ+eu3hSXCBzPWagxOqsD8HgbC6ke7np+ShUFZ
         SQLZHwWyZCvZCrU1sAGuL2yL5/8HUIT7I3vIjOBL/K37EFhCgHadGMeQv5w5Loa1LBa/
         zZerxtExwt82QRbZ7+cYKjRuSptdb72O9cgNyP1B0hN5QIf+RQX0j7K11+rkeEcg9eb0
         ouRBmnWfE1NBOuDtXHBfW/O6eHX2rNlGv+rKtLuhDG7WtYA0q0Wff3i4DD06F8lK9Riz
         4sj9LLYH92TZ0f/yEBIsdeOzUieB96WIbT1KRdrmc0RecJ/4sGlG9Lmls6zQ99MRwsqo
         qyCg==
X-Forwarded-Encrypted: i=1; AL+hErEUUDOXu1YO7oVLU/AlQKlP84SJBcLpZol1UdcNTLaCD7DYivECP0NjJ56jBWPnfnlBW6RJhNvG2mJCZ3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Da6GaSdBPlO+MWyS9rPFc+ZPOFBkEpPHOPK07VNpk22WJyWWt
	NoyZ2QLFhyg3Qdk7v3cd67Hv2/kZtE7JikJzlSeDV5GmB6HNmpNJP3SS
X-Gm-Gg: AZFdTZfFYSdw1NQTBMpE0+LZs3JJMCThYKeZY8SWMaGw47D6i/j9HnWZn9YuNQ1dmfS
	6uOmlbCYj/g/vjcBGJWq25Uu6MzHSzRgSMAOW+ol2fmTZYJBLd+kJddBkDDQqHnweS239QH7fN3
	HBAJHiodxVuM/0XXMq3dViZwwuaitgywhwKTy9Mkmlg0vzEhLtEKMbKpAA+RwAqwbfUz9pcwBIP
	3mQ8+uODR8jw1iMzaQO6n+x/5X+mhnHS+CPqKA2wc5EbE4Prm1I8RWnsUXEg7Qbo02kmp91odfS
	Q2KsjDOXx+NBwNt2HCwiFEsyCGCI1Hmc3UhugbUy5calYP0EnZG+MyH4uu34ACJ0l73L7ctQJ/4
	enHj3VWF+0aN6/wlkQ3tdbVxOBpnMh4zVpltRu3yb6OHvlDhIykyPPRDXdlJ3ahjuEBgbr66q7m
	zXwG2djmNaLXsRnKGK3H4NzwBf0KLQlEgnOIr6bA/YET0A8BAVDBDF+L/+u0hSuf96cnCgdQQYM
	nSr/q+GBinDni2J9VG/ww9JkGACFOXNy0Ww6YW6VX3kwUFnYxElvpFoO4if1EfNMQrCSUTZhoak
	DyeGsBRFjaMBzNeIneIO/lwcTx87wgEPXWGY
X-Received: by 2002:a05:6a20:9183:b0:3e2:2021:89c with SMTP id adf61e73a8af0-40148dca737mr12101063637.5.1795418740652;
        Sun, 22 Nov 2026 23:25:40 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm4987776b3a.11.2026.11.22.23.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:25:40 -0800 (PST)
Message-ID: <fa05e353-0786-42de-96fd-8a9b1ee725ac@gmail.com>
Date: Mon, 23 Nov 2026 15:25:31 +0800
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
Subject: Re: [PATCH 2/3] mm/migrate: batch PTE restoration in
 remove_migration_pte()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: david@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com
References: <20261120032949.2036731-1-chenwandun1@gmail.com>
 <20261120032949.2036731-3-chenwandun1@gmail.com> <awBjoC-YFf6KPYT1@gremlin>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <awBjoC-YFf6KPYT1@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/20/26 23:22, Lorenzo Stoakes (ARM) wrote:
> On Fri, Nov 20, 2026 at 11:29:48AM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> remove_migration_pte() restores PTE-mapped large folios one PTE at a
>> time, constructing each new PTE and updating the folio references and
>> rmap separately.
>>
>> Add migration_pte_batch() to find adjacent migration entries with
>> consecutive PFNs and matching type and flags.
>>
>> When a batch covers the whole folio, the rmap helpers already call
>> mlock_vma_folio(). Skip the explicit call to avoid double mlock
>> accounting.
>>
>> Device-private PTEs encode PFNs as swap offsets. set_ptes() does not
>> handle this encoding when constructing subsequent PTEs, such as on
>> arm64 with a 16KB page granule, leaving device-private destinations
>> unbatched. The next patch enables batching for these entries by
>> advancing their softleaf offsets.
>>
>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>> Link: https://lore.kernel.org/lkml/5f9c449e-43b3-4732-9c14-8199418cace0@kernel.org/
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>  mm/internal.h |  6 ++++++
>>  mm/migrate.c  | 35 +++++++++++++++++++++++++++++------
>>  2 files changed, 35 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 9f78c12882cb..e6ecf307d532 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -552,6 +552,12 @@ static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>>  	return __softleaf_pte_batch(start_ptep, max_nr, pte);
>>  }
>>
>> +static inline int migration_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>> +{
>> +	VM_WARN_ON(!softleaf_is_migration(softleaf_from_pte(pte)));
>> +
>> +	return __softleaf_pte_batch(start_ptep, max_nr, pte);
>> +}
>>  #endif /* CONFIG_MMU */
>>
>>  void __acct_reclaim_writeback(pg_data_t *pgdat, struct folio *folio,
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 3c39d309e6bd..e000ef77ea87 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -358,6 +358,7 @@ static bool remove_migration_pte(struct folio *folio,
>>  	while (page_vma_mapped_walk(&pvmw)) {
>>  		rmap_t rmap_flags = RMAP_NONE;
>>  		unsigned long idx = 0;
>> +		int nr = 1;
>>  		softleaf_t entry;
>>  		struct page *new;
>>  		pte_t old_pte;
>> @@ -441,17 +442,34 @@ static bool remove_migration_pte(struct folio *folio,
>>  		} else
>>  #endif
>>  		{
>> +			if (folio_test_large(rmap_walk_arg->folio) &&
>> +			    !is_device_private_page(new)) {
>> +				unsigned long end_addr = pmd_addr_end(pvmw.address, vma->vm_end);
>> +				unsigned long max_nr = (end_addr - pvmw.address) >> PAGE_SHIFT;
> 
> const please

Will do in next version.
> 
>> +
>> +				max_nr = min_t(unsigned long, max_nr,
>> +					       PTRS_PER_PTE - pte_index(pvmw.address));
>> +
>> +				max_nr = min_t(unsigned long, max_nr,
>> +					       folio_nr_pages(rmap_walk_arg->folio) - idx);
>> +
>> +				nr = migration_pte_batch(pvmw.pte, max_nr, old_pte);
>> +			}
>> +			if (nr > 1)
>> +				folio_ref_add(folio, nr - 1);
>> +
> 
> Please let's not insert a bunch more open-coded bits in an already way-too-big
> function :)
> 
> If you need to add functionality to a function like this, please take the time
> to pay down technical debt and refactor it first.

Sure, I’ll do some refactoring first in the next version.

Thanks,
Wandun

> 
>>  			if (folio_test_anon(folio))
>> -				folio_add_anon_rmap_pte(folio, new, vma,
>> -							pvmw.address, rmap_flags);
>> +				folio_add_anon_rmap_ptes(folio, new, nr, vma,
>> +							 pvmw.address, rmap_flags);
>>  			else
>> -				folio_add_file_rmap_pte(folio, new, vma);
>> -			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
>> +				folio_add_file_rmap_ptes(folio, new, nr, vma);
>> +			set_ptes(vma->vm_mm, pvmw.address, pvmw.pte, pte, nr);
>>
>> -			ptes++;
>> +			ptes += nr;
>>  		}
>>  		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
>>  			if (folio_test_large(folio) &&
>> +			    nr < folio_nr_pages(folio) &&
>>  			    ptes == folio_nr_pages(folio) &&
>>  			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
>>  				mlock_vma_folio(folio, vma);
>> @@ -462,7 +480,12 @@ static bool remove_migration_pte(struct folio *folio,
>>  					   compound_order(new));
>>
>>  		/* No need to invalidate - it was non-present before */
>> -		update_mmu_cache(vma, pvmw.address, pvmw.pte);
>> +		update_mmu_cache_range(NULL, vma, pvmw.address, pvmw.pte, nr);
>> +
>> +		if (nr == folio_nr_pages(folio)) {
>> +			page_vma_mapped_walk_done(&pvmw);
>> +			break;
>> +		}
>>  	}
>>
>>  	return true;
>> --
>> 2.43.0
>>
> 
> --
> Cheers, Lorenzo

