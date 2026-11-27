Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793640;
	b=Me92KbCGWcIHfRB29sEA0T80bOE9DVSHD4ICyvGe/+tSsD2rmNgDGp5uwPH9HuS3J5wP
	 sDGRg2Uzjc/j4dtyjPN/2T/oWJgJzDlO71oSLeRloODv2xqUSoGFwB64nbivKVgnAOjLC
	 XGqf4ZzzVj672/VPB8MQSVA9rOtjMMEUt0ImuaUe/M5t0iNF2OasQfORoQiEQX775rZ4p
	 bQJtma1tLyYS3zDRiDUqe/T1KFiS6pW0HBqwdny1oo9IPGxcuadtgoqw3MhJNazgu2pGt
	 gMCVKTMqzXoCa5nX4Yzz0u2NrMGQ+kFEtZxVEdb/6OGgD7l1iNVFd7mZgpS61d1eLCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qTJK+XH+ZOTU8gAK0q7vkyGI0JnK1yiEcA7kRxssOjw=;
	b=Sr15TyCHaaFj557cju8f5WeuvxZ/yZ0VfMzJWvozw+h0VpzkVCNQahRmTlKPxBjQsmEP
	 k7A5aI72w0soZvJa+N9BeqJEOlBOKKVaFPII9i6PpOGxyOJhfZuq/VwjE/vHg5DN4w5b1
	 32j4929v8r3DiV3TlA/zoXO+zs4iYjmxRQUQHH2FfngIof9jS7cKyrWSkmAHzN97bl/0e
	 lvop4ifBwEpJTDOihbQCG9Mfei4wArEM6b8PUASsgnR3NMQGoT8FgG0Nl9IIIHZvPz7eD
	 yvEJ1/XU8kvQsLudt3VcdfUQ+ykHzZdfbMZONkONjKElVMpFIn/+DZGaWkAMC1ZJcpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H4TTngsT;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D20606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H4TTngsT
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so7515497f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795793638; x=1796398438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTJK+XH+ZOTU8gAK0q7vkyGI0JnK1yiEcA7kRxssOjw=;
        b=H4TTngsToTxGs5cuVKrbMVRTgRfqMhEmNCbHvoBbx7MQMIvoP5IoMHe0VmPgonwqXW
         jFHTFTbC3/2V7VSLpcZfHb/8XTh1+Z944oClLDDnTDbv5f1+Ol21NtBYB2lioyw54Om2
         e2xCts9pwI+TH9RUtuDXlHbQYAMArUWKd7mmgDvrDx/rf5nUriCtUBJS9AnPWVXaQmR/
         RL/P0kUv3fYhSOoldRJz14SwYfoMqwvMoiL8/bKjk1IkWTuZLv2ww7nechKKFP35IYuJ
         +Ci0uwJdSWUe16KPQ9NCv/l45qTxldzwIWTLIoI8+BnqGKWgj1knl/2oLiHE6ZlQYBSy
         Lz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793638; x=1796398438;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTJK+XH+ZOTU8gAK0q7vkyGI0JnK1yiEcA7kRxssOjw=;
        b=ur8mqaU8nP5dfIF+Gw0qGAu/pX/ueK+qLOQQQwYSqByxCPS44mCc77nBuErEeYjG+y
         uuA03S6nHUCkjrHLrcHUXfGxcrkVx/kFwYQu3QvXkYmx+Fdtu/hO2mMicxgqmBp5U3bi
         5pyxuJ4WZ2ShvHH030g39MpMsgVNsjKHJYcAegmTzYpvx5SV9ewDQbW+ljptNRGfKjCy
         yVrPludup38S6szr9NNredylbiPABKRD3ZhuD0W3zPkquH/v1isMEEan/WViQNeJO3T6
         tOIGoj856gpfkZYY2K6lvWGRbhhzWS7HLaAHFS0Zm7DTEyu40/CfZtU5iljfnkdC/Rvy
         GY8Q==
X-Forwarded-Encrypted: i=1; AL+hErGbrHuv5X7xDxmfDk6WxAsKrDI/1EyLGxmZdE0hlKf0OcMyrfSZg543+jkGVgVuoSooOLuATzoN4+3t9yU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jkQk0d2KAnKYpzrRUh0Y31asZ0+GuL2xSHI25gtFmtoR4Z3uj
	hsT7/slhc+Rp+jwUhuDMoHCOzlC1hyHDmJe8ua0LKAqPwPR1Cl32/BPPqtObfOwzwRA=
