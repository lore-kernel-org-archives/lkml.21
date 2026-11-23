Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455769;
	b=1ublk3nUwOh3IR66GBWuCnuFfetsUebV0+5DlhM3PObbbv3F2Aee+/zZ+RH7NA1OF2tJ
	 SBxGrX79wxF+EDpKkPqD8Y3o1Ss7chkdbiq0Jw5ispCMzn7isfwGLT2c7HmMcK0YEty/B
	 dA23Ar6gqRHcSvlJVW4pNqNmb7VkrPOAlmDVqJd7Qg6DNt9ZDXGrq0P5naLQ7ZA9yvU+Y
	 uMH0itDx0cu1QHnBfzNawcuEkxV/WV3hSSmJCaxMyWag/8vlT6xkGL0mtSi6jcYdo/z9T
	 nno9YH1YGSbx3HbSjqVbr50K2GMksnMhHUest8A24fI6Jjf3QdwNkgi6AvIU2tgr9DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
	b=mErfxgz3tszXwWRvtUnWo1BUMLGl42XgM9hlxPOBOKh79KO0x3WHqrpI5k5RTX8Ms91s
	 D/2vp0Fz4fV4G13A40SBADL80ZYnyZW3o699jdAv/djTgSykcCa8lS4NvK3Q8QOc0xPlv
	 A+aGZgO/+2XcrDrs+ktML262+x118FAC+qC1F+ZPJBw+0gL/hTK8E72m6923imRGUSe1U
	 B5xU5HYoG3Ocn6xlLJDUNM9/jjVami+tSPlcaPf/MPveCw3icf7c1x7zUPw0goeq/onHU
	 h0T9ANW5Xhox2mlrvGG88i/0Z7B3kUD3uM1409mT5nQ/mIfFKOkx09rDELJGUH01miw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMTPLQ+1;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A42606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A42606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMTPLQ+1
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-5642e0910a3so1668169b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455768; x=1796060568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
        b=XMTPLQ+1CDEhcn3UvZ25OQuWfhFLUZULm0I1zSaTSjUfCBWMdLqOXd2FbtQI9IgvZx
         6+RBzArB5Y+FBU+5SDIv6CQPyaYcmkLLcZPz2UmnqQ3MfLzS9bOz5kW92/axHluUxd2C
         jkAO8/S7kXsVvJToIRZCbxbIcYGJV0WopTkIBya+6HufFkhjb8ByOdheIQ0xf9EC3giV
         UGFlk5XHJhcx69yV+hTAXriQHOkXm/fWlPDzcJoKshB5L9fdxhlc9qz6RANUavclDZVP
         Yo8DPecRlYT9k0nHlCcBGVTg9Oh9YDOr4PZ9l9wZoJcvihAdzd+jF8uGikm0fJz4Q+DD
         Zwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455768; x=1796060568;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
        b=HtyLITLBt95mIuzdY7LAqn9pFkCGMaBbyJ/GxwYYSGYsmAkPaQc/uiewk3W9Baodcm
         G6rG1ffP+3uiwsmO5b0iJk/DgrQQZB5rb2ex/4rjj4T13ZLsL5eZrcq20F8bGnT80mMj
         eKxIjxGnE7AMwJWTZSikaFjcj0kqit8t+M9hysGzjr3rlQIIzx5qL441/JtFKT3tjNIX
         IVg3k5aQVuXKOxen1giZq3/Nxs20fJgcpJfmvFKfvw4febA67u22h9WtfAVeH/XO+PpN
         alEos3QQrLrD9ktOeeG9LsZHqRVEZ/ZDa8dE+/HQ+MEp0N+PAp3Rz1XyCOLkiYElFzPu
         q1Eg==
X-Forwarded-Encrypted: i=1; AL+hErFdNSv1Au6DCeW1oNCdvyAGB1djkgvDpS4w8n+DY03UEj8NuD3PfUK6ibT1Fh0jFkkiM2xu4Aa64gAU9fY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YadiSQP+bV5yeP3VSpyXKLPmVVPdUOxu3zuuraaGejmsmp9Ip
	XRwoEOMKMbKpWXPrNp6ExgOhu8BmD+YzXDYE/Lh11Yrz/+jh1RvLjUU1
