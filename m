Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616212;
	b=e7rH1Y/7kFCLkqqm8qCjGSDU/zP+oqEkSNDEId83QWRcCLXpErSXKTWp5Wa9ID2utu8V
	 FBT6kYK8/Wu6Msg3IeG7jJ+TSg2Uu43kQi8Zw84DMEvaXz8pg6j3nMag+C29X1qOgwAcJ
	 jl3rzR2IyjLC5mqWjOJGAR+TI5F8+5b79fMLwF7FVOGQM/3HPugiLonJ5FKTqphje/Hi1
	 ef5UpFsgBV5COMIfv9S2eSKTQDdu8fjsPsZlQpL+F2/G/5T54rhC+lVi2+ItU5XYRAqGC
	 mZFVmrR7Sju9FurvW05QiHDKVvYSSt7mpjNCB34pd2lRVzFZ9R2OKPVevYzM7D0z9pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616212;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KCFAC1FOAB4tB1Vm5iJMuAjrTh3kSujq/UfRYmsRVvA=;
	b=gV6EUQwZ/IZIo9DWjs9VUTMOV1h3MxnZ1IB8fD063tE3XRfliF+wTAfI1/t437NXeHOy
	 v0yNUonhwg2gpMrYIqSieRYn0YlmGRsTuk3XMpFT9CO9lxNSXIbGn8/F5CYhHm9SLvEL/
	 anrEPADDs/i7GqGM/BMlFaNeQZ9F8gw0Qq1lZNzubtVUnek5RQuMeKyUh/66NQTAN8JEv
	 j1bFHRALqMsIZpUhMZ+cdrJsEB9MlFREIXRCCq+jO9FquV8ICcPZ8lch3fwvWSdz9IhTV
	 6zQ12GA1G38MZvlKm88LDrQhyBbD1XKafQpLSHk9cJ/VdSDBeY3PhmUiGrVjsUs0z7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bMA90oAV;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC12F606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC12F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bMA90oAV
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5208B2F;
	Wed, 25 Nov 2026 06:16:48 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27D553F763;
	Wed, 25 Nov 2026 06:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795616211; bh=2SXKFVoBbxWUha93ECgLAC2EuSDLG7Zz9KOIAMkR/Vg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bMA90oAVFQ3VCfANbPbE8mQjtEZEYekxZbeHGHszMB8aYNvDChqBychj9Mop3Xd7r
	 5C1OLF7oy+aH34p2wrvzefyJhIzLzw8X4fmkwtgcOqNGchsJf3KmzzuE8jInQE6iqs
	 NFf/+ydb07wVOQAB785EXpl4cwHYyYHkgYNDiNoQ=
Message-ID: <81e6e5ad-24ab-4b47-b22b-494d61e318dc@arm.com>
Date: Wed, 25 Nov 2026 14:16:48 +0000
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
Subject: Re: [PATCH 4/5] ARM: NOMMU: pmsa-v7: Align a split region's base to
 its size
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
 <20261125025757.1159931-5-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-5-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 02:57, Brad Hawthorne wrote:
> try_split_region() masks the base with size - 1, which aligns it only
> when size is a power of two, then rounds the region size up without
> aligning the base again. An MPU region's base must be aligned to its
> size. For memory at 0x21400000 + 0xa00000, the kernel asks for a 16MB
> region at 0x21400000. QEMU ignores such a region. Hardware that
> ignores the low bits would map 0x21000000-0x219fffff and leave
> 0x21a00000-0x21dfffff, which the kernel uses, unmapped.
> 
> Start from the size rounded down to a power of two, align the base to
> it, and double it until the aligned region covers the request.
> 
> Tested under QEMU (mps2-an385) with that memory layout: QEMU no longer
> reports a misaligned region, and the kernel boots to user space. Not
> tested on PMSAv7 hardware.
> 
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the bug in review, wrote the fix, the QEMU tests
> and this changelog, and ran them; I reviewed the reasoning and the test
> results.
> 
> Fixes: 5c9d9a1b3a54 ("ARM: 8712/1: NOMMU: Use more MPU regions to cover memory")
> Cc: stable@vger.kernel.org
> Signed-off-by: Brad Hawthorne <brad@sim.vu>
> ---
>  arch/arm/mm/pmsa-v7.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
> index af0c71135a6e..bd776ea90934 100644
> --- a/arch/arm/mm/pmsa-v7.c
> +++ b/arch/arm/mm/pmsa-v7.c
> @@ -146,13 +146,19 @@ static inline unsigned long irbar_read(void) {return 0;}
>  static bool __init try_split_region(phys_addr_t base, phys_addr_t size, struct region *region)
>  {
>  	unsigned long  subreg, bslots, sslots;
> -	phys_addr_t abase = base & ~(size - 1);
> -	phys_addr_t asize = base + size - abase;
> -	phys_addr_t p2size = 1 << __fls(asize);
> -	phys_addr_t bdiff, sdiff;
> -
> -	if (p2size != asize)
> +	phys_addr_t p2size = 1 << __fls(size);
> +	phys_addr_t abase, asize, bdiff, sdiff;
> +
> +	/* The base must be aligned to the region size */
> +	for (;;) {
> +		abase = base & ~(p2size - 1);
> +		asize = base + size - abase;
> +		if (asize <= p2size)
> +			break;
>  		p2size *= 2;
> +		if (!p2size)
> +			return false;	/* would need a 4GB region */
> +	}
>  
>  	bdiff = base - abase;
>  	sdiff = p2size - asize;
> -- 2.43.0
> 

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

