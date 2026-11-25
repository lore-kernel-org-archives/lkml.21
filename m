Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594501;
	b=cYqeTBp68Ah+hjgpCT5m46aSQ9rh4evLSWPz/8Hc+Qo0lJqm0MV91k6uNQ3DGK3lkgGt
	 ckYbUVSMGzbC/l4+rPjUUyyUbCXr9wvraLz6MqN712tvE3mWx/sRSxFlAhVkkEWXbMlYC
	 YJcTLNuy93AbKq4PAd6SqxnE0Y5BE7bchePUZV5ZpJS3ZXxiRiJRMsM7CVRCZ6UL5OWb1
	 bBNsZBne09m9Xawzk6+Wdxc40IVtlap031/1YdVu/COlTOxZhLF6aqTtm+4YNJKmN9zdA
	 140oZFV7UHp5OoJ1jVfW1xjc3VMe2azkh7M485+UO46BdbnCZfF4RAG+5TmAXmoiRXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Rc4aqCyzYBjWOigmv1O5fiE2Ptnz+1fYVaVELpdQ2fQ=;
	b=daoRmhsDbrcsznXOgOsAUYHjNGdY5X2wil37wlsCSFYv+pUClbXNKUIa1yi90zGUKwW7
	 iQicA3lIXXBbKoltWotHlU2LMjbzg4ND2BsfM1GwCDo/eDYHnrCF49tOhhAN59nul1Co0
	 /fW0/xMQ94NDfWAmLJAzj9kc1MzduyG5y3wQifnBPjfO6okBcy1Rs8g67RF2LuMP7gYnY
	 l64CUCiaFVheBxlRuw7cgFBk0dEalUAdNtCqLnEsy2T2/WRscau2lR2Nz9uOIFKleuH8C
	 bkaEin6Js670JcByfU84rIPTem1Dy7SVZdOBNBnq7XDCJ+5t6el/rDEb4dMkmzayGFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAEA606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAEA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso51814385e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795594495; x=1796199295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rc4aqCyzYBjWOigmv1O5fiE2Ptnz+1fYVaVELpdQ2fQ=;
        b=P2gG8e8iMnSEtgDu8AYaKIyzjTUKC7CVofda8nfnwnngzWLiIL4yD7KdqqpBF3ipwF
         TZr2WGXJjSWQlfe/98yRvEYinjMCtUCLakBpm9CL8qF/WpkSw1uV2ndnFc+AMYTYAusl
         9fMtL8xGs4FLT+mFf9F83iJ7j5lNsuXCF3aUWN8lDdurs/1gc57UJ3Vfr2Gc1RYm2GBB
         CE/ebmAc+NHLFPBbsyx3UQAakCefnhz1hMH9FfCPlHF16hzxXpdRDjVTD7q4eXSqU5bL
         98qNPSmropSDF21V1dN7Ze4HG2AKrF8HiN/ySooWRrV9BvYjx6UWi9FVgveeLtdEfCjS
         rgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594495; x=1796199295;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rc4aqCyzYBjWOigmv1O5fiE2Ptnz+1fYVaVELpdQ2fQ=;
        b=sbTdrDLmZSZ45QqJnUYG0CAg/ThYpeK10WaBM3V/6cYHhdNbOG2LPx60tQ4LSvshMH
         LWtfPIhnkIcqGPK19Tr/joSieif+W+G0t0XgGGdPuPU5h4W7LQncAHHExskO2m2Y4wo7
         noyHLK9OyHYszC87QMQnA8qVJWsLVuw1t+yK+lJAJwnScCnwA6FVlehTunGL7O06WxbM
         q6pIZ6fbAWtWyzWeGctbsqcfluO0X9eZ/12b7coXiTFtrGhrvKxgo+fTNmW+SiEHiqBT
         6sVNC6U9Cq0zZkFJ7yT3lRA+HT1HVmLzx6UGrkMe1GPH/n6DAMrbIjeVsLF8d6zNIcRp
         EXlA==
