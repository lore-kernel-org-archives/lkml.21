Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108518;
	b=N4wtTos0U6HtXnOxbvwEqAPgJaVArEu+oP1+/4V9OycngDdI0j8I1/xR8BkBmwN3LDRH
	 +5r3ow9CNwpOY5uTmbJPE2/C0pIaWELzNVI8cK/GTr8pt6R0oeJJqTj9v2DQvtsN18Izf
	 kY2Bd6FZj17zHKJ/bIzcqpENLPiJAemqLBaVC6QYVWwYqgb4Ijg+XwPCQz7LUUTzXqtrD
	 XG8GcBhHaI33AzsDKM6feDG6E5AtWqxBZWp5xPZ1gTEJTO54LKYSf8KUvfw5+UryYxRAf
	 Of4TISltVSuXO9/kSB6oyFk+4gvka7S0L0iPZt52n3wEAECAOnZgT6bmhOWEOARetRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=QLlAlF6sccc/yijrm/66Ncx3qXiAKuk+bopz8N9+Jgs=;
	b=2IkpYlXOPwaie65aj++Dvp9m7fp2U/LKpAL+9hgcqLtnMTD636FcHFymhkZVeuGABkF8
	 uvB+z+MwQ92Xoqlnrgz5IlsGYJskEfkVxB/FAUXVejvyRUB3Nxg2vNm3hld+40yPUpeJM
	 2YQ5v0swOurvaQqd2BXC9sPMRvyeVRkLl9WwAGe+NZIidsOudUlDl2rHzqyQMnXBCy64I
	 nf5zeFAzd4uV8OTD62ZwAiXnlOEAZyyidjiXS8TrHtdcS/9atbutWKftpMQD71C7Jc9uf
	 Z8/P++SkvSW+b5cDoQEMLfB66JAMs78+/pF/O/xQe/1Gqjpu99ma/hSKygk0KJhPi1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKC6PKmb;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4127B606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4127B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKC6PKmb
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so45808a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108517; x=1795713317; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QLlAlF6sccc/yijrm/66Ncx3qXiAKuk+bopz8N9+Jgs=;
        b=fKC6PKmbL8T9BU4qs7WIf8UVTCIALkcf6ev15oUA8cgdeK293wEnfx6mIobFpAmzSr
         Mc1PaNPs7SgJwtbLp+mgaIecJjc+K1CJTkWH1O1wNbODCXriHpJPn9eZ9bUBkXkOA2+n
         E9eLthDMC0/s0AphSxs8rEUQz8UlqM4SXO9wWKuEtXfjXvX7mZc85+PWiBCX9CZLo44Y
         2aVI6innRIH9EY4nnoSnIz9iFOgebmAAQXSaGJN4vVIwgUG/mSniiFRqYLz5FN1x18h5
         0td2nm7CY2D2/085i1oEoJIM7/fLtdB8cOz+sQ4KJnTWpz2sS4MY3zZpltKdqFudnVeP
         Bpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108517; x=1795713317;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLlAlF6sccc/yijrm/66Ncx3qXiAKuk+bopz8N9+Jgs=;
        b=McXNt9aO5GtJQQaAw+Xe78GNjJDU7ga5S2eBqg28x2TzNUYKWDSLDuagZxDQdJxRit
         OmZfypxsox1GUmbRLFl5hUlVjCcHCz9Hdkj4XG+xoNZIIbo+hMdIW4CzQOzhbaJiqjwf
         dBARHCkkFVpqL5digove1I0k2IyrpzlDTbEAooizq7YsYJ6+3SnZFPuWVYsazA6ugFX3
         iGuJSaHtxkRJo1r2KDWqTHIWK+g53SVJxs5BF7F9taFYfHWzjDh9XKXLi8un8gbKyxE2
         vJVReVg76MXRuZ2Zx+bUHpShOIRBWyG8EUy2pjebjjcB7DlLJEPiQdUIWP93GE7e1rgm
         neug==
X-Forwarded-Encrypted: i=1; AL+hErFcOe/FBNYajiE00EoQIqO7NarLVPMJAM9A0ntYJmlwy80vPjU4I4Ux6kBtpGknK6FngEZRfQ1HPcWdWNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FEiGhAFzefB/eQdIyAXLxNAu3WUNko+KFfJYWQ1k09jGm7Vps
	EggUcmvK6iv8y/OpJD2ME5txdVR49XLn208K/pfOiIcOoFbeLqLog4TZ
X-Gm-Gg: AZFdTZfd2EaXH1u9ipkxxzF1Hmhkmfy+dlCJ+MaMvWAy0TIyrlQKpH9jqIKNXhxHQ86
	sn/YJj5sKJ64VA9u5YXMTuP3GInp/qa0NDUKCWp3Gjb1ioCm2iwQKcTj5eXBIVurcPI1c6kgtV/
	/9H12xo1zt5XdzwjNT1QDdXx6qDm1+UfvNkSa41t1AFdO2WNozwVFdR548YiaFabIowCouyGKoQ
	ipnXvHkzeHP1mpyo+ve0PjItVrT0w85zLhVOprZBJ1CAW0q0tx5SJ55RiXPa7YBMlPvDZps4HND
	L94IRn+Vl3jLzGZDsz4nBSs+BB7PwXmAE/bexEtnMGK7l/ZFHNGhTi+4lam/5Dylq0PmL2oh/oU
	No9e4WJjTKoQ5Z9UB8X/sfIb9dRWu/KTA/lWdR/Ihdg9VeDGNhZ+UzjU5Q/FImd+xEYfGUc+pjD
	I8qB0H6qLmEzGDM0VyU+ucnZMCz8PomKBjz2h5VDvJCpd+e8kNBPCr1Nqe8GMdr7LehMhDeF1dz
	UAzcx+JEVbM6ujAxq8z+alKrwMLC2Ee8cWyyje9kbdFS7KMqvfmDVHCgp81QXOgn2+qhmu7qMA6
	0H9/HnmCvWoUBMe0WhfyPij6fLQ=
X-Received: by 2002:a17:90b:288e:b0:3b3:ec88:72a6 with SMTP id 98e67ed59e1d1-3b41c85284amr34574a91.3.1795108517546;
        Thu, 19 Nov 2026 09:15:17 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm3418882a91.12.2026.11.19.09.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:15:16 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v3 4/8] powerpc/mm: skip kmap for lowmem pages in __dma_sync_page()
In-Reply-To: <20261119151520.2383226-5-m.szyprowski@samsung.com>
Date: Thu, 19 Nov 2026 22:43:30 +0530
Message-ID: <4idclp6t.ritesh.list@gmail.com>
References: <20261119151520.2383226-1-m.szyprowski@samsung.com> <CGME20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f@eucas1p1.samsung.com> <20261119151520.2383226-5-m.szyprowski@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Marek Szyprowski <m.szyprowski@samsung.com> writes:

> With CONFIG_HIGHMEM enabled, __dma_sync_page() unconditionally goes
> through __dma_sync_page_highmem(), which disables interrupts and
> kmaps the buffer one page at a time. This adds needless per-page
> overhead to every streaming DMA sync on such kernels.
>
> Use the per-page kmap path only when the buffer reaches into highmem
> and do a single __dma_sync() on the linear mapping otherwise.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/powerpc/mm/dma-noncoherent.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Thanks for taking care of this. LGTM.

Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

