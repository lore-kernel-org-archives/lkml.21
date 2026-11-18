Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012663;
	b=XuYhMEeAO9C6IZ9/w0CtJsvsGqtb9Bg2FxpJYIWRhhNDSs2554MJbEitIyA1qIbpq4di
	 HEmK1U/OnzEniDPEQA0+BxU/M71FFOTYQ03SB/UciCvqKXQQAl1OPecVSvtXSjySK6ZLU
	 UDjQPZwCn7LK5FTkqKORpkcXJIrAYQyU7k4NjxDOWFOMQXtw0RduQBR5E23m4K2jFl068
	 GfRKACVx4tQpDNfO/Jjb3bH2uMzL1Jo7zxA2dfS4oHoBSmXx7urNsW7xrzHLLTpXgERkM
	 m9tAKQPABX8EjrNPLzW5Pjj4PJPSj7eDOkwIW0LNvauy3vT/74iYQtQGGjOOxM9jdoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012663;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=lpqeT2rigFPgFS9l60+27LVDzSLTb24mL7bP9ItOtmo=;
	b=GMcUsCW7tH7HVwE5DdLqgQgi1NaNIIYs8eYwT/Vcodh3Hy6tMqvCPUfqkW+9dz5B9RAK
	 e6LsOgcGRffZ5XbicGHs6qUX5586flARrsg3JtMaXyGjqGX7Zxkb14TmS1/JppOdsqz2c
	 tOPuTlKBdi/SYGYJBtqSuJaeQqCJmmydKmDo5QLIisY2MiUICoXTLONxNaxH4V6bt/TJq
	 WVOww6sDRFPLuYefqWnNZ5iB8+D/JcPCvrNK6byI0HppvD+06+vFpTNxM5zTp04vCY7g3
	 ZPvtbN+l3Wag1tLg4wLoXbxpGlGqHnXFWtAK/D4vwjqforgk1lOQYdp+1UQwekLAuvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Is++7Tbx;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5E0606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5E0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Is++7Tbx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 14CD91A16CD;
	Wed, 18 Nov 2026 14:37:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D14A75FE9B;
	Wed, 18 Nov 2026 14:37:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AD0D11BC229E;
	Wed, 18 Nov 2026 15:37:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795012659; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lpqeT2rigFPgFS9l60+27LVDzSLTb24mL7bP9ItOtmo=;
	b=Is++7Tbxm0I5ZC1ofAck6n/JkeCBbgnUtBxLtSfqcfIvQ5BXw1Z7Fk0jIQ9g3pd+ZsSGzK
	Ntcvs8pmJuEduYUMwxzl6+Q+qpWQ3SnhNIydJ+mwZFqhwdYWcL06lKcwpUt9Vqgd/ZJftU
	PRinGuTry9s13+tBmsFqAeveDXYexMV+lanMDqWxBlTz2KQVZE4n3G9XQAlOvUCjNWtdu3
	+fAVBjHrBjQxSTMZkPzIoQQd6GcehGwf+6ZRAKXpHWxxDu1/H1hACblsaGVacoNvkm9VtH
	znsp3hOsIjRuAOUVkw6yUaLAnoc4++hpQvEG71lUQ4p+hlYGhFF1SdYJ4umu7A==
Message-ID: <af11c394-5cff-495f-82d5-c4cd6dd9b218@bootlin.com>
Date: Wed, 18 Nov 2026 15:37:34 +0100
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
Subject: Re: [PATCH v2 04/12] drm/vkms: remove TEST_LUT_SIZE
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: airlied@gmail.com, alex.hung@amd.com, daniel@fooishbar.org,
 hamohammed.sa@gmail.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, pekka.paalanen@collabora.com,
 robert.mader@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
 <20261106201813.129911-5-leandro.ribeiro@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261106201813.129911-5-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/6/26 21:18, Leandro Ribeiro wrote:
> This can be replaced by ARRAY_SIZE(), so drop it.
> 
> Reviewed-by: Robert Mader <robert.mader@collabora.com>
> Tested-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/vkms/tests/vkms_color_test.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> index 18e73a8a5c31..3489513af352 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> @@ -8,11 +8,9 @@
>   #include "../vkms_drv.h"
>   #include "../vkms_luts.h"
>   
> -#define TEST_LUT_SIZE 16
> -
>   MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
>   
> -static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
> +static struct drm_color_lut test_linear_array[] = {
>   	{ 0x0, 0x0, 0x0, 0 },
>   	{ 0x1111, 0x1111, 0x1111, 0 },
>   	{ 0x2222, 0x2222, 0x2222, 0 },
> @@ -84,7 +82,7 @@ static const struct vkms_color_test_lerp_params color_test_lerp_cases[] = {
>   
>   static const struct vkms_color_lut test_linear_lut = {
>   	.base = test_linear_array,
> -	.lut_length = TEST_LUT_SIZE,
> +	.lut_length = ARRAY_SIZE(test_linear_array),
>   	.channel_value2index_ratio = 0xf000fll
>   };
>   
> @@ -96,7 +94,7 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
>   	lut_index = get_lut_index(&test_linear_lut, test_linear_array[0].red);
>   	KUNIT_EXPECT_EQ(test, drm_fixp2int(lut_index), 0);
>   
> -	for (i = 0; i < TEST_LUT_SIZE; i++) {
> +	for (i = 0; i < test_linear_lut.lut_length; i++) {
>   		lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
>   		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
>   	}

