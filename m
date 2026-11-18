Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030285;
	b=fxaXkMueyf/XgaScnceZoE+BzkiOzZOPF/BC2Bxitcs3m1nzj5bKOfXhx+UBXA0bDaZC
	 YyXA7vFy+5kBtAW12PvZ++twIwt3/PC9PghE1Fg2xVnGz1uzZuSze7Z0mqwjZFXfI0gJk
	 DMbnOTC481Kr+VaVVBC1iUcO6effMscx3APzGOx0hGDF1mo5uhggynDez9us6E4MWnhXQ
	 kMHnb8OrfHgYQhEdi2gRM6G/70vhjsFuGPHeYp+AR4IsMgmtjEDz8wuQp7T9Ry6SiIWjO
	 frZcTW3MACFS1l6WknrSzRbyzIaRvRqE2MEobzuageQbuZG0Jr/sC4Wy3UGMLrAJ0qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DyoNOi8SqxQRtdWNaiooYSD8hFAkDD28ur39JiQbgr8=;
	b=ts06P27cvZ5qOgjp1ztvgfVkkqOQMiVhFYO8cpHJwk5WepG1qxML+v+y+8YDoXWBg+g1
	 coNUpMX8t4XWManjsx8ae6CktHR/aN1J3IKUF1CxF+kQciZ7pra1pK9FoslUrluk4BQJj
	 vyyOtFTU90v9o6zJfTgyRTOBFT9tH9M9GOt82NL6majGWlaHV1c2QMUAGIqfbAUkI3dyA
	 astybarFEOZQYJSIWfMI2Z0ALjzMc5YxP6ZHUYh2IPgc80rWHdPdjVPPIn18qd8TbCvMm
	 OLTEgiQ/Pxh/HKeyBVdGh8apPfnK1BkWiVlLPUYMXXdh5V4TmQy79TS+ufI9QLpT9eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFuf4zQU;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0FA606A7D7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0FA606A7D7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFuf4zQU
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5118deebcfso150382266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795030282; x=1795635082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DyoNOi8SqxQRtdWNaiooYSD8hFAkDD28ur39JiQbgr8=;
        b=gFuf4zQUDEoP7iC2MdGtPoZNDoQc0po102MyjgPSAjI/BKxKDcOzPFQXDCTGxyoBma
         ZutVtJQ+lca3F6ODV51vM/ExvFJ/ePHWA7kdQrU6ouTfQXFE+kQaSMexlfB8odlLRHLG
         5wSicNPDE+0B9z7eJPIRHplPTeH+I0/wlu60Zy+8hYhORZyORxy5hW1S03rK166oNCyn
         GPsMYDW5+erH449aPuogmViYnqiGWX9Zxg41I6Dxj2YXp+gwOQbxnkdrkmiUT2kewRX2
         b2YruDCaQzs9cTSB615OgQ8LfgBtVkYQKR3NvNLGq57ePa31b0b9dge2IPneUHc6BXA0
         RJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030282; x=1795635082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyoNOi8SqxQRtdWNaiooYSD8hFAkDD28ur39JiQbgr8=;
        b=S2n+iasOO+IvvXYqGcaL50ndtIPZ0nMu76eFYi4W6emhkGvJ2XnfWpi/9JJWUVKOHR
         tI16NB7mTsXUeKEzekU1QhF4RK35qZsq3mqcFi73PUHtAQ+3gUn3hO32qPHh8jK89ub0
         tc2a4t3tFu3J8IO99gLOP85R22OC3kwwdYIKKjBF5ia+E3a/lk3tKrmZ05O223DWlDS9
         Q3WuEH39N0GorNsyMtaeM0uMmYMKn1HqrCc2BdceZnWDnClbO4DlgoDEgXhOTDGTtnJw
         V4nyNI/9XXcijqgq1nl7lltY+ycrPhzqFuj286OZXhsbQDF52zHbkhfyftytYZqS/uSW
         fT+w==
