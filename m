Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013053;
	b=aSocv5CqO6tocoCVUyQbYI8pbHDEGqFe8GUm4bYrHJ46jdTo4BGrbjb8f8Qhv/aLQywq
	 T6eTW1tHuEWXiPgM8JY4AopfVvM4sSosR2At68gdFq79m5d03IC/5j+uaaFlPiWBNTcl6
	 /eS4TKg98MGYnq/7Wr+tkO/kSjEzkbeZyaKRK7qaT4iC0DhlPPDcVcN01s+ig2lXzrTO6
	 f6vqseIOdp85oTJjK7fjoMC0vYuaBup1Q/y6Fc5V9n9f7E0osySAUEAZvQ9V3KXE/K4mp
	 d95/s9hyy8ahCtk1G0buvmgnKwNKNR5qVSxQXzHl+I+pU4SWu0JCNWax3cib9G0LQQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013053;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=i45jgLtgfC7QwlLoc4Pp1YJaro3MrUIk3lvsQEeO+yM=;
	b=hGSzXKxeAzwrFQDZmiv7ieVVucCUW+3ATZ6oMzBtTyYM2ujgXKHy0P6l3kmpFWQW1yjd
	 gQAXFQmPAknpDo/7vtSOytDJyT1St88SpvjkFrhzpW+z04S77sqbD/qIgZzHGlUZmWETH
	 QM9NxbMbaWl1+9y1JSJNGl6Ssg5IJtq5baq9QuaJ/3xPBMt7AGs95tSBlqM1jSsNmlq3F
	 7M8zfHO6Lw2w8jlrJZTjhdG7Jmq1ugKPYQx0qLksuzWaaqGS0CdLf4Ma/mwtgFdZDX5zL
	 j9PRluyJuKY0ruXYHg3ZR+08/E0pTy2kVv0sy+8A/SOyaeBGyzb0LhuVCJ8g/YJ2zhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lKjTByaY;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F84606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lKjTByaY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DAC301A16CD;
	Wed, 18 Nov 2026 14:44:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A371B5FE9B;
	Wed, 18 Nov 2026 14:44:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B7B011BC22A6;
	Wed, 18 Nov 2026 15:44:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795013050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=i45jgLtgfC7QwlLoc4Pp1YJaro3MrUIk3lvsQEeO+yM=;
	b=lKjTByaYhyS39StnFj4mM3KS2tm7a+Psn17Fr0s7J1ltL5ibMxp0P3wTNMAqpxPMM919Hl
	JaHQ0yqMiIYaGg6KVBkqdIkjq/zHYG0Vn9faVOd2r2hQRikhcR6bCxOldLDwi/ZYhHVSKT
	+ysjFg3Z9YGSQ0adf916a38JS1c+XH4B/sCoB2b9HAfgrjIpasZR68DlVY/3iUYnGLC5YQ
	WMJg1vEMaZDpEsEyzbjixVzfca075mILx/LoYC8zn38woMAjkGc1dI5+WY7cG/jhSJ5xaV
	5flbZM2wNDYWrvqlt+Q3GRLRxRoGf2Y1I0FZsbFeBCN8Ot2hojdIJzZpnzD5jg==
Message-ID: <d26bc038-0d3b-40f1-8021-345282dad49a@bootlin.com>
Date: Wed, 18 Nov 2026 15:44:07 +0100
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
Subject: Re: [PATCH v2 07/12] drm/vkms: rename struct vkms_color_lut::base to
 y
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: airlied@gmail.com, alex.hung@amd.com, daniel@fooishbar.org,
 hamohammed.sa@gmail.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, pekka.paalanen@collabora.com,
 robert.mader@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
 <20261106201813.129911-8-leandro.ribeiro@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261106201813.129911-8-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/6/26 21:18, Leandro Ribeiro wrote:
> No behavior change. In the following commits we'll add x, so y better
> matches that.
> 
> Reviewed-by: Robert Mader <robert.mader@collabora.com>
> Tested-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/vkms/tests/vkms_color_test.c |  2 +-
>   drivers/gpu/drm/vkms/vkms_composer.c         | 10 +++++-----
>   drivers/gpu/drm/vkms/vkms_drv.h              |  2 +-
>   drivers/gpu/drm/vkms/vkms_luts.c             |  4 ++--
>   4 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> index 83ef2afcc819..c223797a542a 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> @@ -81,7 +81,7 @@ static const struct vkms_color_test_lerp_params color_test_lerp_cases[] = {
>   };
>   
>   static const struct vkms_color_lut test_linear_lut = {
> -	.base = test_linear_array,
> +	.y = test_linear_array,
>   	.lut_length = ARRAY_SIZE(test_linear_array),
>   	.channel_value2index_ratio = 0xf000fll
>   };
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index b4a433be1b2d..640a1a03f06f 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -114,12 +114,12 @@ VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut
>   	 */
>   	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
>   
> -	lut_y_floor = &lut->base[drm_fixp2int(lut_index)];
> +	lut_y_floor = &lut->y[drm_fixp2int(lut_index)];
>   	if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
>   		/* We're at the end of the LUT array, use same value for ceil and floor */
>   		lut_y_ceil = lut_y_floor;
>   	else
> -		lut_y_ceil = &lut->base[drm_fixp2int_ceil(lut_index)];
> +		lut_y_ceil = &lut->y[drm_fixp2int_ceil(lut_index)];
>   
>   	floor_channel_value = lut_channel_value(lut_y_floor, channel);
>   	ceil_channel_value = lut_channel_value(lut_y_ceil, channel);
> @@ -132,7 +132,7 @@ EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
>   
>   static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
>   {
> -	if (!crtc_state->gamma_lut.base)
> +	if (!crtc_state->gamma_lut.y)
>   		return;
>   
>   	if (!crtc_state->gamma_lut.lut_length)
> @@ -647,7 +647,7 @@ void vkms_composer_worker(struct work_struct *work)
>   		s64 max_lut_index_fp;
>   		s64 u16_max_fp = drm_int2fixp(0xffff);
>   
> -		crtc_state->gamma_lut.base = (struct drm_color_lut *)crtc->state->gamma_lut->data;
> +		crtc_state->gamma_lut.y = (struct drm_color_lut *)crtc->state->gamma_lut->data;
>   		crtc_state->gamma_lut.lut_length =
>   			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
>   		max_lut_index_fp = drm_int2fixp(crtc_state->gamma_lut.lut_length - 1);
> @@ -655,7 +655,7 @@ void vkms_composer_worker(struct work_struct *work)
>   									       u16_max_fp);
>   
>   	} else {
> -		crtc_state->gamma_lut.base = NULL;
> +		crtc_state->gamma_lut.y = NULL;
>   	}
>   
>   	spin_unlock_irq(&out->composer_lock);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 34b855431af3..cdcf7a79697b 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -159,7 +159,7 @@ struct vkms_plane {
>   };
>   
>   struct vkms_color_lut {
> -	struct drm_color_lut *base;
> +	struct drm_color_lut *y;
>   	size_t lut_length;
>   	s64 channel_value2index_ratio;
>   };
> diff --git a/drivers/gpu/drm/vkms/vkms_luts.c b/drivers/gpu/drm/vkms/vkms_luts.c
> index d0e96df2c120..7b0c8eaf83b8 100644
> --- a/drivers/gpu/drm/vkms/vkms_luts.c
> +++ b/drivers/gpu/drm/vkms/vkms_luts.c
> @@ -272,7 +272,7 @@ static struct drm_color_lut srgb_array[] = {
>   };
>   
>   const struct vkms_color_lut srgb_eotf = {
> -	.base = srgb_array,
> +	.y = srgb_array,
>   	.lut_length = ARRAY_SIZE(srgb_array),
>   	.channel_value2index_ratio = 0xff00ffll
>   };
> @@ -538,7 +538,7 @@ static struct drm_color_lut srgb_inv_array[] = {
>   };
>   
>   const struct vkms_color_lut srgb_inv_eotf = {
> -	.base = srgb_inv_array,
> +	.y = srgb_inv_array,
>   	.lut_length = ARRAY_SIZE(srgb_inv_array),
>   	.channel_value2index_ratio = 0xff00ffll
>   };