X-Gm-Gg: AZFdTZfpVqGXSU9Iyc4gMI5mAaB0YD1Rr3/M7ayYXtuYxQ+vwta4VUNCvtTpW0QqRWN
	RdOgMcxTdC5YTDYf/IkdyMe5osxG/6dkiD78LX6eUNj7N9B8SKtlhD5/XMuJwqVrbRT+pCiX7A3
	uiek24pc4BXqNpl45aABKPr5oA69Y95Ig9qqUpzr5pJ68daT2+zBRu142Tbjf36BuBIhWW5Vc5o
	U7yfWxDDkIQYUNnWW7jN30BDVQPdkZf9gEqmacp86ahD6b2GWSyMXQi+b1oUdzv7wUDgo35o3iJ
	z18kwlCEab+2E4s4PqzYsMlzStbIEyVLJ1uZ13ljhTZIScQvyWnXuc4NIgyNa2vQTj2E3UjVgWU
	jR/9QDvS5oTsoxRmtwQP6rJhZPnDjTBJqHTXaHDMGAu341jQSeR/knhQKnHCOfyJZllIecmtF4K
	G9aNGZITviB5LU4BnTzPdSAQONYdUb5pej1YC7vKbRLBAN/d6mW4OLjScxpEtDOyrqgzYlTrG/V
	meB4jkxm7euaMHhC2Cs2tiMnPSYDrbukvDPEv91wHtXQAPucRM+MX+DiDYuRe6/pR7ZE27WC/EW
	QVSScaiCPNbckjb1cWEUNw8A54DE0/yoUkmlAnyE98jqOsEJddt7AFbEuCvI4x4fsa3I7MSO2Mg
	jwU0i
X-Received: by 2002:a05:6809:747:20b0:572:8a:59db with SMTP id 5614622812f47-57a742be1e3mr7669480b6e.25.1795455767809;
        Mon, 23 Nov 2026 09:42:47 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm8959220b6e.9.2026.11.23.09.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:47 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v4 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Mon, 23 Nov 2026 12:42:45 -0500
Message-ID: <20261121-a733-dt-v4-2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121112312.75ba7299@ryzen.lan>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <dbfb7c5ea8b0ade2d48ef8e5cfd0b9e5a9946483.1795034153.git.enzo.adriano.code@gmail.com> <20261121112312.75ba7299@ryzen.lan>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> So what's the purpose of this cpu-map really if it's all flat?
> I wonder what the term "cluster" should really mean, here? I mean there
> are surely different types of cores connected, with separate frequency
> and power domains. So the cpu-map should not be flat, but describe that.
> Yes, they all use the same MPIDR affinity level, and the manual talks
> of "cluster0" only, but I wonder if this is not what this node here is
> about.
> Looks like the RK3588 also uses the same affinity level for all cores,
> but has a differentiated cpu-map.

The map records the topology in the A733 User Manual v1.00,
section 5.1.2, figure 5-1. The six A55s and two A76s sit in one
DynamIQ unit and share L3. The BSP's separate PLLs, CPU frequency
policies and DCDC5/DCDC3 supplies (A7S schematic sheet 4) describe
two DVFS groups. Mainline can describe those with the clocks,
separate opp-shared tables and CPU supplies.

RK3588 and GS101 both use 4+2+2 maps. MediaTek changed MT8195,
MT8192 and MT8186 to one cluster each. The MT8195 patch says the
big and little CPUs are "in one cluster: fix the CPU map to reflect
that." The other two patches make the same point for their SoCs.

https://lore.kernel.org/r/20230126103526.417039-2-angelogioacchino.delregno@collabora.com
https://lore.kernel.org/r/20230126103526.417039-3-angelogioacchino.delregno@collabora.com
https://lore.kernel.org/r/20230126103526.417039-4-angelogioacchino.delregno@collabora.com

I kept one cluster in v5. Do you still prefer a 6+2 split?

Enzo