X-Forwarded-Encrypted: i=1; AL+hErFp+NxbMNOmfs1H4xbSPvQPb2/fkXoo4y296ezToFmRETZiWI469z5L6KQbgU3OxDZlX/QMxTycyhZBzuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iEtsBNBTPsGgwPiDmaYAFc/THvCMTbVVs51Ky2GXG8oIEF+74
	aqxUhRnCILX7+0q9heMCBC6YP8fiKfaOp37JRrzVdYpfQWX1EwQD3F81
X-Gm-Gg: AYBFou21prAigJrgv/BoTBjG4B+IKt/UE7JT693vuoTxkJXjd+FVexWCBhVHCh+t0sY
	fMIrZNoudOTdSc2z8h+nadSabj9i3JEltyuk3qvGAU/QvFEpOttZHxQKzOp9F3BM4Aau7IgqsTi
	UcSvW0xhohdLjoL2PSo4cxJuf3SNcIkIjTpjN30ubpKTD3q4v0+xjbJEmcbVuQv2Kw3+7YkahE/
	83VdYVaSfUFrAob64FGXRaLDaIZIJ+MQ2Y74U51V3J14pI5suw4+1gLhtcF8V36LL2URMvkc9Mc
	n8+iU+EV1lCtM+9fpHj+QTSGwZAQFpAW1jg6xXcPz4Q2En3cYcLf/gM/eznQVLOJr1yo4A4JXLu
	sR+Y6aDk8A6QI7EWgg4p8C6CzzeLxSYcIfQ/1p8CiH8Qx/PHpHvaoVFdjpk+CP2ckDvzH/FbG9y
	rnNGCsT9DG7imXoXmCuaAiAmtmts6naf9ieBD/hCdbN4+xVFCW28EwePyNF1SONd5uZCZ4JWadK
	c2ug4yJiVkg0yREqRF7VwqTJZU+fdmZybPalMo0Ouhg2m9tLsfLFXYR89xkYN+3h/aYwg==
X-Received: by 2002:a17:907:3f93:b0:c2e:61e:f4fd with SMTP id a640c23a62f3a-c510debe470mr322367566b.5.1795030282513;
        Wed, 18 Nov 2026 11:31:22 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512351bc7fsm29492666b.86.2026.11.18.11.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:31:22 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 18 Nov 2026 20:31:18 +0100
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
	linux-mm@kvack.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v5 05/11] mm/vmalloc: only flush the cache after the vmap
 succeeded
Message-ID: <av39BuCsq-dRFiMM@milan>
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-6-hao.ge@linux.dev>
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
In-Reply-To: <20261116071325.263682-6-hao.ge@linux.dev>

On Mon, Nov 16, 2026 at 03:13:19PM +0800, Hao Ge wrote:
> vmap_page_range(), __vmap_pages_range() and vmap_pages_range_batched()
> call flush_cache_vmap() before they even look at the error code. A
> failed mapping is never used, so the flush is pointless at best.
> 
> According to the Sashiko review it is worse than pointless on UML:
> flush_cache_vmap() there is flush_tlb_kernel_range(), which syncs the
> PTEs into the host OS. Flushing a half-installed mapping therefore
> leaves host mappings behind for a range that was just freed again.
> 
> Only flush when the mapping, and for vmap_page_range() also the KMSAN
> metadata, is fully set up.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index e2b63cb1592b..d99d7710e1ba 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -371,10 +371,12 @@ int vmap_page_range(unsigned long addr, unsigned long end,
>  
>  	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>  				 ioremap_max_page_shift);
> -	flush_cache_vmap(addr, end);
>  	if (!err)
>  		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
>  					       ioremap_max_page_shift);
> +	if (!err)
> +		flush_cache_vmap(addr, end);
> +
>  	return err;
>  }
>  
This is incomplete. Maybe merge with 6.

--
Uladzislau Rezki
