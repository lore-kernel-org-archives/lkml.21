Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705736;
	b=Mps7XNnwA9GSskW3jEeUXQu0jy+VLxQrLJpW854z/PgaOko9stGHOWxJ3UzZfFb5XFE7
	 GVXgxuVLUxB1FubsEY9Kk5Dt9MO+oZDTz9y28mdDJi2nvdzV1rSlpiw2T1GdbU/JEMqpJ
	 KX1NKrIM7+alNJIL1Z+t9dvEYJCmZ8N00kxIfw89wNbWzFC2i5tUGpNHXpeFXpfpLfZot
	 eGFyy0olsizLE1/gGXk4tGFCv347tn4MgZ5JDggrCUQpjbmXXmzdSaK6Hhzsy3hOT3u46
	 ZF756ZctFkWHgJnQSoOzAXVCpDNfQXpD1q3CoblraJpoQ0HJgnzf+pG9SsKR2OlN6cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705736;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wvxVJqSGVuApLTKz4mwcbmdNfV/hIsiHSvEl/vvD4v0=;
	b=rnZa50c21/AVeSht04Fj6cDv77GQYOTBu+Xo+OBEltW6FypJj29GC+mgjHt8FrZ5qoFx
	 g3pV5evtkPjwz8Qdn6Efczgx2mK0UHtY19SrHAptBCH/d6QOrda0f0V5FivYKsjo9E/O4
	 SlSnKcEE4egdgGv4FTJ3PrfrQS+Gr38up9HJEXIGhDwOM0YlsW29ylU2BaOGRCk1Vc2K4
	 rCw1GFbMtRSisxRstZZpDBIuC4jhr/MMNwAuCzNWdpb2M28PYaSOqUBCSvCWo3tQB/Av2
	 3OF++Fchc//BItuR7dEYPGXWCVqT2rsApWi/JP4eQL5IbZxT2KY90J71xv3xq2a6D9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T7GwDymH;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC4F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC4F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T7GwDymH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CBF41BA8;
	Thu, 26 Nov 2026 07:08:52 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF03A3F632;
	Thu, 26 Nov 2026 07:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705735; bh=Ue8IPCZ7z+Rz2AeoD4nUpDOU0+Z3z7tWnDkxEZZk624=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T7GwDymH4UHkJY/YJVw/9ZTUduCJO3dW7TCu5flRs77MiNEPaCTVOTd1NN1tjsfs7
	 lYn6PzvdUMmWVZzhgdlCJB4l1A/RaEFZd5uCV6cO/vX8LoSVjD1QNDo6jlDitupdIe
	 lRfYw5jAaBlv4pG6RIy1uy6Hbat1VhOgbHsl/JCk=
Message-ID: <be1b4244-3018-43a6-a4c1-ad49d3cba6be@arm.com>
Date: Thu, 26 Nov 2026 15:08:52 +0000
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
Subject: Re: [PATCH v2 07/23] coresight: trbe: Publish the session after
 successful enable
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-7-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-7-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> arm_trbe_enable() records the session buffer and perf mode before
> __arm_trbe_enable() can fail. CoreSight skips the sink disable callback
> when sink enable fails, leaving that session state published even though
> tracing did not start.
> 
> Install buf->cpudata temporarily for the buffer setup helpers, then call
> __arm_trbe_enable() before assigning cpudata->buf and cpudata->mode.
> Clear the temporary buffer association if setup fails; the inner helper
> still truncates and ends the AUX transaction.
> 
> After successful enable, retain the buffer association across AUX
> transactions and clear it in arm_trbe_disable().
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 979d0fa84c1c7b448c1ce5cd7a37dff8845795ef..9dfc6bb7afb4c42dfdec643ee7e4f2f193e2b70c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -69,6 +69,7 @@ struct trbe_buf {
>   	int nr_pages;
>   	void **pages;
>   	bool snapshot;
> +	/* CPU used to configure this buffer. */
>   	struct trbe_cpudata *cpudata;
>   };
>   
> @@ -137,6 +138,7 @@ struct trbe_save_state {
>    * @trbe_align		- Software alignment used for the TRBPTR_EL1.
>    * @cpu			- CPU this TRBE belongs to.
>    * @mode		- Mode of current operation. (perf/disabled)
> + * @buf			- Buffer configuration retained for the enabled session.
>    * @drvdata		- TRBE specific drvdata
>    * @errata		- Bit map for the errata on this TRBE.
>    */
> @@ -1033,17 +1035,24 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
>   	struct perf_output_handle *handle = path->handle;
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	int ret;
>   
>   	WARN_ON(cpudata->cpu != smp_processor_id());
>   	WARN_ON(cpudata->drvdata != drvdata);
>   	if (mode != CS_MODE_PERF)
>   		return -EINVAL;
>   
> -	cpudata->buf = buf;
> -	cpudata->mode = mode;
> +	/* Buffer helpers need the CPU association while setting up tracing. */
>   	buf->cpudata = cpudata;
> +	ret = __arm_trbe_enable(buf, handle);
> +	if (ret) {
> +		buf->cpudata = NULL;
> +		return ret;
> +	}
>   
> -	return __arm_trbe_enable(buf, handle);
> +	cpudata->buf = buf;
> +	cpudata->mode = mode;
> +	return 0;
>   }
>   
>   static int arm_trbe_disable(struct coresight_device *csdev)
> 

