Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705717;
	b=2lZHwHP9K3y/P4VTBUffCn0s/AyoBz29krx/XBkydtKHV44/IQpkjFIQq4Bekuzdp/1T
	 vUIKYKEmvjEleoUNdTJ6NjYGjIGp4k4JlvELK/Ib1tt9LpKDC8EWAcPvztNEerXsgqVnE
	 5fxgVb9qSI4MbYvYmrp1YO6uf311QOWwDTOwBKyv8kH2EqlAhESV2Drve1xBrK5Ts6Sng
	 9YIfny3WdSs6sL6H3kw0LAeUTx/SdzaD7irMQexu8B4mgJKdOKWra+GUoP9Lm0UOjV9ZF
	 drYbipO9l5U/gK0xvrUGGpGD6JsI/ITgz3zdo8ZgXFh0yhXJtNFO8qOrQKfBOtPrwFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705717;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fgxyB+n3QY03ZfRfTDTAK8x+vJ6Kgnl8jXSFnV7RL2E=;
	b=KY5phOqfQnkmOX8DBdk/OajHDFcCDf6sFjTO+1bclu+zNeY7hnJxOMGXSI9Maa8yx0ah
	 xvhK0664SFuxDH5XX1fx+a+YH4n+H8HWSbDWgiGh7pLU5lcMP5zNzNe9tn29L6OzFHwqN
	 QtqKYl+bejVf91xMmzMw8Z+rHS5ARDqbawiUiPoi7CCypNEAXnRKzdvFZ4xbrAsrnjX5y
	 Nh09d4vb0/u/BI6Rtdtb1z2LFJe3QScfa1kH/+3wzcwkUqU5E8V/BzWqhbtfos1sgiXiX
	 2mQR33xNujKcjMkTOavZQNmbPtCXQ16HQMknZLBUI+nYNmkwHn/Kf706slmupo2vWrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h5gWecEN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F23606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F23606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h5gWecEN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB2081C2B;
	Thu, 26 Nov 2026 07:08:33 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4586F3F632;
	Thu, 26 Nov 2026 07:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705716; bh=pcTtCG5MrLLjdL9Cf8YKjtiDMmisuJ1ywC/zUjGK40E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h5gWecENk6kSakIJsEri90wKvxyAhsFYtkk7vrvENr2wPd5wdcoJ9vQSUc18Ll15n
	 7gFze5rR9zhQhAhbTEp44gILci3gNaynyKdYMcOvBEvaFye2KorQkAoJUTtUEyweJJ
	 9F51vqM5jm+i4bfjy0Ir3ZXM+t3nZoPKz5VyDZVc=
Message-ID: <07b50f8d-b71a-4e96-bd4b-cf3973cca833@arm.com>
Date: Thu, 26 Nov 2026 15:08:33 +0000
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
Subject: Re: [PATCH v2 06/23] coresight: trbe: Drop redundant disable from
 enable path
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/2026 17:55, Leo Yan wrote:
> The Arm ARM (ARM DDI 0487 M.c) rule RDJMDD says:
> 
>   | When the following conditions apply, the PE might ignore a direct or
>   | external write to any of certain Trace Buffer Unit registers, other
>   | than a direct write or external write to TRBLIMITR_EL1 that clears
>   | the conditions:
>   | • TRBLIMITR_EL1.E is 1, and either FEAT_TRBE_EXT is not implemented
>   |   or the Trace Buffer Unit is using Self-hosted mode.
> 
> trbe_enable_hw() calls set_trbe_disabled() first to ensure TRBE has
> already been disabled before programming any other TRBE registers.
> 
> However, TRBE is already expected to be disabled before trbe_enable_hw()
> runs:
> 
>   1. CPU probe resets TRBLIMITR_EL1 via trbe_reset_local();
>   2. Interrupt handling disables the buffer before re-enabling it;
>   3. The normal disable path clears TRBLIMITR_EL1.E.
> 
> Calling set_trbe_disabled() from the enable path is therefore redundant.
> Drop the call from trbe_enable_hw(), which only needs to program a
> known-disabled TRBE.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index a7c1037a048f5236598f8f3a7cc4f47bff9d329c..979d0fa84c1c7b448c1ce5cd7a37dff8845795ef 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -652,7 +652,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>   	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>   	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>   	WARN_ON(buf->trbe_write >= buf->trbe_limit);
> -	set_trbe_disabled(buf->cpudata);
>   	clr_trbe_status();
>   	set_trbe_base_pointer(buf->trbe_hw_base);
>   	set_trbe_write_pointer(buf->trbe_write);
> 

