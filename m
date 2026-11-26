Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705754;
	b=r1zfHbOpmHmj4jkySBK4jckN00IB0X3aD8n8HpjqBXBSlrTd3wQbX0O4+DqeXRfqRmTS
	 GVn6UR508hz+FYxuvHJGSGOu7avewUZl4Jf88wXuhVqyvWOBzWo4U++Qc/nuFFtZrF8ZB
	 V0bFor7kf2uKfFMmhVHc0mLLKb7U6HFLVwfi+zT7kjRLb4gZT/q4Pma9NPR58H1X0hpRF
	 cXRpyFfhzSJfTbXP0sh8K5ShuzDT5p1rabqwXf9VtwmmFc5ziHezPB17/mA+VXGx7jCB7
	 HQ9ma60RBFCXiGG2X/8kRIpTO7+7NClT+pYl2CP3aGX9SYWvR1FU5mS/aJbW30efVUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705754;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ySVP4RDrhD51kApv2xgJAHw/0POy+NyJsJlKrfqs8fA=;
	b=c5xT8iKXm6LC0uOvzOSxwh7Sh3kcxRw7ohUnAsCB9NU8GMbugfB0nDZZWCC8TEL8N8If
	 Qg3gRtBz076g5QJxuoZCbm10ebrxTDrEQTHnV+Jk7X3Sjigkl1aJAkAC+J5xGi2NxcSIS
	 okXLHrrrFKnGBeMsMAsUOW2XM6scy7ZEBmpGA5X2e+zzzBjBpl6G0VnI7imZTJKV6DNaa
	 UqceNBsyCCK3nVMNLEehDjHU0nuYtJdzz1aKARSFMHnKkCiVJnaq/fOisWGj9qmABLG5u
	 NVcCfAF7d4AA0dqP6kMNiY+EcAsmifcV8UDNLnsGcV0LxZFZi8zY6XlRhyS1ppxAk3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Dgc1oi5U;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB6F606A682
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB6F606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Dgc1oi5U
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1B1E1BA8;
	Thu, 26 Nov 2026 07:09:10 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 265473F632;
	Thu, 26 Nov 2026 07:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705753; bh=CsbhZR+DTE4bqj+/JNAnKcAQgbRPHqcY7AEgvUGJ3fQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dgc1oi5UI7pPuxHLyBQVihGciL6RnbQNDE0sAuZWmthgA05mIb4CfyaXeNkgZxu1B
	 MZCRJ+dLEoOydz+hXjmB4wWoVq2dQPboGAZ/MoLGAh153UlE/gGJxjSmoJE4UXOwLQ
	 Cq1HWZ5e7LnrIleMr+lOhXGq4FqCFHVRALslQva0=
Message-ID: <1b6d3591-1752-4865-9c14-6c4ea8bad767@arm.com>
Date: Thu, 26 Nov 2026 15:09:10 +0000
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

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> Signed-off-by: Leo Yan <leo.yan@arm.com>
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

