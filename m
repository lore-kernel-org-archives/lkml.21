Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771321;
	b=s47WvnmdNiWKQcdhEMfUp2K24qFxBzJ3iF8uVXcnS53VtYlcdri9QqXUSUdoNM85vWBo
	 9xeDQRbgiyQh1wn8ef7fhH+Ib4BaG1owHvZFseliadtyYIab7aFYOyQ752Vxq+9Hs1YiH
	 JAumIW+nrQ+NB35Qy0ScD2szXK8CFOgCIoGII41oQG+G6e/3KuBE4qUm+noVOwFFEEpIA
	 lPicPVodv8sBOcDPgugzL+2PzmuFOHirWNlUnaJk55fVwzm3X/QlBEOBdiUGw5fuRpPfO
	 Y1raz9ajmSGIkc7kV9trJmdfjTvpbYVmwxnW+0fChiZQXTiXjDfH1RZJhf0mveWn9cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
	b=hQizeQmTk/sJxWR5BJvVA+yakPr/oF7145EgKYaF5jF5K8fC5EK6HC7A5P7PBsPB8m5n
	 yR9tHpfZvFX+90r1oeKq/iTzqlEQApkqm4XPXkXOHcEham9d6436Wq/RHJ5RXU8hWjhZ4
	 O7W/H8nnYTBl8a1Ih6rN7DVTvGFKM4jujlSjU7Na8WehWPS/mWNFNOiVOv5WPsd5aJ4p6
	 PVsAmFBdKx7NvF64wu0dJ5RvgoyUMrNSRcegOcvHvXZXKhuexpBRrcl3WBz1O80Dhy7si
	 va52AVGSUKVKk542jRh1WgmybPP7kwcTDxK0VFcTHhEhmC1zOftzSSa5AiQBPbvcQKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ntrYKELj;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFB6606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DFB6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ntrYKELj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso72844875e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795771319; x=1796376119; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
        b=ntrYKELjVyYmc5EIREXSJiz5LXrlRVwcqTuOc4K4L1xHE1tQ+xj25KrNTBRt35kFug
         w2wLN+wqageIsfHvEhmshrL04ynMxt3sKEhqPIKw6B5ujjPKgehMtnQ3kNd6CBbh67+E
         s83Sk+9+q6wTVCvt0iiHLxVIucsOhokGu5E3ZR+FgVqNXszbiJw1KkxhAsT/k11Vi5gh
         srngCczt8bWD5XRdot7/7vD2Syc1ZP2ZKxK6bSg1GgflMct152fuhWnDQmcpcslHfgzi
         tx6Jm8S2Cge8zyjiwuLBWKpV98Iw+4Tdn7hy6ns5bmpTZ9zk74rklc5wQUAEnes7Q/fm
         PG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771319; x=1796376119;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
        b=BApsDTnyVA7l/rK8nAoHZocc+H39Fk6RGc1t/suDr1bObDGdeSiEghBHHw+JY2FZy1
         ZC6zhHXB3VQxq95h+4uqgYZ+Sug2HhU3FhKsdaS6ni+yDErvaMi6wTygwc12ubd3dB/m
         M70FVuPH5A5o3FnHyJTeA/FKL2oO0LWrvKLvh3k/qr+hQF9HDDz+04fyMqUs+57Dxo6b
         yb5Tv+BjkW6spJhfLVA5CbJRH180ADNeKbwjxVYdiE9N3HcxYu8ZoHvbYAbgStFgdbVb
         8mkYM+V0kTWKfwbGhfgeHq57pGvxkcdIyLkOB+ttG1SELQX2XNFIxt+TNEk6B0CdEoE3
         jMfg==
X-Forwarded-Encrypted: i=1; AL+hErEYN8QTxOf/dlxQjk76+7jKsMWNydfTNplDHptQsu6TpqwidFxYc9nA1TuZpmWJmmYAsHRLMX/AdrTgZp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q3hDCmsCNyq/UEOip/NFSl4xYaotiiG4jVQxYHvIiOrWWnnQY
	dOXplEzydTIID5z/Wjyju/1mdjlh5M6nti9+9PCDVJxutTFQd/U+YZbuW/JbiWdyNm4=
X-Gm-Gg: AZFdTZfgrX9JStQ+187ivzUkvH80Zuiq27hU4gB+nGKEeID06dGd1T+/vZ2JHPTFAXY
	qdHBEwZdv/oMsAXCHqUqxMu6AhLFmTaNK4IWBtCIm+/YaMXGGvnGJMHIFnw/boOG4HbVY3y2kDw
	phISb+urNdhL32mb2Zicb4ctQfKtC6np9dHlncj1G81ojDyri9Q3p8DbC2sYq83JdO60htw3/N5
	IGNMOy9wW4ssYunDdks8u5p7/z4AdB6NB2PflEH/gURIOsCSgrPnJSWvW2PlrWa2Tn5lKsh64Wd
	e/lbTFyZYr3AzRxCXWDokAYku5vRduZFP3cib+twSkqCk3TuUDIyi1G9sA8lY0IZjviCcPiCvkt
	E5ckdQHZKEEyUUW9iCrfugaejsyGlz2EHdvtXCIwoslZ0QGwCAerQ3WeRLSvhcuMErv53Ft0cjI
	VEuol80A07jbZMlldx83yB7gQd2TZ1HGXT0TSJqVgYJVYiwzizp0B7vGBJO6k0kmDSL+pJWO3RT
	7+T57Rclx/L9nBoClUv4Tj3aT7ScQJQTn42nmjP2BZ4ZSctS0VwdSNB4AWOrYH6cREDuga6e8uI
	O+d5TmYylX6qh7zuKZpctsKibs11fLRGtAccvwuw38yMz7RW
X-Received: by 2002:a05:600c:4f10:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb88804d35mr538864655e9.10.1795771318996;
        Fri, 27 Nov 2026 01:21:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm741305005e9.14.2026.11.27.01.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:21:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede
 <hansg@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, Conor
 Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
In-Reply-To: <20261127084820.GN38590@joneslee-macbookpro.roam.internal>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20261127084820.GN38590@joneslee-macbookpro.roam.internal>
Date: Fri, 27 Nov 2026 10:21:57 +0100
Message-ID: <1jzeuu1vey.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On ven. 27 nov. 2026 at 08:48, Lee Jones <lee@kernel.org> wrote:

> On Thu, 10 Sep 2026, Jerome Brunet wrote:
>
>> This patch series adds support for the X-Powers AXP318W PMIC, which is
>> used recently on new boards with Allwinner SoCs (the A733).
>
> Doesn't apply.  Please rebase onto v7.4-rc1 and submit a [RESEND].

No worries.

In this cycle, series based on -rc1 and devm_kzalloc() in them tend to
conflict in next. This series would be impacted too. I can rebase on -rc2
if you'd prefer to avoid this. Just tell which you prefer.

Cheers

>
> -- 
> Lee Jones

-- 
Jerome
