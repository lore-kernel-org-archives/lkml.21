Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004912;
	b=5NzCRjyAUZseDxu0Udsii+sInFnCVHfDhsPfOnvHqiQTrqcSFQfdgdBayFPBx79hKcpl
	 OJ4hf622EJwxG/IcJJrP1y9lL2T/Tl44rUJRpfydtSzrVTNc8m3lT92UxqMq+FRBfi070
	 y3HkkV6Y7X6ElopRhsm6ggpxOFMsLFZtf11suwgZ/eNPhhTWx6qk4Oidf75N0U+hkOeRJ
	 gswJqdfNrZGAunx8Nc3AgNNlDVoxeHGVO0Qf1No+Vv/WUK12//mH6pp4OFmnhSYO3wVmx
	 bJOZvalBaEhFGkvFlHxMfYWosONfo8NydMsP/JrbgLAyP+PYutGZJGdncdHLPuaagQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fApH6YF8/olwr8rszx1618Se8LLbeSsWPgcCTgBcSzQ=;
	b=Fmfe5wBkxeXTB+St8godGSaP5TM9ncT+BjMutvP+y5mHwlNC6nDKuA/ElzKQh1UzuSJE
	 rB77+cS1ITeNm/GZ/BD6u9RDxUl4EqnubA1zPQgY/pkEic2Uc2ssHCgxi1HwSYyYW1P9f
	 4tkj05VWBSu36ImBQAhiRObfIoqXOV1GFcJjVwhlyIGZasWBIa4t5s/PiLxhaEBS7I0Op
	 nKdrFSTQ2+1Yh+1Pgk03Z4ByGZa9y80MotBrOWfAb3UTL+QJokWDE7SXoPVMcYRFSooy4
	 LolUtmAb0X8B7BzVY4bCnmpjxlUXKfjOO2dkD81/yjHekyA4eBqVhlf2gKvG7CY0zKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QRVCfeCD;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BA8606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84BA8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QRVCfeCD
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so688910f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004911; x=1795609711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fApH6YF8/olwr8rszx1618Se8LLbeSsWPgcCTgBcSzQ=;
        b=QRVCfeCDZ50q55h4y9LENvb5jE829mfCziTdzf3Mv4xSq5+zz8ClfPFrt3SC4bEwvm
         yZpjuQDYojaQuIchie2BoCKzm1dvvt3cWcU5WTqAPJaCz+8jbjIJT4z1oghC9tHqxGDe
         kGy4C4WaH/v52F3BpzODMnCqHy40pG5OX03QsH3WBBTyR65czbLDyYPm2gF8yYeNlza/
         GXXW0dXuPvHlyy7vBx1JgTnjqHG2kVjiGq9NRuATTvsavX2uw/yacVlCcC8SbhcnxBP3
         rsB0FYxkyyXpgwDeYykmF15G47UdgTO2C/m+ftBt3r/+KxSDTqAYOdAiMMuZz99z5m6J
         S6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004911; x=1795609711;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fApH6YF8/olwr8rszx1618Se8LLbeSsWPgcCTgBcSzQ=;
        b=GKdlQtELMffU4qx67xNxZ6YOhs/t52xgxWaqzoNqiWEbemju9g+cMDTZUAeg2X0N5l
         qufEGuIg9lYSVM7jSEoDLj4NhHWUGcA8EfAHVT65lM5vLdPXDDVRNmDu9wSDuaDni9IB
         kQHpAL2uMQCL6XIAxifLRSOQ0Z9rEJDAg+WT85U2PIolRw1DpKWmQ8FDy8e86Dsdb/FQ
         zXyGJvSFAzYMTIWEqvUfjRO986iuxMbh6ydX4HNkXvsO9rLacqDOEmzjm1RvZvh87Lzn
         pYm1IVAM4nm7LKVrDHrLcIl5Lc677dn41uAFo1+7t8QTOcciajIJzJYNrq60eWBCHDF0
         8qtg==
X-Forwarded-Encrypted: i=1; AL+hErEncLblR0cGWf3VXaYeLbrNKPhmk4QKSdy8iB59cXYaKmRE9FsMa01ernuX1h7sELojlihkdUHoc5hCCQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/86RyIZwhPlS8E+Fb3VvIuGMeGRra9ELr4fjErG7SOs3/4DVdN
	f15PuKOFwU4MjfOh6WUAg3j9xUl+U+S+tVgSmuwrwqdvenidslOBpfnYr2hxic+ZT2A=
X-Gm-Gg: AZFdTZfUzmo5bIdcC5N+D0rF3GI5Dat0BTGbSEwVOq8bc0pFKLu2ElA+qzOkZ1+6hB/
	NZvIjWvbt6t/9erhMzydhv/FyuCBJi0WOCwwiji+gDeBvnjYxEeXjXIp3UWu6pirkNNms6U0DlX
	l7cUaGRlkCRlPvOX9CZWdWX2+b1EO26wSOfP+dH5cXip7TO+fWDLpGmYQcyaE2l+djq2jnCTV80
	n8SB0EwXgyVuEddCdvI1t/QJLp5JPkoSpJqjKPQoDiN5yUFtgm8yS0K5HGrMF8cEE02BlhyG9Se
	otArtFem/IcyF+eSPw7vMIB5hixgh0xncmjWqOdHIrOwwoadrjC/ikPKj97FYxaLXr556MRrRgF
	8V49YiMOsOUEMuXBO5sBzw4GS1Fv8uFcwaSEaPA0Ix2E7CF6hF4CQnUMwc52HwpL1JVC69mZzb4
	Q4katUSOLe4by8FhusLHbq+P8vCOS84Rb0R7Dod0bCY11xKLdZ1Q7u7BW6rwNlICxAKmTgbaquu
	xvmuJO3dicw9wwHISONXhJnJz9JkzL1helz/8u0AZjTW595AflNIgX5xZftiG/3FKQ/Q2A7L4cu
	OGz3DhhCM6qb4bc0WTkWljY1bGiQ25tOkXg/O+UEdqgIz3LC2eEpbF+g773Yn7Zy0mDVTtD/+dA
	ZcQ==
X-Received: by 2002:a05:6000:2f86:b0:4a6:63cf:99a6 with SMTP id ffacd0b85a97d-4a663cf9ae8mr4421294f8f.23.1795004910709;
        Wed, 18 Nov 2026 04:28:30 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c406sm4567452f8f.14.2026.11.18.04.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:30 -0800 (PST)
Message-ID: <15dbc800-ab4a-4b98-8f6a-95d2ae80819b@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:28 +0000
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
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 12/12] arm64: dts: rockchip: enable the NPU on
 rk3576-rock-4d
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <c0d64d55586774802bdd70defa016be6912ab83e.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <c0d64d55586774802bdd70defa016be6912ab83e.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> index f068794e48d4..72b251d396fe 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> @@ -779,6 +783,24 @@ wifi_en_h: wifi-en-h {
>  	};
>  };
>  
> +&rknn_core_0 {
> +	npu-supply = <&vdd_npu_s0>;
> +	status = "okay";
> +};

I can't figure out which code actually acts on this npu-supply
regulator, even after considering the patches in the "pmdomain:
rockchip: RK3576 NPU domain supply and settle delay" series. What am I
missing?


