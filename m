Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553133;
	b=Umj24nfn++NJ1o7U4ZMFazMvoB/uSLlgS9+7fvve03zU8PuOPZy061cqHAqKBrpThH5H
	 DTqDSaOnSDB5mpOhTR9sCo5r9KSwFXDys2aM3pxH4ae9g+bZzRaJUCVenFMMabodiO+xt
	 vL7laLIUXL5TEHKuZrdKrSaNzLAlhZtA2ZS6LxNafJ6wlh4lNBrIgSahvOAKDTKSlmdwA
	 LWSeIDgTBAtyGcbrBEv++XVGdvyISsPY1bQg9NPA9gCkGSXxD+V1jU+VR0hl3V7a6jrmB
	 JGGU8xMAUDXwBBUdyzplgii6VeGp6EwOWtsJjZtx6lOJJgTzHoiSuHSh1PZa6Omj+cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
	b=ZI/N4NhVbX6DVh7LQK/guR/atCJnJ+KFDyKCjG6bPQo9W1tp0kRUFOSvP14srP64vKo2
	 ubUEkuf0rYfhTiIIyPMNoO4Qv8c8BZHtudoSSM34RgBlrHcggJllL7SeZyAnkJGuPkkBw
	 MyY3vqdj/pNdnGmzr6zNLBjge20OQvMKsVDBd+xdivY9tm1gfP8sbDg/+0YeZxflsIZaP
	 AB6HrpvNgaCYeNy5jbYPHLezZwdgjzlecMyj7VMWBfBqO0roa+LN7vgjhACim+UPc3Yt3
	 1HIq2aQJlpE+CPt75MQQ6hpyfSw710vQp4DaT8j8WWG39GE1L9GZsRRYOhvb7UNH9qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fWkfI7g7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC03C606A335
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC03C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fWkfI7g7
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4eab91bcaso27687217b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553132; cv=none;
        d=google.com; s=arc-20260327;
        b=O3XqlcdGY0UXhd3ikZchYerxcH+NIk93mpsueL8hv4Q6M+6GnC0x9Z1sbFiqvKbY8D
         NTLSEq2fXtsOZcfAP33B4lsTZG7ThT8LII7UQEJ0UNAfsm+bCtbVhMKlS5/iWZDk/eO6
         uva3diAsITryEUwcTLPxkoiY+6SrRmbmPX3v7aU4c+iD/SPzyRqngF6fKkGIZYHEjQoS
         mcQUQd4sh4YMogSEjYKc62/ExJl/nwadyLJy9pY9Oaom3tHApkvJraaxkxayGapL+OEc
         u6wG56BufbwfbwG353OI2dZ3m9pw3hRX3XsPQMMOaFBEKqRt3lBmIHVk17AlyRfbI6a8
         uszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        fh=TOk9JGh+wI6Dk/2JiXB7oXw+fjOX4p38hYLCfpeqzsQ=;
        b=WMAHkmxtzN5eD7QY6q9ywk8bUhhukwM+i6SbngNgkz0KnYsiKeb1p/VSMtylkEBOHQ
         5Nm4G/8LqUdgRQWnfvgUWeQpXGjwnhjaRBObLxYj8ouwPAydQMGdy4ou85rK+KvkxMgS
         9M+/omPGJZAnCdDKDzNh3Nvw5kHAJiXSwSi9IS5YaBLqA0jcoq51UF7kB4i8IBbl1LKB
         B6slcaF9wyIh000bPdU5sL8iSJvlxSBp6t0QlPZdUIzwnqvgU2i5m+2ZlifHrfOW7AQQ
         vqXwto4IKeK+dh8WSf40Cjmuhrs9Z9O5w983dr12aCediJCp5xVYV2/OPmWcsTl4kAKA
         +Zpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553132; x=1796157932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        b=fWkfI7g7PrLQ7bt+0UAil+Zy7J/2gPJX50pDHayXK+EpqLlR20gEcua4dazCanX3T5
         E53HaM4usZB+CE/EUBt9WWedRTs2GcLHHZMNdI9HL+DQWjWIvORceM10ZdjtTOKgBdL6
         aJMzVftA/pPwii3PvCGJApDKR1SH7WIDniYyN/fnUEkj9dyewvH9yCmNioPAwUhpdzIh
         hPaq2LbyV86n5UydtCwC0x2FWZIn2eZHLO4E1bGxrFsWWM8scZG0+Hh28SugR8pD9uh4
         98xRtzbCiLQjlnMY7czZmvRaYZUmtvYPyalncM69vRhfNSfPjPAVyEUYLYPyxyOx3xpZ
         PRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553132; x=1796157932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        b=zAclzBPkl55++V9w8aOcpFjnXsRdcG/1qKLN0Ue3ix5m9WVg7o91aAW96qOIiSMjzH
         5k6J9C0J4qnzdwQoiSTBttgYs3DXOyThys1zuruwNMHbLPEnHbqXwb/LJFNgJAn+jX0I
         5PnoYHK4zCFDkRzz/cYeVfk+yX14bawN4RhsFx6qGEzp2HoHvTXfacSzAQDxfp51gTzb
         7JrNND8Vz1AOGnsF0fpiIkstUKmCb4i5iP3GHFDHnlswbH2+7DDuBUEFFHjB5FlE8sUI
         6saudbpUX0Lo8EE6gt6m1Ip+RIBF+tNqXoBsZq3B6GHKnBGx6jLlm4wkuWEx6cZBT3ig
         9orw==
