Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632599;
	b=rwPiXWEZe0lCIlkppZES/GfVZLUu0m15XKfEZPk7/0wzch0Phx/fh6UIb5DtNIvo32WW
	 afZzEfBS10FOtDlR+PfBsRYEYYvjcLthOs4fqjROE8QHOLfoTy4ITdvXZ/FtdEV58DFT2
	 zgTCQ3WU6i8Ij9/4hI9+AtuusodqpjlLzFGruaPbxffqiLErmzKJSov5ZSmiEMxEMeItc
	 YXpVK7rySBVS5g0tUT61qcSV1bG4MXsguh9O49xUR70Sr/xxVD9HKhGFsz7MuJlGMdE7s
	 nQ0fW/m0UdQlFfdG/7yMeYvwZHDxown/QY9oN/vXyLWqULZzG30JE8W6YwmLhwL++0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jFupvv06LsXCAl0vGBUfBexOAZyEYwTtWknj0ciKxIk=;
	b=UqxEe6Rs5DMuV6XR6M3XMCyBQxPlHUD14BkkBktbsZ63/04mDB4Yc6wf8z4MLgXx6O4H
	 2NFEogdRCAwq5yCL9soF44hpc7P2VOzHwJjbxMPR1jNakkw1Vt7/PISpTKsMO+kGpj4EO
	 xrYYbarDJtrU5A11uouzZ5sVYOtupmuTOZ92XUa6YW8SezHcyfnF6YDLlHx8x0/hjmW3I
	 FH94k/UcRaIADZ80D07Yb7wtAWp78U/0Lj46cbE/U/4BgUvXzn59zhIxsqQmokU802Dt7
	 Ma+M8JEEFLHRyGZS0XYPhrXYJW5Xrwk3aiYy6qpiKkO3ft1f7eP8Vrfyo1S9mxUh4IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PdvPemKw;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631D3606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PdvPemKw
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4764454f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795632598; x=1796237398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFupvv06LsXCAl0vGBUfBexOAZyEYwTtWknj0ciKxIk=;
        b=PdvPemKwVto01SZ+tm7zotUP4fvFTPNg7Ws6EaMlPmBd0Db2HSC3Dmj9UppBpaaUKo
         pFWHbBtbiECzNwsVOzrhMIMAqY5XnABvQjLc88+eXiHu+9DtYdQdvk5NTqJLwRCbtwhb
         9CNTbsCeqQ3+wN1pEqxynB6E6qxkdazrMMkCI7XxNLdDI4CX234R1AmZaQjCbneEnnD8
         /FwlXspWWMA8fxZCFfeaiuVdCjuEt80qMHAeYBoBnk/9cpeIc68WmsJY5qmniCed5y2X
         eIOy36OI6bowksUmZu6oRwkqKgbuRoIzwhRc8vHQCeJ4XTcl4dpC9M+bL+DVuhVVrpBN
         UVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632598; x=1796237398;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFupvv06LsXCAl0vGBUfBexOAZyEYwTtWknj0ciKxIk=;
        b=1SAZ9yL4od+st+1bWNb4cthJPpZvlACewjgvcMjWKYVGWEjJ32jy/zf/gMn8e++wyq
         aWsu+hu2AmovE3HG6uSTBWb5lfd4MmO9uG13OMG2J2ik12VV3nH0WmyxJi/dG1VMO+XZ
         4LlmbbrnX5W8q6AwlbnSZN7U9aEBl+vNAam9uLhqk9wqg9Kc+FK6F4aA7eYMg3oT0YJz
         G+9G6JwiTg+drxFtBGDT8mhTwhSjoucM8dP5Y9IQ+WppUHcG+2UNeZTYkztbgzXZluVi
         TlRTG08Tji4P5XQmKUYMR/WYLMiJcJz7mtV8kK6FFIOuxPI+dFJEhKc2XHQwA7GVOBAZ
         Wnfg==
X-Forwarded-Encrypted: i=1; AL+hErGct6YCgpdfw3v3nkaHtmcAY4r+14xJ+JmtiHeYNIekKRmhlYRA+gpbHQG/SW9Ig/t4r9ggDdIeAmeWDY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ht/BJUYta+QhGkDoRb9MO/wpuwNpOyV95mi7Y+rlaIG+v0Uhh
	GQ68WGWO2SzxwhjEvOn5WqYFmP5ccY7vxj1zKLAVA29x8jbhKdi4IS4eehF7BdjbAuw=
