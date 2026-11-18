Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029033;
	b=F0rVcX/rlX32d58eNPC3d5D8C7G//nNEL3Un5OT7NH5o4JtIrwPoLXH4XR0u2Arbmy1Q
	 GSgRyiSOLATqfbHultoO0tvihmlcATj74zz3Oz7WhlyXAorg+oCfAIIWTzlgtu4kNA0Dv
	 PaExcYtWC56iMMLIYKM0i5FVNYGczxDsCAW9z86gFurt6xU6Qfmx4SsS/gjv8H2FmpxMC
	 xqpOj24oLzOueqNGB7guuFEgV+6i7W0/FJJZK8XrLOuivh68CMHd9S3NjGP5rcx0vgHVF
	 AqT/eM2HrGnX5vyc0J6vh3F81pG0+n7/xLoogc+xPyDGUEbfox0UaH8gIE7clEoyC3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iVQ48tYQcgbZ0/KEDLqaISGszEZvhwKB3BC0TwvqE4M=;
	b=5btosBwNGH5QzoINk+J07bUELR2VpTwahdmCAQSOGmdMmR5Sfa9EbPl48VZEiPxePzAg
	 3SIdSECCsl/mHfpRTkRbWIW495z0eoMRbdwD8fnxndjVZm87mGjv/UxzX8ZLsbpF14SZJ
	 nvYRxIIYfgucjt/Xv5SpxfuQzOWfGL7iNumClJBv4UUiWEPkASJ+GzTW81ZwvGcXzO4Y9
	 qXbJcuWGgr4UV3vyVqR7WopePF4xn1jPi9jJE6gC23lUwU5lQFP+9CE0+gIYQrDDxPD+9
	 D9VXTZmcoWef37Lmc9pTJq+sSP2OvACEd6sDo8mdufl0qonAcZ4adZf6nDNJhSW+3rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZL7zUDf;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4566E606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4566E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZL7zUDf
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2526196a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029031; x=1795633831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iVQ48tYQcgbZ0/KEDLqaISGszEZvhwKB3BC0TwvqE4M=;
        b=xZL7zUDfbIFzDWI/sXPrHwkRH2Pzzf+jcGBJ/WiqqQUZ89MMw6eV78LOkyVNyKQT1B
         919+HvLfjo3coRTrm7CmZUxiOjd91R1ocP0w3uLkrcraww7VjdXEXBVJdkmRzjQmeYyc
         VXDIukR2K2Gg5BuZVZMoErDp5DOeW/sdJbzGZcChWu5Y1twgPoCaBNCvfftBrUgUBtMg
         8/K2WfXXWENJU0wSK/0M+s4d5Wh6GonnKGhOrak8i99pgfl7XMSFUQmYyOL4SPENen42
         XmSXuY319Jp4iyAFskF/H5QIqO1K2vCCtgCDGxSXHi3Mo23E4Y0cyOplh603a+uB2Lkk
         5H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029031; x=1795633831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVQ48tYQcgbZ0/KEDLqaISGszEZvhwKB3BC0TwvqE4M=;
        b=IYac9Bi1dLmXvjsDxc2SDuksieKNhq80pBGUCdxX+KdM2tIHdkantEh8pp8WMOTHV3
         Gq7hqYklCw0Lu47JALShQ4zF2ag9ywRUL+64AywwN1Jz6rVLhg/6hYqdYApc8iyyfSLf
         V7c8MF1d4KkTy6aFxq/e9DgraeiYSN8cwtP9PYum6IL9wZ3OwRFEIXHV/ftVl8xA5mmE
         I5FxyKsNNLybtzHS2DV7cRAiLqVq4MuAiEJNppil+DNdyHRZ132PFBhvI6VUYKbFyrCP
         VwqEj2yYvPf00IB9k+C1C3nPSKijAkdYS+fXH3UCm8QoMtYGdPLtVGFAR0Ldx+LyCVxH
         ohwA==