X-Forwarded-Encrypted: i=1; AL+hErFH7E703tt+cwoIsGrTJ5X5wFxayGrfz5RrMsaYd9mibfivBg3xDQnm7nab0QOcaFEUc4Sd080XKlZBROQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P/pRwEO3SP5IGqPeq6WH8kqr2C7kaXbK6eFWpdUEUxE+vIrLY
	HA+C5rPugz44DKfNPMUbBYAikbomaZTE1eJnNiQT3bDTyZWwKh7soY2BaFcZo3zL6P9Pulq0HKv
	HG06E6Obidm5fD8f+RfakMcmNbJn4aIM=
X-Gm-Gg: AZFdTZfA/z3fuNVByqJU+As5PivX/33tQ9D1kNmQr5Vheb8w+kEyqRzWk/7ALBQ4yFX
	82BgCEeLEmyfe0CohlUm9sf5kkl6lOj5Og15Ov45tAfSLYxNKZS+5y9JFVWx+6NC/04UMASnXvf
	09fuyGJ6rc9HTXTCbSh3duzMsnAMBQEu6MXfeTtxZKC/CyM/HeL6imXs3EutsKagoJ/i+ngshfQ
	UH+0M/exQKHl/Z0cO8lL9rOYvHXK6Dx62nBlcVa3QKD/Amhm9whtaiPZfC4Psy0/IY0kMrvhcdo
	tbiswj5s/AHgDgVG+68/o2XKakkCPWdHMFPsdLKgbEkY6UCYAOZLO82GCvod5onQq1PMqejz9KP
	4WgbplF0p4I7M+H83IXk207Byg6dhXTt2a6WSqNYEBmlfVrjKtW3P9MQF9QBHlRae0rK6xLS69H
	FA1Pyonof1PTvsrWHr
X-Received: by 2002:a05:690c:799:b0:8b4:d584:6165 with SMTP id
 00721157ae682-8b52043ff55mr69264227b3.21.1795553131511; Tue, 24 Nov 2026
 12:45:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-2-tanure@linux.com>
In-Reply-To: <20261121213102.143130-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:45:20 +0100
X-Gm-Features: Aa3M54pybnp1CQPsafQYDf0P2DptibC917JzUwMw-x18aat2wfvVMhiMsv1rR3s
Message-ID: <CAFBinCDPGYpR6rmtJvN5pT1OdSN-ne=YJVeT0kk4Ff2SB2vraA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the
 T7 compatible
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The T7 has the same management bus multiplexer as the G12A, in front
> of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
> But a device tree that names only the G12A string leaves no way to
> tell the two apart later: if a difference between the two blocks
> turns up, every T7 board would have to change its compatible to get
> the fix.
>
> Give the T7 a compatible of its own with the G12A one as fallback, so
> the existing driver keeps binding and a T7-specific match can be added
> without touching the boards.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
