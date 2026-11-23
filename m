Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422273;
	b=utDo6/Id151/Kc3iPSTReuR0pAaP+3+bSNStE/2zhsZhFEG5RuP3Yx2nz6K0Q4OgtOUn
	 UtJ9Xvjkg8LmNXx0R0ZqbJwL5IfwGcpMPvzpXZwiWT2odaWEog0w0JyN/AQeqvn2zXofn
	 /BCSxUMhEIqytW2ltYOBsHVbKhwkhZ4B2nsFZ3iJoJL6gPFOjuhdqXaD+3Xn23MoHdSSn
	 CI0vwFoe1F0iirfT8sWSClb3klaqTxNwBfTJu+px2ge6sLKM4Kd1uaKNClDMyKH/vycCr
	 Hou1PifaGe8FSE27V0GUe21btcguqkwT/hxrPWWeRYTFEPlQHhsP45wpCp71sUBwxeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422273;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=IQO4tn0OyPdxMhtPAGNESRuXYu8NbrwjcIpFVzP0og8=;
	b=l4R3aJ0rYyifN/TrLbRWG7n/6zQ/EXMYmFX8sfDqah2Z39qwdqGlScHTtRBEHcPYFvTl
	 N6CLAzSiW1LFhnWYBwRV9Hx+pHbioYSET1Cbz92wkZUhyqPIoCeAtAv4TIpNkkszwOxcr
	 cQB2M+Ql6iyUsgU+sPEIyHdYgKRCfv46blXTVEyH+H7shXuCk2FuuUExCaz1QFZuAIcMa
	 t1JxaDCrW+e76ILe9LpIVCWQkWDKBcGNKSO126oh9k1P7H2a9cP1xJ4Vk9XH8PZ/s9sq+
	 BbaqbbfPao7lSE9EMCUmNK0LBmB4g8xJZOQ1pmxSwaWTl4j7zP+1Hx5P+dQGvoEA5Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D6Fh9qWC;
	arc=none smtp.remote-ip=95.215.58.172
Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEA9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AEA9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D6Fh9qWC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HSUyFp+EYllNTrLsXxEGxRMBuqpbPPoIyuQ1COVxKsE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795422270; v=1; x=1796027070;
 b=D6Fh9qWCPEswhAg5emIFm6DBkMe74EM6ay3Mi3HuZUBJNeGqHpWo2PZ+RBhuA+TCw7/pdfYM
 fNbX7Sep8iwoCOQFiu1FXC9I/doZUWoDJV2AXczIR6+kywooOFjb3+eDPROR5/ViWJePvPi3DFO
 GXwYoS62jRK5yXqQteoZ2vmM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4f28e3a27007a1d5;
	Mon, 23 Nov 2026 08:24:29 +0000
X-Mizu-Trace-ID: 4f28e3a27007a1d5
X-Migadu-Flow: FLOW_OUT
Message-ID: <1e7d39f1-382c-49e2-b3ae-935f25b22a57@linux.dev>
Date: Mon, 23 Nov 2026 16:24:23 +0800
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
Subject: Re: [PATCH v5 04/11] mm/vmalloc: reject an unaligned range in
 __vunmap_range_noflush()
To: Suren Baghdasaryan <surenb@google.com>, Dev Jain <dev.jain@arm.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
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
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-5-hao.ge@linux.dev>
 <4c233641-15ad-4e5a-a106-423bc31f357c@arm.com>
 <CAJuCfpG5shRGvjHJyEOveSxkPE=x7nGTo4xmy0XLabV7NutrMQ@mail.gmail.com>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <CAJuCfpG5shRGvjHJyEOveSxkPE=x7nGTo4xmy0XLabV7NutrMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Suren and Dev

On 2026/11/21 06:13, Suren Baghdasaryan wrote:
> On Tue, Nov 17, 2026 at 6:05 AM Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 16/11/26 12:43 pm, Hao Ge wrote:
>>> The PTE loop stops only at addr == end. An unaligned end is never
>>> reached, so the loop keeps clearing past the range. An unaligned
>>> start clears the page below the range first. Both are caller bugs,
>>> and the damage is hard to attribute afterwards.
>>>
>>> vmap only installs page aligned mappings, so an unaligned unmap
>>> request is never a legitimate teardown. Warn and bail out at the
>>> entry of __vunmap_range_noflush(), before any PTE is cleared.
>>>
>>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>> Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
>>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>>> ---
>>>  mm/vmalloc.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index a168f6f20f4f..e2b63cb1592b 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -523,6 +523,9 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end,
>>>       pgtbl_mod_mask mask = 0;
>>>
>>>       BUG_ON(addr >= end);
>>
>> Nit: It is usually a practice to change the existing BUG_ON's to
>> WARN_ON's too, if you are changing around that part.

Ack.

>>
>>
>>> +     if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
>>> +             return;
> 
> nit: It's also better not to combine multiple conditions into one
> warning so that the generated report clearly shows which condition
> (code line) caused the warning. IOW:

Ack on applying the same to the previous patch in the series, "mm/vmalloc:
reject an unaligned range in vmap_page_range()", as well, it is done the
same way there now.  

Thanks
Best Regards
Hao

> 
> if (WARN_ON_ONCE(!PAGE_ALIGNED(addr))
>         return;
> 
> if (WARN_ON_ONCE(!PAGE_ALIGNED(end))
>         return;
> 
> 
>>
>> Reviewed-by: Dev Jain <dev.jain@arm.com>
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> 
>>
>>> +
>>>       pgd = pgd_offset_k(addr);
>>>       do {
>>>               next = pgd_addr_end(addr, end);
>>