X-Gm-Gg: AZFdTZdUuXV0QlYEs9UtgnS2rqGOdMo/Gg0+MGadOyhHlpNCy5by8SF79oFVZq8jrjN
	Hbajt8qyo9RMgmuyHY+DdR4dwNxK4tfWCyjvFwC2qTUOLIBANeHht9qIMIpx07bKsODi6LE0Gii
	FEVu9Oxwlv8yRdQkKCxIFRQGdMWyBNVI71zitelsQnHUFV8sL41kOBYjkAT1cOkoMkxgsUnc93w
	y5jagRIqatz/z+6HvQ7YMKw/LcVb87sPHaADyMGbagFU4LDaSDGrVSsXVf35VoxNpTi37uDKUfg
	f394PuOJrs1xTKfbwRvGHsUjey3qtvUA0VugBxjLdilRsgIdOvvMyAF9kVavbAzsDs5Q3/wbMQp
	TNgL6MyC2PFFOJl1bOjv45HT2c9sGMpUKeG2CBrw++XHSwLvhJUOc6fP1y1sckkkP0TATdaJmrC
	NXk0cv8dJUiW/21MPx3NEx5jiQoTxikB8wjIFjMnb37usZdK8Xei/eb3GVYBVytj9KDtTN4MgAI
	SAGgj6RqQb67jxUnEfmEVvfAPGvZB4gE9H8JHwdR04ml29YeSILkSWNjhaOpma0k55AdTbJby6Y
	b5TNxKTSQnpm1Fm3BWWgjvIs8k+LyCYbC+BjNd/WX48pJfqoF8U0Rpfdkml+yMaFUrlh8Wp+8tz
	G52+uyv3ODc4eQVWeUF5E1yEofKfjFQ==
X-Received: by 2002:a05:600c:4e4c:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4bb88938d2dmr469383675e9.32.1795793637832;
        Fri, 27 Nov 2026 07:33:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:c897:5d9b:d0a4:e684? ([2a01:e0a:106d:1080:c897:5d9b:d0a4:e684])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm46147475f8f.6.2026.11.27.07.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 07:33:57 -0800 (PST)
Message-ID: <aecd4578-7131-4c23-9bec-a2573c0e25e0@linaro.org>
Date: Fri, 27 Nov 2026 16:33:56 +0100
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
Subject: Re: [PATCH v5 04/12] phy: amlogic: rename Meson8 HDMI TX PHY driver
 to be SoC-generic
