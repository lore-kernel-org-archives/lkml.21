Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124338;
	b=P1qhumHyeXcjssez0wBmGTTq+q8+yqT9Cj/cQ7WoihV6Xx/iJhmS12Pvl0MvUHhLR7tz
	 CJR3fctigafWA4FhjZ6+QCvOjWpaPPnPGWESeGPYp/YiGnes8qOZnb3CBmgvPEOsC5UXS
	 t87OIYLSniQNxP6LCbFHhOpLDjscLbCTnXYVXMylvzo4GjNxKrdPh7R/xiSbvq7c5DX8K
	 eYivI7HvOH1pmvwMOjfeCOSqi1q0Egh4j2G1OL0llttpO5D2ol76tAcxc7V2b4EtDzc6N
	 t5qSDr9r34boZteQoxO3Isp1bTP0a3IraPygem/U3r3KZxbf2GwfAk9EMu+6lKvpK2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
	b=mJFiZp8W24cbFuhB5GRRmRb7VR3Oo0EILJoaR6M+IVGAU39MQmcdqoflW2VZzBqkH/VK
	 Ebxw8imy6XZjpyNQavjll5HMW5P3MESIC/4NP/BDznPcCPTZlzABh9ni+T1607btplmZf
	 9igRo14Y14aVkGNWPD9f9GE+a+V5aF9xwpxM7vA7+er8VYPRdqwwrx92MnhReXf6jHUcF
	 lBfdarsBASx0DeTWsZ+2Vj8+/iOvvH96Yng5telF5PKrPPhMRAMpzo++uYQH9AnwMBWUW
	 cWy2hl4iI3XnRtj8QXeOyzXWKwEsQVCPCOsBm3bDk+Wplt4Tpca+wgdWe4I9trjCXkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyiTt0Wl;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B76760A2609
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B76760A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyiTt0Wl
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b3402105b9so2194797b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795124337; x=1795729137; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
        b=oyiTt0WlsE/V9D5hUQXI608VV5yECoIwBcFPiIx2eeFBJ3YWZeyoL5guMklQc5hlik
         ZcxuF7J7ibR7FrDfwlg2hPem3bjlTBY/us13BV0ah6NZNOHDDDgPGNMAoIjmBcRTbB93
         Rg+/+tzF8PjUxGMDMn+RXK6rRtfxBrH2/ijOUDvfiJDhJKdK7VE/i6GDMsnZ+OzPs/v8
         e0+xsvjtPScOV+jOBisrqNbz45YXgrnX2hkYbi3wW2EfHTF23zAvo+LVrQGfzcXoD8dS
         jNaM0H/aya5hSf6JQDujLE2cDMUl2/13tpxg2CJUUbrq3IfhPNe5mogv/YlUY6iGBYsH
         CQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124337; x=1795729137;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
        b=GEovNK2MhUAYxXRiMoU5KJ6Q5DKpMtjWujUNCPTsyhVdZSMk8yOyEZM3gD9cUOxjI5
         R4hd+WvECZWWcCL46LlRjko84N99uBoK3FUgYuP67bQGKaXqfLSLFZtrLZYMYJI+cTul
         W5nfGhIPGRgpexrwPU36fnsIXs7Xq66R2IbuHm0u0ANd7tpQfKf8L6vXG2q3fy3V5K5g
         z0jfvJsCHoVRN1ifJPqVm1pGjI5pRwXQR3JcHwCnHk5GzFGWr1Gse+C5LHtQxrADXDdg
         Fvnt1yAo61aFwnfZRziuKIEZ+w3Aw/tgRJe5bWr/lijR1ro8Ay0WY0RLQmX7F6ekmXmr
         zqBg==
X-Forwarded-Encrypted: i=1; AL+hErFbIpmAbTjSxrVClgZbRKNL9zUwPRWSPOKqasfGncL0WHWXA2fVvJl6ZCdVTrbozqvb2rBbDEqIMhCH1yI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u6oZBKdL0K348btBVmFA4+ZVtID2WTGaqjhlLwoPmREqzMFub
	spOx8gQgUt1CbB8PxZNC1lGxji3rs2xO0CAo3/scm7e/ru5GGjYrZEeA
X-Gm-Gg: AZFdTZfzH9yKx056is35On31nMEiBKRo832smzqCBR2xWEagb4uAgs/Ea0R4N4nnt0c
	SiHmMkvJhaTtyEgyuCyMXhDHSvkTiHGSIL5REEG7G7m1azuL2bq4sMAcF4mpQObZzEf+jXeXQsl
	1E8BE4xVpLmQc9A2Nee2bJ4lvmuRaGRerAzmJbCjPCkSzZcC9RkA3TQlTFTHfSplnTApZJ2eTEW
	+HEU0pqxj7bXOTttPGBXUqnQwUUINNZRUk+fy03y16KjRLkQ3n2YLhcgIVgGeDHYn3ahI6oKvM1
	w5vPYX+QjmkfAMOB70pMMDiNetmJq6OM0HDSnp4AWFKPLrp41du+3Zh/Prh5fpQcXV+kZI6cgim
	ga6Rtig8aj+JQJEVnUkB8R0rC9K5bbE02cO6aFjAXCmEqR3icd/h7o5VJqxf1Gm37wx3eIpCNDy
	l4FTbwBHddVBGNpFGFHKtW0shZyIWs5mj4VkB1PW21UNhm1N/2/Z7j4HM9FoVJzpjGn5/QQ26F7
	pFiANxknCHAa2w5eu89O4JMD2p7XmI5AqZQ1G8nFIe4BEhzDlqw53gRqHrT3yqKx/mAps4whd4v
	Myrq8BRO/YufIbFUHO0I7e2V
X-Received: by 2002:a05:690c:c9e:b0:8b0:95a7:37e2 with SMTP id 00721157ae682-8b5204ebe00mr4585427b3.80.1795124336861;
        Thu, 19 Nov 2026 13:38:56 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b7502sm663093d50.20.2026.11.19.13.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:38:56 -0800 (PST)
Date: Thu, 19 Nov 2026 16:38:52 -0500
Message-ID: <7072ab495239e6bd28e2e9ed75244e24.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Cody Kang <codykang.hk@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
In-Reply-To: <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
 <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
 <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Icenowy,

On Wed, 18 Nov 2026 18:18:11 +0800, Icenowy Zheng wrote:
> 在 2026-11-17二的 16:48 -0500，Guodong Xu写道：
> > For example, the blocks sit at different addresses, and most fields
> > are at a different word or bit. In dpu_int.h, CFG_RDY_CLR is bit 4 on
> > the K1 and bit 5 on the K3, and the underrun bit is 9 and 8.
>
> Yes, this IP weirdly doesn't consider register map compatiblity at all.

Exactly.

> > IMHO a K1 port should add its own compatible, its own field header
>
> Well I don't think field headers would work for a mainlined driver;
> maybe things like regmap_field could be used to mitigate the
> difference.

Fair point, but maybe that can be done when the K1 is added. For now,
in this series, let's make sure the field header and its users are
self-contained, so that K1 support is easier to add later.

Guodong
