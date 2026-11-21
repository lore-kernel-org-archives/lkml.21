Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261281;
	b=4FAM1ehaF040eLpzPsV+wFo33NCe5kHOpqOab2/k5axTm54XzZyDdwQOCOu9Qt+B2+gY
	 /YzpvW+vyYRLI09/lS4Mg7+IXkXmZi5kAUyICT1rUhFsCbK02qJDTfCqPKRC+UNQLFIV7
	 cvN5tNjbdMXm1v1cmpJJbu3H8TEs9wj/ZUThxQk7LkOZZKlaVzRAYytAPf6Z8dtW+fYcx
	 BlQaRmOOd8WSAsXz8vTsL4jygj+Ek2bbsw/SEwcJRGAoozhweVV1J2mzj3F1ISyjG6rNs
	 zr4v2nFy8OqcXctvkH/h08MwCpfAC1kTE7kTKF0PFfDsqjMLua3Q75jZQhzUgMw3H1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=V/4tBO2K3lzOYZl1l77yELe15RR3PgBFIIRphRTzGfQ=;
	b=FEsSst6pwlKz5ielfcFOyxvexHAP0F7C55mKgLiHMgCyKUc/0LPl5+JWb/kddAqvb454
	 6u//SI50dGj7pWu2Ml60jSyHoG9LD3kLpZZbw5hZkQMtUg6efzx4NCJMUluV/Ng3dBWYJ
	 ZueF3iLeT4629uleVFw7QCsDZPloAjRQJU8xIzo5FsA/Rtz0JuDbvYJQckcGJjArDO0Fh
	 tavKb+JJuXoA/5AAwwaXeMTjUyeaNP2r1Ub/TF9IFOIr/eAhGoaymh9AT3EhXWFCouCMF
	 9CuIZtUM+c7mFCYRu9cpWqX6ROV9HJI6OAlHNB7G9VMiYA6vTLiPlamwRWrt4wY8XFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pardini.net;
	spf=pass smtp.mailfrom=pardini.net;
	dkim=pass header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b="IMaQ4/8h";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ADB606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28ADB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=IMaQ4/8h
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50a4a2132cso259290766b.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261278; x=1795866078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/4tBO2K3lzOYZl1l77yELe15RR3PgBFIIRphRTzGfQ=;
        b=IMaQ4/8hBHnxGBqLoaxspl/9T+AJZlQU6Zg0/10jtCuO4StSzAh9PpS5OpfjRLhUii
         5LrIJF+qYnNQngd4iNXBASPX9FgwacgZjtxHDLHM2mTZfCraILJuWiUdSQW2sOItwz+F
         G3fnMcrqbktomV0StIlH4L0x1YqjTyrDrRIlRDM/fcFOz2xVOkMgLMMLaZMsQGdIUnTX
         vIm7l8EdrF/rGO4k2hlqgmEmd9GaiSxqAc0YqPPl4r6rYKBBWFB/jUwGOcQW1CHZmpdU
         nmi836ysacfluTBHtml8W43LgmpCHsj+s0jBb/w59rKVoo9DZxvEf59E2TJQSndxSK30
         nnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261278; x=1795866078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/4tBO2K3lzOYZl1l77yELe15RR3PgBFIIRphRTzGfQ=;
        b=TLsFsvE0y/IANT0ucSy+Vlpa2fP9b5BhNPSwzX1VXnF2gbyer+uJ4j8ZhJIkrKI3ia
         JCCUeVnFyiI+eOMaHOx/bxxnwR4sPZd1OD6HWJRxRvdn9TANEcNItfKAoGomLdZm6dAC
         xiuVdUk06N1KGnlubE+V/cyKQV1gFS0dc/umOQH8koJthc9SbFWTPYD8zxI3EJG8edHc
         1m7yIOFnMurj+daHVT7xCUquaSQjHXiqX6GO5XDFWclhxWXHdVIpaV+3ooE29cGlQsHf
         MGo8GG4zoGzGD00BWnjXbd2Ah96WumGQi044ac09HgyJnJ2OkmCM0GFdnFCiTMEBKFC6
         0VJA==
