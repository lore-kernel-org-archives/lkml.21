Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266035;
	b=cO+KjSEraV/N8ckWblE9agSmfs1t4YStc3rxe2FXYJQgM/CW0mTeqdN2PLorTld3Edrk
	 OhmrkDhD9TYrN/F2VXTt1R0ZR7Uh844Hbmc8byJdcn38Y+Iq0RqqDLu7rkWG8PHiMqTWY
	 rS0P2fy/FDM1C2KjmoeELa/A4jl/oawYPOFwOeKu+Y4rSVGqcs0HZCy3dn4nO4jOVJ3Tz
	 9eMSK99HrohlIlUGKYAgE2rDXbj+8vtL9U+4FkbCBj2y8dBGh2k2Z4Y+uB10L9o6xUYU7
	 SKI9YUz9JHSmLPc1DRuOs/Q4QKlloD3AVL2T5VMLudsbcMNAdSAmVxy8j/tCwWTQwaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
	b=z/e3094De7eXK3L4btorAxr44NmaZv8he+OJb0Y1Y9fPouscLcI6NC8W6c2ABRHDBlF1
	 aA3oPkmijzm9NSZhWZlBRbsr9cKoT7pLRuSOoGn9B97qaOh5T41yYteNywziPuXVfMLtG
	 jJ+ZZvCmjPaZNYHjh0IRE5fyO1mxgXaG2Y9a0/MHWF1n7W+2SSlkDEP/11DSouh+KpXov
	 zSrfRFbpo+6Gd3bOt2GNW1CCGHIIN6R3eOGbmOoTTZ1/7M0sZDOzYtyuGB+OlVnhevXMQ
	 Q1GsgarZU7872engHwh2KcFh314a6ZMtKTZhW/keHY5nE7udGSD3CxdpzxC2H2ql7uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNtRAbmQ;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B353606A332
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B353606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNtRAbmQ
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9496473b511so224068485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795266034; x=1795870834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
        b=RNtRAbmQYXLSiaEjtX2aUWytq3ybkP6vzvMM/GYzBbb22sqY7OMQwI+6PVQp9DHcAr
         lhyzXBhfLKqVcuJ8sVYNtP2aRDK4nll7J9DPE5KKQ2CAiVa+LkTWYungYQISMsCYyeh8
         hpGt4X4Nli6qalkIo2q0QmQpZOhYwDWO5tabVR1HVgZiiW3bleQnCJNRgfq3ll0kyepq
         3gsRAOgqgRVcju81U/9by/AXAbdfkcF2NzQSoJbhod4BZL71XZp0atz6aRPfoC9lunEa
         hlKhShuYNK3XPf/2DcuSXs5DhYd1yfNh3h4hIJmP4ba3ACaEg6LShMxd5328jY0CMk/1
         hndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266034; x=1795870834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
        b=03U7SIoJ4dFPgTBDPod0jjeK4h6IHfBzOJ94++xU84+cYDYpYYGcqRkVC/7DvRVhel
         zOPaepPQM6LbouxfZLkffpy8btcEYaqTNlsapancyLDkfiuTezMOcEj9rPi1prrnb9aB
         /t8gffQt5IwcmKGqGBo5ccWTwkGOwMmeNEfMMLy0hhEBI7UkjQNyy4WWbQ9IncItaYR+
         W1ynco6MJ05kLKZu2E57EI0FwGu1Zh4pHlYA3oQZz6uWN5HLOBcgzNVVXKhWogLr0pdI
         DViM+6iM/+DESXlpm1Exl0CboohbMbd5dLiAvmL0WDo7EJIPqILqpH8CzDO/bUaiW3eR
         1tjA==
X-Forwarded-Encrypted: i=1; AL+hErGEC+ScNIsq5akS0TC0Y/HPEzthJsLWU9OHCApVTJmS05+1CX9Svfqcxi/kbmgt9cYevV25vgWNw04NbNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DQpXKuFeAXj+mR/WJcZZt/ojGlrh0wvVrpmu/FSUL88n6UqGO
	ydLSmQDTiwPKSmtdVAyMuZGg50FZFWF2THgyCPPGI0L+/BoJwxQYKQH7pHuEZs6d/JM=
X-Gm-Gg: AZFdTZfm8WYzltlo9ijj5U8BW3nCSFcwrKLCfsmJW250B2+klpTZ5yuXVk+FJRAHUEp
	ZCkFwJVt6Fj0s0JhJDFIVVFZi6v37dIitDAFUMdSlyOkw9zgaLXTooiWIv+gjPmjT9lRHHW7aCo
	EAb4vYEWXFZIf4CaR+s64dAIbnS2JhkPcrdfTfGX6egWoL2siJj+mH69roDQWxEYEXVpckUAlLJ
	ie7qbADeTSnTx65vzlTG8mRAQjBijF75xj5iMMRCLx6DTwvP2gonEoTjIBfRlC3JmpLTAbzcPPw
	9h8acP01VlgYsGZn6IbOYDP8VqbPA4KZsf3wT+Bm0yqkr9I32/mLWMvZZYwTv8MPJooe0dmBGlZ
	aNsMmtCO+8NRtnnLTL0ThJC1UqQV8+681gNefFPE1BBPr2VmqWuZv5HGpwglnIDlIn4+0tB38ff
	+vxOE/4cr44CXAjsyfTn/kfAhPM5cQEXxDYP8u5ObdYYj5by4uXLaZA1qhjbfbAyWvbMgyzcS8a
	LaeuCY/RVTOe/ceduZbJdJd5Mi33rInS94DE97rnYh2ISZYzzf64kug0kK/B3o6aDfJxDk56vrY
	hBy6lhT/lqn42WUEbmAH8lJnMJ+H+C0WVsrXl8m9MxMJ6JpHV4tXDwpaEMTiZq7e3UgzxEtO5LV
	cLltwvSAURMnUq+qGjK/6KWtbjK8IrhhFlJzul2BTW/eFYP8=
X-Received: by 2002:a05:620a:2786:b0:93e:5677:317b with SMTP id af79cd13be357-949b35e9b3fmr1046746285a.25.1795266033942;
        Sat, 21 Nov 2026 05:00:33 -0800 (PST)
Received: from localhost ([204.244.107.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm408593585a.42.2026.11.21.05.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:00:33 -0800 (PST)
Date: Sat, 21 Nov 2026 08:00:32 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awGV8BU_AfaXQyBv@maple.netwinder.org>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro>
 <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <awAq7vxcY8CGjhNl@ninjato>

On Fri, Nov 20, 2026 at 12:11:42PM +0100, Wolfram Sang wrote:
>
>> > > +#define R9A06G032_RST_TS		1
>> > > +#define R9A06G032_RST_MIIC		2
>> >
>> > I didn't find any listing of the resets in the RZN1 docs, so coming up
>> > with arbitrary numbers as we need them seems okay to me.
>>
>> Why aren't we starting at 0?
>
>I wondered as well but clocks are also starting from 1, so we could
>argue with consistency.

The clocks use value 0 to indicate "no parent clock", but only for the 
".source" element of struct r9a06g032. The encoding macros add and 
subtract 1 to the clock IDs, so it should in fact be possible to use 
0-based values even for the clocks. Too late to change now since the 
values are encoded into DTBs.

Thinking about it some more, perhaps instead of using 0 as the special 
case for "no parent", we could set .source to match .index. In other 
words a clock pointing to itself means "no parent". Worth changing? 

Ralph 
