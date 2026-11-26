Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705251;
	b=Q7mIpJ4RHuPjB5qm/CYQV80JvQt7BuKwkBfftRQ9OjeFd94Xboi46nNhpPH+IaS6BOLU
	 T5I/1PH+QMJg3ObJPIZURcZSzLjbuRgO8RVnLMdefGp19ioLIKN1n6sEe1pNBV2lgH6cm
	 ZJ0ARRV8EBC9hB3Z/afWdP2CmTxWiU7JsndsP7+XIYQ9cWeVjjRHzpZoj5nVxzrZwX7a5
	 RIw1zecJebScKZLlZyHbKv/TF4nt3/AHLldDx/LhOnfBRrv3/Y2evsPFFo1UmFqvzrdh1
	 51WIGkOKNVIpY2qLIIzzG3qZc2Q1rRhX1o/ETcnUBbtJDMxdTgOPaydZTOSHcQ4Bteg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705251;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7vlfz2YIOMsDpcgqil+TjE1DMAtwKpgtIEmyD66S1fo=;
	b=XgWKA+9P+Q9jPK4PzzPcvWAII8bs+7GV9yhZsXuYaLQa3HSOhnNnnIuQTaErwprJPxSh
	 qYTil5hCsSi8fiWHMWsSf/Yhxqakhs7Lixau2VSxsHSIb7Xc5pgFZAlGJ6Ix8PSAnb7rG
	 z4N97P9swh3rwzrF6p0hMIRu6nW5PDKBFnUkLuep+nIcEPqTQhe6XKcyZSNuFzVSWM4AQ
	 +WrbPBnc42TS0Q209uHcZ2xzkCk3Qo+4R/XS7tbE/uvCf3nvJVYg9ZmhaPBcm5PCRwdkm
	 8Ks4cAJ5S05VcACrzDOv9gCDMa4amQvIQtqLBro5IAijABVZNoxr1CYBVo2+vwoanwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OrG3TV0B;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD60E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD60E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OrG3TV0B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35C811BA8;
	Thu, 26 Nov 2026 07:00:47 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BC1A3F86F;
	Thu, 26 Nov 2026 07:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705250; bh=0v9eO+W3RIJoIsk5MXrKv8kB1hjR+PMVi3bSCo2sPMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OrG3TV0BjDDQtO89hf9CzY5NHvPY5KIPoBbiZ1loHZloMGV1TxRlJyliVPydymdET
	 LS/WOwxi6aluc8ieVauOJeFcpwy48N/Ryx/GVcP2ayfjH/uiELcazNkhIQSWDLOqck
	 mtMfnyJ7AAwgRPsbjO+0n4Ap1HcH9Du9+BuR6oZ8=
Message-ID: <4dfed719-5f62-4ea3-8685-5dc4426ad3c9@arm.com>
Date: Thu, 26 Nov 2026 15:00:46 +0000
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
Subject: Re: [PATCH v2 16/23] coresight: trbe: Always classify TRBSR when
 updating buffer
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> arm_trbe_update_buffer() must account trace when perf stops a session,
> even if no maintenance interrupt has been handled. Prepare it for
> trigger and wrap modes by making the trace-size decision from the
> drained TRBSR status rather than gating classification on IRQ.
> Acknowledge IRQ only when it is set.
> 
> In FILL mode, reaching LIMIT sets WRAP and IRQ and returns TRBPTR to
> BASE. Interrupt delivery can be delayed, so update_buffer() may run
> before the IRQ handler. The existing IRQ-gated path uses WRAP to size
> through LIMIT in that case; preserve this while also classifying
> updates without a pending IRQ.
> 
> With classification on the no-IRQ path, a normal software stop can
> have TRBSR.S clear and an ignored detected trigger can set TRBSR.TRG.
> Neither should warn or discard valid trace. Mark fatal status as
> truncated and return zero. 


Use LIMIT for a filled WRAP and TRBPTR
> otherwise.

This is already the case, right. Please could we remove this bit ?
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 24 +++++++++---------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index ac49098aa08412a23a20d32f84c2e1977ee4a223..661f4a78e67c30652de8c834e4773819fa67b5ac 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -662,8 +662,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   	int ec = get_trbe_ec(trbsr);
>   	int bsc = get_trbe_bsc(trbsr);
>   
> -	WARN_ON(is_trbe_running(trbsr));
> -

Why are we removing this ?  Do we expect to be called with TRBE running 
? Both trbe_update_buffer and the irq_handler stops the trbe. So this
must be held valid ?

Suzuki



>   	if (is_trbe_abort(trbsr)) {
>   		err_str = "External abort";
>   		goto out_fatal;
> @@ -844,7 +842,6 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   	enum trbe_fault_action act;
>   	unsigned long size, status;
>   	unsigned long flags;
> -	bool wrap = false;
>   
>   	WARN_ON(buf->cpudata != cpudata);
>   	WARN_ON(cpudata->cpu != smp_processor_id());
> @@ -896,23 +893,20 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		 */
>   		clr_trbe_irq();
>   		isb();
> +	}
>   
> -		act = trbe_get_fault_act(handle, status);
> -		/*
> -		 * If this was not due to a WRAP event, we have some
> -		 * errors and as such buffer is empty.
> -		 */
> -		if (act != TRBE_FAULT_ACT_WRAP) {
> -			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> -			size = 0;
> -			goto done;
> -		}
> +	act = trbe_get_fault_act(handle, status);
>   
> +	/* If an error occurred, the buffer may be empty */
> +	if (act == TRBE_FAULT_ACT_FATAL) {
> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> +		size = 0;
> +		goto done;
> +	} else if (act == TRBE_FAULT_ACT_WRAP) {
>   		trbe_report_wrap_event(handle);
> -		wrap = true;
>   	}
>   
> -	size = trbe_get_trace_size(handle, buf, wrap);
> +	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);

>   
>   done:
>   	local_irq_restore(flags);
> 

