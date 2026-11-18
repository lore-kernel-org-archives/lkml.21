Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008440;
	b=4a1Rg8BGgzr3zNC62IUnXRRVUMzEaL215+K8/SYXQlzro0v3ACG+XZ+wAjFIAjUmP5qs
	 l5Tu6N0NJy2WOQCgAyzguyJg21PTIhL1IdsabLoz0RN+w+SSAkrOh9nuF9uG6UsVUApM4
	 oT0iczzelbW/YQ2zPb3aFYQpHQQrXR67o8jNhqfVZjH94MI5iQ36F5EAFgCFdFS7lYYHV
	 Ap6UnWy48ij1WDrRC2pI5AqSK863sjz9SkK65Y9fjDY/DQqhKjju7+HS7gu8EeOjHMzxc
	 CKFGPwEmG1he8CYiAXepy70VJoIvI8SaKKwBpBDfGY7lqF2Z3F+ALc6FpU9Z09qsyJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008440;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=qGDF0QdJq6eV3irICcBQAn2r5GsAB1GesRbUX5r+ORw=;
	b=HSouCmby6YNnFr149+Dv6kC1Cv++TojHbtsegwdXm9yUJRynsChNasYGA79Uh5BSbu6v
	 qw6B5g8LJZKHeBUvXRtlSmaLbHMiAnoUJMtCScAVbfA14bEQ/hRSXUeuE4u/doVuKfmYI
	 MGYzeirgNBhVsBJDjA242JBba5juvW4GAMpon/6CvVPHBheI41AYz6+EGF2VjHhlvAz4w
	 KA85xwRqRZ0KiPblFZL4I0coLBeUWAsIEQ5KBilWzAFPBXihPUxBltxLNoFOqsMmzhyca
	 UheNeMd6vuI1et3x/EWtgyoSN9K2AjJS1BDzMcjxoV2wOLWArX5omCR9VU5pPmVthjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=x3CISAJB;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8331606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8331606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=x3CISAJB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 48A2A1A16D0;
	Wed, 18 Nov 2026 13:27:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17B9E5FE9B;
	Wed, 18 Nov 2026 13:27:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0ECEB11BC2000;
	Wed, 18 Nov 2026 14:27:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795008433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qGDF0QdJq6eV3irICcBQAn2r5GsAB1GesRbUX5r+ORw=;
	b=x3CISAJBzWj+v/j41t6dxQL9r9dPwpcUtD8GhKekBMGgOIKGX2nCrPuXl/X4XTIbnnRohg
	xRqkGbRuIJnvT/fCrJxLARo+F++FISE1mwWQnWZWfiSd/d48kCUYsn8MciOPfnoN4SNLYH
	7BKWRSSWuV4J/lT9sIRL/eGf3vRcPXRsBFuy8dK2TB7wpxMYPdH5amWSjvB6f2psXnldLO
	2I47MmT43xDjE/DIKO/L/XRawUwkiI02ajWo+C3byftQ1rhVQL2pyrEc18OSjSjsqcOrIN
	7FYzJU91XJRghW+HI64PRo09rFf4laVCsJjHhExFQxtD4iYaLuMky3g0HN/nHQ==
Message-ID: <bd611fa8-2df2-49ba-9e2d-ce897d42d18e@bootlin.com>
Date: Wed, 18 Nov 2026 14:27:10 +0100
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
Subject: Re: [PATCH 1/5] drm/vkms: make argb_u16_to_RGB565 round resulting
 values
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
 <20260928005301.367977-2-matheus.aalmeida@inf.ufrgs.br>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260928005301.367977-2-matheus.aalmeida@inf.ufrgs.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 9/28/26 02:52, Matheus Alves de Almeida wrote:
> Currently, argb_u16_to_RGB565() truncates the resulting channel values.
> Use drm_fixp2int_round() to round them to the nearest representable
> RGB565 values.
> 
> Restore the rounding behavior from commit
> ab87f558dcfb ("drm/vkms: Fix RGB565 pixel conversion") while adding a
> separate helper for channel conversion.
> 
> Fixes: cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functions")
> Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 35 ++++++++++++++++++++---------
>   1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index dfb8e13cb..6d7853e87 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -639,20 +639,35 @@ static void argb_u16_to_XRGB16161616(u8 *out_pixel, const struct pixel_argb_u16
>   	pixel[0] = cpu_to_le16(in_pixel->b);
>   }
>   
> -static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
> +static u16 u16_to_channel(int size, u16 in)
>   {
> -	__le16 *pixel = (__le16 *)out_pixel;
> +	s64 fp_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp((1 << size) - 1));
> +	s64 fp_channel = drm_int2fixp(in);
>   
> -	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> -	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> +	return drm_fixp2int_round(drm_fixp_div(fp_channel, fp_ratio));
> +}
> +
> +static void argb_u16_to_channels(u16 *out_r, u16 *out_g, u16 *out_b, u16 *out_a,
> +				 unsigned int r_size, unsigned int g_size,
> +				 unsigned int b_size, unsigned int a_size,
> +				 const struct pixel_argb_u16 *in_pixel)
> +{
> +	if (r_size)
> +		*out_r = u16_to_channel(r_size, in_pixel->r);
> +	if (g_size)
> +		*out_g = u16_to_channel(g_size, in_pixel->g);
> +	if (b_size)
> +		*out_b = u16_to_channel(b_size, in_pixel->b);
> +	if (a_size)
> +		*out_a = u16_to_channel(a_size, in_pixel->a);
> +}
>   
> -	s64 fp_r = drm_int2fixp(in_pixel->r);
> -	s64 fp_g = drm_int2fixp(in_pixel->g);
> -	s64 fp_b = drm_int2fixp(in_pixel->b);
> +static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
> +{
> +	__le16 *pixel = (__le16 *)out_pixel;
> +	u16 r, g, b;
>   
> -	u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
> -	u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
> -	u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
> +	argb_u16_to_channels(&r, &g, &b, NULL, 5, 6, 5, 0, in_pixel);
>   
>   	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
>   }

