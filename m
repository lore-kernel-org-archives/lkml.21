Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013134;
	b=S5i9+D/gdiGo11IfDt5VwrVjzdii85VUBW/e4UuYVR7l6LXTXv1KtLlWl2R7m8tJTZJB
	 eUXuOiiNeqNHoITdGXDrMVaVTH0kcYbqIhi5IHtos3H10/S2VXFoF+iTGbOgXL+pt2ejB
	 s7zjwVs/kmZxBZEFEd9u2lY9nZaIByEuJIWDfi9efnA9Z0Df9zeGw5467d8D1x3a1yVfA
	 h94DL2SXSClJz6KDtd+ViHzTH6hS3vmyjmf13m8k+kmNxjgrAMChu7e6vE+CFuXLqccuX
	 1YK/yoEYGS3QbBWdtuSWZZbVdKFO6nMHsa8E1MRQc6ytrRrj1Mx73P+Qz6d864kf7kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dW8jz8AGPYPy5zw3TfeSNEgxlfsTPgtxmP0tja/c/ok=;
	b=Sy+tcce/Xi43uXq9CX7qHs83DobgcF9JZO2G/FUWK4jlSBV/iXTNyKPsyfgz8525jAcu
	 oK0ZOqmvqp8y5nyEkT4TyqGTiSVRNMb0w/G6Vb1CT/sLW6XetOBuvtrpr7u7QM6Nz0tvu
	 m3Nb2OpEQSedaU5k0uF6FlfgpCaBE22tpFebPeVSvN+wpncaEc3Kpmi4mGqPrci5HxnYa
	 J/DsVNWVjalarbRVJRXnZRnxC7H/8H9DvYMj2rxHmMbaIsFfbWDmGJDX3UI8PYZXqf37Y
	 e1xz+khiaNDbeOHTUAE4ZFDqC+VE+i7p8Kch2fxgJBZm9sTpwb+9oQkfb6p/aG8PVWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="h/V3GnQq";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5F2606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F5F2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h/V3GnQq
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so7328725e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795013132; x=1795617932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dW8jz8AGPYPy5zw3TfeSNEgxlfsTPgtxmP0tja/c/ok=;
        b=h/V3GnQqzDYq2+Ocl+djVXBVuyWbqmvHG+OGYyfMN89qcxr7EWLd11cyani+5hjlv1
         WLNecqE7293/zllCuLdsKFoIFMM8fcNJhcpMs9c+7mypY5kOnCv1FIDJ+YaUg1Xmxldp
         xTrQX5ZC55Zklzxax1U7EhQWJSm+Yroo0mTyRZqMN29tezP9MUxPsKYS4KpzSHzOm8yX
         6pn/YAWEWzVXbVG2bLDqsqQxO8aZammeB8kymZOGTipwM1P7qrkPXfJBGBeXaJ7kSOL4
         upQU6siI/bA+SESuz/5YB89xWVFNdnooK7OWh86cdfYljPk/Pxoe1NRaJDHI9bGm3I5u
         JPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013132; x=1795617932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dW8jz8AGPYPy5zw3TfeSNEgxlfsTPgtxmP0tja/c/ok=;
        b=2QSYArZsmL3YWTan2/Yt+6Qs5VVIVzzL+DDAWjLnS2FEGZN3ZAwdEcW633zdZL3eet
         5uapYlTog+K6g3De7Ab8UqZv++ilZJpOk1lcJz3V1yFoLDybCEvfNYHW5/LUlfCMwRy5
         tXPT0LweotVF5B07S3YokxJa8PvpXX5+QOzMt38Jn0OsiYPO/sskufaeqRs2RX5yaEVJ
         xqvYUVdBXMiwcz6VA7QcJAlTjyJgJL3cADCna07CHUYypC21PVmH3jhGICmpqHziuJi4
         QIuMJF6Jq3c7vS3pk5tdIKpQ3jpnBG+mSqA9BhT9GRPvEoWgWLGZT4iH38+NSSr84YD9
         dAnQ==
X-Forwarded-Encrypted: i=1; AL+hErHPFRWfdmBp4Ts+LbTO4AVcEiIkoD3NTMSVoiLq0oZfPYfNbMSeNDLM8GTxjhOK6mG8tflNBqLWks1t+OA=@vger.kernel.org
X-Gm-Message-State: APuU4Z84YenVBckBsTvHJnBUI/hGjuAP1f+sPD6YqnVS/uUmVHgYKyZZ
	s2+XhPiebKVNipKDhW1lNoQW5lVf+I8PVTCrbRrU0lTa9qtNHbnGmKUDtfBpHTGz+y8=
