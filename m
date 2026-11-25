Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632590;
	b=KeK4L3tbDUHvZp30i37QmxE2zUEZzBFoNV3cdLsKBwuZ0EpJQEUNw1t7fgAFKrpX2Bf6
	 utBfCvcGKJW9o+/xSMk+Pa+kygF1rNTaMeZi1q+FygNKTjOAV78BOTWsj8beFHUPsAuqC
	 po+qnMe3DxjzCOcVjD+pFag9LVtNkGq2v4rbIBITC8XqpoPYbzHwKTMLWRUUd2lZ14UI9
	 j9HdgmWPCuV+5xB6shw1OXmybCQ/91KpJiQcmQ9NWlYvk4AZGFOXmEk1EN+rhtJ9WLT65
	 YfDTAZq47erA6X+Hkt7Ufp/nx911EfZAbSl1tcvWglkjaVxVpcZux1MCoJVc5IZasdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632590;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PM8SzO2FNT5QYTl7e2L6CPSCvxzNzPmQG5xnJtLl3nA=;
	b=4yWkNk8MSv8/FYZXNdaSAmwPFaukbamE3Rs+G9R6J0g5PnoidwZP4JV9S6yswukXgl+3
	 QDJQK9qVajqXuC6UCX6c2U3g+rV09ZVdJWafX/PKNUr4RjLQ5KXP2/tBwNSwXngjmHlFx
	 fIvACk1feuEhMdnDWKLC5oesfrNRX2S2uwS7an+8RjZl4uOuntMSuYRQXdW9rgxuZVTvs
	 pc9yB/bbEftqoAeSZ6yQjXegR1fWLUP3FvAQ6I8hDRbqWis2V3Q1Oxc6NRTrIQLOl4dk+
	 2zvg20YHaeWQ90y36zVaaO8teweBbQMSx0CTQTVQexm+HYZpwlpbW3/ZoCf10beCEtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OHJ2BmO0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69450606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OHJ2BmO0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155C11F000C4;
	Wed, 25 Nov 2026 18:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632590;
	bh=PM8SzO2FNT5QYTl7e2L6CPSCvxzNzPmQG5xnJtLl3nA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OHJ2BmO0t26BbIkdocGQD9nE3A3OnHYcLXXVl3aaKYh+ftS4n0BE66Ac1a8LInUBI
	 FdMbdKSxEl5b/l+MrQ48QNJYD1pbeCzOcYo0xW37AXVOAjJ759443kXbYTgs1xDoTS
	 SYElSvDFlmmnNnvyi6WKrSdrXmdvTh270kn0RN4RVcR7wyiNKLKmsF/vKh/dOcpHUZ
	 jmBs+uJpdaNHb3ngBn/j65iiGdvZWzQ3XzdjXL+6g1W+Xr6IGVd+qh/3k/v7eK2cmz
	 yJ3kZpF3U3fmtkq+vCMzzm3MkdCyDmCQ46RpCoxRUa95UlZMC32Wnm/egUjwXqJYmG
	 JGzQpF3KxjK6A==
Message-ID: <777b808e-19e3-4dc1-80f7-6d75cb0362af@kernel.org>
Date: Wed, 25 Nov 2026 19:49:45 +0100
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
Subject: Re: [PATCHv3 4/4] powerpc/mm: Drop PAGE_KERNEL_EXEC
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
References: <cover.1795625038.git.ritesh.list@gmail.com>
 <96692b22febc2c4ee366de072cebb57abd8ffb18.1795625038.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <96692b22febc2c4ee366de072cebb57abd8ffb18.1795625038.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 25/11/2026 à 17:52, Ritesh Harjani (IBM) a écrit :
> On powerpc PAGE_KERNEL_EXEC is just an alias to PAGE_KERNEL_X.
> 
> The comment above it's definition saying
> 	("Make modules code happy. We don't set RO yet"), is stale.
> Since commit 4fcc636615b1 ("powerpc/modules: Make module_alloc() Strict Module
> RWX aware") module text is allocated with PAGE_KERNEL when STRICT_MODULE_RWX is
> enabled and only made executable later, so there is no longer a reason for
> a separate name.
> 
> Convert the remaining users to PAGE_KERNEL_X and remove the definition.
> 
> No functional change intended.
> 
> Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/include/asm/pgtable.h | 3 ---
>   arch/powerpc/mm/mem.c              | 4 ++--
>   2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index d20ff2ae02f5..ea06a85f0fa8 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -20,9 +20,6 @@ struct mm_struct;
>   #include <asm/nohash/pgtable.h>
>   #endif /* !CONFIG_PPC_BOOK3S */
> 
> -/* Make modules code happy. We don't set RO yet */
> -#define PAGE_KERNEL_EXEC	PAGE_KERNEL_X
> -
>   /* Advertise special mapping type for AGP */
>   #define PAGE_AGP		(PAGE_KERNEL_NC)
>   #define HAVE_PAGE_AGP
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 8a0fdfd028dd..bc83e45b7ae9 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -388,8 +388,8 @@ static void prealloc_execmem_pgtable(void) { }
> 
>   struct execmem_info __init *execmem_arch_setup(void)
>   {
> -	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
> -	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
> +	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_X;
> +	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_X;
>   	unsigned long fallback_start = 0, fallback_end = 0;
>   	unsigned long kprobes_start, kprobes_end;
>   	unsigned long start, end;
> --
> 2.39.5
> 

