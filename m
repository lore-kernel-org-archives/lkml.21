Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536730;
	b=vukzBw3TftGPQpcIqyeXHBqX9ph92cp/FuljBUtFPaH4eMVXD8i9JaxqzK1D3VWYPJRQ
	 KCsD5+3o1E9mmBu0106atG41Ro3ylxBJEEH/HpCBxvuf2+aHU5l/xmgTMd+ELE5g4Uv3R
	 i9ZNKJIg88AS8IYsGd0+xrYbgaU5RZ21AjOL8GjRy/Gc27o9q9DFqobgViyso9m62W3qu
	 RpTcsp+U3KmdngSux6OBLppkBQSQlRsd3bIs4zClrkiAm7L6sxpRLfu0firrZ0iJVkWcz
	 SCtFxk2AOzqYR7/4nCknI53bEBbxHxNzTCwVZAEqjRSRbQFCbUGe0LrI1MPmw5HnXvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+6LKQYgkr2YxzPjh0brr5Y4vnuislFHhKsvQIh4zTc8=;
	b=qRbvE8+9Td6jfpeGXswkBFwWuS57vhlQqgVtRb18fmdDLKQIxPgXg8qCTtQgjxMb/9X+
	 W+EEC5/rPkbkmgSFQF3vzn48HcLuyf/x1/6cCc0Lfq2vFnVX4zUOiCY/UECf5p6OVX6wS
	 IjuYts0ADJApB/rGObVqIzyGbCh/xSmV5W30ejEwhi5Jh4fmjC+mPZTfU7oH5ta/b3QBu
	 RMKYlm01Q/MapW8yYzf2QREueZkH71zI/6MZkv3hUW5r7cfhHHnHry3uw/yUv6T1LuE7A
	 jVOijcwAsTs5bPU75jyO3plXjXHABPWvA0bSCeLZ6I72cu7qBG92+UOp7vyPK/3rBZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="ZJYE2/jt";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD72606A339
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD72606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZJYE2/jt
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb606491faso25844895e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795536728; x=1796141528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6LKQYgkr2YxzPjh0brr5Y4vnuislFHhKsvQIh4zTc8=;
        b=ZJYE2/jt6lGQjQj2cd292w+No+yMVWNlWweqMu3Kt6/KvYFlwXBS5eGAWjV0Gp8bcK
         33iKu0PJhj1Nt/CsNt2h6Zb3qII/5KCkqk0JhNPvGyBjf+EkujG/FVL69nQcc7nB/s+6
         J8uDJ4InzJlSNf0we8ZEguV/TZWegeZHxV3g/QhsikzW9sNICftpP/8Q9FTv0bqbj3Ht
         Is/UBL4IJWVR9YVn1lTAS1LptJja55cZLuHaHU9UdmSNQmJF9ioaQr6iBVd7aJXIvg8f
         TLQnogIBXfpIOTth+aAYDoPOvQbrpaUCJeS26zqGSRUbBYZkySn/2gx+YNM9xJpsDkHJ
         mplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536728; x=1796141528;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+6LKQYgkr2YxzPjh0brr5Y4vnuislFHhKsvQIh4zTc8=;
        b=bvb4d1B0cycZCrO/no/EzDPKQc+ZZnjbmCq1iLq1/WbXY6BRs5EpWPqsT4kHQywmj5
         SSGOCS7GeZJX7uAefw9F7EscT50rFTJgloruPzndVlm8HFQYwvfIlI6nS9yG1uWWybVG
         MRJGan67/+sVcIyi07K2Qz5FD26WwemJR/gmt+QPFd2nIcngAz9i6QHGLVzsFk//rbse
         KdfpsfKT+OG/dMCaC75DfXdfkxjCJncukypD3NxJBvFr6pYS+EjwjIKcm2Ve8GIemb59
         hjYL36UX+6bjK/btRRvZALapAXATKAROrtUndhHSg9L9+5u6MFwQLqvZfno14/qalwBs
         4EUA==
