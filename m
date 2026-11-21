Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261714;
	b=WlhQD13NVsOO/hS+sgJHyt4PwQ8LAalHHdY442xSXiQGwXxyYFkrca7S6bUGcuuLrI2X
	 TavpOz/Kr+kY3sEcyNVbRqJTwI8n5pxB0N56DT1RQ+vau9i3nqVFrRFk33ez4Mz132mYx
	 ccc7Ow0FDmrcmag5FpsAPdqALyRtRK8CCJtrDFPG+TjumRw1d26O9kTJcy+xunk5yHqzh
	 0FPyX//VKSAF806/iPAjLugfymb1bENsZPUVQBWiXmGOvT5EH/wG26dGBnvRPug43QIeC
	 5UvKqQLFc/IZqsXxnJJnn7j87ERUo1i4t9MclrkWVEZoLo6KEP2Iww8N6CyTc2317Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yRL3JyiAib4oTHNTDKyWbrLU/IIxfk4M2prFXzJ16C4=;
	b=Tg6mH4oJC2r46ymYALI01DJCN59wmbM2M4uY4Rnw4f8SMJUIC1nVAvZrECiXqcto1bDH
	 7pa2AB9KD9LUVCyvCrgtBakJ2NyGLG5yaNIYVTC2tMNGO2E1Kj3Itkp6uOx5qKxK8DOiJ
	 RBJ0omaFjehySYlSIJDbagwu+ar17drJbOgqosGGV6lrGPwhV6Ij51Ms/rcvk4M8WX2uY
	 NqMZZBmIGXqneijObT0vSOqRS2S8YnvtsPto15i11ZGOXgv0kn/Yl3Fx0IpjCofhfgreK
	 3TA89kzw9OFAnKJeAx0nyo0njX+7xrxm3EFyr/0OG9jke9sVK5smUp0QCAgY2N98CNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pardini.net;
	spf=pass smtp.mailfrom=pardini.net;
	dkim=pass header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=Mne6+kxR;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE0606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DE0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=Mne6+kxR
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5154989984so138442466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261712; x=1795866512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRL3JyiAib4oTHNTDKyWbrLU/IIxfk4M2prFXzJ16C4=;
        b=Mne6+kxRk4peScxi1p4LMuh5Ukrs8q3jZFQdnWucYimQYiEAd7IkrocX7QJEPHGvCJ
         UroRwRmvHNgH5DPMMtU0Jcl0hQ4sYgJspMjatb/4wwvBPOJmPJGSUexK/Ls35IrYCglI
         8T0GjrqFn+U9dkivDxGYjubSnoHgJzju+qYmm4PVum/ENxklOxaEKVP7SFJeMInSNFYX
         /AD8bVWB4JwAd2H8o3WnJPIzR+sSAyftywZksP5dr2UYqbjlIDsKgv3q0dQ1VsZrsvGx
         AAxRu+sut4qMf7ddnDpmHN8lzdU4Eufnj8peQudcdL5pzasSWKN8Ey9oxJs2qUybeUKb
         /T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261712; x=1795866512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRL3JyiAib4oTHNTDKyWbrLU/IIxfk4M2prFXzJ16C4=;
        b=slUe9iHXJ988C0vDtSPZ4DlDSPxH/xnXGepoKF0PANcMOS0xabwrKO3EKQ7DOg7zg0
         TSuTX2ILbteuUIYjO/0JEMW/R4KyOIELfJEopObs6bLFiG3HCWn9/wKOyxEI0L8GWw5j
         AHl7Oj3iZyIQkNDvyhm0wQM+Eco9s1SpA3KMxHr22faQa0WtBAOZX+39Sb5XQbMpX8SA
         fnspD26G/6dZvCrS5p4M1l1OTnoQqoK8xJVnKq9fCuRmZbGbfs0cZ1hFb6vi4iLRQ3O7
         P3uY8gNlYm+nxarzNLskPgIYDWnf29XVqSBNd1nqdvUdxy60eCJSaZ48ErRJTZ9Fp8IY
         kLSQ==
