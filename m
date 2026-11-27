Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802814;
	b=zkIw7QLOKBg4+Boh2A9Me0Shnerwe7SUevfZ1cQyo/OSlkINTJq7WYzj3VwUhPbf/to2
	 JG8M7odLW2uIlVYMokvbBJoRxdfLrwbkqhq3JsiAXj9A+HmXOjU/8EYCTVCicsde9ReTk
	 R3Xpc1N8j/RrOMErfvq4PIrAtzB6LA2EiNiegk92IwR0JnzGM2qxCxtXAFTnrf/pfWn3L
	 wJ0hT/4A019aEqdxFjMESTkUHmIgKAPbeaR57XQhoHjhMi6Qd7/SvDKdKkHd63grGeJJN
	 chdM+8GwcEKm7CNJgFwlLeRIaU5Y02BdF8Kl4sewkyZC80K+ge9PdktMHtwowIZBKuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
	b=YYfNg180iDS3I5SyDpOHDRirrzN+TtTqg1UZjIicl4l0VeCUkt+d+PZgD72QBAVBQX0M
	 mim0KAkZ59X7RuzCZ8GfS+1NLZxEhF1+dApoX8gpZN9SFvyvnHVhTPFPFz0iCIm8bpUsS
	 XpxyS2L/TcFc7vb66/I0CluVo6Aw//09NFkWkEXWceJnI0Sn4kMziu7joqaknDWpFeG4j
	 rnSvmjebc1rt+hLAODmT693p6I3lP67LubhO6HqIHJlGBLDUKpI9c0LrQ+FL+byPZZQu+
	 iig0AIUiNBY82CJu/22LPweXNGtigNl/v1dQS8/xWGOOpE3OshJfjZyGgkwpmwvYKTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9TTNwVj;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE91606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CE91606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9TTNwVj
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6d68de53053so6156533eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802813; x=1796407613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
        b=y9TTNwVjP6UCmujUMGevJiEol0AFP2ky/lNt5rQkZNqfDtyPQhhWpcRFKHicGdhgtg
         USPGFmEp6lLjnKVzq0KAJ7E7zLCCHNdQ+lFzNMNu4JP9vgPbAeOs7iOGBuXKAEEK4ZJT
         emmzmgphfL9jW8KmUU3sHoVnpNfJrK9OCye+FQMb36vnUnB+OIE2OugGUIwieK+Idtub
         HVegVKuQBjrv/w/ZGFuogmr4POtDyN8FXdgqkG3QVpwpoQ+9iuVcxfts5p+Vk3yrV4Cg
         LAvV4R3Dc5ZmAmOvQAJJQzVH8EsK6rZpOXsI2g9D+fa1fTYvaEK8YbLmGLHGHdf2ejm/
         ahhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802813; x=1796407613;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
        b=lIxGgqYnHFu5qTY59onUvKlO4XeXB6/ZWJEqggdvBYCH0C3qJPsqogi2Ldc2nENzqM
         Apkyaxg8kcsiPYFM6lR/IFggfqSWy+hH7V13UYPsK342TOJsghTf6GmbZEg2gmDz8AjV
         jKmJDv5z0uM5kHVtLhOlPXGU3cZ9M4nW/LWxGOmyqYfSBJlW8qLGx60f8gI6VCoNdiEf
         sBtAm6dgtFFTDPRnFMDn6hzXi+0WvnU51ggONE4bJyf1yJqjBjTD6igXR63DI2AdJq6r
         +zoJYVTmy5ccFiGJHWwUY5gTksrqaHNcqYQmp+/XAxP+7mxe1EzllSsglMtsJy6d0WLC
         E7KA==
X-Forwarded-Encrypted: i=1; AL+hErEEnj4PX6+22fHP2nJ4L79oRCGL6SGaCg0WICpHuAbrcxYxWQ7KcbAntvmiX/P84TDP7LweJyXmy8OQ4n0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yNM7oEmddodFqnWYIbb2DqHuVAdlzrj43rtLb7Lsx/fCub4az
	9lOFv+bJlUqLJnHYDQRibepeZ2+zf8v0VjT3hALGeSagDiUQMi88OIB2
