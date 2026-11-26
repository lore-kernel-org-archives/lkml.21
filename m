Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691962;
	b=AMrdohvRnTNw8PhNudFGUnTFQzqmyWKFO4vpClchU96LNoofdQiQQm22rjtJuxaxZtzf
	 c/EdGh8iYjtgkTUN8Kq9ajEXqNWBh7fvbZo9FNGYMHt/sf5Af0nUhP6fLvaB9tAiBBOIm
	 rNNlYLGlkD4GluUIVq5PV0396BKUYp0Yk/mQYUVWIp3nOtRIXECPtviVwhx+Q/vRU4xbg
	 EXuqy3hEIyAn9eA8J1aRfaymCu84aYe923wxvszO5RlfrYk0dz1YKKUqQ+ioXe546ilQM
	 /6nSLNGuA79rkpO4HB8zaOS/niy6Xcg/hjdvKvE/jaZY9zPq2aY7uWbL8eC94APEQZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691962;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=18CgUgPBF0j6yrFg8qVwRx3rkky6jbAeeIdauXdTqV0=;
	b=FeVnEIL/eedMDpC2RVeg1V0RhQ75FY7cM6ICod6BqVDONUoacVe9OSxgBwXwN+v+4qHp
	 MjbIou8Q/wYmr90pHCvXQ+zaPvUK72vXfao3HTG6+KWDDPze4L90x0HYKc19IER+auqes
	 9QBu0X93FcCYbSY0DfkQme6A3PIDYpi3JnMC1Y84jizhOOoiV7hbfhqCmeuV/m3vykT6N
	 aSMOoYjCFO9fnA0tiMm9kfrFhYaEPWwXoh1mosEAMBEhmjoLweQh1KZh8ABawebUt4KwJ
	 5NVDJOxGKnWQ1pOLaOLTWrmZBapAt5woIA82ArkO9uBK+i/30tobQGIlJpDmYVsyXXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mzD1LFi3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A926A606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A926A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mzD1LFi3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F20961BA8;
	Thu, 26 Nov 2026 03:19:17 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 271A03F632;
	Thu, 26 Nov 2026 03:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795691960; bh=iTQoIOfi51AC8tveJvkY57eCnmH4Xs812RqGdysXL5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mzD1LFi3UwyqDxPDVQ1l6dP+K3uVO+MeB+NWjhVGPlVEB64cIn1CBMVR3kFiPceW3
	 UdPcBOsu6nbTAxxK3kxQQnYsTdQnILASfZ+zZQE0SKtPVkE98uzNHSXjF2gGCc1EpW
	 Cz4jkNEbWowG6SR0hUvYFaoL9WMFY0wqyMpmdZKY=
Message-ID: <718f6c8c-71cd-414b-9ac1-11528dc35f24@arm.com>
Date: Thu, 26 Nov 2026 11:19:17 +0000
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
Subject: Re: [PATCH v2 08/23] coresight: trbe: Clear stale external abort
 status
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-8-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-8-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leo


On 16/10/2026 17:55, Leo Yan wrote:
> clr_trbe_status() clears the buffer status and syndrome fields, but
> leaves TRBSR_EL1.EA unchanged. After an external abort, this indication
> can survive into a later perf session on the same CPU.
> 
> Clear EA along with the other status fields while TRBE is disabled.
> The status captured for the current fault remains available for
> classification, so external aborts are still handled as fatal.
> 
> Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
> Signed-off-by: Leo Yan <leo.yan@arm.com>

minor nit: In the future, please keep all the "stable" fixes at the
beginning of a series. That allows people to apply them without the
other dependencies (even though this one doesn't) and allows maintainers
to pick up the patches from a series (without applying the entire
series).

Cheers
Suzuki


> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 9dfc6bb7afb4c42dfdec643ee7e4f2f193e2b70c..26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -608,6 +608,7 @@ static void clr_trbe_status(void)
>   	trbsr &= ~TRBSR_EL1_IRQ;
>   	trbsr &= ~TRBSR_EL1_TRG;
>   	trbsr &= ~TRBSR_EL1_WRAP;
> +	trbsr &= ~TRBSR_EL1_EA;
>   	trbsr &= ~TRBSR_EL1_EC_MASK;
>   	trbsr &= ~TRBSR_EL1_BSC_MASK;
>   	trbsr &= ~TRBSR_EL1_S;
> 