X-Forwarded-Encrypted: i=1; AL+hErHrbzT0ElIUrzQF5QbP1KJo35eNovZp0z/Eddz6lqWE0dIv5fWOSRyk2cVXRHs/jK5esrnpN6x+RaCVqfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G7zKWcMcN/kSQT94Q6njZNFjOorwcKLgwjkBMne2sU+Ru4wBs
	yx4po5Xfl9eZjYR8/ipla2UyKgpocWXiprFGY3ZuZ1Qmqa2jPJ2YTyEq6HvBkJcDrQ==
X-Gm-Gg: AZFdTZcMgyQ2cA6dNx6KtsKEDY62BDmdszniEhvwtyrgC2Bi4XVvA9Hmv7YaE4sXqnK
	t+0Qyxgb7XzX0Oq7kSbJt+X3H97ADVPGisQr7TA48m94Pdhx6AyaXMdeD1IQFCvM5fYGTPgvQjR
	TOpz4XL+y9NwCAqd7MU8jFLXC1yon5vW2KM455YjMER/7mxJ1uDM8RjQ57vmVhY9SobR6kFlqUw
	Kp0+CQmzmdFT39MuHsLWxvibJZ+mArPDOML/EnaaZBFuuw22wvslO4N5Fgw07w4sRM8fj44E5JL
	LOutydzWwdcqJYSIab7lMsetvX4wNjgnnbMrUq4/gI7J/83c1EgUX4VSDMBT/fqx/RHvR09ahLU
	ttX9D3OZCo34IpN/oTrys+4mOZKocbCVI6yQyJgatUsXNks7+bB+Sah9+rl8RhET1rf3G+0aJ+V
	xusEZQEEUoyuz8wYW4kCI/4jallOn5HaTHOSn8KW0rcHU9+XzosJ6qH3DVhDfxJSc2bNL52kKrt
	CY/GPDcyDFKVITmRh4yzhdWtXbtn2R/yA9QO99WLy8S6Yawmix4092OKLNnJKUaFAbSXcT1pwOi
	GAgdaOZMZR6sr2hedPlvyQZJXs+a5Hf4uouq+0tWfUkg6mbhoTKm9YHgpS2xorhfdDnrR8r+5+y
	XHQ1gzZpqKXQfi+zNCVO07dpKiy3P9QDh8hq2qcL8rFqLusTEoP3Sj8jyk9ySnKYM5GCW86zCmL
	HO
X-Received: by 2002:a17:906:eb15:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c513a5ed086mr409503766b.11.1795261712641;
        Sat, 21 Nov 2026 03:48:32 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afecbb5sm193756466b.71.2026.11.21.03.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:48:32 -0800 (PST)
Message-ID: <139cd117-9a75-4304-9e3d-94c47476443e@pardini.net>
Date: Sat, 21 Nov 2026 12:48:30 +0100
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
Subject: Re: [PATCH] drm/connector: Cache out-of-band hotplug events
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20260821-drm-connector-oob-hotplug-cache-v1-1-e92e146fdc7b@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20260821-drm-connector-oob-hotplug-cache-v1-1-e92e146fdc7b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2026 16:55, Sebastian Reichel wrote:
> When the USB-C state machine finished negotiating DP AltMode before the
> DRM device has been probed, the out-of-band hotplug events fired to
> early and are lost. Without replugging the display or reloading the
> USB-C driver, the DRM driver assumes nothing is plugged.
[...]

Thanks for this! Tested on a Mekotronics R58X-Pro (RK3588,
FUSB302) on v7.4-rc3 with dw-dp v12 and usbdp part3 v18.

With an Apple USB-C Digital AV Multiport adapter (A2119) plugged in at
boot, HPD arrives about 2s before dw-dp binds. Without this patch DP
stays disconnected until a replug; with it the display comes up at
boot.

Note: I used the rebased copy from your rockchip-devel branch, since v1
no longer applies after the drm_utils.h rename.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

mvg,
Ricardo

