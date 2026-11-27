Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769112;
	b=2EZlgYive6Hb8QO/X6yCfuD/KmUqga6Dho7AMCmK/oeK7thSpqe7EXiFdpw3VKE5Gn7A
	 dNzN0sxW3KTzDAjKidhl5kh8y3dlITdQD37fhmcfhqj7wmKhmuFTatdc0zaVhGTzI1K5F
	 ujSPgvsPNdG9YIGoeEIUBjeRu65ei17wQ4wZ72nviTH68NSqYwrxsmy7YEH+/Cvnm7xdt
	 9yNWFjxLSX9DyBrjYADkiXeDkXlZluqmdjbXlv3VMmIk1H6cFBiCS2Gj2rRgG7c9V9Qos
	 Mmlfl6sRUSraPNjswgQ6VhTbQK9rMYCtC1i/1YVBPym8gCkznmLWhkZM3gS8/TO2kCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
	b=Z0HN8j4ro5vfZM1/51VeS9wIszqVv97QiN+JKilGbZ3I9A30j5XynkqZ9EiR6PiigJgQ
	 qpbxcf2oIeojRm6jltrBY8Gp/0n2O9fq3Ior06y059z8Ljhoz0VgzFmFE7FR+MiypamII
	 yFmmRzIzmuhN6UGkJ8SdxZXwLgaCGA581FmQyRcdXbQ73GuL7f42CfkFaOcX9nx+2UILg
	 j2x2nposoO5KN70TRJPiSqWzGCfW9TdjAsB3hJyK8RSFxtcIW5LDZp824pWqclS/heUof
	 LNFjfYEw4AzVPq/CXLc7ecAXFAveU/hqPN2WoFPBfiwH9U8DU5rrgxqwdWZUt6SOO1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRD64OoM;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7759E606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7759E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRD64OoM
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c506a231b88so1045384866b.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769109; x=1796373909; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=MRD64OoMvCFGHZzsUp9+PwRr600pYUT0w3py/Lhu8RIPbqz6DXgVcMB/2Yq02pK7Jk
         zIr7Bip3xailSfRQcn5XGVNVqY9qud32SG3Dh/HIncZv/GYYDGBs/yjGvu6uagZJ3jPH
         EFINEQR8KwtgdsJpdpN/TGnxBzOw/N8Fm7ivr3hJXlrbYE4F3S+5wVPl5IpGYJ4GFeCY
         MaYws/JsouoDxUGRRwa85698slMGV7CjYPGuL/hUtgKI3+gg/PgfrUtBbLfNah4xjtVW
         munMq2IlGI+FdDn19++xCQ259D97pO+8nQPNtINOJhw74xx1qVicWNXaQidZ9Ok+FWl7
         keIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769109; x=1796373909;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=JPEli1jClq8r/0Ptbx7AXaKgd6kM9U3ceIuTiwTPxnFrVvddr5A2GqvPFH2kzHy6hy
         6SQxo+fbLSaRxhm4LeiHfTf5Ah3TlPc2cyGyOLxOlRWoKwwWhEoknfBcLzux2jFOhRcl
         zgm0FBhGmN5FcokbYENXG8IddPt9thZVag4v0FP1NJ9MlrGhKwuH+p1Uyfw4Ljm3+4aS
         7Rd38WZfPqXT1P3CT6T/m6DZkvK7XcVJkxH3pmOmcQfFjGvUVGefoxI5Wfm3hTtr23mL
         4sESjY966bNfTwIsDPiEMc2S4PlbNFq8TBySduCmhY3c+SlaHf/8VEdkugg6LYf2pnLC
         OKLw==
X-Forwarded-Encrypted: i=1; AL+hErHPEeXkm25U99fwouKHCNZzoi5ZalMtVeVWzJC+/5JW89hoa3ASwPOB0D9B7pTZ85Rc+BI0xBpZ6tH1mzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P4527oRZhNZzCBMsonzA02fj4qE8dq0nDJcW/+kjPUFP1HyhC
	bbVWNwocO/G2P/rQrv+Um3oYzogy1u0FEjPZSmwBwDKaWpgRay+5nQB4r2oVHbGdA34=
X-Gm-Gg: AZFdTZfSzj3QttERQxGBTw0hyUzQIrp22FRWShzjSPrmjKRDMSKEvsJBTduNiqOmOse
	MaSMRQRzF31iiVpmbCfeWRA5wb+LDZuOgtyfvu5aWnXcTrumuOTknlMf6+cQMFrefW1w2zptoUR
	vPcgj8qzluYgiCBO/1cFfnxzlC6CpjPD/X/ONvBmoLbIBX67+b7Qyqgt/+Pz8ui3D6j1Fd8V7sm
	C1DecNF7FvSkTpy6fYzzYj1p4w9GqGXJWP5Izw68pkfRPYkfkOlR/o5IN3q2gLvwTyMvZ5h/OnY
	JfU8NJ7w8mUeqY+CiUZyUfbqM5WoPImW2Wh8gnXKBz8P438hT5zEdw63NozkmdLYau4ORockymm
	3mQtcAWo23eOVB+djFG8ZUvZhANjydcbqJIlH5jJNBj4hRQkgppA/4qg8/KdFkHSChBqxLnPSGc
	kyRd25b5naxxV+t3bCgHCTvVhT/gEPNQj3mHjGULa75JqNJp6kbz0asAtbFND0Kx0TGAXjyThi6
	0LAX//ixxTGMBzdbHx/9Vh4zs7UFpLhxOn8XkVaTrkzG5gLn6JMU++DbJkhiHxdAjtMTWgwyeMI
	K8YM+qYnhGbZJ2cQ6+VBX/0yBm2alui6SwBC9so+vF3oMJyr
X-Received: by 2002:a17:907:6c17:b0:c51:3cb6:5b11 with SMTP id a640c23a62f3a-c513cb65d73mr1971796666b.49.1795769109636;
        Fri, 27 Nov 2026 00:45:09 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm851467866b.39.2026.11.27.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:45:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v8 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
In-Reply-To: <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
 <179536111581.2728475.9919460533427781841.b4-review@b4>
 <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
Date: Fri, 27 Nov 2026 09:45:08 +0100
Message-ID: <1j5wxi3bor.fsf@starbuckisacylon.baylibre.com>
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

On lun. 23 nov. 2026 at 10:48, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

>>> +
>>> +&spdifin {
>>> +     status = "okay";
>> ... as sashiko pointed out, you are indeed missing a pinctrl for it.
>>
>> With sashiko remarks handled
> AP222 does not have an SPDIF IN port. I will remove it and update the 
> interrupt number for SPDIF IN.

If you need an immutable branch for the clock changes, I need you to
submit them in a dedicated series. Let me know

>>
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>>
>> --
>> Jerome
>>

-- 
Jerome
