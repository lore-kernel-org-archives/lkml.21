Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402889;
	b=RA7KwlOF0Jl7IO61PT5lCRkOUXsT6m+ebYUBMfHVtyTxgyDGgn2P+oV09BNPYJ/PxO7z
	 OyROAHR3kuSdgNArWQiQvIXc4yeV8W0jgfh/ENedxH/MQ2Cn9mj/S+NPXwwicDjp+vdvy
	 +hg2510JwusjLyRXiteM7491sBmSErmXKAStUBmKajjMhGQkV9CFcGG8gaC8kJCPLM1Ia
	 nUIxWE8JzPJnwxy/rVjckMvc0Os7dKWdO07agMXumUQpaHY4BLtpQ2IpYZuqbVKcdJVDN
	 iA9tErBVTcXJR79eMn5o00IqznmEGXMRaIBVu4u1FMrYnxAYVM7Vitn/owPC7114nig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402889;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=rVGtwWIUrwg3vjkZky9jBduG/TMeysWW9WrLvNCpeaU=;
	b=Pz9Y6ezpRRCwxbOvONi3r1IJByFWQR+pOaTAa4YPbgNQ80tFTfYyLVbLpnPPBGo43EfN
	 dM5Bf+bIP3uoYHExGViGUTtif4Lg2WQpSllLgKfQvqigp+VShZPqWc/OeiFkLNTfAxxfF
	 gPP3CyUX/KitSVQe+hU3RM3n/AAg/CgK0Xpuy2jzNYTeMrU2S5BrWXcVZ3R7iPEyQtDLx
	 9ZWVliiZsAlxSrD1xLiqpf0HRwxuLFFkdXyPHEsYQsXU4lUWFL4X3SixmcTxtK3PCNuim
	 gT97tuObA/qLz4lmlrriDRcy59JH+/WbXPLSGeRT94E7mGRS3UJTXB7hXDSr6vH0Hqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Je3rYygI;
	arc=none smtp.remote-ip=95.215.58.47
Received: from mta1.migadu.com (out-47.mta1.migadu.com [95.215.58.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC69606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC69606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Je3rYygI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mIgBcbUV5ixDOvXz3J1MusGef0bPdFIqnXiTXJGakI8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795402887; v=1; x=1796007687;
 b=Je3rYygIgpzY1nXNspU9V2667bbCxLLQx2mNTGfA5ycudJIdi0ddpU3flrQfQ+x3bu/n4JwP
 EHkGQ2b2RtFhdpJIDn16/2YsyMpdxpo9jc0VZClg2ybCSOXNcWbKs036kkjhk0PZ+OuQ/szJxZH
 3U2NuV9anPz/kTarzHXX0zWQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 195945ff91ad8013;
	Mon, 23 Nov 2026 03:01:26 +0000
X-Mizu-Trace-ID: 195945ff91ad8013
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 05/19] hugetlb_vmemmap: Allow architectures to
 dynamically disallow HVO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-6-jthoughton@google.com>
Date: Mon, 23 Nov 2026 11:01:07 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C1CC6F31-4F75-41D8-89D8-CE43465FBB6C@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-6-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>=20
> For arm64, only some platforms support HVO. Add an arch hook,
> arch_support_vmemmap_remap(), to prevent HVO from taking effect if the
> architecture lacks support. The hook is not HugeTLB-specific, so it =
can
> also be used by other users of in-place vmemmap remapping (e.g. =
FS-DAX).
>=20
> Check it in hugetlb_vmemmap_optimizable_size(), so that hstates are =
not
> reported or treated as optimizable (e.g. by report_hugepages() and the
> HugeTLB allocation and freeing paths) when the architecture does not
> support HVO.
>=20
> It may be the case that arch_support_vmemmap_remap() returns false at
> first but eventually returns true. This is the case on arm64, where
> support depends on a system-wide CPU capability that is not yet known
> when bootmem hugepages are allocated. Such architectures cannot =
pre-HVO
> bootmem hugepages, so they must disable the section-based vmemmap
> optimization in their vmemmap population path with
> section_vmemmap_optimization_disable(). Their bootmem hugepages are =
then
> optimized when they are gathered instead.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> include/linux/pgtable.h | 15 +++++++++++++++
> mm/hugetlb_vmemmap.h    |  2 ++
> 2 files changed, 17 insertions(+)
>=20
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index ab33df268955..8cf44120e2ed 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -480,6 +480,21 @@ static inline int try_update_vmemmap_pte(unsigned =
long addr, pte_t *ptep,
> }
> #endif
>=20
> +#ifndef arch_support_vmemmap_remap

We usually add a 's' to 'support'. Like arch_supports_vmemmap_remap.

> +/*
> + * arch_support_vmemmap_remap - Whether in-use vmemmap mappings may =
be remapped.
> + *
> + * Vmemmap optimizations, such as the HugeTLB vmemmap optimization =
(HVO),
> + * remap vmemmap page table entries while they are in use. =
Architectures that
> + * can only do this on some systems may override this hook. It may =
return false

"Some systems" is not clear for me, How about rewrite this sentence =
with:

  May override this hook based on architecture-specific runtime =
conditions.

> + * early during boot and true later, once system-wide features are =
known.

I think the description should be general, so the last sentence I think =
should
be removed.

Thanks,
Muchun

> + */
> +static inline bool arch_support_vmemmap_remap(void)
> +{
> +	return IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION);
> +}
> +#endif
> +
> #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> extern int ptep_set_access_flags(struct vm_area_struct *vma,
> 				 unsigned long address, pte_t *ptep,
> diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
> index 8b28063d78cc..440477288d19 100644
> --- a/mm/hugetlb_vmemmap.h
> +++ b/mm/hugetlb_vmemmap.h
> @@ -48,6 +48,8 @@ static inline unsigned int =
hugetlb_vmemmap_optimizable_size(const struct hstate
>=20
> 	if (!is_power_of_2(sizeof(struct page)))
> 		return 0;
> +	if (!arch_support_vmemmap_remap())
> +		return 0;
> 	return size > 0 ? size : 0;
> }
> #else
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20

