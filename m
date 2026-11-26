Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705680;
	b=L3UvFSNo7lDX4hRGM+L43zndjJbzYWuLXGGo1Qz8XjGgk0deBPweoOQ7KSw6YDZLTY5d
	 bODMQk2vsIcJyK1CI1yAcyUIThxO5HFf3h6pQYtKfUfr0KEKzQIc+F4MCNkFrVUE5Rz2L
	 jiETmfF0G73j2SmAtgrDQ/uAOapVeOcj7e2AEKEqXNrQE8yTOwyn4xhWQxWgTOZGsypr5
	 kgB9QEJRsg3nbqHSMuFKG/p6rIHMw/omTyCQSjsVoqXYecxNvMbZnaTSEZY8UGcZxLdkD
	 Pw2BNDKqflVlgjwbrsUzoaPXIFGqoXWYayGuwcy+HKDfa1IqdU1cibLvAKp3IFqlN0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705680;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qd0IyWJWgxFJe6K8lzcJgYPZmz94vxmtfSOmYUc+AOM=;
	b=21PwgY9u8u1fM/B6NaB1cPvJ8oCumWzm1rjCmqn5IMP0Yhx18PbTc5s1HnoNxgQW8Yyb
	 1vmZD6OxbAkxW4hbZ0noCPWuKlBEXdrNSOJCQaQc2xbOm82LJaWwUMauT4S9u4EH1+eR+
	 psfwo50+1CeEER9RqwD9T3wHhJflq79pG1SSOEGtS1Zv5B1rzwHiUv2RAaixngVWT/IuO
	 JbNXEwC3bU77a3r/ci5SdX0YtVO+ezyXCbdeXQnE+rLstWNMeK2Mtlo0eMYExIlPq5Txe
	 1NsboK/II7fjJdACZwOBQOu7/AUBMlVOA5nVpiFrEBhL/aJsfpoxE/ozK6TUhjf5Q2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tTO9PAEe;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A153A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A153A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tTO9PAEe
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 398771BA8;
	Thu, 26 Nov 2026 07:07:56 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BEB53F632;
	Thu, 26 Nov 2026 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705679; bh=yQ6/kuCwtsRfnXsHazLqO0maiTSknyF6p3TOO6ky2Ps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tTO9PAEe1PjMP0IJdFKLEuBNbbvARlV69XER9fQOARBLUAR27kVUcaM6+LcdVs1LB
	 ET7l3FoBIvDXL3zarrqtX7XWYoF0FXFdQaCjeCRimPM2lj1q35JG22+cmX6FNwhXTw
	 x7+nHCqhRWPP5Yiyh6sf1mL57n3U6HZvtdQyBlVs=
Message-ID: <af91df31-bba3-43f7-a739-996d11422f96@arm.com>
Date: Thu, 26 Nov 2026 15:07:55 +0000
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
Subject: Re: [PATCH v2 03/23] coresight: trbe: Use helpers for checking errata
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-3-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-3-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> Use the existing helpers for checking errata instead of open coded
> equivalent.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 02d12445763a86d58c79bdf5143f761827456bc3..8ec0b4c4987f25d10ee0b2f80c27e10f76357387 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -738,7 +738,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
>   	 * the space we skipped with IGNORE packets. And we are always
>   	 * guaranteed to have at least a PAGE_SIZE space in the buffer.
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE) &&
> +	if (trbe_may_overwrite_in_fill_mode(buf->cpudata) &&
>   	    !WARN_ON(size < overwrite_skip))
>   		__trbe_pad_buf(buf, start_off, overwrite_skip);
>   
> @@ -961,7 +961,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
>   	 *  - At trace collection:
>   	 *     - Pad the 256bytes skipped above again with IGNORE packets.
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
> +	if (trbe_may_overwrite_in_fill_mode(buf->cpudata)) {
>   		if (WARN_ON(!IS_ALIGNED(buf->trbe_write, PAGE_SIZE)))
>   			return -EINVAL;
>   		buf->trbe_hw_base = buf->trbe_write;
> @@ -985,7 +985,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
>   	 *     - Adjust the TRBLIMITR.LIMIT to leave the extra PAGE outside
>   	 *       the TRBE's range (i.e [TRBBASER, TRBLIMITR.LIMI] ).
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_WRITE_OUT_OF_RANGE)) {
> +	if (trbe_may_write_out_of_range(buf->cpudata)) {
>   		s64 space = buf->trbe_limit - buf->trbe_write;
>   		/*
>   		 * We must have more than a PAGE_SIZE worth space in the proposed
> 

