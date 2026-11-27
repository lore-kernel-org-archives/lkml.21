Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792767;
	b=UtDDurNY+FShpRS1Dji85pqJoxCpAB92oJkh3BBdFpvIxIa30LrgFrfekT0OWwCc/jMe
	 4EYLaEnKba0ylGtBuNB/I8zkJ/T7+6EFvwtKqul2dO1B9KqOi4YnPFTNDiksQuBC6t7Uv
	 tbQdiMNS8RM+jfZHBeOlVwYvBqLwy7DF8fluJXFWilIYC6vV0qaUrm2V+tutp/psd0ykH
	 rVXvHliQr+WF30vI/HrK0v1DIBLEj7PvVVXkjjfilbHajD3PIg0eZSIqMtwLk2tPE6J7a
	 JGgr0jPDw40iU22oUudDtxxkwYGLw1bfafIbvL/Rkt7fI8wYxh6D4o3dwWobWZHncjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792767;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=w+bvO8L94MbR99EZPTdisowEtnBgJBIsl1FXhXNPe+4=;
	b=PXdkN2DVQODC7RQlCw32FALGNj9HsUN+mVlMz6hFDSrP+V1avVRCdWBxA6gu9eFGo2T7
	 VkLDoG9AcRtoR2t4MDAcL7uSlagTOZh4NVFIXktdOvEqFVWizmGCZR7KVzQ96uWOMotH7
	 FV3xzIoeIKBG8xIIjD9WDQ5bfd+ue7dKGXKhxGWg2NQn6fTqckbhFn9MXwmYj5uczF7Sp
	 wPTNGNw/NZia8xrv+Wd9UKlBSWBi+T+3/keBXt0qnXZmVQzFSjDeaA4a5TWk3EnmvdMKT
	 T0w51iamgALMRJlaEIJJAgj7MzQw8V4aLyXlEL6PzPCar9kpa8XY0otHdOGFjV1ZYYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XUUzxyi2;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52170606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52170606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XUUzxyi2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30A10169E;
	Fri, 27 Nov 2026 07:19:23 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A3B53F632;
	Fri, 27 Nov 2026 07:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792765; bh=6cLgsO7UXgi5ha39CFj+v3MC0SZqQUTqxialUDP9Zno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XUUzxyi2nkciM4jc6pOOx6202g7vH1u9DKGnQaVFAq6cyhD4Q0+u2gQ2FE/V7D3NC
	 5SMbxg+7aJwR79Krd/JbgbJ3bX7MpUDgQXZi1EARW0yPeo5WVs/kUS6oVHi/e/tJ2S
	 wGIs/Z5uPnUsQBaAzEDlU5HfPbhbz3gMcXbIYy4U=
Message-ID: <0cac6918-d7dd-4e2f-addf-17eb1200f1e3@arm.com>
Date: Fri, 27 Nov 2026 15:19:22 +0000
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
Subject: Re: [PATCH v2 11/23] coresight: trbe: Assign the perf handle in
 enable and disable
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
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-11-3f57cf3199b1@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-11-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> etm-perf owns the perf output handle embedded in its per-CPU etm_ctxt and
> passes it to TRBE through arm_trbe_enable(). TRBE binds that handle after
> successful sink enable and unbinds it in arm_trbe_disable(). The handle
> object remains valid throughout this interval, even if the current AUX
> transaction ends or a new transaction begins.
> 
> The inner enable helper currently publishes the handle, while truncation
> and failed rollover clear it. Sink disable leaves the handle installed
> after dropping the buffer association. These assignments track the AUX
> transaction rather than the enabled sink session.
> 
> Publish the handle only in arm_trbe_enable() after successful setup and
> clear it in arm_trbe_disable() before dropping the buffer association.
> Remove the assignments from the inner enable, overflow and truncation
> paths so the handle association follows the enabled sink session.
> 
> A valid handle object may have no active AUX transaction, so the IRQ
> handler continues to check perf_get_aux() before accessing the
> transaction's configuration.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 4a041bbc6e970d72a7d735e15f7221037cb091d6..1f51c33de83638479436683fd96e31d69c3b860f 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -303,11 +303,8 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
>   
>   static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   	perf_aux_output_end(handle, 0);
> -	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
>   }
>   
>   /*
> @@ -1012,7 +1009,6 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
>   	if (ret)
>   		goto err;
>   
> -	*this_cpu_ptr(buf->cpudata->drvdata->handle) = handle;
>   	trbe_enable_hw(buf);
>   	return 0;
>   err:
> @@ -1042,6 +1038,7 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		return ret;
>   	}
>   
> +	*this_cpu_ptr(drvdata->handle) = handle;
>   	cpudata->buf = buf;
>   	cpudata->mode = mode;
>   	return 0;
> @@ -1062,6 +1059,7 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>   	trbe_drain_and_disable_local(cpudata);
>   	clr_trbe_status();
>   
> +	*this_cpu_ptr(drvdata->handle) = NULL;
>   	buf->cpudata = NULL;
>   	cpudata->buf = NULL;
>   	cpudata->mode = CS_MODE_DISABLED;
> @@ -1102,16 +1100,12 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   	trbe_report_wrap_event(handle);
>   	perf_aux_output_end(handle, size);
>   	event_data = perf_aux_output_begin(handle, event);
> -	if (!event_data) {
> -		/*
> -		 * We are unable to restart the trace collection,
> -		 * thus leave the TRBE disabled. The etm-perf driver
> -		 * is able to detect this with a disconnected handle
> -		 * (handle->event = NULL).
> -		 */
> -		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
> +	/*
> +	 * If trace collection cannot be restarted, leave TRBE disabled.
> +	 * The etm-perf driver detects this through handle->event == NULL.
> +	 */
> +	if (!event_data)
>   		return -EINVAL;
> -	}
>   
>   	return __arm_trbe_enable(buf, handle);
>   }
> 