X-Gm-Gg: AZFdTZdDSWuXUiK4dFqDQPgwQ7pI/QDKP6sJkmYGHq1FYQIFxUBWkEUZp2CdfrXvBmT
	zGbd8jJOyc7Es6XITLJlH4R5PN34ds+9FVe4uHenYKfJ152MWJw4/ocQB7jdl9MwVGMdqjrIv1k
	qXeXoUTZepzFTSkPwIFt02oyECWrC6Iohi7PgahzyvL8xTXu0cBi7HbYqdmYeNm72ZZkVK9Mu6F
	zQINdrkkVVQodzuYprs5pL6FbNWYxzeay0GiAlglrSpT+G0ElZ/sUusEWixQL0ywV6zY2bOd6Vn
	WYptYG6RzT72w9i8zS1ZI4S+azNXOSN4s/465Wjh00HrhKp8knDEughSR+GMBrFH67v3iuQkO5c
	+/EmMIJc3wVjTcotXqgFD+qumxPF475uVk7dgtzTRorgB/pPRx01UsLiR7QoHTWYZ5rGbJ1FuSs
	pWi8ExWiQ5lX8+AIsTYFT9EBUBmGi1vNJ0qBzHatncG/bkAYFydoF7oNw7ZtNOq5HPXNQuc4HRB
	c8O0T9Ql1PIyym0EVG26IM5tWqxMAfxnNmbmE5w895YzkJRlCyH3oLvUdDbTmxcik2CusP1f+/x
	QJLhjSpBx4rBick3ylBs3170J4e7wA36hwQLSiS1u486vBoCYUniWrlJH6+kvJ81YAzxK7xZ5ME
	HCZoHomn7TA==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb8881d4damr393393525e9.28.1795632597466;
        Wed, 25 Nov 2026 10:49:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:84b7:1ee8:d497:908f? ([2a01:e0a:106d:1080:84b7:1ee8:d497:908f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm555244145e9.3.2026.11.25.10.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:49:57 -0800 (PST)
Message-ID: <9dcb4721-a756-43b9-a8c6-34922dd4a115@linaro.org>
Date: Wed, 25 Nov 2026 19:49:56 +0100
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
Subject: Re: [PATCH v3 2/5] drm/panel: lg-sw43408: skip backlight updates when
 unprepared
To: david@ixit.cz, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20261125-fix-blueline-panel-v3-0-914b4a30b73e@ixit.cz>
 <20261125-fix-blueline-panel-v3-2-914b4a30b73e@ixit.cz>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
In-Reply-To: <20261125-fix-blueline-panel-v3-2-914b4a30b73e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/26 14:08, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> sw43408_backlight_update_status() unconditionally sends a MIPI DSI DCS
> brightness command even when the panel is unprepared and the DSI host is
> powered down, causing sysfs brightness writes while blanked to fail with
> -EIO.
> 
> Pass struct sw43408_panel as the backlight device private data and return
> early when !ctx->base.prepared, matching other mainline MIPI DSI panel
> drivers.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 92cab6478ea61..7f7d7b6b17f61 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -181,20 +181,23 @@ static const struct drm_display_mode lh546wf1_ed01_mode = {
>   static int sw43408_get_modes(struct drm_panel *panel,
>   			     struct drm_connector *connector)
>   {
>   	return drm_connector_helper_get_modes_fixed(connector, &lh546wf1_ed01_mode);
>   }
>   
>   static int sw43408_backlight_update_status(struct backlight_device *bl)
>   {
> -	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	struct sw43408_panel *ctx = bl_get_data(bl);
>   	u16 brightness = backlight_get_brightness(bl);
>   
> -	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (!ctx->base.prepared)
> +		return 0;
> +
> +	return mipi_dsi_dcs_set_display_brightness_large(ctx->link, brightness);
>   }
>   
>   static const struct backlight_ops sw43408_backlight_ops = {
>   	.update_status = sw43408_backlight_update_status,
>   };
>   
>   static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   {
> @@ -202,17 +205,17 @@ static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   	const struct backlight_properties props = {
>   		.type = BACKLIGHT_PLATFORM,
>   		.brightness = 255,
>   		/* HBM can go up to 1023, stay safe for now */
>   		.max_brightness = 900,
>   	};
>   
>   	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
> -							     ctx->link,
> +							     ctx,
>   							     &sw43408_backlight_ops,
>   							     &props);
>   
>   	if (IS_ERR(ctx->base.backlight))
>   		return dev_err_probe(dev, PTR_ERR(ctx->base.backlight),
>   				     "Failed to create backlight\n");
>   
>   	return 0;
> 


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