X-Forwarded-Encrypted: i=1; AL+hErF+1rhiuYwKNnlSDzYcCugCpaMRkeL2MNzbNuYjmwVcdJLL1vugGtX/Yp/eTIRcZ2NfTYW7wsenUiWnS0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DHlSehqbQzf6UD9oeYouWmWMSlptLClIP0UpuSZ4/CdTOMf1Y
	kKnvDshSEwsp0IJA154M58a232vSLEvRU62ik99tUe85QJxZIjWQulXz4eaDeEm/1w==
X-Gm-Gg: AZFdTZeCAUdGk2fqjzZ7kFlsg87IYBL4+f+khpwB7kM/JOo0hqBJ2SOpVpAcKh5ACA+
	MlkCdWvFZTlQ8feLgKIUq3UXECPqCIsEyAmudY0l5FKb882pWAbyk/khPSUFu5yc4NvK/IWLypM
	1wLxwUgc6E0lh/z899HK9yYAKYw04KzE+iVmH/g5jFpYg7s1s+ooWoFxJjPXJ6hySmLOrwWZ3X6
	4spR9crsIBttjACTOpTaM8TMsjll8tlz30yrfdQxW1+Ng4jINazs8Yfxn7dzBWlzuVx9hH9W62F
	atXThaZbAzyY7L6yIWqr9IOVsXV4GBqJUTr/gTEe/wi15DcouS6nAI2N2w5hm4zsz7/QzmZlMzj
	LFtfhwXBAhOP5rq8gW6X6TWc7g4bhED/xVwnZAL1NwvFFHSz2hKfsTxtAhh3uK5dYLOrmCMC5PB
	Kr97AtO4+9oYbDPmtZFPhCWZEykjJBeAK3OZrW0UNUCCRgwgTBN57lXqGcKBNXCh/dRuHJDayPT
	6X3FRQsbQWLh5nXprs+vSCFd/mV4cDI7mZQz50g6+5w0QVC7AWjmqY7cmEzynxruXwazbgTF46Y
	whDgkCd6hCj6tovW+CqddRy6Kso4rprBDZ6MrxtZf8tM0bV2WXu6ce/JnaCnxFpQ4JiPMBTzFN1
	/MmiixGh291nnYGjeoezpRcnAQ5ks//Se/Ed0rtHNkXOjEGP1YALGWJUviyuTlD+zSJRGmyPQ8B
	1T
X-Received: by 2002:a17:907:c17:b0:c4d:31ad:9dd5 with SMTP id a640c23a62f3a-c513ac86e26mr558143666b.42.1795261278496;
        Sat, 21 Nov 2026 03:41:18 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae688f8sm195387666b.25.2026.11.21.03.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:41:17 -0800 (PST)
Message-ID: <8588725f-9758-4261-8766-5af518ec4f3b@pardini.net>
Date: Sat, 21 Nov 2026 12:41:16 +0100
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
Subject: Re: [PATCH v18 0/7] phy: rockchip: usbdp: Fix runtime muxing between
 USB3 and DP
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Zhang Yubing <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Alexey Charkov <alchark@flipper.net>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Yury Smirnov <yurymonzon@gmail.com>
References: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 20:40, Sebastian Reichel wrote:
> This (final) cleanup part depends on new DWC3 glue driver series
[...]

Thanks for the series! Tested on a Mekotronics R58X-Pro (RK3588,
FUSB302) on v7.4-rc3, with dwc3 glue v19 and dw-dp v12, and with
mode-switch + orientation-switch on usbdp_phy0:

- RTL8156 2.5G USB NIC: 5 Gbps in both orientations, also across
   flips while plugged in.
- Apple USB-C Digital AV Multiport adapter (A2119, pin assignment D):
   DP on 2 lanes plus USB 3 at the same time. 1080p60 on a small HDMI
   monitor and 3440x1440@50 on a Dell U3415W (its HDMI maximum), with a
   SanDisk Extreme Pro at 5 Gbps on the adapter. Works in both
   orientations, and the picture comes back after a flip.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)
