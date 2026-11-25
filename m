Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612858;
	b=YkRcEA2XUIb/IKiY696syEluGPpI7eeBjWbHChmvk0F8NN0yeRxhxbIy27AKqrvrc9C7
	 YR58C205LlIuzI86akkeLQDMzNsLkcyKvwavLJagBr3aEF9Os23WtaZp5hBtJlmY45nVz
	 8ciDJ5f9coN6EvHPDHAunry/pYg4PQG0T/C69474vqf+rKW1qtnT7yUZDR+HLm0vXipPl
	 aGDz2pqWJesGSX/MJAKkEkJ+iKoPkbXqifI+eNc48xJ9V9a2q6f2GCxpXaNb20LhpqR0n
	 2xpUD6Qpn7e5WmAOQ/yHhk+UhOVniArPEur6l4maEoi2QsIxHvF+ElFalzKR48PEhSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612858;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=FSEDyfxSTPcIGOMud9C2CIH0AankhOmnnyfmu4tSqH8=;
	b=x7dMat/e7lqQT+EwhfFwlm42+qmA7epID7JOrAQLaDO9M4n1DZqgkUkJauZzPN1lBwQA
	 HwRd1lxyfL6Gre/K3GrvUTrBxsTltc8YZMPCsqqVrRM22oNwA+8EJi8cNOEObN8LglueQ
	 JdfoAezHW168xHu7vR06CEYtHGWGDSorhOg6XzRnhXcKL7QSirZvsSHFD2QCz5P2Dqgfd
	 KgBygqP/VyjljyLChbPBvpt2418K3e9iOQOqRWTW9hhWYHekMS88f71vBhPrLY9GNMG8R
	 MMgd3UVBnsGK8jNO0RhNKO+p+amUnTVxfpsbNasqjLkv+K1y5SrgpMpyUo3Jt89NymA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Oemqflkg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4A1606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Oemqflkg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D94A2F;
	Wed, 25 Nov 2026 05:20:54 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10CD33F86F;
	Wed, 25 Nov 2026 05:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795612856; bh=o+g6T0SKB4A2t//VSduq7zL1oBlD6qtVm9U/dPU7Dr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OemqflkgmfdfC+KnMHjvYx4vWJlyDu/kQl+p7P29+d1/z2KNi+KO3194mNfG5ag8D
	 t2EWzp19bCxzCMW2SbfDA368RHZJviDTfp1lZRyTBa2qfSS/H4vnhPSbHUTl7rrRFV
	 l51VaLUflgozNOHD1WaI4xOrGubWZikkG55oW4Zc=
Message-ID: <a162ddf0-3a6a-4c9f-8506-ff66974c2931@arm.com>
Date: Wed, 25 Nov 2026 13:20:53 +0000
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
Subject: Re: [PATCH 5/5] ARM: NOMMU: pmsa-v8: Fix off-by-one in
 __pmsav8_setup_region()
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
 <20261125025757.1159931-6-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-6-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 02:57, Brad Hawthorne wrote:
> __pmsav8_setup_region() rejects "number > mpu_max_regions", which lets
> number == mpu_max_regions through. Regions are numbered from 0, so
> that number names a region the MPU does not have. Reject it.
> 
> A Cortex-M33 can be built with 4 regions. Under QEMU (mps2-an505) with
> a 4-region MPU, QEMU logs "MPU region out of range 4/4" and the kernel
> takes an unhandled exception during the setup. With this patch the
> setup warns "MPU region initialization failure! -2" and the kernel
> faults later, in memblock_alloc_try_nid(), because RAM that region
> would have mapped has none. On an RP2350 board (Cortex-M33, 8 regions)
> the boot is unchanged.
> 
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the bug in review, wrote the fix, the QEMU tests,
> the board test and this changelog, and ran them; I reviewed the
> reasoning and the test results.
> 
> Fixes: 046835b4aa22 ("ARM: 8757/1: NOMMU: Support PMSAv8 MPU")
> Signed-off-by: Brad Hawthorne <brad@sim.vu>
> ---
>  arch/arm/mm/pmsa-v8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/pmsa-v8.c b/arch/arm/mm/pmsa-v8.c
> index 28cdc5468406..e5353a030731 100644
> --- a/arch/arm/mm/pmsa-v8.c
> +++ b/arch/arm/mm/pmsa-v8.c
> @@ -140,7 +140,7 @@ static int __init __mpu_max_regions(void)
>  
>  static int __init __pmsav8_setup_region(unsigned int number, u32 bar, u32 lar)
>  {
> -	if (number > mpu_max_regions
> +	if (number >= mpu_max_regions
>  	    || number >= MPU_MAX_REGIONS)
>  		return -ENOENT;
>  
> -- 2.43.0

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

