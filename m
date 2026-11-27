Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775529;
	b=0fbBnmmSairSnDwudIFIx/xqC+yoY0xFwA4M1TpPPEQKKMD9GT9GQEACLGU2VrrbnJdu
	 K1sCt0TiEzNvh4m8LGi7aQ/+SB1X1JXtc2wOG6jUGzq4t+ib6to//OkWwZBb1ZbL8IDqp
	 tUWlLZzCxpm5Yhk9JtNuE9kj2mrC+88EiCSRKusov9WGZAos7V4+YTtfhgFQgN+oXsNbW
	 KcDNg9asXWV2SiS5Jb8BjGO9ju4dhAlwMJx5ZYUv2vy+skNtMInXua5XiGLjW9khJr2sj
	 isgXqwCLCkK5ctL42l9zHb31sQNGzvFGeh4raqAGmz8jlJ8pVrof1LLreFzpGLbemfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775529;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=06zzXwIW3I1VPFNgtYMvEWIBr/XXYDkHvtUDGSNv6OE=;
	b=Ef2dbBITRaGt8Znk8MPyaaMlNQQYLMaIztGmqyavGCw0JQPzNo0Gfo1Mvf8rrpuxXdde
	 xRqVhs+JwNjIKplCad2h9y2xFXjz40ME5jKh+gGdJw9oma+yJqN0Ki5TwUH0MJ8kGjlf7
	 edkuf3eX0BaEfvtKu0sqV3vVnFrmgByxbofSueme3rciXN/iGIhdVsTFt7+ZPrzcMV0cN
	 G2jU74PrbiTTBYWFn1EMYpMZrUvHfFtAI9Wk7R7r5G+O+piS//d+Iw1r/TC1bnqaMj/Qj
	 pY/PYJz0LrqCwiOOz3wgokg6VVWGHD3++olXrJzhayRQ8gb5x1tnDx3vlG2z8xdw1Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="F+URV/Gd";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D1C606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D1C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=F+URV/Gd
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAC9B1756;
	Fri, 27 Nov 2026 02:32:04 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 253083F86C;
	Fri, 27 Nov 2026 02:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795775527; bh=chASf/urfNl2ikaVYJ/SelPybEFH9i/SJ8m0tJNVg6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F+URV/Gd0w5wHeP6hZoLc/b4BtVw11ZkT6FJyv32CDUg64mLIoHFo0ZNv9Uipo/ip
	 ePSVsVR78Bp9xytPsTnwGfIcptZux/ivBAR9s2R1pPrYyIu3tXw9dlAaiJvbshoxtr
	 7GQWVFzLgHTs2WDC9PJZFFsy2dsEs+N94eeogbG0=
Message-ID: <bf5fbffb-6d78-4485-be56-7a213648953d@arm.com>
Date: Fri, 27 Nov 2026 10:32:04 +0000
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
Subject: Re: [PATCH v2 10/23] coresight: trbe: Drop redundant disables
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-10-3f57cf3199b1@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-10-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> The IRQ handler has a common point that disables TRBE before dispatching
> the fault action. Once execution reaches the overflow handling or
> truncate path, the trace buffer has already been stopped.
> 
> The __arm_trbe_enable() error path does not need a disable there either,
> as TRBE is already in disabled state.
> 
> Remove TRBE disable from the truncate helper and from the overflow
> failure path. The truncate helper only needs to mark and end the AUX
> output, so rename it to trbe_truncate_event() to reflect its remaining
> purpose.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index dd9c9330bb0c739795f300dafc6ce34e72fbf280..4a041bbc6e970d72a7d735e15f7221037cb091d6 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -301,18 +301,10 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
>   }
>   
> -static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
> +static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   
> -	/*
> -	 * We cannot proceed with the buffer collection and we
> -	 * do not have any data for the current session. The
> -	 * etm_perf driver expects to close out the aux_buffer
> -	 * at event_stop(). So disable the TRBE here and leave
> -	 * the update_buffer() to return a 0 size.
> -	 */
> -	trbe_drain_and_disable_local(buf->cpudata);
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   	perf_aux_output_end(handle, 0);
>   	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
> @@ -1024,7 +1016,7 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
>   	trbe_enable_hw(buf);
>   	return 0;
>   err:
> -	trbe_stop_and_truncate_event(handle);
> +	trbe_truncate_event(handle);
>   	return ret;
>   }
>   
> @@ -1117,7 +1109,6 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   		 * is able to detect this with a disconnected handle
>   		 * (handle->event = NULL).
>   		 */
> -		trbe_drain_and_disable_local(buf->cpudata);
>   		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
>   		return -EINVAL;
>   	}
> @@ -1208,7 +1199,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   		trbe_handle_spurious(handle);
>   		break;
>   	case TRBE_FAULT_ACT_FATAL:
> -		trbe_stop_and_truncate_event(handle);
> +		trbe_truncate_event(handle);
>   		truncated = true;
>   		break;
>   	}
> 

