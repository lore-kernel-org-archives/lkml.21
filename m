Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446672;
	b=Gl5brT7JjbB/0DYRg4Hm2TY+Q+apKZKy2HyAW4izNcaYYOIxV6CpHKELZN+G7UCArSWm
	 r1VkTeRqfMh3Z99HE6SS2B6zVaAgOiW+xMKWksZaWGeVUWOePHPDiHqL1Bb5xATNXv7U5
	 pCisnGpbZ4O0utJSCTKwqpL+RXku5QHPcz9McE4ihwYvlvU0yyNkI220MnNx6zINRxxXD
	 F1piskt2ZeQoekshfdkVvH1KNiuZuzdAJ9i5Ad3Rc072JgftA5jo2I8C6DWEVFjNZIzNN
	 odUtoBD8cRKq7Uw6Wcz/ITIREY4XZUWla2dZcF9DfHygOIKa5EXq6KjZr+vbNKKpqmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446672;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=owbHfGV2nQrGcsQaLy/RU2gfSzpR3q6745LexKCM6PA=;
	b=n5ZPnaOw8IXCEvrGJygHMqlNdr19+V2wml5E6DRm54xRh4SRUYCLkECmnlgzIKJ3Rzbz
	 IlNnNEiouyZDQA6uxLO9/Hh+wqypzziflk2xcj6J1J3la2+Jye8qUBor71NekSapOayuj
	 mPaPn57o8ZxeEvfymw2QEvc/ZMxvRk8YpxO5XOfHVaPPBG/WSLugSJJNqWcFCqKEC5iC0
	 OpCcRDyqmfKASctA4Hh8X80KiXHCyN9cEsEDUBl6KgWq/yc5rd6PH+njT9kLyFXb7na2x
	 TvTFJ9y+FiDVg9kKew5VOjI3GbuIHEURzWl0LABHKaOF2bkNaGysChCxkMJ/bQpWtxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bXcDaqdt;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E35F606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E35F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bXcDaqdt
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C58181A25;
	Mon, 23 Nov 2026 07:11:08 -0800 (PST)
