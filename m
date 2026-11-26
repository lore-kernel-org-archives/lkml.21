Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705705;
	b=MEkaFL1LOCHn29EUSLO8HrVIp2asKJIbay6mo/NaOyLnw0CAVvYAGES5qNgwthxDJ3ZD
	 91CxDWCFEmmXYD8t7EbbcOcXyHSUwOTUNZnNLja/MkH5SxeJYGMIj2GkSJnSRUJU9NF+h
	 sJol1J65PQCM8D9P2QbeRL6aMwQAJLxAjNtldUH+eAfUfO3GgcOoR2qrFaoHw+PNU6d/s
	 87fk9f5upeCSKRvKeWqeXtWLulwEZjCU4XaZx/XkNQyi+dPXJgwNEqCVzn1UHyv5aW1AB
	 7qVpugCXKMPHbfqJDoRF1U1OzoQHj9mthvZ0MFdaFTD9jFkSjJFliIeiu+f6ELO4jhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705705;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=s10zdA63ZUkc/Ktd6fQza6WZn0Id1SGwFj4wAg5AooU=;
	b=0Ar4HPORpDNdh2lBeRivS4gC3t03FZoJmtoTsopJ4c5yRsOxKEORBawQKKhErUqrs4xl
	 5xmciAFAB82GF8du7VT9CQMDuWQyQtq89oMxcMSnizZBMYKxqrfwwbk+lgbPMf3ftOLOA
	 9zK2eJC/fXYO9iv3af+VEzWhye6QLW99vXlMybn6X2JPYUxxoCybURUtg9rdN+bGMWGJ1
	 SGmbc09CxF4KRtFs0htuWV67np+zwZqPPrLFOuMkHANRXG4evJLjARCmDbpCzqi4emd5J
	 f+nHWuzWtBGgbgoeosNV2WpPUqjUtcEiADihAOMtolYYwxSkyoNFCvC9sA1ZJ2H5Aog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=H60ILt51;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DD8606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DD8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=H60ILt51
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C484C1CE0;
	Thu, 26 Nov 2026 07:08:21 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A7D93F632;
	Thu, 26 Nov 2026 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705704; bh=WiE+GrqQlfy0dZcrGXC3bpTOEyYUUMzcbbF/wtNMzrg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H60ILt51+3vmoERJ93hXRhVn/lf/QkCWwvKlWccBnDuhZwSGF1ovkIG/NsKSe6xoZ
	 C4TMGRkJQOpuxQUYYvVKyOCcy1hnTdsjzEFQRM4I+2/bAN8fDpIGNC4gHB9JY6spv6
	 KBZmQOIxUH6pEgjypUQdx+iKDbY9rDDtqsjobYX8=
Message-ID: <25c6af3c-de2c-492f-bc15-213e19d1bc1d@arm.com>
Date: Thu, 26 Nov 2026 15:08:21 +0000
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
Subject: Re: [PATCH v2 05/23] coresight: trbe: Validate perf handle before
 using sink data
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-5-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-5-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> The TRBE IRQ handler calls etm_perf_sink_config(handle) before
> validating the per-CPU perf handle and its AUX transaction. This may
> dereference a NULL handle after disabling TRBE or access stale sink
> data after perf_aux_output_end().
> 
> Validate the handle and AUX transaction before accessing the sink
> configuration. Move the local buffer lookup closer to its use.
> Remove the warning for a NULL handle, which is expected after
> disabling TRBE.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 91fbdbad3676ffae399df0b4d4ddcd603a40e86c..a7c1037a048f5236598f8f3a7cc4f47bff9d329c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1150,12 +1150,18 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   {
>   	struct perf_output_handle **handle_ptr = dev;
>   	struct perf_output_handle *handle = *handle_ptr;
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	struct trbe_buf *buf;
>   	enum trbe_fault_action act;
>   	u64 status;
>   	bool truncated = false;
>   	u64 trfcr;
>   
> +	if (!handle || !perf_get_aux(handle))
> +		return IRQ_NONE;
> +
> +	if (!is_perf_trbe(handle))
> +		return IRQ_NONE;
> +
>   	/* Reads to TRBSR_EL1 is fine when TRBE is active */
>   	status = read_sysreg_s(SYS_TRBSR_EL1);
>   	/*
> @@ -1171,16 +1177,11 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	 * Ensure the trace is visible to the CPUs and
>   	 * any external aborts have been resolved.
>   	 */
> +	buf = etm_perf_sink_config(handle);
>   	trbe_drain_and_disable_local(buf->cpudata);
>   	clr_trbe_irq();
>   	isb();
>   
> -	if (WARN_ON_ONCE(!handle) || !perf_get_aux(handle))
> -		return IRQ_NONE;
> -
> -	if (!is_perf_trbe(handle))
> -		return IRQ_NONE;
> -
>   	act = trbe_get_fault_act(handle, status);
>   	switch (act) {
>   	case TRBE_FAULT_ACT_WRAP:
> 

