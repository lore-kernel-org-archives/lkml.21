Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612610;
	b=xJdDRoWEbwui5TUG+5/938f22uakeaE2Gtkf8Kl6H18J4A8gcB2GTIvkkzAHXVMHDGm6
	 GwFJUEsZO3kM/19psHz+iYccnWmk6HDC9WFBredG/jEZmHfkA3xuZd7E+ijNngREBYyK6
	 2sNxRRSCp2JHw3acabWYMWvGg+ty/HrHVx8s8rpv6H43i4lP0RxK/c0gQMuQlcLh8ku9O
	 ZGUW9vvVAwTgIaLtgb9PFsvI60NlV3z8QDgoUKskrL3yxA23GMmMwV4p0Sp7aYjCIkpcP
	 tShOlt5U3UMUca3VdTIWBo51e8rOSW8McYZXgPYOsKa5JI5RpD8Nax2rR8pqrXt69eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612610;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=p4pwdpLr8G9tkVOw66/7LdGDUKK3H4uvVJTpUAjnWxc=;
	b=jdBM0ac2ePsVtRICiVYgEMbFQQE/DQ540aad1jYeWstbMyuJDCL4AzaUbEBd1g1yHV/2
	 mDoYWTS3EE3iP+e0LH3qtFoc5kZKPI3SWb88A5Gpg8/QxVsoMi6YvDTv/2cIriyql/rhI
	 Lo1Tq0J4s1azf02RF2d1f5pDGafgL8/FQDtyYO/+HAkdoou6yF4LlXZEJ30v/krFEfV3C
	 sNR3pItNt8FbOU9bjNhh0vyGasfJutnGQOCrwD4EHOaWdJym690PssWS1+daaJVMkyug8
	 lqnwuq3b2DKchAU0VqxoycCSpnrOUTN2R8CgSg3oSSnhDwadlw54tltV+/WiVgknybg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OPTkxYqI;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DB3606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DB3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OPTkxYqI
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18BF22F;
	Wed, 25 Nov 2026 05:16:46 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D7213F86F;
	Wed, 25 Nov 2026 05:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795612608; bh=sBRq7wpGpW8WmsuLwJ+wOE5r4x79Wz0L9uigkh0JVCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OPTkxYqIZOPed4pLqkkr32XUHQG7ewENqa0OD+6+t1sCG+yay5oTSErb0JqNMcL6G
	 waWMK46znWE5eAhdOaub9+wRPXv8M/SMJd/5xLmjtF4VOp063b98+hcmRfb/37VogX
	 2mU5wqxIlvPDpIq1VdCBw3izczdqHfecvCsuF1u4=
Message-ID: <b0502bb9-4840-4099-ba97-822a4913ca3a@arm.com>
Date: Wed, 25 Nov 2026 13:16:46 +0000
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
Subject: Re: [PATCH 2/5] ARM: NOMMU: pmsa-v7: Do not allocate more RAM regions
 than the limit
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
 <20261125025757.1159931-3-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-3-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 02:57, Brad Hawthorne wrote:
> deviation from their usual behavior, this may indicate that their account has been compromised. Be extra cautious before opening links or attachments. *
> allocate_region() checks "count > limit" only after it has filled
> regions[count], so it can return one region more than the limit. The
> caller passes the number of MPU regions left for RAM, so the setup
> then programs a region the MPU does not have. Under QEMU (mps2-an385,
> 8 regions) with a memory node of 0x21000000 + 0x9f9000, which needs
> more regions than are left, QEMU logs "MPU region out of range 8/8"
> and the kernel reports:
> 
>   Using ARMv7 PMSA Compliant MPU. Region independence: No, Used 9 of 8 regions
> 
> Stop allocating once the limit is reached, so the memory that does not
> fit is truncated, as intended.
> 
> Tested under QEMU (mps2-an385): the same case now truncates memory and
> boots to user space. Not tested on PMSAv7 hardware.
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
>  arch/arm/mm/pmsa-v7.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
> index a20a43867210..f2ad0f3ff480 100644
> --- a/arch/arm/mm/pmsa-v7.c
> +++ b/arch/arm/mm/pmsa-v7.c
> @@ -193,7 +193,7 @@ static int __init allocate_region(phys_addr_t base, phys_addr_t size,
>  	phys_addr_t diff = size;
>  	int attempts = MPU_MAX_REGIONS;
>  
> -	while (diff) {
> +	while (diff && count < limit) {
>  		/* Try cover region as is (maybe with help of subregions) */
>  		if (try_split_region(base, size, &regions[count])) {
>  			count++;
> @@ -215,9 +215,6 @@ static int __init allocate_region(phys_addr_t base, phys_addr_t size,
>  			size = asize < p2size ? asize + 1 : p2size + 1;
>  		}
>  
> -		if (count > limit)
> -			break;
> -
>  		if (!attempts)
>  			break;
>  
> -- 2.43.0

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

