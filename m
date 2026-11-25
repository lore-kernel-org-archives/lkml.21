Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594253;
	b=hhOne9Gp8MBxbkNsQ75RfvPFCrInJsP0x8aiVHGY9TgFO//O5cRu5KRI8zhGn3dmVeUH
	 gSnuAgLzQn4Pu18lgx0tQgUUxQn0+BPM1bRWG7yVZOu1Jutg6ap//HJL6YoUzXAhEtKPy
	 zgsy6SmKRVcKirTh3IC4VzlJumj898/zifL+EM+IS7IRHZPTx5aHP/OJZfMUMGn8yQ1OM
	 6a4Xgdr5otJRP7iTpr9UpAqRMcT9tzfHS19E7WqtaZ3cCoOGl1hOZZeUuk6J2kjotUF98
	 cZZHaN9xqqg7CRx0vgt3XTX+Kxmx9iEF8+3QU98xLlBTH1Srqinpva6uxq6q2QktmPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
	b=LWeZOAASoGRafsfiKcuIure4PFwmR60dqjIeNmgKzgTnW3z832tbhFF5+EM7cNU7dD0G
	 pxD3qyeVLbdQ9cKJjBYeE02xEu/w0EM0ZoF7oziHzewJiCLTLVdRYvHZUq2vAQTbRF5h/
	 SRf98GGyo0MzSGG7+eoP+X0xG7RO+ugo+W+Jx7KhGiRs8OJgpyBM6uT9BaDp/BMpdTHGS
	 5w4z59toYOTZadieiZAldDncWQIQHNLkYD90E5zeSXxj7OKt4aduMZk6DhRxYKkJsFwtU
	 EH9htdZzf9gxMyXdByqiDwazuMFfwCqbzhBgcXBoclKBbOfjbBfD13F0gOI5tcvoMYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Axi/6UaU";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF0B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF0B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Axi/6UaU
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so5090257f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1795594250; x=1796199050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
        b=Axi/6UaU56VI48FBOJ0Iuol++iREtc8Gq+qW1zWGU1vVEnaSvbob0k+3ZfA+F+RIZO
         I5uQl7TAdl1SPHyDZjq5Dv23VwS0DC9RL5k2X5NCa3z23u7EFZRvqTknvRZ9hO1p2Rf+
         KMrYnPJlwhXc6saE+VVVh/zmQbOjbEFka2m1a4abMx0WMhltlVR0wKryxEoeUsWKm7p4
         /SaTRtv4WDijhvmjHVG4lgM+x4N8jEoTKElJqf48QpLRnF7Q28DzwO4SC0jGHEggwCof
         o64i5ChchfZ34nDZLE4xJ9OZRWiU3WFpBk9v2dx4wtKbSYZp29Z/gh3bbDmDVrnabc9w
         brag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594250; x=1796199050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
        b=IgX+uRaJQwflgHDbyrmiN/noqRoTfOYbCjX1SHzjK6/pP1ukT9PN9UkQHXm16Fl8cn
         yGhykuKKWJIyvK5UGo3Y06B085gFY19OnycQ1McLKTL5UiCyEXc6u2Q9PJDRXVKbaJuv
         csotgHCRt3lwV/Oh4ZPmR5JKOSWqwp8fysMp5BeddyAOGIh24RS+t0Mj2w7wU6yjp6N4
         Izh5Ta1kk32dp5/7leHN7plwrOG44Fe89KPU7TEMD3eMXx8bpa4335beCdaV6kb/y9iu
         Pe1pYufjtkiFBSAgiqbPCS6mHINUpaGyAWZx4hLOVA8YsOX8jHNxJ7coo5St50jVWDBA
         Lb4Q==
X-Forwarded-Encrypted: i=1; AL+hErF142VnT5v6XHI+b8pJIv72lsEJvQV2E78fucvU45obQJOiT8MKILVv5N7/xd61HQ4VVyZEFxMQSHIE1JM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kj3rc4gUzfR6t/y0l9Fx0m6WzEbpVVPZoaZ5qG3+G/C5Myz08
	8cJRpFXPvWOn9grqjiCSyVQ9JAX40pU8lwJD11ynu5h7CxVczabPury62Fl4zbutHp4=
