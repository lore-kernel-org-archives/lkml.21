Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785619;
	b=kq9dSS0f1VSdNO46PGaciGLNGR1G1+YMVoNOKTaTDSc+gymQrz98O5+kFMpgK9LAQWon
	 yalJ9VsJyBaBqlsc/RuBtF8O5nO7kbqn5fX7Jl4RwXXpL5ljBBA90GfvXii5UAkgYvBO5
	 YS2teVHsS9HhFY0kJy1bHdwYcTumPVqxNrprfYHEqiohaEeCItNYGieismGIpaLzIXivD
	 xR2bPME90HVOMH+0iNbKbzvYhSOBB/s8H1GwUcozI7vIV4avqfM6meUc63BTUq/1YAC3m
	 2b7DUpGxfy4EVKHILEpexqcOthnPQoeBZ+/7V0TDnRDxuihT5RorAiqaUxtV436FZYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785619;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=t3bmZhMlLLLChKiQYVURV/Tny2pVJcAegEMm5bEYllA=;
	b=AQAd7kjrfKtcXnW1c4SIfq/ce+6dNcVf7Z5/7D6zBzZTCwo0ZOQb+iDtKygDUaWvj9yJ
	 HOv5716wl/9pnp5VzVSlLOJN5juzdW7l/4GtwBjC0kEOZiyN5Dxy9Hr/eeScgOqlAE2lo
	 XGGyWcwlb59qEv8wfXyHSVDJGHostSHMXqXTetm11K+SKa+FjnlXv6CU8VVXHv1JPfxx+
	 UC0y2augz1WH2VdkG2/4jfVnTRG+RaEuun+dyATSnyOEuZwtT4XqhSHMFzvHs8hmOgrU8
	 Afh22j5WraCZ7x0d1FA6JH5k0wigz0rbuGUwMXL3mTT4rGmryZfdLAZwobmy74fM1LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IztbIJC3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650D5606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650D5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IztbIJC3
ARC-Seal: i=1; a=rsa-sha256; t=1795785601; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PZc+IvajhshC54TAHOFTMmDH2mve+1jfOAsQkwp1C/mRnWLYl+Ef10yP4o8fNhhDff8Ob+w2l0nX13lPkFmsFYttLCZqbC3WTsZetDDui1aMaeqiCFnQLy4/VM8FxGeTQUUj4Cbnm4DZi5a+6v4u/MR4TYRLxctV4CzpNh/ZmgA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795785601; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t3bmZhMlLLLChKiQYVURV/Tny2pVJcAegEMm5bEYllA=; 
	b=ICqQyiL2vq0cpK6WNAENZCQ+YBy2NXOZAVfGLbzrjwNr2o6svO/HKeYqVgQEVugno8+eh3JSmBJUXI18S80usLpG8fD3hEp7ptn6Osjc2xKiXczCKVNuvU3qrJcnHdVnwr6H7POjJ3x2DGrVp+qHiXqjJsCVKQ9HKnyDz0dwGQc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: a=rsa-sha256; b=IztbIJC3g4yrB4jKc/9Up1BLK/zgg6JzSywiNdLaBvhK8OuUHH7hDElgLGYtc7sVBA3zI3EFVeeiMZiZmOjmchaxJLXt4wE2EWlvdax/pqRXxCMSXhOS0M/rmgTly03NCHQLpeMgSKeAW3t4fixWZMIzMYxrbXvt1ax29XgnEyk=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=t3bmZhMlLLLChKiQYVURV/Tny2pVJcAegEMm5bEYllA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17957855989751007.5771783185683;
	Fri, 27 Nov 2026 05:19:58 -0800 (PST)
Message-ID: <152ed8fa-c32f-4502-8852-c6a9c6f60872@collabora.com>
Date: Fri, 27 Nov 2026 16:19:54 +0300
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
Subject: Re: [RFC PATCH v10 2/4] drm/virtio: add userptr blob resource to the
 UAPI
To: Honglei Huang <honghuan@amd.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Ray Huang <Ray.Huang@amd.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261106082625.812860-1-honghuan@amd.com>
 <20261106082625.812860-3-honghuan@amd.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20261106082625.812860-3-honghuan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/6/26 11:26, Honglei Huang wrote:
> Add a userptr address field so userspace can request a blob backed
> by an existing process mapping. A non-zero userptr selects that
> path; probe VIRTGPU_PARAM_USERPTR before using the field.
> 
> GPU-readonly backing is requested with the virtio CREATE_BLOB wire
> flag VIRTIO_GPU_BLOB_FLAG_USE_READONLY (also
> VIRTGPU_BLOB_FLAG_USE_READONLY). The device MUST NOT write such a
> resource. The guest pins without FOLL_WRITE only when the device
> advertised VIRTIO_GPU_F_BLOB_READONLY (VIRTGPU_PARAM_BLOB_READONLY).
> 
> Signed-off-by: Honglei Huang <honghuan@amd.com>
> ---
>   include/uapi/drm/virtgpu_drm.h  | 10 ++++++++++
>   include/uapi/linux/virtio_gpu.h |  5 +++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> index 9b886e9772..c890c754d8 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -99,6 +99,8 @@ struct drm_virtgpu_execbuffer {
>   #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
>   #define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name from userspace */
>   #define VIRTGPU_PARAM_BLOB_ALIGNMENT 9 /* Device alignment requirements for blobs */
> +#define VIRTGPU_PARAM_USERPTR 10 /* CREATE_BLOB userptr field is supported */
> +#define VIRTGPU_PARAM_BLOB_READONLY 11 /* VIRTGPU_BLOB_FLAG_USE_READONLY is honored */
>   
>   struct drm_virtgpu_getparam {
>   	__u64 param;
> @@ -187,6 +189,7 @@ struct drm_virtgpu_resource_create_blob {
>   #define VIRTGPU_BLOB_FLAG_USE_MAPPABLE     0x0001
>   #define VIRTGPU_BLOB_FLAG_USE_SHAREABLE    0x0002
>   #define VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
> +#define VIRTGPU_BLOB_FLAG_USE_READONLY     0x0008
>   	/* zero is invalid blob_mem */
>   	__u32 blob_mem;
>   	__u32 blob_flags;
> @@ -206,6 +209,13 @@ struct drm_virtgpu_resource_create_blob {
>   #define DRM_VIRTGPU_BLOB_FLAG_HINT_DEFER_MAPPING        0x0001
>   	__u32 blob_hints;
>   	__u32 pad2;
> +
> +	/*
> +	 * Non-zero selects the userptr path and is valid only with
> +	 * VIRTGPU_BLOB_MEM_GUEST. Must be 0 otherwise. Probe
> +	 * VIRTGPU_PARAM_USERPTR before using this field.
> +	 */
> +	__u64 userptr;
>   };
>   
>   #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index e22049835e..af95374758 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -72,6 +72,10 @@
>    * must be aligned to that value.
>    */
>   #define VIRTIO_GPU_F_BLOB_ALIGNMENT      5
> +/*
> + * VIRTIO_GPU_BLOB_FLAG_USE_READONLY
> + */
> +#define VIRTIO_GPU_F_BLOB_READONLY       6
>   
>   enum virtio_gpu_ctrl_type {
>   	VIRTIO_GPU_UNDEFINED = 0,
> @@ -415,6 +419,7 @@ struct virtio_gpu_resource_create_blob {
>   #define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
>   #define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
>   #define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
> +#define VIRTIO_GPU_BLOB_FLAG_USE_READONLY     0x0008
>   	/* zero is invalid blob mem */
>   	__le32 blob_mem;
>   	__le32 blob_flags;

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
