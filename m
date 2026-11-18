Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005487;
	b=L8Vf8ayXuTIVX4XY6oXrPkJkUS8xQC1vV31r7+4as2WeA4dwhMxyT+g9WucvRNjp6csY
	 BVe6JzQNk/4z2xh3ZbSAifiVI3n0azxzQ/viG8wvkL7sIgg33saQ2Bc+v7syStocuKne/
	 U3NfMjZ9dPoPXVq6jHEWsiNif1Cut6IxJls5H2q7ntGSDpFiDuvGBz2LGPZFpdsHh/ur2
	 YXSzQWcxbdIBkesScdl+MXseEg88V0zQiZD4K/yGrpauQMdR7B43pFXcpHOfGbWAahUu2
	 wfUPhKQR/n0VgzQhfM1D3fWzsebCst73qW8oD7qnOVgEoXRkF8NIDeGfITT72sNtlFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RJ0VV9bT726BqR7U9WtLSEERSGHBOqG4sqzOpQlDp4A=;
	b=D7CWVw2GOO6FBAFIl0HGuHA2JK6JMkQzF/5hTrUcgf2CXp7J2RHYVGoS71UNdrd/CAvs
	 j3d3H/rxm4jH8Rxib8rWBFnrzeMXuURM1y+/WIGPuhrXBQTTCPHwkdEZ7ATQKH44XSvoS
	 1TdfJvKSdrwuifgq2etqgwTAD/1f3ZaRlZrWEHyPxPhw9yTP6atC+965c1V+LlhuGHt4/
	 QRq+QjuBWMooNjwhPkGWswrseFKIXC+qDWoKYjOgUG9wbiT3uaG6AEhQaKyZXosS2Xuco
	 NMYYfgevge0oGK7g8Kfxm3G8ZEYTTNXY7eMsZQYCLtH2t70q8yXKejD/grWY22FqrtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ce0SM0ya;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8AD606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A8AD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ce0SM0ya
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a42b34e930so671493f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795005485; x=1795610285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJ0VV9bT726BqR7U9WtLSEERSGHBOqG4sqzOpQlDp4A=;
        b=ce0SM0yawDr5aVULgwERwW3DrJyKrfWoLMUAb8iuAV5Pun0RUKeYtbGytIX/8a7B+p
         26QeD90ID953fGE3+RTLQO5ZogGTTKM3oJf+cqEeizan81LmbNN5HU/rrMKn5L7zYtLP
         CTboDEMwxIo/2qeVwBb4d/eLfwiWrkYFeV/d6NQSWRfq2pzQqftZv1zdVXjrxzoMUfnr
         cwWcE7rPW+YWkHmK0/T3q32lyUHwyU5qBOHmEBBlARmpZ5yGHl4m/mTcFZmW0HJ5HjtK
         P94e2cCWMpYzlXFt4j7ZmyskxUcYJHJQERQw7NbldPHIfHEHb7MaN2jfE4un5ov88+7P
         PTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005485; x=1795610285;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJ0VV9bT726BqR7U9WtLSEERSGHBOqG4sqzOpQlDp4A=;
        b=jf+uSixFKjPPqLIcrKkirN5Rm98D7VvV/QzpmCpl8TyvJcR0fl1rvb0UCL38IEm9j8
         kBtHd3qYgaN9V0rymRsBBuqcYQVUH17S5g84oi7c42Hk0UER4F8AA4MnlAItO4lTL/ts
         1fomNsVKssgXprf+wSsNMTeR+qjmxsQwwz5l0ezdoDLUkCwZzuXa4ScPD50ib4ecFLHT
         9fT5XdG3gJiZ2dl5khzOPONdhiImnocmx1pC88qDFvJnhK9d024wWfoSN5zuj3/Jq6eE
         UUC6j39g1PcMHN5r/dggnoXoJZMkz4BQJvn4JriI1xHeFnwNaZhQWpc4sTLXw6F/Ur8C
         EYMA==
X-Forwarded-Encrypted: i=1; AL+hErHv+WmYAiLuQPEU0JY8xnq1EdM5kqAWlE5QFrebPIZoTy0HwCZVAAYD+yzE5s1gMi2paGn0xWnXalB/z98=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+SKe7W2LFHoWqkQhTsmEEY+JMKBhiIGHlgCduEpdurUH7bR+H
	1altnNHzo9qF22XytzOtP0mQDffPCZASkbb3IB57gK51k2DNIwxvrz+94bNeLVB9mnI=
