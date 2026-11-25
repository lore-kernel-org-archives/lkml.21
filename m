Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621201;
	b=gEyH9gV4KQj9zEAGkKczjm7BztIls1WvWEAAXoQRyw5ipJdOnn98VBliGnCxdMIZ0WjF
	 D9BBRN1s8YuTi5CGQdw8rAEbhomUhnJMrVJ++AEOfhEiPkVL7H6ELUGso61FEpr6L/Jgr
	 Bu4Gea0/Dk01miFk8hZCiC0qzdi6iVzGYACPO0lAytCbzh+G3bp6O5GbggMd5kCi9FzQb
	 a7jTEu4ZU0IMx7lh69ynKWLVVQumuHKFmOh6H7JPW1iVjMPE0sX3AbYhj8yNtZfHgo5rr
	 MNGze4kgrJq4z2x4frChlNXsAJWjWMY72nqJKPbanHA4wLBSwnrF465HRX4GeAk6lRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
	b=rOG3JNy5tqvnqjnCEk1SeqoMmoaNE/DSqrJTs5UmGN2GFkZI62UFZMCLauV32ol+5/fc
	 3vDclmolPJs1kRwtJxZ6BwfT7UHUWL1ed27JIe/B7iAHvq+PK2brpVttzTJLxGxyFpF6X
	 tSX72mZuB3iVTFq6TgCBMi9aFROy6aPSiN/XtLPRd06+jVe+QvmXewM9Hc8LnrlAY22nV
	 89yirXUQj8QP42LPPgnsl60cyVvN7zAY2OtNQH9rnGchjJctnpQ+Jgt5laYSipxagXCDt
	 ImR6XFOUJdpAcufHhP4355WmgZe9y1Lzz8+ug25AbBGHK7dI20u6U5vv1G5ZnwUit/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RjxdsfKw;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E6A606A68F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E6A606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RjxdsfKw
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so56646545e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795621199; x=1796225999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
        b=RjxdsfKwvvddGpQSiNhRsMhHqK+KznqtEzdvJlHNkNxRcNDDOnVVWr0obg9T1+w5YF
         IXSVqRD72Kt14j7/vOch3js9XRZ+MOQav6q+WBeAvgDXBYU5UAlDmPZTqqj8maE6QTzk
         RH8OhZMEzGRWmI13DO0mVDzTjznLEvNsLJudBVG0o/2U0CAzCh/p18Eis767vb0mWFkt
         wOdRWWP4FXylRdYfohZkobSdmX/jcRRrz2lvpCrUBmEAS1NrPXbhC2X+VCfPh1YPFPHV
         tgqR26Le1ES5fcDtsnSZid+RMgOyE6a704dSJca23QAMgNQkjO3J1mJm4VtXdQs4IgSd
         E3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621199; x=1796225999;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
        b=0rfl2rvnztp3uFpsTtsP3nSI8wU18dvjXAzav08TT0qAyFM8vbHGBNeTJ5/ofY4toV
         82JDaI4Aw0kvBmlIKcojfahVQo8dsSEsFAZONoO/SrhgGEFL5wUoKrgzaBgbPgWAxq6j
         lHrWtvqxl2vaDEHlHn4G6+Ny2uU6stMqSRuRLi9lhSHy4PcGOlVdzOeCJOE51HmaZAdc
         Viq0CarlfbW4n9SdszJtG96VTsj1xm6rnPvVWqyG1K+xz6VSFraGI94w6ZLwbia5DXAh
         /baldT8YQFIqlndeyJv7cBJ//CH+aC9fAxaN8l6djcg+caUZ/b0uU5fZyzv212F6ZH7p
         yHYQ==
X-Forwarded-Encrypted: i=1; AL+hErEkZctH1WcFwGM9cI5cVpNOswTxNJTuKI/O1O6i/fmDjzoa9sTqR4uZ+V1wiHn5Q4gtMpCG+s6vK7mjXCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cMNHmidjq8jOHxWgwFiDIPUflVeZkMk219f7a4JV8n1DqNVk4
	YMs5TCRUjH/ARkqVcEhoOgebbEcQhzJlei2SduYjIpjBJsYHEAi5WWVNGmxA4u1fqS4=
X-Gm-Gg: AZFdTZdXl0a9QnzmMoPWLbQHYVXSVUgfwKq6coCaUfur+Ymd5hwyCHwcBPvUs3hmuBf
	aza2LTd3EDHtztr2Gl+6T4dD3laaDwex1Ms4krbU5EiOCmDHyHNxBoz66tiC4bRLTg139LQv5KI
	2Hq5yqljRxX7746eoXzgHYa2BFQfD2Xy/nsAdbGzFAQ+ZjXkji2PV0ajnOkfTe/quXE4o31Dfdd
	pJ5wNsYiwxT/uN/D4P2OEiEaZPsh/oZWUMUICjanG4hOwz3aRf9+aq0HaQ5wK39N8UQpdFoTl1V
	rMF0Rf7eyz7ml7VLC9ONX2c9pv4use41BsBq6nbHQ6iHL58ulBY6Bjf7WKKwANHMkJaes/azMoL
	oc7vArFKFig8Kntdm7l4Kn7nfgmIssStiV+769pFIUF/Cy/d26p50FRSSn9UyfSZnJcewOX2tVA
	bStqHPUW/pLa1qXT3cJW08D4YNskrrptR4RsDObncqPuJ7urVZegs/qUtF9XLzrqsC3IwQVzXvg
	X5fsdc36QCDaXUr4ip12CBQXz5Ljb0jxj5oMaHeAvJMBr3cgNFdM4tu2FqnCkP+vdJUZgGbGnv1
	WBi077Odedgpj632LJ4AJZC9TmvXgjVuo9zU3w==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr427623865e9.6.1795621199120;
        Wed, 25 Nov 2026 07:39:59 -0800 (PST)
Received: from [10.229.50.9] ([90.82.202.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm14255031f8f.9.2026.11.25.07.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:39:58 -0800 (PST)
Message-ID: <8a9a4fe1-0fa5-4c48-aa88-f61b3a01739f@linaro.org>
Date: Wed, 25 Nov 2026 16:39:57 +0100
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
Subject: Re: [PATCH v3 1/5] drm/panel: lg-sw43408: use the full DCS brightness
 range
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
 <20261125-fix-blueline-panel-v3-1-914b4a30b73e@ixit.cz>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
In-Reply-To: <20261125-fix-blueline-panel-v3-1-914b4a30b73e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/26 14:08, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The vendor changed the value multiple times. Last value for production
> devices was 900. HBM can go up to 1023, but keep value safe for now.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 822318f546ef3..92cab6478ea61 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -197,17 +197,18 @@ static const struct backlight_ops sw43408_backlight_ops = {
>   };
>   
>   static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   {
>   	struct device *dev = &ctx->link->dev;
>   	const struct backlight_properties props = {
>   		.type = BACKLIGHT_PLATFORM,
>   		.brightness = 255,
> -		.max_brightness = 255,
> +		/* HBM can go up to 1023, stay safe for now */
> +		.max_brightness = 900,
>   	};
>   
>   	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
>   							     ctx->link,
>   							     &sw43408_backlight_ops,
>   							     &props);
>   
>   	if (IS_ERR(ctx->base.backlight))
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