X-Gm-Gg: AZFdTZdevkLAgBokXdI8vj77DkyE1HLOa7KjNRUHROn4dRS3jye9QJALlXB1vQ5QYvm
	7IsPaInSvfxqQN+pRHnOqsFNrnpAdfjiREv3xD5YiY3y0c8WtK/JTsGNNsXTVxoaDxsu/sKDiyq
	zvKcggu7MKBIFm/o8RVIwLJOnWgYgAMxGtvJ+p41dsuvhweyBJHkeqQf3FzZLNmeBtYz5nKBV5o
	hYTugs8Xn7+4TiP2WZZx7o3favco5qrneaKnKOxbN9UhQT55HmW97cUe1EL9uyjaxvWBbjeZwY4
	4X7FELGoRcosuKyxkrdk7t0V7LoNp9Hu+v85TcIchQuCKPKr3jv+/YkwGVsEB/YXulvUDHR5X7B
	4pBfuDb3gIFQARUJphesUVe/yPDBEOHgrJvy6AAFFSEcKKBFzWS718N81LVEBnJXpaqOeIRGGof
	lQMDY2Z5ooHXANuxi8cRAFEs8S3L5X7CXuQeRcAAglYm1/x4tzvOtJ9Lp5xTCEKQS91OhnH2P/6
	ZVfqj2KvrpgcIbdSMTp1y9qvDN0bwdHELPjU1dTfSAW091jpORCHUOBYejZE1KgaVp15moMfNlL
	XZOIFGr0uGhqyoaCVz/nztDkNYQb5+CTfcvRXDWbPRoh/+V84Q0ayz0AJlMrnYryoIdmFLUhxIM
	u7pFktg==
X-Received: by 2002:a05:6820:a74d:10b0:708:c97f:5541 with SMTP id 006d021491bc7-71b394868bbmr14209997eaf.37.1795802813364;
        Fri, 27 Nov 2026 10:06:53 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f6d33sm17220715a34.18.2026.11.27.10.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:06:52 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: jernej.skrabec@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
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
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Date: Fri, 27 Nov 2026 13:06:50 -0500
Message-ID: <20261127-a733-dt-v6-01-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-2@gmail.com> <p3YaXlLJTguQBGnWyMpb1w@gmail.com> <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
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

> But it's still compatible to the D1 MMC controller, isn't it? As in: a
> driver capable of supporting the D1 MMC IP can also drive the A733 MMC.
> I think the voltage regulator is a separate problem: it's external to
> the MMC IP. The vqmmc supply property is documented and usable, and the
> availability of the regulator it points to is a separate issue.
> The same as the H616 and A523 have the voltage switch already, but are
> still compatible to the A100 and D1, respectively.

Agreed, and the manual backs it. The A733 User Manual v1.00, section
11.3.1, lists SDR 200 MHz at 1.8 V IO for SMHC0, but the SMHC register
list has no voltage control. The Port F pad voltage is chosen in the
GPIO block: GPIO_POW_VAL_SET_CTL at 0x0200_0070, bit 0
VCC_PF_PWR_VOL_SEL (0 = 1.8 V, 1 = 3.3 V, reset 1), section 18.14.6.3.
So vqmmc for mmc0 would be a regulator provided from the pinctrl side.

On the A7S (schematic v1.10, sheets 4 and 7) both Port F supplies are
fixed rails: VCC-IO, 3.3 V from SWOUT2, and VCC18-PF, 1.8 V from CLDO5.
There is nothing to point vqmmc at today.

Unless Jernej still prefers dropping the node, v7 keeps mmc0 with the D1
fallback and no-1-8-v on all three boards. The Port F switch can follow
when it exists.

Jernej, if your "emmc" meant SMHC2, I can also drop the unused mmc2
node; no board enables it.

Enzo
