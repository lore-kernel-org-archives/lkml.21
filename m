Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013888;
	b=unse2vZB8Q6pUeCY/9NNiZMtH6ejpczz3MhLTyvT6rdRjmbZmRozsYWYjK81p5ggjyRB
	 tGyAXIT0hRdfDQ3YwRFQ7aO4HQuuYukXd+15G8iXm5EVe0UqCfI6GSRdaqtBeMj+88FmG
	 1FRlI1piRhYmAWuVS9wWckxwNULvgBgbkJF5bOtNLymX4SUwhkDRcPm4Z1ldZj0wa6vdo
	 NNZPHv/ILBbKm5MUX27NgyKD+FsuaxgfAuYRfopHFvPAo06D+QeqovzDplnFeU6f+Ucid
	 EMgUD2q1VCivMuHuxjXUvIsXHaekdWSPNVv+TxNuKTWfOy1s4XO63sw4OG8rDGgZ8kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013888;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tHuM99Jzt7UiO9ZNKymx5rMYrueAFx5g8jXrXfP2WNk=;
	b=QmQOIn1yeKUnfAaZBeL2eKwBAlTCVuCDBnk5FSSanyiy0Gm42f0KaDJQ8Rtk5n4IRFFS
	 5mMbdA8lcosufrkMzAKH3ZjBLpziqHf2AAlQe+UKyp6CFsyoMPLtVYzUzLaqHh1m1xA/1
	 8pTrf9+kbOIoSUTLi0Tp3isAMG4yzSQNMXCuHpT75iqnOjdYB3I/48TXOFVMBAJA6U3Wz
	 Z41Oirni0Rgcz2unNsV7zvPAmXvI7nRGYWximxIq9vwUZMOTMJPCDuxe/tc8dgXJQujen
	 otTSiAEzxCkHDaXgH64RJ+edVg7QiukY3/eMtwnAUxOzzaXQYKgeYs9FYm4fQPL448g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTauBCrb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF6606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTauBCrb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3F61F000C6;
	Wed, 18 Nov 2026 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013887;
	bh=tHuM99Jzt7UiO9ZNKymx5rMYrueAFx5g8jXrXfP2WNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BTauBCrbJxPM5YsvKQ8IjqqOrGylzv7sM/nWNL7FPmqkjf0V4niGgT8RPZAoNNxxQ
	 PFDhn+JEsYYdlwO4dhAt2wjuA3sfUBlWxgEWynEsaGgvj1eOxjkW/W/CtaFz+Qjp8V
	 9+GP2zD+gN0ZbWiXrKqewDIfDiyYJ8R6CyielFazlZCs7w9tIqgy0XumuVIpwwpxeq
	 8NAdldESd3h6zJ6lW9GPsJ6VAwbL88tBJ9UxAIRViPO1hjSp1NPwIHjuIKQ79i5vzk
	 P5RUDlljycF1t7XPxEauMY5IqfJJcKQjcyXQomUAhxOb5VgQKJg479tCJkRuZ7PbpF
	 WddlgxNHkEE3A==
Date: Wed, 18 Nov 2026 16:58:01 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
	Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Chris Mason <mason@kernel.org>,
	Jingyi Sun <1045704958@qq.com>
Subject: Re: [PATCH] mm/userfaultfd: reject DAX mappings
Message-ID: <av28-asG0qH2Tpsf@kernel.org>
References: <20261118-dax_uffd-v1-1-d776cca1ae17@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-dax_uffd-v1-1-d776cca1ae17@kernel.org>

On Wed, Nov 18, 2026 at 11:03:00AM +0100, David Hildenbrand (Arm) wrote:
> UFFD_FEATURE_WP_ASYNC made DAX mappings eligible for userfaultfd
> write-protection, but the DAX fault paths have never fully supported it.
> 
> DAX faults use vmf_insert_mixed() and vmf_insert_mixed_mkwrite(), which
> treats any non-empty PTE, including uffd-wp markers, as an existing mapping.
> A read fault on an uffd-wp marker therefore returns VM_FAULT_NOPAGE without
> replacing the marker, causing the fault to repeat indefinitely.
> 
> PAGEMAP_SCAN can also write-protect a DAX PMD, but the huge DAX write-fault
> path can make it writable without clearing its uffd-wp bit, breaking async
> write tracking.
> 
> Device DAX mappings requiring huge-page alignment and cannot serve PTE
> faults after UFFDIO_WRITEPROTECT has split their huge mappings.
> 
> So let's just disallow DAX mappings in vma_can_userfault() entirely,
> making UFFDIO_REGISTER fail with EINVAL.
> 
> Fixes: d61ea1cb0095 ("userfaultfd: UFFD_FEATURE_WP_ASYNC")
> Reported-by: Chris Mason <mason@kernel.org>
> Reported-by: Jingyi Sun <1045704958@qq.com>
> Closes: https://lore.kernel.org/all/tencent_1874C71D4177A1624528043E008DB1A5EF05@qq.com
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/userfaultfd.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 169f681f9849b..6656233d5dcc7 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -2131,6 +2131,9 @@ static bool vma_can_userfault(struct vm_area_struct *vma, vm_flags_t vm_flags,
>  	/* Only mm-backed memory can have its faults handled by userspace. */
>  	if (!vma_is_mm_backed(vma))
>  		return false;
> +	/* DAX fault handlers do not support uffd-wp. */
> +	if (vma_is_dax(vma))
> +		return false;
>  	/* Core mm may discard droppable memory at any time. */
>  	if (vma_test_single_mask(vma, VMA_DROPPABLE))
>  		return false;
> 
> ---
> 
> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
> 
> change-id: 20261118-dax_uffd-0fb2c6d1c087
> 
> --
> 
> Cheers,
> 
> David
> 

-- 
Sincerely yours,
Mike.