X-Forwarded-Encrypted: i=1; AL+hErGx7+ykmLixF692Nt0LbQCdOO32V3nfNNaUXbrTSfHpaTSoy+ir9aQya8BwQ1taJo1UXUfBLVNb18tbbaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mmlLfe456gHcs+Uaj98jKONWB6klo1kOEXuWYXF4plStnEBHj
	b2iDhKrUTSJh1otTX9vZi/GJM+U8+EpkL2IKk5jw5gakgaabGNj0mu/pmliVNtsmMPY=
X-Gm-Gg: AZFdTZdYS7pHCpPggFNO4MBnPGsmibMe30TUd/bpIppnEBMGdCLzM/1z6DSI+6EZDTl
	HOCsxfYKTDM4PiPBgfFqwkYWNnk85lWySREWLg8joEJ5LLNOMMauKfHaRFnuQIKb9UyvbddQnCH
	WwB0Dhts9Qzn3fj7MY7gWI7RDx2T474ETCYCck8zLcLc1ZW46SEwNichH+TbDoz5HQvJPwSNGeo
	MDHBE5IKfjYf0et1U2DX1G8TJh2VxoDLNOSmrAnowKkV+zjukDQClhVH9B1cJ0prqxc3AgfHg7n
	SOdwXV0xpiKuMQF/Ls3SZc6/kK0cfUnED4CgN35MtUlwL/He7GzNHw5MnpqPI40y6lIeyIC3TSp
	uGX4TjhcC56ZeYYRjSuW48/TiZv+3C/uaezC9FQWo/ZYWT5GTQhCHsTeON8pA7SEDNj1S5xxooR
	qW9L1+oJomF3v+R5CGujb5gRqg3eggg+X2HEs1IJNrF0rzcRuIIVk9pI02KN4nEGTd5dRbRyNpe
	HEBFTJMiVjCT0PyLSjsD3oC3pSL9mzux6R2rMalnBBRnhXZQoBe2GWTE1iGmAxNJ6HNW0Qwj2eL
	7Cv4vsgRnrp1whw3KD+8PxB96Zy5Xqoz/N82g5LnPYKyH/0to4pX8IIBixugSawpX9KPN/hPGu9
	pwk+/SAjp
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr372318965e9.7.1795594494562;
        Wed, 25 Nov 2026 00:14:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba3d3679bsm26993885e9.2.2026.11.25.00.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:14:54 -0800 (PST)
Message-ID: <6e408f48-17ca-4927-ae09-c4153e294371@linaro.org>
Date: Wed, 25 Nov 2026 09:14:53 +0100
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
Subject: Re: [PATCH v4 00/11] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel-dev@aliel.fr
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
 <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
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
In-Reply-To: <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 23:05, Martin Blumenstingl wrote:
> Hi Ronald, Hi Neil,
> 
> first of all: thanks Ronald for picking this up!
> I like the overall approach. Before I dive deep into this series I
> will finish the code-review of Valerio's AUDIN series.
> 
> Two quick notes below.
> 
> On Mon, Nov 23, 2026 at 8:38 PM Ronald Claveau via B4 Relay
> <devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
> [...]
>> Overview of the series:
>> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>>    add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>>    "hdmi-phy" child node under the HHI syscon.
> It's been a long time, but I think we've been asked by the devicetree
> maintainers to have reg properties for the nodes within &hhi
> But I can't find the message at the moment.

The hhi syscon nodes doesn't have #[address|size]-cells and so far it
wasn't required, let's wait for a review from DT maintainers, I'm fine
with the current design

> 
>> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>>    PHY configuration ops, along with the temporary legacy creation
>>    helper.
> At quick glance your PHY approach would also fit phy-meson8-hdmi-tx.c
> There seem to be minor differences:
> - two additional enable bits in HHI_HDMI_PHY_CNTL1 on GXBB and newer:
> HDMI_FIFO_ENABLE=BIT(2) and  HDMI_FIFO_WR_ENALBE=BIT(3)
> - newer SoCs seem to have HHI_HDMI_PHY_CNTL3..5
> 
> Meson8/8b/8m2 HDMI support is not upstream yet. That's why those SoC's
> won't need the backwards compatibility code. So if you need to tweak
> the driver: feel free, there's not much you can break!
> 
> 
> Best regards,
> Martin

Thanks,
Neil
