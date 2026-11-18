Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005269;
	b=0suAS41c2zWsRuIoVJiFVT4+3DKeTQ9b/pspp+nIQruUqitTLcRqpCrQpgVAl7h1idrh
	 +c7G03wO7eN8J4Tf6stq+ojiBPnEtKMzcV5DYwlE4asQzw3jzljKFofM5vPECaydq86EQ
	 K/R7maYn2akaVnjbtOOJn/tCkAHq/Ppl5p/lkF5sWXeQFaspNeCmcfNaG1/TPXc81IUGg
	 4K7oXMfb3QWjjxrawgj2VgOQR3ZeTqB5CFK1yzHcfUcYr4lE8zLQv9yPw67Ovu7d1W5tI
	 JBkt/O3vujToZ/vpSS10qtOuLdNIMen61Sr64A/GXYqd8YQStyQmrI8LhtjZDwDQIow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=;
	b=EO8CMT4u5z3lymr5y9XqRAklOaIdtBfqy1db+fuDt+ctwhj6PdJijI0YDFwjf6XhxGyi
	 D6sKXoyK57EBZU1+cX5IRfRM2W3njy+S23NsO86918lCmV19uKeh6N7VbeVG2gk1KLnO8
	 4x23D8UmTevyPC5CcABQYHRkH3W6eZYsRU096bNZC8WKJDiekXHTXUL6UT2XADJU/gUiv
	 s0MKXAwwOxBxhiULnP4ppObMbWWeYbIZbIS9DMWDZaJwys69pB2yZidyRcQflPbZjkJWF
	 kpM6obVij4rIYoW4etjhx4LRySWUdWDvjPTCZixzfQ7XnFhpPbjU4O/D6Gbil9DVRUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zkKo2LEP;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zkKo2LEP
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so10809915e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795005267; x=1795610067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=;
        b=zkKo2LEP3/ymgPRDW9n8rWDi1g8Go0sY5onHwOFAaXSRwN0FeYcbFR8oy0arRLA2gR
         GltSRRjONi/WfGI/e4ofJt8RaPzofSLBoAfjo4Tw814qvqon3h/OckCmAuE4A3XNcwGD
         pZQwucXTC+Sg99gQlZFOy1vjMY4daODSag09sPgmiFi+DE2dTyNyyE0k56imBNjIRD2P
         P4vxRJkbVUosV2i4p/hf7jjZfZ7BPqf96LJR5L2qFqlIWkVhvAB9DQGiSPNUDFi5WbSU
         tA5jUuwM9pQ3J+hWkkh1sIf+1Je58wUVIlEzvzLkZBMwx4K+U6GzMt28ODqIcRBszzHx
         E6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005267; x=1795610067;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=;
        b=pIc6dVynJnftm0wCmCdzfVQ2vJ1st+qNHbi11tlRAm3JBMdUAIEKg4RBt8IHQQx2Jg
         ZmLF4eOCjBCLkNN0WK/qPCyvH49GbpEzX/dbPOv4vvntJRUqgM9F6sdfG7z64i6qfR7J
         fRswLyuAVtZ+s6VrEWzVRI5AIK7CpZ8p6laOGfajHTBSosk7fh0rf+DxzVoWhrx27YHy
         sHwGcwsEraxPksUgoilKYddARPxmxPNpLFPrqpOqJszsTlLlMTN5PC1mOFlhhJsLUaA2
         eDUwrCLIUHuSf0sv8qxfcUhirLdU/g2q1Nac/ZeAHxQ3qah0u13SMW7gY9YtMQkGt87l
         vgHA==
X-Forwarded-Encrypted: i=1; AL+hErEkEUeBFwJZRZuuJsKBTDKnMwwb9+vTZb4ujE+t/QRfgqPfiSfvjAtQqGyEp7ObgVq86mp+4vWX/73OW70=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oqfMTPhlXAo/jgrIrRYNP//Y1wsLIsNo0yTmNzb8RMiHJm4wV
	zRSv8fVOFD4i/zHfZ0yTKehj1copqh/y7LToLpwBym888DGGtIPxCfTr7m86rhz8UK8=
X-Gm-Gg: AYBFou1EwsMkU7crxviDlhJiG2AMW38kWm4NkPBTkTc4N2trSSh2gLRxc25UIwa9U6R
	LW+G6C3rSVQbZFK0ulrGWnrtyaLdemXFZuiKrM5qK9EZu4iwn6nSXfDEPhGNQDaS0XU+AbWhWlR
	wZwIxWkVg3/O4wNB6WukXJik9GqM4CGKZ9T/gIw4Y6KPPPyS4+I3+Ozk/LCzt7mCZXIonFjkoEp
	Zkm13SypvwTYguFOT7f/SJo/3342q3pYYWPvueKfgYXZX5dznmKht7bKkQw3Q3f/E8og/yWJiGo
	wX/qrHywlPR5XzhB+zFBBWDyWSOqhJGTsNvUS8kKRQN6d0EVD2PnyQJdRsoP/lOJibKbJ+BKefd
	YeRr6RDLjI513qp8KojwxOwW2Ds3cY0hlmvfZ4Qzs5BinflxldLsCrD2LuiYVAPwwngEmLKfJVM
	RFYrgfkgi88qYdL6nBrzfX2yP3QgX1XquL3LXlreiFbzrVacRShASQL2IIpi8yNBzPQT4nHnVp6
	zFWV1U8msTPaNzhDc2AlOjzoVoGyxi4E0Wvyqk95M2aI2dEkS3n6+hOY6xG4P0+cm9UhDEro5ch
	EvwLEpzWUBQwImPc7vO/md0kDJcQeRs0IURxYZbzRG58U4MdjEVMScfmbHffmU3DDfrb7ICvYnl
	ay8eRKKTc
X-Received: by 2002:a05:600c:1d06:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb7da25158mr46260185e9.18.1795005266845;
        Wed, 18 Nov 2026 04:34:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6ca2:2772:9e53:115b? ([2a01:e0a:106d:1080:6ca2:2772:9e53:115b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57664esm26749835e9.1.2026.11.18.04.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:34:26 -0800 (PST)
Message-ID: <3e82658f-1152-4c98-b996-242abc203f74@linaro.org>
Date: Wed, 18 Nov 2026 13:34:25 +0100
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
Subject: Re: [PATCH 05/10] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 phys and phy-names
To: linux-kernel-dev@aliel.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
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
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The HDMI TX PHY now has its own binding and driver. Describe the link
> between the HDMI TX controller and its PHY with a "phys" property
> holding a single phandle, named "hdmi" through "phy-names", and update
> the example accordingly.
> 
> The properties are optional so that existing DT, which do not describe
> the PHY, keep validating; the driver falls back to creating the PHY
> itself in that case.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml        | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> index 416fe263ac92..5a033fec21b0 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -108,6 +108,12 @@ properties:
>   
>     sound-name-prefix: true
>   
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: hdmi

I don't think phys-name is necessary here.

Neil

> +
>   required:
>     - compatible
>     - reg
> @@ -136,6 +142,8 @@ examples:
>           power-domains = <&pd_vpu>;
>           #address-cells = <1>;
>           #size-cells = <0>;
> +        phys = <&hdmi_tx_phy>;
> +        phy-names = "hdmi";
>   
>           /* VPU VENC Input */
>           hdmi_tx_venc_port: port@0 {
> 

