Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426803;
	b=CiQ8Q+bICI6estffUc3/VpVb1i2yj+JrJsEGUR6GmfDsf087Ih8lOWxTmv0waGTCHUTI
	 gZbw2KbX4EPnH9bq8YBGz6hgXyub0ebFsgKWOalwQtsiXg3ux/i0zI+r/NMlDT7Pj0Fpy
	 sO/uUkrufCa66rrmZv6whuBgBLR/nKLx6EiXpDT/NTZeCZ7hd0jZciMNQkkoYFRyRg2+C
	 FIUqOPvLWEWGGJCJ30h5vuKmxsW2xg/dN/8kFvwD0ixlQKWjyk+q+xnL108oS+dXbSzHe
	 ROvVerhjFwmgcbd605gDDh4lASGn7EhNVlvi8bAjvdKYaVrCOxMldQ7JfCq/YQjIY+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426803;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=i+eMkEpTzD81tZmWhd1BLHyxg3x1lR4H2TnpzoCNaEA=;
	b=gGfxb/8X8I0q64RVGQFM/WEcyexxHSs303dwIOxwHZAuLcWaIY71sgl4x/y0REGXHKvr
	 JhMCAx5N4wJGuYtnJLJgGXcGoDFF7MSXNQBZKT/bMOLd1wyb77N3Tc6Zb7LE0WYrFzCF7
	 qeuJazddElskexMY6iKiT0b8DJJkxQzoeYziSVoeLFWhEQdj3Sy3X7n/xky2FmJMB552j
	 nEjrHUOMIBaf+BgSAf5hVGq30RklKhoFAVG6A3yc6KMv7ZGDkdBn3liOe+pTVkCzgfMnu
	 CfB6KmaQI8hLUevWpUXEU3pqXadtCDtuRfHoV+3YDF/WEhFxXWHPzdUzgOtYfzyfqTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="K7Gc/477";
	arc=none smtp.remote-ip=91.218.175.94
Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1CF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D1CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K7Gc/477
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AKOZmr7uaBmqal/sCBWQH1DHrEHxf/qcqO9hy6TaXp0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795426799; v=1; x=1796031599;
 b=K7Gc/477rEkF2tKAfVRDPYsvPEc6LCYk8NQYKan6gNViBSsEEiEoF3OjV2bGwVsjUAlU60oH
 UZX4WpEJOkZWtLAnU6YaBRuqaxebD6Q6m/F7iJu3bV3h9NmKbDHffu+Oz2HSx8A+jbguq0BdCnO
 D1nsyRz3jsRcYII+ZJy1xzEQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f66f58c573959892;
	Mon, 23 Nov 2026 09:39:59 +0000
X-Mizu-Trace-ID: f66f58c573959892
X-Migadu-Flow: FLOW_OUT
Message-ID: <1d0e349a-9f9d-496b-8e86-9d4fccc14d72@linux.dev>
Date: Mon, 23 Nov 2026 17:39:54 +0800
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
Subject: Re: [PATCH v5 06/11] mm/vmalloc: undo what vmap_page_range() mapped
 on failure
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Suren Baghdasaryan <surenb@google.com>, Dev Jain <dev.jain@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-7-hao.ge@linux.dev> <av4BbLb6SxEcRe-8@milan>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <av4BbLb6SxEcRe-8@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ulad

On 2026/11/19 03:50, Uladzislau Rezki wrote:
> On Mon, Nov 16, 2026 at 03:13:20PM +0800, Hao Ge wrote:
>> ioremap and arch setup code map their ranges with vmap_page_range().
>> When the walk fails half way, or the KMSAN metadata fails after the
>> walk, the ptes installed so far stay behind. The caller frees the
>> vm_area on the error path, so the next mapping that lands on the same
>> range trips the BUG() in vmap_pte_range().
>>
>> vmap_range_noflush() now takes a mapped_end argument that the walk
>> levels advance as they install, and vmap_pte_range() BUG()s before
>> it installs over a pte that is already set. The ptes below mapped_end
>> are therefore all ours, while a pte above it can only have been put
>> there by somebody else, for example when the caller's range overlaps
>> an existing mapping. On a walk failure the undo is limited to
>> [addr, mapped_end), going further would clear ptes that are not
>> ours. If the walk completed and only the KMSAN metadata failed, the
>> whole range was installed by this call and all of it is undone.
>>
>> All callers are sleepable, the teardown passes can_resched = true.
>>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
>>  mm/vmalloc.c | 52 +++++++++++++++++++++++++++++++++++++++-------------
>>  1 file changed, 39 insertions(+), 13 deletions(-)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index d99d7710e1ba..5c1eacc2a0ac 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -117,7 +117,8 @@ static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
>>  
>>  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>  			phys_addr_t phys_addr, pgprot_t prot,
>> -			unsigned int max_page_shift, pgtbl_mod_mask *mask)
>> +			unsigned int max_page_shift, pgtbl_mod_mask *mask,
>> +			unsigned long *mapped_end)
>>  {
>>  	pte_t *pte;
>>  	u64 pfn;
>> @@ -143,6 +144,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>  
>>  		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
>>  		nr_pages = PFN_DOWN(size);
>> +		*mapped_end = addr + size;
>>  	} while (pte += nr_pages, pfn += nr_pages, addr += size, addr != end);
>>  
> vmap_pte_range() either s=install everything or nothing. At least if i
> do not miss anything.

Right, vmap_pte_range() either installs the whole range or nothing.

I will drop the mapped_end argument from it, and vmap_pmd_range() will
advance *mapped_end = next after the call succeeds.

Thanks
Best Regards
Hao

> 
> --
> Uladzislau Rezki
> 
> --
> Uladzislau Rezki
