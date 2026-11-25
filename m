Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602386;
	b=tqgg1udMDqBCm5CR0f9QnGBTVNFVpDRVKxeJ55whcnXhoNt1HMT1OPaZbcr4/z+g/6dy
	 U5KvookN/beho1R1QNCChDwH8WuziAbuOi2c+hNu93bNhlVF/H7VJPgbNkqTfCV8wDG9A
	 tiMmwQ/QG9ztJUhlPzXmp0iXjIL1/SVv0Pg4EQ/bGCaSVi5eM/8Fx1JnZj/SE/zj/pOvA
	 yB3BobnAU0jlnuAQaYl6CtXJNNCQB9jpgoFL35S0DmoBUZvq5X+okUQqD/QppdsSol3oR
	 PBf+ogvuu8Wn1lEs1jW6zSJ/r/jw0MeZ5EBDd7GxqQxLNfkv086qFUwb0AFoAanEm0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602386;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uJW+afDWIWxoDSAbl6TmjU23FJQuelNkJuMFpjidvk4=;
	b=ThspfEeU1hrIS8T9ZWWfReB9/6nDSDCxm2o8wIIrT4ajOciMRWK1qnm9UaucOBrjohli
	 nCmOwGyWx38nPbKasa1i90UuWutkkOAjMmqZ+t8nPU70isoerYpmxQABNlxSArUcwptG5
	 EJ1oQb1VMrZj0fEtimzzSjSjNpJpjWN5FOip4GC5NOU45vtTm1Ag1/UZxiqmn60Fj8FWX
	 U1GcAmk4aYlrqNSvkLxqvl7OeeWj69qPHFweK6PRgEj7vRirwNjHM4os2edPFq5/vKaVo
	 oEdWN6rrzBEr8DUAergv+j7on06wMTjUMlLtQFrKE5LZq0EZ8i+xckXYWPkr8Rljsuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfnvbJL2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A417A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfnvbJL2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B348D1F000E6;
	Wed, 25 Nov 2026 10:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602385;
	bh=uJW+afDWIWxoDSAbl6TmjU23FJQuelNkJuMFpjidvk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lfnvbJL245K8lJcAFkVJOQxmtu7shESOrpPEWsC3LVdjwIZfLVxcE1yZgivknjoEF
	 VF3AeNjPG29BGh7APelu1Aolivj1Gp2ZxbCDGabJREAb27oEGZRUsYcTBFahyW867o
	 LpfNrzZcxYD0sG6cZM2lWngo7L2CO6v//7ujOxMkDMR9+0N5SzmAy95HbXiArUDAMf
	 wmycAh1w5nOdE0VDGXc4YnS1RfYx1ZFafdEQjg0e69o0A6yNR98CwtjIUx3jiDDIWp
	 gLN/5Imq0/+OmfC+cu9VCZjzbn433Z+9N4sY27fpUx/os4Nl0rxfD2muBgPDSyukdV
	 1UacFPyJPObNg==
Message-ID: <b80c30ab-d079-4d8f-9ca6-4c51582bc8c2@kernel.org>
Date: Wed, 25 Nov 2026 11:26:18 +0100
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
Subject: Re: [PATCH] mm/mm_slot: introduce mm_slot_next() helper
To: xu.xin@linux.dev
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
 kas@kernel.org, akpm@linux-foundation.org, chengming.zhou@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261125084205.345860-1-xu.xin@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261125084205.345860-1-xu.xin@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 09:42, xu.xin@linux.dev wrote:
> From: "Xu Xin (vivo)" <xu.xin@linux.dev>
> 
> Add a generic mm_slot_next() macro to simplify getting the next
> mm_slot container entry from the list, and use it in khugepaged.c
> and ksm.c, just for cleaning up.
> 
> No functional change intended.
> 
> Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
> ---
>  mm/khugepaged.c |  5 ++---
>  mm/ksm.c        | 18 ++++--------------
>  mm/mm_slot.h    |  3 +++
>  3 files changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 4ceb1b16c03c..0a5c78d01159 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -3074,9 +3074,8 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
>  		 * mm_slot not pointing to the exiting mm.
>  		 */
>  		if (!list_is_last(&slot->mm_node, &khugepaged_scan.mm_head)) {
> -			slot = list_next_entry(slot, mm_node);
> -			khugepaged_scan.mm_slot =
> -				mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
> +			khugepaged_scan.mm_slot = mm_slot_next(slot,
> +						struct khugepaged_mm_slot, slot);

Weird indentation. I'd simply exceed 80c in this case and have it on a single line.


Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