X-Gm-Gg: AZFdTZcGjC2Jj+bdj9//bo4faLZxE6wt0Zz7NPtXWLnMm0y9f4QgLWcFoHsALF8CV1O
	GHA1fAMzq7EULh1Bg0riSAk2uJTPSd1ZVaZigygClm73HKqRKp1OHTfS92Xpz0RU68xhh0lhMbJ
	tAn2CudO2kVzUAsTSVZYcZH75Gi+rGxMZ8CgwcoZ6+BAsb4KD2nb4mwaItVcHv2Hm0wLyoYHVr2
	UwUNg8eL/BV5wGl6wF6/G1toDbOlceQbtK+tv0YNI5TUG0fQsk6JwBD8aAEt/rLIyGYs+Ux0VzT
	ulcUCGrP4mpf1nbXwyf5BpfGguOolNiN0/PglBaXUyuIIJv3GySFJe12At/90/7Mggy0ZzsJqzD
	1Ws0OtKSpUqs03qLuinoKUgMTPJ9+arBC1o4wXWgBoAwHLj702VCHm0Up9bdM1hxVJIakJIBnqd
	rLgCsQOnPcoeGXfO1MIoHBk0Su+PMLL6bSSiXEOrkgPsH7pmQQqjJKeyxQs3e752E9WqmfW9Ef0
	n92eBLZGQIvXaoK2hVe19ckUEizMBxF9642q1iSxBHl4WX9gvSVZSkpHYDLqRVjhna8SZ3iSNYw
	tNIxlzNJNj+ocUOtc073YKX+8uJdZPnoR+KoqCByihj4kZhECR2Ih64JroJ/PymfZVtnQLXwwCM
	=
X-Received: by 2002:a5d:5f93:0:b0:4a5:33ad:871a with SMTP id ffacd0b85a97d-4aba56f470cmr32677127f8f.0.1795594250026;
        Wed, 25 Nov 2026 00:10:50 -0800 (PST)
Received: from [192.168.2.69] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm31415134f8f.0.2026.11.25.00.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:10:49 -0800 (PST)
Message-ID: <f7fe449e-5dd9-4476-9f1a-100466dc0c8f@bytesatwork.ch>
Date: Wed, 25 Nov 2026 09:10:48 +0100
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
Subject: Re: [PATCH v3 3/5] arm64: dts: freescale: imx93: Add MIPI DSI
 controller node
To: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Michael Walle
 <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexander Forsch <alexander.forsch@bytesatwork.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
 <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
 <20261124201110.GA366860@francesco-nb>
Content-Language: en-US
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
In-Reply-To: <20261124201110.GA366860@francesco-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Francesco,

Thanks for the feedback and the offer to review/test!

Frank Li actually just applied patch 3/5 (the i.MX93 MIPI DSI controller 
node) to his tree. The remaining patches (dt-bindings and board DTS) are 
currently waiting for the Youritech et050fw01-kt panel driver patch to 
be picked up on the DRM/panel side so we don't introduce broken 
dt-binding references.

Any additional Tested-by or Reviewed-by tags on the remaining patches 
(or the panel patch) would definitely be very welcome.

Best regards,
Frank

On 24/11/2026 21:11, Francesco Dolcini wrote:
> Hello Frank (both),
>
> On Wed, Nov 11, 2026 at 02:31:17PM +0100, Frank Obergfell wrote:
>> Add dsi node to the i.MX93 for support with mipi dsi panels.
>>
>> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
> I am not sure if the other patches of the series are ready to be merged
> or not, but this seems a patch we should merge in any case so that we
> enable other users of the DSI interface of the imx93.
>
> What do you think? What's the plan for this series?
>
> (yes, I could test and review it to help, I know :-)
>
> Francesco
>