To: linux-kernel-dev@aliel.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
References: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
 <20261127-meson-drm-create-hdmitx-phy-v5-4-88c43eb95468@aliel.fr>
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
In-Reply-To: <20261127-meson-drm-create-hdmitx-phy-v5-4-88c43eb95468@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/26 16:27, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The HDMI TX PHY driver is currently named after the Meson8 family
> (Meson8, Meson8b and Meson8m2), but the same IP block is found, with
> SoC-specific register programming, on the newer GXBB, GXL, GXM and
> G12A SoCs.
> 
> In preparation for adding support for these SoCs, make the driver
> generic:
> 
>   - rename phy-meson8-hdmi-tx.c to phy-meson-hdmi-tx.c
>   - rename the Kconfig symbol PHY_MESON8_HDMI_TX to PHY_MESON_HDMI_TX
>     and update the Makefile accordingly
>   - drop the "(ARCH_MESON && ARM)" dependency in favour of
>     "ARCH_MESON", since the driver is no longer ARM32-only, and
>     select GENERIC_PHY
>   - rename the phy_meson8_hdmi_tx_* symbols to meson_hdmi_phy_*
>   - update the platform driver name, the Kconfig help text and the
>     module description
>   - drop the unused <linux/property.h> include
> 
> No functional change intended: the only supported compatible remains
> "amlogic,meson8-hdmi-tx-phy".
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/phy/amlogic/Kconfig                        |  9 ++--
>   drivers/phy/amlogic/Makefile                       |  2 +-
>   .../{phy-meson8-hdmi-tx.c => phy-meson-hdmi-tx.c}  | 54 +++++++++++-----------
>   3 files changed, 33 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
> index ce7ba3eb2a8e..294996869e83 100644
> --- a/drivers/phy/amlogic/Kconfig
> +++ b/drivers/phy/amlogic/Kconfig
> @@ -2,14 +2,15 @@
>   #
>   # Phy drivers for Amlogic platforms
>   #
> -config PHY_MESON8_HDMI_TX
> -	tristate "Meson8, Meson8b and Meson8m2 HDMI TX PHY driver"
> -	depends on (ARCH_MESON && ARM) || COMPILE_TEST
> +config PHY_MESON_HDMI_TX
> +	tristate "Meson HDMI TX PHY driver"
> +	depends on ARCH_MESON || COMPILE_TEST
>   	depends on OF
> +	select GENERIC_PHY
>   	select MFD_SYSCON
>   	help
>   	  Enable this to support the HDMI TX PHYs found in Meson8,
> -	  Meson8b and Meson8m2 SoCs.
> +	  Meson8b, Meson8m2, GXBB, GXL, GXM and G12A SoCs.
>   	  If unsure, say N.
>   
>   config PHY_MESON8B_USB2
> diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
> index 91e3b9790c03..2611ec8a056d 100644
> --- a/drivers/phy/amlogic/Makefile
> +++ b/drivers/phy/amlogic/Makefile
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_PHY_MESON8_HDMI_TX)		+= phy-meson8-hdmi-tx.o
> +obj-$(CONFIG_PHY_MESON_HDMI_TX)			+= phy-meson-hdmi-tx.o
>   obj-$(CONFIG_PHY_MESON8B_USB2)			+= phy-meson8b-usb2.o
>   obj-$(CONFIG_PHY_MESON_GXL_USB2)		+= phy-meson-gxl-usb2.o
>   obj-$(CONFIG_PHY_MESON_G12A_USB2)		+= phy-meson-g12a-usb2.o
> diff --git a/drivers/phy/amlogic/phy-meson8-hdmi-tx.c b/drivers/phy/amlogic/phy-meson-hdmi-tx.c
> similarity index 68%
> rename from drivers/phy/amlogic/phy-meson8-hdmi-tx.c
> rename to drivers/phy/amlogic/phy-meson-hdmi-tx.c
> index f6b5df74a58f..e4e606ab4eef 100644
> --- a/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
> +++ b/drivers/phy/amlogic/phy-meson-hdmi-tx.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0+
>   /*
> - * Meson8, Meson8b and Meson8m2 HDMI TX PHY.
> + * Amlogic Meson HDMI TX PHY driver
> + * (Meson8/8b/8m2)
>    *
>    * Copyright (C) 2021 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>    */
> @@ -13,7 +14,6 @@
>   #include <linux/of.h>
>   #include <linux/phy/phy.h>
>   #include <linux/platform_device.h>
> -#include <linux/property.h>
>   #include <linux/regmap.h>
>   
>   /*
> @@ -32,30 +32,30 @@
>   
>   #define HHI_HDMI_PHY_CNTL2				0x3a8
>   
> -struct phy_meson8_hdmi_tx_priv {
> +struct meson_hdmi_phy {
>   	struct regmap		*hhi;
>   	struct clk		*tmds_clk;
>   };
>   
> -static int phy_meson8_hdmi_tx_init(struct phy *phy)
> +static int meson_hdmi_phy_init(struct phy *phy)
>   {
> -	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
> +	struct meson_hdmi_phy *priv = phy_get_drvdata(phy);
>   
>   	return clk_prepare_enable(priv->tmds_clk);
>   }
>   
> -static int phy_meson8_hdmi_tx_exit(struct phy *phy)
> +static int meson_hdmi_phy_exit(struct phy *phy)
>   {
> -	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
> +	struct meson_hdmi_phy *priv = phy_get_drvdata(phy);
>   
>   	clk_disable_unprepare(priv->tmds_clk);
>   
>   	return 0;
>   }
>   
> -static int phy_meson8_hdmi_tx_power_on(struct phy *phy)
> +static int meson_hdmi_phy_power_on(struct phy *phy)
>   {
> -	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
> +	struct meson_hdmi_phy *priv = phy_get_drvdata(phy);
>   	unsigned int i;
>   	u16 hdmi_ctl0;
>   
> @@ -85,9 +85,9 @@ static int phy_meson8_hdmi_tx_power_on(struct phy *phy)
>   	return 0;
>   }
>   
> -static int phy_meson8_hdmi_tx_power_off(struct phy *phy)
> +static int meson_hdmi_phy_power_off(struct phy *phy)
>   {
> -	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
> +	struct meson_hdmi_phy *priv = phy_get_drvdata(phy);
>   
>   	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0,
>   		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL1, 0x0841) |
> @@ -96,18 +96,18 @@ static int phy_meson8_hdmi_tx_power_off(struct phy *phy)
>   	return 0;
>   }
>   
> -static const struct phy_ops phy_meson8_hdmi_tx_ops = {
> -	.init		= phy_meson8_hdmi_tx_init,
> -	.exit		= phy_meson8_hdmi_tx_exit,
> -	.power_on	= phy_meson8_hdmi_tx_power_on,
> -	.power_off	= phy_meson8_hdmi_tx_power_off,
> +static const struct phy_ops meson_hdmi_phy_ops = {
> +	.init		= meson_hdmi_phy_init,
> +	.exit		= meson_hdmi_phy_exit,
> +	.power_on	= meson_hdmi_phy_power_on,
> +	.power_off	= meson_hdmi_phy_power_off,
>   	.owner		= THIS_MODULE,
>   };
>   
> -static int phy_meson8_hdmi_tx_probe(struct platform_device *pdev)
> +static int meson_hdmi_phy_probe(struct platform_device *pdev)
>   {
>   	struct device_node *np = pdev->dev.of_node;
> -	struct phy_meson8_hdmi_tx_priv *priv;
> +	struct meson_hdmi_phy *priv;
>   	struct phy_provider *phy_provider;
>   	struct resource *res;
>   	struct phy *phy;
> @@ -128,7 +128,7 @@ static int phy_meson8_hdmi_tx_probe(struct platform_device *pdev)
>   	if (IS_ERR(priv->tmds_clk))
>   		return PTR_ERR(priv->tmds_clk);
>   
> -	phy = devm_phy_create(&pdev->dev, np, &phy_meson8_hdmi_tx_ops);
> +	phy = devm_phy_create(&pdev->dev, np, &meson_hdmi_phy_ops);
>   	if (IS_ERR(phy))
>   		return PTR_ERR(phy);
>   
> @@ -140,21 +140,21 @@ static int phy_meson8_hdmi_tx_probe(struct platform_device *pdev)
>   	return PTR_ERR_OR_ZERO(phy_provider);
>   }
>   
> -static const struct of_device_id phy_meson8_hdmi_tx_of_match[] = {
> +static const struct of_device_id meson_hdmi_phy_of_match[] = {
>   	{ .compatible = "amlogic,meson8-hdmi-tx-phy" },
>   	{ /* sentinel */ }
>   };
> -MODULE_DEVICE_TABLE(of, phy_meson8_hdmi_tx_of_match);
> +MODULE_DEVICE_TABLE(of, meson_hdmi_phy_of_match);
>   
> -static struct platform_driver phy_meson8_hdmi_tx_driver = {
> -	.probe	= phy_meson8_hdmi_tx_probe,
> +static struct platform_driver meson_hdmi_phy_driver = {
> +	.probe	= meson_hdmi_phy_probe,
>   	.driver	= {
> -		.name		= "phy-meson8-hdmi-tx",
> -		.of_match_table	= phy_meson8_hdmi_tx_of_match,
> +		.name		= "meson-hdmi-tx-phy",
> +		.of_match_table	= meson_hdmi_phy_of_match,
>   	},
>   };
> -module_platform_driver(phy_meson8_hdmi_tx_driver);
> +module_platform_driver(meson_hdmi_phy_driver);
>   
>   MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
> -MODULE_DESCRIPTION("Meson8, Meson8b and Meson8m2 HDMI TX PHY driver");
> +MODULE_DESCRIPTION("Amlogic Meson HDMI TX PHY driver");
>   MODULE_LICENSE("GPL v2");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

LGTM

Thanks,
Neil