X-Forwarded-Encrypted: i=1; AL+hErE2X8NWaJPOVvA47hFADjznEkmxBrMWeP3+z5Ibsz4BmxqedvKYeiPBawayP35FiwgEzIAKw7DfwQtqDMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P4mS2+pYydQx2tmAVKjfBOo9jrpXumPyxJuQ8q8sLZHoe/3P6
	BEO88tN9vV7BimwnR8ax/i+zyqVQE5Sfhf7eaihhJ8qTkcDByKnOYRRu2lc468hD2hQ=
X-Gm-Gg: AZFdTZeVcmJ1RavlKRMKbPxQQIMLQaXJ6tKvHHrKFwaE3DnruHyYchOF8+KISqMi/Bg
	mhvz4eDwzoM9Uv575z4eJPP0mxK3I88i5CCl3tGtHIOawkLAlYMV1fKJnAjxHxW5Ozh9SH/wBtW
	QvoHlor4NOfp+llDCgHyXqaFLRkOQh+6KRrkwxi4pyDj+VfPBlpyS4szt3KlHFn+USbSM3nJgct
	3JTEuPH24WfUxAQ5Vir1ARC2EBuHOz1H8eepbK539TOdrltVcDei/59VBCy3jY7w56Ugp2eOTMb
	BTxwGPqq4nDGReZu/hscLjKS/8aHUe/YEPIAIfUVNHWhx536FAl29Am1JXtkch4u0di0+LiyA14
	tpFreL92bIoxtoDU7EnxDJv8BIzynIiSMHcxYCBXcMtEY9RQLoBFb8KIFJFEPdBhEFmYC9yRM7X
	b3yRU8EXa9vgNe0j3FFVy7yTHNiy9TH7XHAuPi2YBDkJjddCbx/BmeAT9YxSLLq5A3n8bk9XAff
	ey6mhdAOcGk91r8Z5MlX59wJJ7JcfXpAFb7B2Lx3JZi92SbbvHp75Y3x8eAvXQ0mlUqPrEYXKeP
	S2zBLjoMMPZVrZQwKmTEYPSyUVxkkv0wYMgtsnJLav1rOBour0hu357+EFiZI9UuIxmP2jZgTj2
	cxq+q0Akc
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr344659275e9.9.1795536727863;
        Tue, 24 Nov 2026 08:12:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94? ([2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm358970025e9.0.2026.11.24.08.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:12:07 -0800 (PST)
Message-ID: <afcf78be-b017-485c-8e11-402b0948c9f8@linaro.org>
Date: Tue, 24 Nov 2026 17:12:06 +0100
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
Subject: Re: [RFC PATCH 0/2] drm/meson: add HDMI support for GXLX2
To: zinan@mieulab.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260718111527.119231-1-zinan@mieulab.com>
 <ac5ef957c03ab3bf3fdb464680f3b024a883aefa@mieulab.com>
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
In-Reply-To: <ac5ef957c03ab3bf3fdb464680f3b024a883aefa@mieulab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/24/26 15:19, zinan@mieulab.com wrote:
> Hi Neil and all,
> 
> Following up on this GXLX2 HDMI RFC from July. Since then, users have reported working HDMI output on several
> S905L3-family boxes with a downstream implementation, including a P291 board. Their reports are here:
> https://github.com/ophub/amlogic-s9xxx-armbian/issues/3604 <https://github.com/ophub/amlogic-s9xxx-armbian/issues/3604>
> Before I refresh the series, would you recommend keeping the proposed amlogic,meson-gxlx2-dw-hdmi compatible and a
> single MMIO resource for DWC and TOP, or describing the two windows as separate named resources?

Please rebase on https://lore.kernel.org/all/20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr/ and adapt your patch.

Thanks,
Neil

> 
> Thanks,
> Zinan
> 
> July 18, 2026 at 8:15 PM, "Zinan Zhou" <zinan@mieulab.com <mailto:zinan@mieulab.com?to=%22Zinan%20Zhou%22%20%3Czinan%40mieulab.com%3E>> wrote:
> 
>     This RFC adds HDMI transmitter support for the Amlogic GXLX2 family,
>     observed as an S905L3 (CPU major ID 0x2a) in a FiberHome HG680-LC set-top
>     box.
> 
>     GXLX2 is unusual in that the display pipeline, clocks and HDMI PHY follow
>     the older GXL path, while the HDMI controller register interface is
>     directly mapped: DWC registers are byte-addressed from 0xda800000 and TOP
>     registers are 32-bit registers at 0xda808000 + index * 4. The existing
>     G12A access callbacks implement this layout, but using all G12A match data
>     would select the wrong PHY initialization for GXLX2.
> 
>     Patch 1 proposes a dedicated amlogic,meson-gxlx2-dw-hdmi compatible
>     without a meson-gx-dw-hdmi fallback. Patch 2 adds dedicated match data
>     combining direct register callbacks with GXL PHY behavior. It also handles
>     the GXLX2 value for the 297 MHz PHY bucket and adds the compatible to the
>     Meson DRM component match list.
> 
>     This RFC depends on the separately posted common Meson DW-HDMI regmap fix:
> 
>     drm/meson: constrain the DW-HDMI regmap range
>     https://lore.kernel.org/all/20260718090710.70534-1-zinan@mieulab.com/ <https://lore.kernel.org/all/20260718090710.70534-1-zinan@mieulab.com/>
> 
>     That formal bug-fix patch bounds register iteration below the directly
>     mapped TOP block and prevents the legacy 16-bit indirect interface from
>     wrapping. It is intentionally not part of this RFC so it can be reviewed
>     and merged without waiting for agreement on the GXLX2 DT ABI.
> 
>     I would particularly appreciate feedback on two DT ABI questions:
> 
>     1. Is amlogic,meson-gxlx2-dw-hdmi the appropriate block compatible name?
>     2. Should the DWC and TOP windows be represented as one contiguous MMIO
>     resource, as in this RFC, or as two named resources?
> 
>     Evidence and disclosure:
> 
>     - The GXLX2 addresses and 297 MHz value are factual results of analysis of
>     the HG680-LC vendor kernel. Firmware SHA-256 and focused behavioral
>     evidence can be supplied if useful, but no firmware, kallsyms dump or
>     disassembly is part of this submission.
>     - Public Amlogic-derived GPL source documents the ordinary GXL 2.97 Gbps
>     values and public GPL-2.0+/MIT source documents the same direct DWC/TOP
>     access mechanism used on later SoCs. The implementation here does not
>     copy a vendor function body.
> 
>     Testing:
> 
>     - An equivalent Linux 6.6.18 implementation boots from eMMC on the
>     HG680-LC.
>     - 1920x1080 HDMI video was physically verified on an LG 27GL850.
>     - Two-channel HDMI LPCM through the display and analog stereo audio were
>     physically verified.
>     - The downstream 6.12 port boots from eMMC with working Ethernet/SSH and
>     has physically verified 1920x1080@60 video and HDMI LPCM.
>     - With the generic Meson non-CEA mode-range change already present in
>     current mainline, 2560x1440@59.95 video and HDMI LPCM were physically
>     verified on the display's native timing.
>     - The RFC port builds on arm64 and its binding passes dt_binding_check.
>     - 3840x2160 at 30 Hz has not yet been physically tested. That test is
>     required before a non-RFC PATCH v1 because it exercises the
>     GXLX2-specific 297 MHz branch. It is not a blocker for the verified
>     1080p/1440p use case.
>     - No other GXLX2 board has been tested yet.
> 
>     The initial RFC intentionally contains no board DTS. A downstream-only
>     HG680-LC DTS is being kept as DO NOT MERGE until the compatible and resource
>     model have received initial feedback.
> 
>     Assisted-by: Codex:gpt-5.6-sol
> 
>     Zinan Zhou (2):
>     dt-bindings: display: meson-dw-hdmi: add GXLX2 compatible
>     drm/meson: add GXLX2 HDMI register support
> 
>     .../display/amlogic,meson-dw-hdmi.yaml | 7 ++--
>     drivers/gpu/drm/meson/meson_drv.c | 1 +
>     drivers/gpu/drm/meson/meson_dw_hdmi.c | 33 ++++++++++++++++---
>     3 files changed, 34 insertions(+), 7 deletions(-)
> 
> 
>     base-commit: b0a652436b892eb9a036a031b33099dca036faaa
>     prerequisite-patch-id: 0a689485bbc3c1d77d52aeee0b81e4943d1e904a
>     -- 
>     2.43.0
> 
> 