Received: from [10.57.63.212] (unknown [10.57.63.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 596863F632;
	Mon, 23 Nov 2026 07:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795446671; bh=FAc9pImUO33JMG9YrQtXteaNuISbSIl7JA/bta2lbQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bXcDaqdtO8I+YvAgu2FN+tvZNc1OP7xDVz7aC8X4tVnTlepQj08zWDDyUwKiUrTmW
	 TQCNv9FzbCZDpJPQjKGNgW6uiTgNQEM578oWf0vzTCPTZJi3FamFZqff8+fpqmXZTm
	 iFpWDGJ3Tzttt28RJcT/tnE0hM2Y4IaS1nn5Bwkw=
Message-ID: <12001e7c-f9d9-4be1-a4b5-8225ff1e44f4@arm.com>
Date: Mon, 23 Nov 2026 15:11:09 +0000
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
Subject: Re: [PATCH v7 6/8] drm/panthor: Implement sample handling
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nd@arm.com, =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20261011-panthor-performance-counters-v7-0-12c32495062f@arm.com>
 <20261011-panthor-performance-counters-v7-6-12c32495062f@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261011-panthor-performance-counters-v7-6-12c32495062f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/2026 18:36, Lukas Zapolskas wrote:
> From: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> panthor_perf aggregates counter and set requests coming from userspace
> and mediates interactions with the FW interface, to ensure that user
> sessions cannot override the global configuration.
> 
> From the top-level interface, the two types of samples are supported:
> clearing samples and regular samples. Clearing samples are
> a special sample type that allow for the creation of a sampling
> baseline, to ensure that a session does not obtain counter data from
> before its creation.
> 
> Upon receipt of a relevant interrupt, corresponding to one of the
> three relevant bits of the GLB_ACK register, panthor_perf takes any
> samples that occurred, and, based on the insert and extract indices,
> accumulates them to an internal storage buffer after zero-extending
> the counters from the 32-bit counters emitted by the hardware to
> 64-bit counters for internal accumulation.
> 
> When the performance counters are enabled, the FW ensures no counter
> data is lost when entering and leaving non-counting regions by
> producing automatic samples that do not correspond to a
> GLB_REQ.PRFCNT_SAMPLE request. Such regions may be per hardware unit,
> such as when a shader core powers down, or global. Most of these
> events do not directly correspond to session sample requests, so any
> intermediary counter data must be stored into a temporary
> accumulation buffer.
> 
> If there are sessions waiting for a sample, this accumulated buffer
> will be taken, and emitted for each waiting client. During this phase,
> information like the timestamps of sample request and sample emission,
> type of the counter block and block index annotations are added to the
> sample header and block headers. If no sessions are waiting for
> a sample, this accumulation buffer is kept until the next time a
> sample is requested.
> 
> Special handling is needed for the PRFCNT_OVERFLOW interrupt, which is
> an indication that the internal sample handling rate was insufficient.
> 
> A semi-static table maintains the mappings between the offsets from
> the base of a FW sample to the corresponding block type. Since the
> counter blocks themselves do not contain this information, this needs to
> be done in the kernel.
> 
> This table also handles the sparseness of the shader cores,
> wherein the physical core mask contains holes, but the memory allocated
> for it is done based on the position of the most significant bit. In
> cases with highly sparse core masks, this means that a lot of shader
> counter blocks are empty, and must be skipped.
> 
> The number of ring buffer slots is configurable through module param
> to allow for a lower memory footprint on memory constrained systems.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Co-developed-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c   |    5 +
>  drivers/gpu/drm/panthor/panthor_perf.c | 1075 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_perf.h |    2 +
>  3 files changed, 1069 insertions(+), 13 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index 76c346981150..c66ad658a95d 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
[...]

>  /**
>   * panthor_perf_init - Initialize the performance counter subsystem.
>   * @ptdev: Panthor device
> @@ -377,7 +1259,10 @@ static void session_set_state(struct panthor_perf_session *session,
>  int panthor_perf_init(struct panthor_device *ptdev)
>  {
>  	struct panthor_perf *perf;
> -	int ret = 0;
> +	struct panthor_kernel_bo *bo;
> +	struct panthor_perf_enable_masks *em;
> +	u8 *sample;
> +	int ret;
>  
>  	if (!ptdev)
>  		return -EINVAL;
> @@ -392,12 +1277,107 @@ int panthor_perf_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = drmm_mutex_init(&ptdev->base, &perf->session_lock);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_init(&perf->pend_lock);
> +
> +	ret = panthor_perf_setup_fw_buffer(ptdev, perf);
> +	if (ret) {
> +		drm_err(&ptdev->base,
> +			"Failed to setup FW ring buffer, disabling perf.");
> +		return -EOPNOTSUPP;

"disabling perf" isn't quite right - this fails the probe disabling the
device. If we expect this to happen we should consider handling it more
gracefully....

> +	}
> +
> +	sample = drmm_kzalloc(&ptdev->base, ptdev->perf_info.sample_size, GFP_KERNEL);
> +	if (!sample)
> +		return -ENOMEM;
> +
> +	em = drmm_kzalloc(&ptdev->base, sizeof(*em), GFP_KERNEL);
> +	if (!em)
> +		return -ENOMEM;

...but be aware that this is only ok because the probe fails and the
"managed" allocations are cleaned up - otherwise we'd be leaking memory.

> +
> +	bo = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
> +				      perf->fw_sample_size * perf_ringbuf_slots,
> +				      DRM_PANTHOR_BO_NO_MMAP,
> +				      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
> +				      DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> +				      PANTHOR_VM_KERNEL_AUTO_VA,
> +				      "perf_ringbuf");
> +
> +	if (IS_ERR_OR_NULL(bo))
> +		return IS_ERR(bo) ? PTR_ERR(bo) : -ENOMEM;
> +
> +	ret = panthor_kernel_bo_vmap(bo);
> +	if (ret)
> +		goto cleanup_bo;
> +
> +	perf->sample_workq = alloc_workqueue("panthor_perf_wq", WQ_HIGHPRI | WQ_UNBOUND, 1);
> +	if (!perf->sample_workq) {
> +		ret = -ENOMEM;
> +		goto cleanup_vmap;
> +	}
> +
> +	ret = drmm_add_action_or_reset(&ptdev->base, __drmm_workqueue_release,
> +				       perf->sample_workq);
> +	if (ret)
> +		goto cleanup_vmap;
> +
> +	INIT_WORK(&perf->sample_work, panthor_perf_sample_worker);
> +	perf->rb = bo;
> +	perf->sample = sample;
> +	perf->sample_slots = perf_ringbuf_slots;
> +	perf->em = em;
> +	perf->last_fw_sample_time = ktime_get_raw_ns();
> +
> +	INIT_LIST_HEAD(&perf->session_list);
> +
>  	drm_info(&ptdev->base, "Performance counter subsystem initialized");
>  
>  	perf->info = &ptdev->perf_info;
> +	perf->ptdev = ptdev;
>  	ptdev->perf = perf;
>  
>  	return ret;
> +
> +cleanup_vmap:
> +	panthor_kernel_bo_vunmap(bo);
> +
> +cleanup_bo:
> +	panthor_kernel_bo_destroy(bo);
> +
> +	return ret;
> +}

[...]

>  void panthor_perf_unplug(struct panthor_device *ptdev)
>  {
> +	int ret;
>  	struct panthor_perf *perf = ptdev->perf;
>  
>  	if (!perf)
>  		return;
>  
> +	scoped_guard(mutex, &perf->op_lock)
> +		ret = perf_disable(perf);
> +	if (ret)
> +		drm_err(&perf->ptdev->base, "Failed to disable performance counter sampling!");
> +
> +	disable_work_sync(&perf->sample_work);
> +
> +	panthor_kernel_bo_vunmap(perf->rb);
> +	panthor_kernel_bo_destroy(perf->rb);
> +
>  	ptdev->perf = NULL;

unplug sets ptdev->perf to NULL, but...

>  }
>  
> @@ -809,9 +1853,14 @@ void panthor_perf_pool_destroy(struct panthor_file *pfile)
>  	if (IS_ERR_OR_NULL(pool))
>  		return;
>  
> +	if (!pfile->ptdev->perf)
> +		return;
> +

...that means we don't clear up the sessions below. Including not
performing the pm_runtime_put_sync().

>  	xa_for_each(&pool->xa, handle, session) {
>  		xa_erase(&pool->xa, handle);
> +		panthor_perf_session_remove(pfile->ptdev->perf, session);
>  		session_put(session);
> +		pm_runtime_put_sync(pfile->ptdev->base.dev);
>  	}
>  
>  	xa_destroy(&pool->xa);
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> index 641a88edd75a..0e1172dbae39 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -28,5 +28,7 @@ int panthor_perf_session_start(struct panthor_file *pfile, u32 handle, u64 user_
>  int panthor_perf_session_stop(struct panthor_file *pfile, unsigned int sid, u64 user_data);
>  int panthor_perf_session_sample(struct panthor_file *pfile, unsigned int handle, u64 user_data);
>  
> +void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
> +
>  #endif /* __PANTHOR_PERF_H__ */
>  
> 

Thanks,
Steve