X-Gm-Gg: AYBFou2meq2l7D/4nm5J4XrugejY8dp4A34eG8/m/XJNY9unOfr2Soi1JTHcDq6D2Na
	v21g8DJnqSh+/piFZmTJ4cVU1IXZwizO1WZ6CPGHBxAMMo8KTuR1LTMtUZcIkqpSM/3/Nvnb7LJ
	spiCH1vbRgW0nkNABDn3nvIakRa7RWiQV8ZNEZAOD8b6upudiQaPh7i0aJHufMH5BBi9UcUX5Ic
	DUV3mCRFSlG6BzAN9MkYgzUnkdmD/mx1K30/oeayLFKLB5EfZHkjEZeiWB95IMknpaba1DEqbwy
	r3SR3xWCFCnjNiw0Y1z+ED9LM7XSAjhHlfrgCzWS/1vohjhbWoRcnS+3+voB9qRGFBuzQ+6N9U8
	D3Rcu4w3ZfB2jAiN/B9HCnSnyUmPqIqcO26fzc+k+J4Pp+URJqIbVIao0qwaGFwCiekVIu0g+SP
	9l0WCzYreutvzTxSJLpeJN0DAVxc2O+nVQj9EIHMOPOrRfVCkBQrFoiSNl3nYTOcIk8LZI1akaN
	UCf6e+h44n3bGz6oItQI+DvKYhF/gVUt7OmKcVzhC+ckg6NwWvu9x0m+jFaMm4eEwtn31odxF6r
	f0breQlbzY+t8AihTwJNtzDwcWanRqpz7egL5/Q=
X-Received: by 2002:a05:600c:8b51:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb7da3a65fmr52309385e9.25.1795013132472;
        Wed, 18 Nov 2026 06:45:32 -0800 (PST)
Received: from [192.168.0.252] ([82.76.204.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm5382230f8f.41.2026.11.18.06.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:45:32 -0800 (PST)
Message-ID: <ee73f5ce-906f-4411-9449-d17c3abfa11d@linaro.org>
Date: Wed, 18 Nov 2026 16:45:30 +0200
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
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: gs101-tmu: add Exynos850
 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Juan Yescas <jyescas@google.com>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
 Thomas Turner <tturner@lineageos.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
 <20261118-acpm-tmu-e850-support-v2-1-19848c0d97e5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-1-19848c0d97e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 3:51 PM, Alexey Klimov wrote:
> Document the `samsung,exynos850-tmu-top` compatible string for the
> Exynos850 SoC.
> 
> Unlike the GS101, where the ACPM firmware handles most of the TMU
> initialization and threshold configuration, the Exynos850 firmware
> implements a significantly smaller subset of TMU IPC commands.
> Consequently, the Application Processor requires broader direct
> MMIO access to initialize the thermal unit, configure thresholds,
> clear interrupts and collect calibration data.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 26 +++++++++++++++-------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> index 75560ebca48d..bea208cd4619 100644
> --- a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> @@ -15,17 +15,27 @@ description:
>    both direct register-level access and firmware-mediated management
>    via the ACPM (Alive Clock and Power Manager) firmware.
>  
> -  On these platforms, the hardware is managed in a hybrid fashion. The
> -  Application Processor (AP) maintains direct memory-mapped access
> -  exclusively to the interrupt pending registers to identify thermal
> -  events. All other functional aspects - including sensor
> -  initialization, threshold configuration, and temperature acquisition
> -  - are handled by the ACPM firmware. The AP coordinates these
> -  operations through the ACPM IPC protocol.
> +  On these platforms, the hardware is managed in a hybrid fashion, though
> +  the distribution of responsibilities between the Application Processor
> +  (AP) and the ACPM firmware varies by SoC.
> +
> +  On the GS101, the AP maintains direct memory-mapped access exclusively
> +  to the interrupt pending registers to identify thermal events. All other
> +  functional aspects - including sensor initialization, threshold
> +  configuration, and temperature acquisition - are handled by the ACPM
> +  firmware. The AP coordinates these operations through the ACPM IPC protocol.
> +
> +  On the Exynos850, the ACPM firmware implements a smaller subset of TMU IPC
> +  commands (mainly temperature querying, basic TMU initialization, and power
> +  state management). Consequently, the AP is responsible for register-level
> +  access to initialize the thermal unit, configure thresholds and handle
> +  interrupts via MMIO.
>  
>  properties:
>    compatible:
> -    const: google,gs101-tmu-top
> +    enum:
> +      - google,gs101-tmu-top
> +      - samsung,exynos850-tmu-top
>  
>    reg:
>      maxItems: 1
> 

