Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012388;
	b=oYoEsH4zGWyjd/DXCHU+ifwDKQuKNgfLlg8U1QR3MyhrFu9xdRFXOTruK4OJNlvyNjDw
	 JQVe3gqlyHo544+k4e8CJzd4sIqUsg1mUqbi+zPL3vr6JEtuJzq/WS0+eX3BNEZQXqhhf
	 n6LPr+YoEC8Xs5H9yfpOyUMrnHL1vOT5KTJj6hYfqa+1H6+D/UJrb003nblba8/QJf2pF
	 FkAwF7vHnjAmLNjT+2oqgboqZhlqx1uiIbdBSojN51ShAqL+1tXB129kQffnrkd7ldBHd
	 f/RFS7tf5ngX5YFH+pcZQC/V0xYahJ8vGwGHi5zzZaS1u6/I1LTKAhmN0QcUFxjjFFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012388;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=tTMeQhSvdX0fNW6dC8qjgHVaHCWVFfoA4ZOieZXZKAw=;
	b=N2o32mI93SafCMXSiT8RA1HOfKEOmor+neFqc9GjCBg9Sv+jJLIERasHSSC4V4WK/qEF
	 /lDNxMPH1WtjZ8iH3PUdI9LZT898Sm8TRli14BzV9la3FsQSE51JMYjyG6zhA3orpVuuy
	 O00TuKEjwR9uyAefV1C4O6ibuNE7lLMkBoEoIm9LCcWO5EhNFcpg+SZLrBRhw8BEdumck
	 IqGGZtdVE/xYCpvare24v2DXJIRPjkSd4QLPJ2uQujm3v/k593p5iC/DanT0OTLyBeqva
	 bFGhtv3zgsY228KfvNxXxD5q7sFqvIInaavyOlwnvaq6CVxStptc2Z/6bOzKbWOubfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JeaWx35d;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94D606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE94D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JeaWx35d
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 690144E41635;
	Wed, 18 Nov 2026 14:33:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 361D05FE9B;
	Wed, 18 Nov 2026 14:33:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3478911BC2284;
	Wed, 18 Nov 2026 15:33:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795012384; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tTMeQhSvdX0fNW6dC8qjgHVaHCWVFfoA4ZOieZXZKAw=;
	b=JeaWx35d4EsvtG2vsB+2T470EOI0z5A56NmvPwmNOv/LKd21EMkF2clcxZqcTLZmt7cTYV
	3AIXqJq5wDYztvOk0AymKtaXFuFNS68hF2wdlEafBFsRJBz+5xPKzRahIKwqroy9/GLta/
	UQ4EONX3E68TSJbOLKee+DCo3Of6h14A/Tf1/85Q+IsnE1XD95Gg/NI2RklSzfjaTz+GPy
	CSE6GGhnlF6qN3H74x5t06AyMzjKRxHlQQg9F9YmOzyJmruCFJvd++/lnUZXgiglc75la+
	m6cbh+TAyfMBZBV8yjEVy3uvvCNNovsLQyORhrqnVsKXggruPUKRYaHk4vPBlg==
Message-ID: <eb298f9c-b938-49ef-9040-100a45266765@bootlin.com>
Date: Wed, 18 Nov 2026 15:32:59 +0100
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
Subject: Re: [PATCH v2 03/12] drm/vkms: allow color curve LUTs to have
 different sizes
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: airlied@gmail.com, alex.hung@amd.com, daniel@fooishbar.org,
 hamohammed.sa@gmail.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, pekka.paalanen@collabora.com,
 robert.mader@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
 <20261106201813.129911-4-leandro.ribeiro@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261106201813.129911-4-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/6/26 21:18, Leandro Ribeiro wrote:
> Instead of keeping a hardcoded size that all LUTs representing color
> curves must use, use ARRAY_SIZE() instead.
> 
> Besides making the code clearer, this allows us to create optimal LUTs
> for each color curve, and each of them can naturally have a different
> size. In the next commits we introduce these optimal LUTs.
> 
> Reviewed-by: Robert Mader <robert.mader@collabora.com>
> Tested-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/vkms/tests/vkms_color_test.c |  4 ++--
>   drivers/gpu/drm/vkms/vkms_luts.c             | 12 ++++++------
>   drivers/gpu/drm/vkms/vkms_luts.h             |  2 --
>   3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> index 1a1c7cac2f15..18e73a8a5c31 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> @@ -128,7 +128,7 @@ static void vkms_color_test_lerp(struct kunit *test)
>   
>   static void vkms_color_test_linear(struct kunit *test)
>   {
> -	for (int i = 0; i < LUT_SIZE; i++) {
> +	for (int i = 0; i < linear_eotf.lut_length; i++) {
>   		int linear = apply_lut_to_channel_value(&linear_eotf, i * 0x101, LUT_RED);
>   
>   		KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(linear, 0x101), i);
> @@ -139,7 +139,7 @@ static void vkms_color_srgb_inv_srgb(struct kunit *test)
>   {
>   	u16 srgb, final;
>   
> -	for (int i = 0; i < LUT_SIZE; i++) {
> +	for (int i = 0; i < srgb_eotf.lut_length; i++) {
>   		srgb = apply_lut_to_channel_value(&srgb_eotf, i * 0x101, LUT_RED);
>   		final = apply_lut_to_channel_value(&srgb_inv_eotf, srgb, LUT_RED);
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_luts.c b/drivers/gpu/drm/vkms/vkms_luts.c
> index 82cb792f10d8..6dcdef26bda8 100644
> --- a/drivers/gpu/drm/vkms/vkms_luts.c
> +++ b/drivers/gpu/drm/vkms/vkms_luts.c
> @@ -12,7 +12,7 @@
>    * https://gitlab.freedesktop.org/hwentland/lutgen
>    */
>   
> -static struct drm_color_lut linear_array[LUT_SIZE] = {
> +static struct drm_color_lut linear_array[] = {
>   	{ 0x0, 0x0, 0x0, 0 },
>   	{ 0x101, 0x101, 0x101, 0 },
>   	{ 0x202, 0x202, 0x202, 0 },
> @@ -273,12 +273,12 @@ static struct drm_color_lut linear_array[LUT_SIZE] = {
>   
>   const struct vkms_color_lut linear_eotf = {
>   	.base = linear_array,
> -	.lut_length = LUT_SIZE,
> +	.lut_length = ARRAY_SIZE(linear_array),
>   	.channel_value2index_ratio = 0xff00ffll
>   };
>   EXPORT_SYMBOL(linear_eotf);
>   
> -static struct drm_color_lut srgb_array[LUT_SIZE] = {
> +static struct drm_color_lut srgb_array[] = {
>   	{ 0x0, 0x0, 0x0, 0 },
>   	{ 0x13, 0x13, 0x13, 0 },
>   	{ 0x27, 0x27, 0x27, 0 },
> @@ -539,12 +539,12 @@ static struct drm_color_lut srgb_array[LUT_SIZE] = {
>   
>   const struct vkms_color_lut srgb_eotf = {
>   	.base = srgb_array,
> -	.lut_length = LUT_SIZE,
> +	.lut_length = ARRAY_SIZE(srgb_array),
>   	.channel_value2index_ratio = 0xff00ffll
>   };
>   EXPORT_SYMBOL(srgb_eotf);
>   
> -static struct drm_color_lut srgb_inv_array[LUT_SIZE] = {
> +static struct drm_color_lut srgb_inv_array[] = {
>   	{ 0x0, 0x0, 0x0, 0 },
>   	{ 0xcc2, 0xcc2, 0xcc2, 0 },
>   	{ 0x15be, 0x15be, 0x15be, 0 },
> @@ -805,7 +805,7 @@ static struct drm_color_lut srgb_inv_array[LUT_SIZE] = {
>   
>   const struct vkms_color_lut srgb_inv_eotf = {
>   	.base = srgb_inv_array,
> -	.lut_length = LUT_SIZE,
> +	.lut_length = ARRAY_SIZE(srgb_inv_array),
>   	.channel_value2index_ratio = 0xff00ffll
>   };
>   EXPORT_SYMBOL(srgb_inv_eotf);
> diff --git a/drivers/gpu/drm/vkms/vkms_luts.h b/drivers/gpu/drm/vkms/vkms_luts.h
> index 925a4a7b84e2..8078ab33b83e 100644
> --- a/drivers/gpu/drm/vkms/vkms_luts.h
> +++ b/drivers/gpu/drm/vkms/vkms_luts.h
> @@ -3,8 +3,6 @@
>   #ifndef _VKMS_LUTS_H_
>   #define _VKMS_LUTS_H_
>   
> -#define LUT_SIZE 256
> -
>   extern const struct vkms_color_lut linear_eotf;
>   extern const struct vkms_color_lut srgb_eotf;
>   extern const struct vkms_color_lut srgb_inv_eotf;