X-Gm-Gg: AYBFou15wknEbtXDzVicht5pG5V8XihO66rK8uhX54bmcPUjiPCZyfJ9uduPsVWasa2
	Z1q8pHourRLNIIQb9UT7ekFsJRIS3LMxmxPm5IBcwW1Lp+ZBOFyA0AR3Zn8YbROTJ2UWO+5oUuG
	wE1wD8vZ6tPmIX2SUl67bfEmj8xXHJ1g8/flv+mEeDBIvLdR1mMiDZKl4rHpJ7/WOF5VEkbgQVX
	t1Z340xM1a2S0Hq6Sl/TRMvTLKlXmDIlkoSiuESG5o+IVpj1zTyFBXUZDSfnCE1XqgpUsWTQqoA
	T3N1t2MB84UPR/752IuvXXUtaSxr6nxTwYAXNXhmHzqEvMG5OV+XR55GTPsnUH1Xcv30a0G7cZE
	sQjYf0amWbPxXoFODfsgaxk/SxP0sWf/pYrcN3bNuVfEDR8dsz9RtPIhds1XEM8NMNxXnzTJhzu
	7u3V06FPStyR03ZxZilwf7IFdB8giZgfL5+lhaLKCrzyR67AOzf7DwfPWX1JE1wLoOmOhVHNtNV
	WdjnkFdiM+C8uac1gVqRfaOpaneT/v5MMT1KqfoJ1/4pZ7avMb4l55jWRdZkWebs4idCuMldSmn
	XI4c2oD7nIpQjSg6KwkQw58EW7hSUmZHlz7eRwqWAvjmBobFvDHvrxRZKSFEWmJXV5xNBH3cjsi
	qQhVpWd+cIQ==
X-Received: by 2002:a05:600c:8b71:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb7da2ba0emr41716025e9.29.1795005485104;
        Wed, 18 Nov 2026 04:38:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6ca2:2772:9e53:115b? ([2a01:e0a:106d:1080:6ca2:2772:9e53:115b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm4725911f8f.34.2026.11.18.04.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:38:04 -0800 (PST)
Message-ID: <51831581-525f-418c-86ea-3b5c6a80709b@linaro.org>
Date: Wed, 18 Nov 2026 13:38:03 +0100
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
Subject: Re: [PATCH 00/10] phy/drm: amlogic: Extract Meson HDMI TX PHY into a
 dedicated driver
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
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
> This series moves the Amlogic Meson HDMI TX PHY handling (covering GXBB,
> GXL, GXM, and G12A SoCs) out of the meson_dw_hdmi DRM driver and into a
> dedicated generic PHY driver.
> 
> Until now, meson_dw_hdmi directly manipulated the HHI system controller
> registers (HHI_HDMI_PHY_CNTL0..5) to configure analog parameters, toggle
> resets, and manage power states, as well as manually ungating HDMI
> clocks and power domains already described in the DT.
> 
> By extracting this logic into a standalone PHY driver under
> drivers/phy/amlogic/:
> - Hardware representation in the DT is cleaner, modeling the HDMI TX PHY
>    as a child node of the HHI syscon referenced via standard "phys" and
>    "phy-names" properties.
> - The DRM bridge driver relies on the standard generic PHY API
>    (phy_init, phy_configure, phy_power_on/off, phy_exit) rather than
>    touching syscon registers directly.
> - Legacy DTs lacking the "phys" property remain supported via a
>    temporary fallback helper (meson_hdmi_phy_create_legacy) to preserve
>    backward compatibility to be removed on next phase of component
>    removal.
> 
> Overview of the series:
> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>    add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>    "hdmi-phy" child node under the HHI syscon.
> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>    PHY configuration ops, along with the temporary legacy creation
>    helper.
> - Patch 5: Document the optional "phys" and "phy-names" properties in
>    the amlogic,meson-dw-hdmi binding.
> - Patches 6-7: Clean up manual HHI clock/power-domain writes in
>    meson_dw_hdmi (relying on runtime PM instead) and convert the driver
>    to use the generic PHY framework.
> - Patches 8-10: Add the "hdmi-phy" child node and wire up the "phys"
>    phandle for G12, GXBB, and GXL Device Trees.
> 
> Tested on:
> - Khadas VIM1 (GXL)
> - dtbs_check and dt_binding_check run cleanly with no new warnings.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Ronald Claveau (10):
>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible matching in conditionals
>        dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy child node
>        phy: amlogic: Add Meson HDMI TX PHY driver
>        dt-bindings: display: amlogic,meson-dw-hdmi: Add phys and phy-names
>        drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
>        drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY
>        arm64: dts: amlogic: Add HDMI TX PHY node for G12
>        arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
>        arm64: dts: amlogic: Add HDMI TX PHY node for GXL
> 
>   .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   8 +
>   .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 +++
>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   7 +
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   7 +
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   7 +
>   drivers/gpu/drm/meson/Kconfig                      |   1 +
>   drivers/gpu/drm/meson/meson_dw_hdmi.c              | 203 ++++++--------
>   drivers/phy/amlogic/Kconfig                        |  11 +
>   drivers/phy/amlogic/Makefile                       |   1 +
>   drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 309 +++++++++++++++++++++
>   include/linux/phy/phy-meson-hdmi-tx.h              |  19 ++
>   12 files changed, 513 insertions(+), 136 deletions(-)
> ---
> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
> change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
> 
> Best regards,
> --
> Ronald Claveau <linux-kernel-dev@aliel.fr>

Overall it's very good, but I would've prefered a more sequencial move
to the PHY driver, with an exact copy of the code and simplification
towards the current PHY code.

Anyway, the sashiko review comments are good, especially the one on
patch 6 to keep the driver working on old DTs, sorry my bad...

Neil
