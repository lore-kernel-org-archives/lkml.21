Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013035;
	b=DUvwpFEx/F9//7qyJsfJNCXCZPpilq0Yp2RcSTwU36WGF2fjc42g5hvM0N9b+lwSL4zy
	 BlWMvOoFqefFLzQgZKwcoqkO3hx9kDy25MEKdo2iKWyohKtXbqzhK6riAw/i3lrTiv7X2
	 hpc+Qw2teEzjsPZ6sD2e5q9yZ4pLYcaLstrk8/q94r0SeHHSU88LLjGUZlbCU7RQoLsyK
	 fFKIiT51WLA25r3LDlnZwXghzJBgHRXqxEdtvzgHAu1hruwm3UoBemBkl6WIwcnRb48OJ
	 +rXI6p0lUST0e9grpwdiG8RO1aRyMBVvBe2ZuVTPduUdq9ziRa78vFs6S3WRneGRRkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013035;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=RuoK7SHlccTvW+KBXVmm9tIGmcELxfywFYrOMCIIMAs=;
	b=FvyT9yYsM1FwbHauBkpBeoEHySRdZKMqfkAZij5be6acgKAMdsUUIQ1TcOM9AiPP7fpP
	 lLdF92S3aHr6dXkL7szzK9H/+4nQjE33u3RibomoFl5mgaU0jYn3Q6I9aeVayVrkUVCM2
	 iQVpDzjgpgN4z19UpXfPLzA3J3xwKyZQXkEteqUQGvePTQRo9U4rToCZclr3ZXAUDmANe
	 TB8dZspYVX3vVrnVAFkpFn7krpxPok6nHU3rlwMkH+/het7NgKwxDqdQ1NQ8g0eVhZ31n
	 w6zHuXPIC53TZcutJt0j+go8mNr1TX7aD+LUPhQ1J2MQmQ7fMAxCsn3sWZcQrIi5hiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NG1SZo66;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B3E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0B3E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NG1SZo66
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A37EBC4F77E;
	Wed, 18 Nov 2026 14:43:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFBFB5FE9B;
	Wed, 18 Nov 2026 14:43:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC53411BC22DF;
	Wed, 18 Nov 2026 15:43:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795013027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RuoK7SHlccTvW+KBXVmm9tIGmcELxfywFYrOMCIIMAs=;
	b=NG1SZo66mYmaxwSwSF0I9HdIki8dspQKEwD682IvKYbGBWJNcNpS1+IxF1+9WqL7488dl8
	oVExbeseyH53sG1RKw1WrXuf2S6i1eoetCS7exY7CfAfkt0ryAaSSEuq8ojdm/dJ/Tk6Jp
	x7ZA1/rh2k8gl15syw65pzgVOJbG+s1fRlOQQwKGD36GU+nkaouGR//FJFyTQpWac8yGSP
	VgwIs6+UyZm17Qd8y55Jr7JHxMES2ydshpPzs2GWarUP0YDs2TXBKCY/Pbrj7oxSYzT64j
	xSs4WV0oAInPIw2x6KLdNAhVZ5IWHwuiSH7ABMMzSQ1NvWPdClPJUZsgrRljnw==
Message-ID: <929e5bb7-2ace-4ad1-b154-e8c36a56f3a8@bootlin.com>
Date: Wed, 18 Nov 2026 15:43:42 +0100
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
Subject: Re: [PATCH v2 06/12] drm/vkms: improve the way in which we access LUT
 member
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: airlied@gmail.com, alex.hung@amd.com, daniel@fooishbar.org,
 hamohammed.sa@gmail.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, pekka.paalanen@collabora.com,
 robert.mader@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
 <20261106201813.129911-7-leandro.ribeiro@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261106201813.129911-7-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/6/26 21:18, Leandro Ribeiro wrote:
> apply_lut_to_channel_value() indexes a struct drm_color_lut array, and
> then cast to (__u16 *) and index with the channel (r -> index 0, g ->
> index 1, b -> index 2). This is a bit fragile and prone to issues.
> 
> Instead, add a more robust helper lut_channel_value() such that, given a
> struct drm_color_lut and a color channel, it retrives the value.
> 
> Reviewed-by: Robert Mader <robert.mader@collabora.com>
> Tested-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/vkms/vkms_composer.c | 30 ++++++++++++++++++++++------
>   1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 0fc915a954ba..b4a433be1b2d 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -75,6 +75,24 @@ VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
>   }
>   EXPORT_SYMBOL_IF_KUNIT(lerp_u16);
>   
> +static inline u16 lut_channel_value(const struct drm_color_lut *lut,
> +				    enum lut_channel channel)
> +{
> +	switch (channel) {
> +	case LUT_RED:
> +		return lut->red;
> +	case LUT_BLUE:
> +		return lut->blue;
> +	case LUT_GREEN:
> +		return lut->green;
> +	case LUT_RESERVED:
> +		DRM_DEBUG_DRIVER("LUT_RESERVED channel should not be accessed");
> +		return 0;
> +	}
> +	DRM_DEBUG_DRIVER("unknown LUT channel");
> +	return 0;
> +}
> +
>   VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>   {
>   	s64 color_channel_fp = drm_int2fixp(channel_value);
> @@ -86,8 +104,8 @@ EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
>   VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
>   						enum lut_channel channel)
>   {
> +	const struct drm_color_lut *lut_y_floor, *lut_y_ceil;
>   	s64 lut_index = get_lut_index(lut, channel_value);
> -	u16 *floor_lut_value, *ceil_lut_value;
>   	u16 floor_channel_value, ceil_channel_value;
>   
>   	/*
> @@ -96,15 +114,15 @@ VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut
>   	 */
>   	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
>   
> -	floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> +	lut_y_floor = &lut->base[drm_fixp2int(lut_index)];
>   	if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
>   		/* We're at the end of the LUT array, use same value for ceil and floor */
> -		ceil_lut_value = floor_lut_value;
> +		lut_y_ceil = lut_y_floor;
>   	else
> -		ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
> +		lut_y_ceil = &lut->base[drm_fixp2int_ceil(lut_index)];
>   
> -	floor_channel_value = floor_lut_value[channel];
> -	ceil_channel_value = ceil_lut_value[channel];
> +	floor_channel_value = lut_channel_value(lut_y_floor, channel);
> +	ceil_channel_value = lut_channel_value(lut_y_ceil, channel);
>   
>   	return lerp_u16(floor_channel_value, ceil_channel_value,
>   			lut_index & DRM_FIXED_DECIMAL_MASK);

