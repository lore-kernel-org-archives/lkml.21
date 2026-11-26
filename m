Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702932;
	b=dXUIJqZgmBE5DRxh3K7iXxJMIk+NshDxdklu7ITXs3qLG+xh80MLUrSphOTsPx9+guuH
	 CDTcbdFN7Lbu0GMlRbF9CX0jrB8Zb+etCALdwEFMdW8Y4mMogsxRmOICZhyg9wFiqzniv
	 //V9JPHkDTtr/QzV6UC2s6VuXewwyeDaBJUvQ4/nypmVMZe6J2mRWWj28hbTCl9BZHhEo
	 t+fJg54UliEysyrEe3uDL6sbAGJFzhoIcS9eXON8Hc0dUtm8yk20hDLf9X8c2lsng6DNp
	 OC5YitTXTLXC2PygPw+/XYKznw1SqHYDf2TqHVEBy4mr6NIfAmMKNbJD6ok8TRlKU1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702932;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KTNZD+C+JP9EsvqOZ/gFA821fXkXQWgJjDmWwsH0f1M=;
	b=SzsYmH7tUeetwhX8pmJq0ajrj/OoRnLbuZP+CkqIIPN3MggL3ne08fkEbeV9RaL8xB2B
	 ETFtxi9JP3tWOjZ3ujc7VceuuZa+p8j77gQgqPoEq+SjBswPB3AFV+ZlswO0o6t3zHjEp
	 ii5x+yQIj+rO3Vw4cs3zH8c7+mfrAN87S34PBSSRdMKmhWgyiKYwZmxq5nwnPvlIzz/EF
	 E3hJ5LPuW6ipqXIk3UjPqD9bTkTawiHgnF7H6iGlCtdIGjcDwT4KNyUvj//NDbKMoPcNV
	 /L0+rujGJisLcp0Pd7KTs5zbWBtT/qSQkEvQkhCd/fg9XqYOvfeyQ+IXbjScd6SbxCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qc/c94To";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD108606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qc/c94To
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D780E1F000C0;
	Thu, 26 Nov 2026 14:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702932;
	bh=KTNZD+C+JP9EsvqOZ/gFA821fXkXQWgJjDmWwsH0f1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qc/c94TovmFQ5bTftQRsaRCNS2h5YrVVa4k4mgUnRsYuhxlkxha7yCFnO58CjPiRh
	 FrXtjcd9N15R285sJqrpDxBXL0XtPu7HUF8+1HCzwAJOas5okHWT2gY+C00KqrN7As
	 imcMlTuwq1UK8v+I3hothENHuEDx31a9Q2eVuS+6kTrcvldPojIpYeXMmRTw54vAyB
	 pgpvdWvbxpkh86D8/Rcfal3iI5k1pnFOQCZ6tf5fFKxOIV+e0bO07IBtNq3VeYBnYT
	 fcde8WCtC6qqB1FupFXqG18wzejg3gk/THHw/RIZ8/q/6/M5bcYBVqZ1JyAfY3AgCS
	 +zLRRjl7m+rJg==
Date: Thu, 26 Nov 2026 14:22:10 +0000
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Chris Down <chris@chrisdown.name>, Kees Cook <kees@kernel.org>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>
Subject: Re: [PATCH 2/3] mm/slab: add own entry points for
 kmem_buckets_alloc() family
Message-ID: <awg-2hrOmY5U3vzS@thinkstation>
References: <20261124-kmalloc-entry-rework-v1-0-37b1631a67b5@kernel.org>
 <20261124-kmalloc-entry-rework-v1-2-37b1631a67b5@kernel.org>
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
In-Reply-To: <20261124-kmalloc-entry-rework-v1-2-37b1631a67b5@kernel.org>

On Tue, Nov 24, 2026 at 05:30:03PM +0100, Vlastimil Babka (SUSE) wrote:
> The way buckets have been implemented was to extend
> __kmalloc_node_noprof() and two more functions with the kmem_buckets
> pointer parameter, which means all kmalloc_node() callers now have to
> pass NULL. To avoid this extra parameter with CONFIG_SLAB_BUCKETS=n,
> we added macros for parameter declaring and passing.
> 
> This can be avoided by creating own entry points for kmem_buckets
> allocations and not using the kmalloc ones. They all end up performing
> __do_kmalloc_node() internally.
> 
> Since it's just 3 functions with few callers, do not try to do anything
> special to eliminate code with CONFIG_SLAB_BUCKETS=n. Only make sure the
> bucket parameter is changed to NULL in that case because it would be
> ZERO_SIZE_PTR otherwise.
> 
> The removal of the now-unnecessary parameter macros is done separately
> next.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---
>  include/linux/slab.h |  16 +++++++--
>  mm/slub.c            | 100 +++++++++++++++++++++++++++++++++++++++++----------
>  2 files changed, 94 insertions(+), 22 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 70df0a2e3876..6674caabbb6e 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -5732,6 +5732,34 @@ void *__kmalloc_flags_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags,
>  	}
>  }
>  
> +void *__kmem_buckets_alloc_noprof(kmem_buckets *b, size_t size, gfp_t flags)
> +{
> +	const struct slab_alloc_context ac = {
> +		.caller_addr = _RET_IP_,
> +		.orig_size = size,
> +		.alloc_flags = SLAB_ALLOC_DEFAULT,
> +	};
> +
> +	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
> +		b = NULL;
> +
> +	return __do_kmalloc_node(b, flags, NUMA_NO_NODE, (kmalloc_token_t){}, &ac);

No type-based or random kmalloc partitioning w/o SLAB_BUCKETS?

-- 
Cheers,
Harry / Hyeonggon
