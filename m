Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612731;
	b=BVOTfyp9ThcMhkHwNUX4k6FWKTA5ukZu0mrcpTcQWgZtY4gSHeK2l0MV+nab6pXB4A82
	 0bKYONvwkdrBFuo6GB+NETQaudGhqmCDEZjKa62cQOk2lSzh9Gyq4EUKLIsZib/lZ/Id3
	 oeniqfwV/gR7GzzEaisuMOAqmiOFYm/6voTNtVkjnQ/t+pehvKgb9cGAmWY3XdxC8gLtz
	 xKphK+Lf6myzDYZzy9cZV+4+IuWR0MrUh8xBfrUl+valk0nCJxxx1New29C/VS3RSqbZo
	 D0fknzyCroYp4+nRrDoJy9zr5pTzVKR5Vx0dcyHofsQ/jhyLShPv3c/LSSsXScjxmGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612731;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2ma/EbgjJlNK07nvQvlAz6GaFYdt19XTiZ5E0MqXzFI=;
	b=xJDCbSC2Z2uVl448l77KokQp6A7gViH2sFuz1XYMbccm1vz7l+ZHTwdqBC/mmFObzn/2
	 jACY0WBnaudZGYzwEvEr8OGLBGY9fZXW40lg/IuXD5EzMtvsz4SUZC8B53au5FeCNnzSX
	 ckp01vLjgAjUuSg42/z7yWIlXv1skJMaOz5sQjgV7ptXGbI13J8JcIr4CZEDVeciintwf
	 n/JtT4WZiRYXmOZlyP5grbXhZR/Ntxs/PSPW4M2glAqKxeOnDLHH9a96Anuve3uk6N/TH
	 LtXCBJ8R3E8pLXp7K24O31ymsmFdr6GUVA3QpolptAIg8InpmTjIurkyBtyvUBHryuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bZZL0vp4;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30797606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30797606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bZZL0vp4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A05822F;
	Wed, 25 Nov 2026 05:18:47 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79C423F86F;
	Wed, 25 Nov 2026 05:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795612730; bh=JM58YbwXlaYErfQ/3tivOhPKKAEYmR9p/1aB6hZTuxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bZZL0vp4uIu/5CwAs9E1jpk07Qz4Z/LsHgDgAIrp5wdetENcRJMCdVLFDk16tryLC
	 p9al0WFpXujZv+eGAzMywAUUE9ZaPzqy1P/cgX3E1GYWUxSOTf9JNq9vAxRr/bnI/X
	 +Q9bGNEaQas1YOj8x0cM8M10w1rAt1hNvIOqEElE=
Message-ID: <3d441264-bf6d-4d42-9172-14da8781e54a@arm.com>
Date: Wed, 25 Nov 2026 13:18:47 +0000
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
Subject: Re: [PATCH 3/5] ARM: NOMMU: pmsa-v7: Fix off-by-one in
 mpu_setup_region()
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
 <20261125025757.1159931-4-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-4-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 02:57, Brad Hawthorne wrote:
> mpu_setup_region() rejects "number > mpu_max_regions", which lets
> number == mpu_max_regions through. Regions are numbered from 0, so
> that number names a region the MPU does not have. Reject it too.
> 
> Now that allocate_region() respects its limit, no caller passes that
> number. Tested under QEMU (mps2-an385): no change in behaviour.
> 
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the bug in review, wrote the fix, the QEMU tests
> and this changelog, and ran them; I reviewed the reasoning and the test
> results.
> 
> Fixes: 5ad7dcbe40ae ("ARM: mpu: add MPU probe and initialisation functions in C")
> Signed-off-by: Brad Hawthorne <brad@sim.vu>
> ---
>  arch/arm/mm/pmsa-v7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
> index f2ad0f3ff480..af0c71135a6e 100644
> --- a/arch/arm/mm/pmsa-v7.c
> +++ b/arch/arm/mm/pmsa-v7.c
> @@ -371,7 +371,7 @@ static int __init mpu_setup_region(unsigned int number, phys_addr_t start,
>  	u32 size_data;
>  
>  	/* We kept a region free for probing resolution of MPU regions*/
> -	if (number > mpu_max_regions
> +	if (number >= mpu_max_regions
>  	    || number >= MPU_MAX_REGIONS)
>  		return -ENOENT;
>  
> -- 2.43.0

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

