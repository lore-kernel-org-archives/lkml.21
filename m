Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446678;
	b=swAFKiH6z1CjDBG0EcLKPoZuRqCcNemE3rotZLIhkgeuBF2MDWDHYhTsGJo66Q5v/SE2
	 XLFhMldalPc1kO6t/o2lljh7P/36D4HrD9HaT5kUjvrw+arAGiUDrjEKQOWsB8AOnj4k3
	 TAfMjiryKa7/joHDI5gCuncAWH1lg+Vydt6FmR4UY+V6SaxuuOw0XIKZKJT7J3WWv12+N
	 Zh98vVMT2NZgnAycBSDrPnG7LZXVd4+Kumn5/l/lOMjHLzdCJOnePmN/m8dup+RihuTW0
	 w9TsNN3huZHbMToO/9ui7YdXTuPatMeOVv0pQwxZJO6fFajlIRHrLjzntb2ixjJXz2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446678;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2FfqhE9oy5Ae/7J3Y1yEc9hNdHIwpjwYcevD2vSuWO8=;
	b=N2+ZQnisAGlbCXgRkQnCdXIz8XB7Eg1WrP14SP9KLPZk86hpeIkOeSIbx6oMBjTIcdJQ
	 xUv3e815jL4/V6iswP/efA2tHle4z36dfj94qChtfahln0oX8pDtRcgTuJbuPpV3K+S1B
	 LdKthVcoE7MFOku/GnsbSS/VGwAaMOR3mn+JyiUtAvgP/ZNlcd+n0rkbAoHmWQoEjtDP5
	 jXqcNhbTblZa28fLlIGFdmRVou9U8DhAoz1trttyAW2H9Dh1K8iOolUsIkOyQYYvdFEo4
	 fVA7pcWNgTHdW8w42nPF/gYRaHHB+ZGw+pefu9cse87NONGMKGVp6kQ6562iWKWJB6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Y5rx4gcE;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7C3606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Y5rx4gcE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B432B1A2D;
	Mon, 23 Nov 2026 07:11:14 -0800 (PST)
Received: from [10.57.63.212] (unknown [10.57.63.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E3DA3F632;
	Mon, 23 Nov 2026 07:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795446677; bh=04kH5fYhNOok3sRgY/ZmBgLg+WVOga5ND/L+SIAVQ9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y5rx4gcEo4AAnXcwPKgSqTCxQsZDXBo7sNcZxTtO1CfkjwUgXtKtH0SBs1lb259Rq
	 Olmmjm7PR6gyjQ5NC7/zi/Et1sZjtu+H92hFOlkk8ecacVaq96nZVwZ5hlIHS/ssD7
	 DKVUuzgEcEzkNcDzUH3jD/CID1f31px413JUaUCY=
Message-ID: <dfe39073-f3eb-4a4d-8599-5a15f7038304@arm.com>
Date: Mon, 23 Nov 2026 15:11:14 +0000
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
Subject: Re: [PATCH v7 8/8] drm/panthor: Expose the panthor perf ioctls
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
 <20261011-panthor-performance-counters-v7-8-12c32495062f@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261011-panthor-performance-counters-v7-8-12c32495062f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2026 18:36, Lukas Zapolskas wrote:
> This patch implements the PANTHOR_PERF_SESSION ioctl series.
> 
> The minor version is bumped to indicate that the feature is now
> supported.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 117 +++++++++++++++++++++++++++++++++-
>  1 file changed, 115 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 3e62142d7ebd..5ca41cb9c1ba 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -184,7 +184,12 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_session_create, shader_enable_mask), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_session_start, user_data), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_session_stop, user_data), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_session_sample, user_data), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_session_destroy, handle))
>  
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -1603,6 +1608,103 @@ static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
>  	return 0;
>  }
>  
> +static int panthor_ioctl_perf_session_create(struct drm_device *ddev, void *data,
> +					     struct drm_file *file)
> +{
> +	int ret, cookie;
> +	unsigned long sid = 0;
> +	struct drm_panthor_perf_session_create *args = data;
> +
> +	if (!drm_dev_enter(file->minor->dev, &cookie))
> +		return -ENODEV;

This dev_enter is leaked if we hit the early returns below.

> +
> +	if (!mem_is_zero(args->pad, sizeof(args->pad)))
> +		return -EINVAL;
> +
> +	ret = panthor_perf_session_create(file, args, &sid);
> +	if (ret)
> +		return ret;
> +
> +	drm_dev_exit(cookie);
> +	return sid;
> +}
> +
> +static int panthor_ioctl_perf_session_start(struct drm_device *ddev, void *data,
> +					    struct drm_file *file)
> +{
> +	int cookie, ret;
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_perf_session_start *args = data;
> +
> +	if (!drm_dev_enter(file->minor->dev, &cookie))
> +		return -ENODEV;
> +
> +	if (args->pad0)
> +		return -EINVAL;
> +
> +	ret = panthor_perf_session_start(pfile, args->handle, args->user_data);
> +
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
> +
> +static int panthor_ioctl_perf_session_sample(struct drm_device *ddev, void *data,
> +					     struct drm_file *file)
> +{
> +	int cookie, ret;
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_perf_session_sample *args = data;
> +
> +	if (!drm_dev_enter(file->minor->dev, &cookie))
> +		return -ENODEV;
> +
> +	if (args->pad0)
> +		return -EINVAL;
> +
> +	ret =  panthor_perf_session_sample(pfile, args->handle, args->user_data);
> +
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
> +
> +static int panthor_ioctl_perf_session_stop(struct drm_device *ddev, void *data,
> +					   struct drm_file *file)
> +{
> +	int cookie, ret;
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_perf_session_stop *args = data;
> +
> +	if (!drm_dev_enter(file->minor->dev, &cookie))
> +		return -ENODEV;
> +
> +	if (args->pad0)
> +		return -EINVAL;
> +
> +	ret = panthor_perf_session_stop(pfile, args->handle, args->user_data);
> +
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
> +
> +static int panthor_ioctl_perf_session_destroy(struct drm_device *ddev, void *data,
> +					      struct drm_file *file)
> +{
> +	int cookie, ret;
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_perf_session_destroy *args = data;
> +
> +	if (!drm_dev_enter(file->minor->dev, &cookie))
> +		return -ENODEV;
> +
> +	if (args->pad0)
> +		return -EINVAL;
> +
> +	ret = panthor_perf_session_destroy(pfile, args->handle);
> +
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1687,6 +1789,11 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(BO_QUERY_INFO, bo_query_info, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_SESSION_CREATE, perf_session_create, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_SESSION_START, perf_session_start, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_SESSION_SAMPLE, perf_session_sample, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_SESSION_STOP, perf_session_stop, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_SESSION_DESTROY, perf_session_destroy, DRM_RENDER_ALLOW),
>  };
>  
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> @@ -1807,6 +1914,12 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.8 - extends DEV_QUERY_TIMESTAMP_INFO with flags
>   * - 1.9 - adds DRM_PANTHOR_DEV_QUERY_MMU_INFO query
>   *       - adds DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE flag
> + * - 1.10 - adds DEV_QUERY_PERF_INFO query
> + *        - adds PERF_SESSION_CREATE ioctl
> + *        - adds PERF_SESSION_START ioctl
> + *        - adds PERF_SESSION_SAMPLE ioctl
> + *        - adds PERF_SESSION_STOP ioctl
> + *        - adds PERF_SESSION_DESTROY ioctl
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1820,7 +1933,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 9,
> +	.minor = 10,
>  
>  	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
>  	.gem_prime_import = panthor_gem_prime_import,
> 

