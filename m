Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429689;
	b=n7tgEyLYgt/oJiSoNZ5pkDUXdJRqGr6Ht2Ka+O9CFZ2rrVNFLVihj4NXbeU/Xo6iUVbk
	 um0vILSEdqaOQ0PMBOvkzKVsX748vUmZe9JmfXK3REqKzoO9xODn8GZSvhj/pBsDZhT33
	 BTNEtuYbgltvJl4lMJaEbJM7Z3gH6lrvlaCejUNVi0FJg55p9WmbeHW0cpGVjGOhGZD6z
	 11QocWS4Nv8pIjt9O6ZmCo12qxDXIWk7N4E/545bhV+zaSSEhMhzE6P8irQWEjXWx2+XE
	 W6InMSNqX5yLlhbta/mNn5SrPA3zn35J8dnuYMraqJitPaOqPTFprbPxHfLGFKhWMNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=;
	b=FMK17LrOWslL8I4NjuEp+AjV22vdbRF0iQ53G3z6yYoj9b1jnRQyfmLqWjKjALQCO+r0
	 SA7Q07M+jhlnKIPjwb5V2yyV5dVgKJBOXDsixcEmwH6V3pTmVDxz6bKsj1eX3qCBnvb54
	 xJcbdsWgl82svriS/Mv6OEy1B1JeM9VbDe7FzRoqBQ7XHkOke+ZVlvrirWo7Pm8bKtsLw
	 cW2BhwUwNGqk9+5m3y6Lf0LEhd3HcwKsnp3Sgp4cyDbUJQjwHlf2Nvemcbj6Nw+pA6UZw
	 VW4wqYSyARmAtD/SkDwfgATd0FZ6UglVtCLc7KEcLbFcQm6vQF+xRX4b25RE+LmMdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z2UulOCZ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABD5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABD5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z2UulOCZ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1899351f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795429687; x=1796034487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=;
        b=Z2UulOCZoOx37jXThgbpvgQibkiWtRc/IEyak+MkALKrCOyyVolZSlFIl+6jPe5yT/
         q8+4ltVl5E6GR2nQ9DnBy/8RDm8ItyxPtl6273a1uO4jHP5GU56Dsee9FyR65u5Nya3Y
         mD4xykJvMvzh49Nyib6wKZX0akV6UohGR2enqN/Mc/znC3n4xtUhDxXy/TlzgSi/6F+Y
         pKU5BxmS0mOYhw8NxJfWVmk0wZ63gGqnKkZcX2nAlDWLuDGYp8nQWKf6HxjhnX3T50oE
         xa+nuhzXrmjAK9dqW9HJQKhOwIzz8eINIkp3ALU0ACkG7jdtqq+qLHtcjz7XCvz7/hnX
         WjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429687; x=1796034487;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=;
        b=J/w8tWRhTpCDL+6XB4Z9UJYD6++SE5DXk782eLq6tu34ecFKl3YJh5prnRjewjjSZf
         p1i9tEc+OPYPU6uAxfp3YmfQDP8GvdH1q9+8MyW3xaCCK2ZNGMZ7NYo0RoWSjVzIv+8H
         rKzp7xl0glNB4wSAzA7VlHP4KY8a8+DG7Wsp8IJjJQW1kl6S2ta6OcBbZnClvJFbwQmF
         znIkvWCW9THKBjhmSmw20IqcrYZ5DeSn9cFGmQYGT5HvPcNtuBNvKg0tZAjdF7jGEj/7
         6S0xdQciYTCcvETBtzMHEWKxcnC8QaSSFFiKzR2RZoWsv2a3FB8a0URgd24TkkNmt6kq
         uxoA==
X-Forwarded-Encrypted: i=1; AL+hErGG8jrqlJXqxGErOW5DUbLMvmnYOVk7SFNUuRHkWI7uDLuqkTdvbOQjNNyd7dSPDN9PM24M05YaBNF9Mf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FIcff6sslU5881pkaRmpedsaq3v3DfziJWd8QLr2L1uH3/+/a
	bugnDb+uWDeYnBHDxUl+nTAgNRkEvz9Jwz+YSBaVm/sBH2GWac9FZ5wcj00XKZymY3U=
X-Gm-Gg: AZFdTZf9kmnxZbpcVsBNtZn6gNxk6IMCEmu5qP+tAJ0XBpgHsGsfaA7tvK4qQedsyXE
	ifmWd7XwHbUOHvQ/x1zn4KZwsu/cBweQVJIxA9mmjowOZpzutcr4tu39vW/8wdkN8kuY8sW0tRM
	V32NlT3cEg56/0FchwzfWSsCghSwzg5g3gKzbK5qCNviQJ0RyU+uVwHligpdJ0mJhY3C0t5VNLS
	mkEQFi+WUTqXNWiMIagqIA8WL+QpjA3ko7hWQwuor9RGhFvL1TFH6tdnUGl2bG/A3VjWcYNaIQj
	heCc7tmSpmTDHbmgFQEfH0Sm7dFgyJr1H4c8XGa3/ElkMakfLPHRlbpuYQ2t1HLgWzMJSRIc03n
	3vSA5kzZI0IvPPzUeKBXtgnuxvGlu7hQWLVguSFbowqszrnb5lbVc2oBuuNrzRm0alrkas0ZEyC
	NBR/33lEAMdYIQo/BOoRSqUfktJYWmlOSm/k1S1wvyQ00NPC8ROpIBVZUbAw5QvljGHWx1eXTML
	WgJsjD52yWGe7JcClQXe9FrigySL3X0vsctG/MXxxbVRbDW0JzE6ojrcH6R90xreDVWbI/34rjC
	U5/rriemNhpNphHmLt4MuvhnQiYB5gjqUKQTQD/Cu886rraDm8x4FqVcReKhiXqDZ7NOfdEVil4
	66TeIDXpL
X-Received: by 2002:a05:6000:29ce:b0:4aa:6e52:23a9 with SMTP id ffacd0b85a97d-4abb0e46a60mr14731002f8f.15.1795429687181;
        Mon, 23 Nov 2026 02:28:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:121b:474b:8d1f:a239? ([2a01:e0a:106d:1080:121b:474b:8d1f:a239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm21617870f8f.44.2026.11.23.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:28:06 -0800 (PST)
Message-ID: <5f61fd6f-309f-4e8c-9df1-3c532a79cd4c@linaro.org>
Date: Mon, 23 Nov 2026 11:28:06 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND] arm64: dts: amlogic: a4: fix pinctrl node
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-fix-a4-pinctl-node-v1-1-c92b931a1766@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261123-fix-a4-pinctl-node-v1-1-c92b931a1766@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 09:24, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Fix incorrect pinctrl device reference when adding GPIO to pinctrl device.
> 
> Fixes: e9bb91734871 ("arm64: dts: amlogic: a4: add pinctrl node")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Fix A4 pinctrl node.
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index fce45933fa28..6587e3578f8d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -218,7 +218,7 @@ gpioao: gpio@4 {
>   			reg-names = "gpio", "mux";
>   			gpio-controller;
>   			#gpio-cells = <2>;
> -			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
> +			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
>   		};
>   
>   		test_n: gpio@44 {
> @@ -226,7 +226,7 @@ test_n: gpio@44 {
>   			reg-names = "gpio";
>   			gpio-controller;
>   			#gpio-cells = <2>;
> -			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> +			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
>   		};
>   	};
>   
> 
> ---
> base-commit: e3194dfb772304a1b7ca3bcfccacefec3468b7bf
> change-id: 20260128-fix-a4-pinctl-node-6d7f9c29b32a
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
