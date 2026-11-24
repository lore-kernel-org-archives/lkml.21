Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525569;
	b=HhzUE7Kzs+t5+W6crE/OlR9IKfaxRxlIVzhcDKRJ1pjytCrTHiVo0uIVrOrOOvZLf+f0
	 +wm0v3N3anbNSyJJzJP3zEnxC646Vg+nLul06/rpxx6kglOXkA7qXPYPK9zDOUfFZNzig
	 v0vY6wh50wRvhCVWM5Mcrflz9IvSeuMbo9mAPnP1yy0SC5ImLibkaut52j2LPqtcDxvG9
	 IyX1jz+m0o37QNpKP/+k2Q5T2e9p8NmF3pkRhbKMXAxUrtIZdTw0R0/GWcyR8KpstQM9H
	 fDDGodmMe3GueB0MdWgkpO4uoAQU4+Oeec/6OaV6JXGLO9sIW6s0lJkFOLxpZjvUvbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525569;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ISTbz4wvFFAt6bzo0qkX0pE8/CfrFExmmIE+Q/E+mRk=;
	b=S+2K5LAisTONPuqaThojLB10EzEy/FPvjJV3mim70K5NB8ICF0Irn/WKlhgZZD2EbYVX
	 xjljj6zrhm8EUuifUVzSh5MECXoAQ5kgP2LuAp6fsQLFmZDcHJDUx1adZ1QKiwYcYxQk7
	 A3wPAIOn9N63pqJiWXaTYTa79422pOiT1CSUxSGM+P1CDXVFXTgHVlMgRxakf5JgmUV32
	 tSPjx4hsbIF75+n7PZeVmyXaaAoq+lOopXsJGnIKrkxZdYGB88osvxNibT5u5UDI7cEYg
	 8PCJUdf+Xsl+wgyqtZe+HKxR8mxGOZGheP71zgM0rNSxNcDlm2H9inNUJm6A9l5j30w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=c7i3xfZK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD36F606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD36F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=c7i3xfZK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94475339;
	Tue, 24 Nov 2026 05:06:04 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F3AE3F86F;
	Tue, 24 Nov 2026 05:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795525567; bh=KfcNb14BPbce/SMMQsbu3BnOADE88adplfkak0jlU4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c7i3xfZKuhYWfmc8XuthD9SjMtI8KP5JiTYsk//7UKJ7SUqxhDPCOk1lCAF75Z4GJ
	 F6spa/1VAV5pLsBL13FVJTxxgHFMSHzf9eWaP0yf4p4nxYEm45ENeCWFLOvjeBq4hL
	 dJfNqW7ezncp/U9hLs4gCQQIFxuYEQwoAogbIbok=
Message-ID: <09e172d0-3ef5-44ef-a966-7db3b8a4af9a@arm.com>
Date: Tue, 24 Nov 2026 13:06:04 +0000
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
Subject: Re: [PATCH] coresight: perf: End AUX output when an event is
 throttled
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Vlad Poenaru <vlad.wing@gmail.com>,
 Amir Ayupov <aaupov@fb.com>, Suyash Mahar <smahar@meta.com>,
 Song Liu <song@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 12:00, Leo Yan wrote:
