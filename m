Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612341;
	b=XwV04Sa4tYhirIVVIChdN4z7vNxARJ8GrETdG0CMh1cjvFGuI4u36Tu/RDuz6LYeR39s
	 ytRsGwKGFNAlh6as3MjsV0eAP8ot7blv/CpsE2eqOuHTBj5CqPStEV81RirmgMreRvrEt
	 VFf03vJaQQ1Si1ai0uLC0IdqI0BJMjeujGVtU8AGMgqzpUc1Pjiidmju2jyDk+G+f0Dj3
	 kNaZumUZaBJ758kpynIbFfevYuSpIf+FqTRd047P+ma6YUIP34jdsWcnijT6TJ5p+j4aX
	 1I7t4CFyZNN1SEQWgjauPhYtXLDfvE0mI9KAlfjk18spKrPQgfkR4YAl9B2XXGZL8vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612341;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aVLTDwFYWlqCWizPHhyCpymH+pYWjeFCqRXH0aPZ1ds=;
	b=qg6K+YHeYHadSHGt1+LZul+fUuoJkXEdWOSWrdXwxdx6bzzSCtQ8zeT2rWTTMO1gqPgp
	 jpn8izV2CjEyk8LCFOypFE8+bKsXfu3j7H5lI107ETpdJgd/V9vzNlSnaFMObxRakNnBu
	 nb+hLlhcSer/Wg3KYaSj3pdaZWR9CAPzrm1biKNzyGil3a1j+3MTwJDLhAu5Bw9HDEMpa
	 sKDS+vFANaGgRXJp3KIhanxtXb1OmqpdBO6JKf/tWBHeKwg2dR/0o2rjWKnNsIRTmIChV
	 U2GbCxleyxvgza2o17o97BDRaJ68trBvtBjjl4QoNr900hxJyFTmtLGkRJeDOirP2yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KUp8PjMC;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49018606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49018606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KUp8PjMC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E24C2F;
	Wed, 25 Nov 2026 05:12:16 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C8183F86F;
	Wed, 25 Nov 2026 05:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795612339; bh=mW1ACO0Drqr0fPnzZSDbL9SOfYPnPyiIuS9DX+azukI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KUp8PjMCDPoQxQ62nO0fBsjF0DPNeoGM0+ahMPpMfct/8y0r0+q4zzUubji9QLlOm
	 s0Bi8L9qbYi/ZMEcxVeXvWkTpd/pD2Xu5eaSs4qtfvgHF74Wuy92CIik8TtW87WSIr
	 c3jrU5gyQImjU8wUsxwaTYBeYfUc3MGtrtdNZJhs=
Message-ID: <2f02f0b1-73b0-48ef-995a-b844bacefac2@arm.com>
Date: Wed, 25 Nov 2026 13:12:16 +0000
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
Subject: Re: [PATCH 1/5] ARM: NOMMU: pmsa-v7: Do not probe the region order on
 M-class
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
 <20261125025757.1159931-2-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-2-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 02:57, Brad Hawthorne wrote:
> __mpu_min_region_order() finds the minimum region size by writing
> 0xFFFFFFFC to the region base register and reading it back. That
> works on R-class, where the low bits are reserved. On M-class,
> MPU_RBAR bits [4:0] are VALID and REGION, so the write selects region
> 12, which an MPU with fewer than 13 regions does not have. QEMU
> (mps2-an385, 8 regions) logs "MPU region out of range 12/8", the
> read-back is 0, every RAM region fails, and the kernel panics:
> 
>   Kernel panic - not syncing: MPU region initialization failure! -12
> 
> Region 12 is outside the permitted values on hardware too. If the write
> lands, the read-back returns the current region number in bits [3:0]
> (MPU_RBAR, Cortex-M3 Devices Generic User Guide), so the probe returns
> order 2 instead of 5. Nothing checks against that, so the bug can go
> unseen there.
> 
> On M-class the minimum region size is fixed at 32 bytes, so return
> that order without probing.
> 
> Tested under QEMU (mps2-an385): the kernel now sets up the MPU and
> reaches user space. Not tested on PMSAv7 hardware.
> 
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the bug in review, wrote the fix, the QEMU tests
> and this changelog, and ran them; I reviewed the reasoning and the test
> results.
> 
> Fixes: 9fcb01a9f54c ("ARM: 8711/1: V7M: Add support for MPU to M-class")
> Cc: stable@vger.kernel.org
> Signed-off-by: Brad Hawthorne <brad@sim.vu>
> ---
>  arch/arm/mm/pmsa-v7.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
> index 59d916ccdf25..a20a43867210 100644
> --- a/arch/arm/mm/pmsa-v7.c
> +++ b/arch/arm/mm/pmsa-v7.c
> @@ -341,6 +341,10 @@ static int __init __mpu_min_region_order(void)
>  {
>  	u32 drbar_result, irbar_result;
>  
> +	/* On M-class, writing MPU_RBAR selects a region; the minimum is 32 bytes */
> +	if (IS_ENABLED(CONFIG_CPU_V7M))
> +		return 5;
> +
>  	/* We've kept a region free for this probing */
>  	rgnr_write(PMSAv7_PROBE_REGION);
>  	isb();
> -- 2.43.0

Well, minimum is not the same as implemented. I still prefer
architected discovery:

| Software can find the minimum size of region supported by an
| MPU region by writing all ones to MPU_RBAR[31:5] for that
| region, and then reading the register to find the value saved
| to bits[31:5]. The number of trailing zeros in this bit field
| indicates the minimum supported alignment and therefore the
| supported region size.

Which can be done with something like below (untested):

diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
index 59d916ccdf25..b746a4e6f9fa 100644
--- a/arch/arm/mm/pmsa-v7.c
+++ b/arch/arm/mm/pmsa-v7.c
@@ -340,20 +340,21 @@ static int __init mpu_iside_independent(void)
 static int __init __mpu_min_region_order(void)
 {
        u32 drbar_result, irbar_result;
+       u32 mask = IS_ENABLED(CONFIG_CPU_V7M) ? GENMASK(31, 5) : GENMASK(31, 2);

        /* We've kept a region free for this probing */
        rgnr_write(PMSAv7_PROBE_REGION);
        isb();
        /*
-        * As per ARM ARM, write 0xFFFFFFFC to DRBAR to find the minimum
+        * As per ARM ARM, write 'mask' to DRBAR to find the minimum
         * region order
        */
-       drbar_write(0xFFFFFFFC);
+       drbar_write(mask);
        drbar_result = irbar_result = drbar_read();
        drbar_write(0x0);
        /* If the MPU is non-unified, we use the larger of the two minima*/
        if (mpu_iside_independent()) {
-               irbar_write(0xFFFFFFFC);
+               irbar_write(mask);
                irbar_result = irbar_read();
                irbar_write(0x0);
        }

Cheers
Vladimir

