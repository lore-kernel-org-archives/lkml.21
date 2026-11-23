Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446667;
	b=mYe85CndrSo1EVO1QOZxVPatYBJZ/SFI6sMmTm4ekrzkiqAqswG5WrYMR7v3C+aMHFzV
	 8X7zIzUlNrdzdCZB9ewzlZGaHAOpOSf0p4OZe/VkPdrzLYaBNlDvIk9jP752gftiLSn9l
	 yAZ5VCPaIk52JcPnaFFT2q4Fst+EAK7ckN8mLUXRQ6rXfarZpKJ0F1rD+AgAwShIezJLK
	 GulARPI+0pl/IBTtx3dhFtrkkJ3wW+AA4d47g7Hpxo4fsN4xRo6iIAguLgVLLjYgesCMI
	 UNSXwJ8C8+2lkeqA0Zq1M7rG9EY5q+YDLSa0xmkkRDOrzw9TFfropFb5quWLXup+72Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446667;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0f43kva3JnPNZIo4MkOphqg9NfyeNtnXCj3+kANMNKY=;
	b=cNtQ4Y9XG82PZrIjcU0qda+G3lksQWdwRK78hHuYuN0EBzvO7D10QMqZUmPCsQiwdBTO
	 eYg+L+k8rRlfUCDhwxpJOTyhLv9gM6rC1/zPDyCJbSmGa86yXg8dUNk4C1qt/ltpqDGj8
	 Qaq2FxSCQ0g3JI+Z9003gzw9neBYSDIa9HsgCKldJAtXlITXPDEM40H9gEmOIhs97HNny
	 GAiW+ByFRyHAChsq/2be/2acy7FDHXm4tb56wynS4ulP1b0pHMFT8ceUfyy3LWG+9Rstg
	 0wbVfKHIYwrdxrAwIdel6ZBjsMjd+tw+6xqMyCmDHBrg03JSzV2/c85/X/o7m6jyb0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="EJ/+0Trp";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBED606A335
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDBED606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EJ/+0Trp
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58E7619F0;
	Mon, 23 Nov 2026 07:11:03 -0800 (PST)
Received: from [10.57.63.212] (unknown [10.57.63.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EB193F632;
	Mon, 23 Nov 2026 07:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795446666; bh=IpSqJ4KJv0CHrLNqzVscN5CM6p8mgmVvtxNtKC0YMYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EJ/+0TrpY//IlNkmSNPKdVi4fCItrGqq5rKJ+9KvLZEMdtVffCGcXw3prJVD+kE9h
	 25tqfBvu8sp0mkSzFHPpE9ves6yzxuyeD6rAakncFrixvPiBlMFLJbliV+KxZLJU2X
	 5n5Zdjow47cEE8pZ15uufNt7C77oKdlVguc94I6w=
Message-ID: <4265cf08-2b1d-4b06-be25-5039b6bb6f42@arm.com>
Date: Mon, 23 Nov 2026 15:11:01 +0000
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
Subject: Re: [PATCH v7 5/8] drm/panthor: Introduce sampling sessions to handle
 userspace clients
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nd@arm.com
References: <20261011-panthor-performance-counters-v7-0-12c32495062f@arm.com>
 <20261011-panthor-performance-counters-v7-5-12c32495062f@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261011-panthor-performance-counters-v7-5-12c32495062f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2026 18:36, Lukas Zapolskas wrote:
> To allow for combining the requests from multiple userspace clients,
> an intermediary layer between the HW/FW interfaces and userspace is
> created, containing the information for the counter requests and
> tracking of insert and extract indices. Each session starts inactive
> and must be explicitly activated via PERF_SESSION_START and
> explicitly stopped via PERF_SESSION_STOP. Userspace identifies a
> single client with its session ID and the panthor file it is
> associated with.
> 
> The SAMPLE and STOP commands both produce a single sample when called,
> and these samples can be disambiguated via the opaque user data field
> passed in the PERF_SESSION uAPI. If this functionality is not desired,
> these fields can be kept as zero, as the kernel copies this value into
> the corresponding sample without attempting to interpret it.
> 
> Currently, only manual sampling sessions are supported, providing
> samples when userspace calls PERF_CONTROL_SAMPLE, and only a single
> session is allowed at a time. Multiple sessions and periodic sampling
> will be enabled in following patches.
> 
> No protection is provided against the 32-bit hardware counter
> overflows, so for the moment it is up to userspace to ensure that
> the counters are sampled at a reasonable frequency.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_perf.c | 657 ++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_perf.h |  11 +
>  2 files changed, 664 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index ba466e22c50d..76c346981150 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c

[...]

> +/**
> + * panthor_perf_session_create - Create a user-visible session.
> + *
> + * @file: DRM file associated with the request.
> + * @create_args: Creation arguments passed in via ioctl.
> + * @sid: Session identifier output.
> + *
> + * Creates a new session associated with the session ID returned. When initialized, the
> + * session must explicitly request sampling to start with a successive call to PERF_SESSION_START.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int panthor_perf_session_create(struct drm_file *file,
> +				struct drm_panthor_perf_session_create *create_args,
> +				unsigned long *sid)
> +{
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct panthor_device *ptdev = pfile->ptdev;
> +	struct panthor_perf_bo ringbuffer = {}, control = {};
> +	const size_t slots = create_args->sample_slots;
> +	struct panthor_perf_pool *pool = pfile->sessions;
> +	struct panthor_perf_session *session;
> +	struct panthor_perf_enable_masks *em;
> +	size_t user_sample_size;
> +	u32 session_id;
> +	int ret;
> +
> +	if (!ptdev->perf)
> +		return -EOPNOTSUPP;
> +
> +	if (!pool)
> +		return -EINVAL;
> +
> +	if (!perfmon_capable())
> +		return -EACCES;

This requirement isn't mentioned in the uAPI.

I also don't see any validation of "block_set". And I think the check
the padding should be moved here rather than hidden in
panthor_ioctl_perf_session_create().

> +
> +	session = kzalloc_obj(*session);
> +	if (ZERO_OR_NULL_PTR(session))
> +		return -ENOMEM;
> +
> +	if (!is_power_of_2(slots)) {
> +		drm_err(&ptdev->base,
> +			"Number of slots is not power-of-2 aligned\n");
> +		ret = -EINVAL;
> +		goto cleanup_session;
> +	}
> +
> +	user_sample_size = ptdev->perf_info.sample_size * slots;

create_args->sample_slots (slots) is user supplied and I believe this
could overflow (on a 32 bit system). Specifically 1 << 31 (as this has
to be power-of-2).

Thanks,
Steve