> Perf throttles a group by calling each event's PMU stop callback with
> flags set to zero. On a CPU with a trace path, ETM stops tracing and
> leaves the AUX transaction open because PERF_EF_UPDATE is clear. When
> perf unthrottles the event, perf_aux_output_begin() warns because
> aux_nest is still set.
> 
>    [  181.161897] ------------[ cut here ]------------
>    [  181.161906] WARNING: kernel/events/ring_buffer.c:415 at perf_aux_output_begin+0x1dc/0x1f0, CPU#0:2
>    [  181.234120] arm-scmi arm-scmi.1.auto: timed out in resp(caller: do_xfer+0x1a0/0x558)
>    [  181.234223] cpufreq: __target_index: Failed to change cpu frequency: -110
>    [  181.286675] Modules linked in: panfrost tda9950 hdlcd tda998x drm_shmem_helper drm_client_lib cect
>    [  181.314139] CPU: 0 UID: 0 PID: 352 Comm: perf Not tainted 7.1.0-rc1-00058-gdca922e019dd-dirty #11
>    [  181.323915] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, B5
>    [  181.334732] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    [  181.341721] pc : perf_aux_output_begin+0x1dc/0x1f0
>    [  181.346547] lr : perf_aux_output_begin+0x9c/0x1f0
>    [  181.351280] sp : ffff800080003be0
>    [  181.354606] x29: ffff800080003be0 x28: ffff0008023fc000 x27: ffff4b45d287f000
>    [  181.361789] x26: ffff0009764787a8 x25: 0000000000000000 x24: ffff00080dc99710
>    [  181.368970] x23: ffffb4c334553000 x22: 0000000000000001 x21: ffff00080dc99710
>    [  181.376151] x20: ffff0009764787a8 x19: ffff000801cc6000 x18: 00000000ffffffff
>    [  181.383332] x17: 0000000000000000 x16: ffffb4c3a118c998 x15: 0000000000000000
>    [  181.390512] x14: 00003d0900000000 x13: 00000001ffff006e x12: 696765625f747570
>    [  181.397692] x11: ffffb4c3a52758d8 x10: 0000000000000108 x9 : ffffb4c3a117f620
>    [  181.404873] x8 : ffff800080003a58 x7 : ffff000808de4000 x6 : 00000000000fffff
>    [  181.412053] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
>    [  181.419232] x2 : 0000000000000007 x1 : 0000000000000000 x0 : 0000000000000007
>    [  181.426411] Call trace:
>    [  181.428868]  perf_aux_output_begin+0x1dc/0x1f0 (P)
>    [  181.433692]  etm_event_start+0xdc/0x290 [coresight]
>    [  181.438665]  perf_event_unthrottle+0x70/0xa8
>    [  181.442964]  perf_event_unthrottle_group+0x40/0x170
>    [  181.447871]  perf_adjust_freq_unthr_events+0x178/0x1a8
>    [  181.453038]  perf_adjust_freq_unthr_context+0x74/0xf8
>    [  181.458120]  perf_event_task_tick+0xa8/0x290
>    [  181.462418]  sched_tick+0x144/0x2c8
>    [  181.465937]  update_process_times+0xc0/0x198
> 
> End the AUX transaction with size zero on a throttling stop so
> unthrottling can acquire a fresh handle. Collect trace data only when
> PERF_EF_UPDATE is set.
> 
> Check AUX handle ownership before updating the buffer or ending AUX
> output. Drop the post-update check because the full stop runs with
> local IRQs disabled, which prevents the TRBE IRQ from closing the
> handle during the stop.
> 
> This patch is limited to fixing the event throttling case. Other issues,
> such as CPUs without a trace path and pending TRBE IRQs during sink
> teardown, will be addressed by the following patch series [1][2].
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20260915-arm_cs_support_aux_sample-v1-6-35cf6f297d20@arm.com/
> [2] https://lore.kernel.org/linux-arm-kernel/20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com/
> 
> Fixes: 9734e25fbf5a ("perf: Fix the throttle logic for a group")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 34 +++++++-----------------
>   1 file changed, 10 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 909bfd5960331d44547a028fde336f7819488a1a..e506116723c4ed723d66bc721021718b5d176117 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -698,7 +698,7 @@ static void etm_event_pause(struct coresight_path *path,
>   static void etm_event_stop(struct perf_event *event, int mode)
>   {
>   	int cpu = smp_processor_id();
> -	unsigned long size;
> +	unsigned long size = 0;
>   	struct coresight_device *source, *sink;
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
> @@ -757,33 +757,19 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	 * handle due to lack of buffer space), we don't
>   	 * have to do anything here.
>   	 */
> -	if (handle->event && (mode & PERF_EF_UPDATE)) {
> -		if (WARN_ON_ONCE(handle->event != event))
> -			return;
> +	if (!handle->event || WARN_ON_ONCE(handle->event != event))
> +		goto out;
>   
> +	if (mode & PERF_EF_UPDATE) {
>   		/* update trace information */
> -		if (!sink_ops(sink)->update_buffer)
> -			return;
> -
> -		size = sink_ops(sink)->update_buffer(sink, handle,
> -					      event_data->snk_config);
> -		/*
> -		 * Make sure the handle is still valid as the
> -		 * sink could have closed it from an IRQ.
> -		 * The sink driver must handle the race with
> -		 * update_buffer() and IRQ. Thus either we
> -		 * should get a valid handle and valid size
> -		 * (which may be 0).
> -		 *
> -		 * But we should never get a non-zero size with
> -		 * an invalid handle.
> -		 */
> -		if (READ_ONCE(handle->event))
> -			perf_aux_output_end(handle, size);
> -		else
> -			WARN_ON(size);
> +		if (sink_ops(sink)->update_buffer)
> +			size = sink_ops(sink)->update_buffer(sink, handle,
> +							     event_data->snk_config);

Could we retain the READ_ONCE() check to handle the TRBE case here ? 
This looks like introducing a regression. Something like :

		if (!READ_ONCE(handle->event)) {
			WARN_ON(size);
			goto out;
		}


>   	}


Otherwise looks good to me

Suzuki


>   
> +	perf_aux_output_end(handle, size);
> +
> +out:
>   	/* Disabling the path make its elements available to other sessions */
>   	coresight_disable_path(path);
>   }
> 
> ---
> base-commit: 8e3ac058be1b613aeabcb7ce18c142e4603cc5dd
> change-id: 20261124-arm_cs_fix_throttling_oops-140053eb0883
> 
> Best regards,