X-Forwarded-Encrypted: i=1; AL+hErG8hoGpIyB5vlb5n2rNO4UhgKSOMBRKbaZLkYKs4zU3zYQ70zOVm4Atg5bfOafCfEjxo5HSeJjyjegk2eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5K4QekFWIZs6ummBqMrmecILRk4zbiwAdVpBeuBW3f2X/nPrk
	y/DIia/oqz8DIvbHWSp3AEzX1Hp6YyZ8UYdNS5gFPWBPmZrBaez/V0wr
X-Gm-Gg: AYBFou1jJI6fdeq400gnE6/OPPp6HcGVmoZZUch7mthVBJr6Qg8kEdNDYLvGQtj/50h
	EgoUcizF+SpCXpqvpn7BSb76AkI0MbBc+HNpTZ0WEjP2Z3+auiseOvCccbuk/GStV9gtlMIzM3h
	3gCUX+iEHDM/Z/JDQvQXqsSq7L46x1agnCCjY1bES+eDwEi4/1RcfEqUOsnQKNNJR4uavs32KtE
	BD1js7N90wwoALhhNTzE2YqqgxoFMNWRYTq5n0ucIPX0klsi99yOo0fGHrfBcocJpgxc52y8GI/
	jWSF+awcGECavHecOWzsV3Tw4bYtuktv0kYt+ZScyz1k3Shwc8Llu7tYxe86m1f3d0DR2pObLQQ
	QstObey+hLZXRQKoBsvhC0r/mMVK7ppvEuZ5v1HbJRxSPOPAKK6X8zyMpNa7zHOxpiUc7ZcuiBN
	W6sxPde8jFUaOw2Y1b9iC9BS/H5SklojrD6n1k05CTffg3PLXsk5vDyQYnvj1eNqJoxM4QAZBa/
	DZd8EbWScH2gFcbTHfBzE1yEWULBQo0pgcph9yIh80JM3A1F5BOemzaopxQGKvBQMLrnw==
X-Received: by 2002:a05:6402:1d4b:b0:6b8:80e3:d58a with SMTP id 4fb4d7f45d1cf-6b887eb1272mr2966644a12.23.1795029031397;
        Wed, 18 Nov 2026 11:10:31 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b888ef9423sm1460511a12.3.2026.11.18.11.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:10:30 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 18 Nov 2026 20:10:28 +0100
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: Re: [PATCH v5 03/11] mm/vmalloc: reject an unaligned range in
 vmap_page_range()
Message-ID: <av34JPIcIOVdF0kL@milan>
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-4-hao.ge@linux.dev>
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
In-Reply-To: <20261116071325.263682-4-hao.ge@linux.dev>

On Mon, Nov 16, 2026 at 03:13:17PM +0800, Hao Ge wrote:
> commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
> PAGE_SIZE aligned") put the check in vmap_pte_range(), which is too
> late, because the upper levels may already have installed page tables
> for a range that is rejected anyway.
> 
> The pte loop maps whole pages and stops only when addr lands exactly
> on end. An unaligned end lets addr jump over it and the loop keeps
> mapping past the range. An unaligned start maps the page below the
> range and usually misses end too. Such a range is never a legitimate
> request.
> 
> vmap_range_noflush() has a single caller, vmap_page_range(). Warn on
> addr and end there and bail out with -EINVAL before any page table is
> installed, and drop the check from vmap_pte_range().
> 
> Suggested-by: Suren Baghdasaryan <surenb@google.com>
> Suggested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3c0d9e69b886..a168f6f20f4f 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -125,9 +125,6 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	unsigned long size;
>  	unsigned int nr_pages;
>  
> -	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> -		return -EINVAL;
> -
>  	pfn = phys_addr >> PAGE_SHIFT;
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
> @@ -369,6 +366,9 @@ int vmap_page_range(unsigned long addr, unsigned long end,
>  {
>  	int err;
>  
> +	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
> +		return -EINVAL;
> +
>  	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>  				 ioremap_max_page_shift);
>  	flush_cache_vmap(addr, end);
> -- 
> 2.25.1
> 
LGTM,

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
