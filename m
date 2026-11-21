Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296391;
	b=Rhcnv72d/I+Ik/mUn7Yw64kFsqBEdqV0eFPZvl6McqLFLWizPu3uQx6boC83QcdT9mEt
	 HoLohJsbH8d4FJ8IcXvaHpjwSrVt0VWA/zh4kPb3gmA1fvjtxM3EvksUGKYfXEgyMKTpB
	 I0fOZMgXlUoQKb1RnL4J9W1TxPupkQkMkJvfqOaIRUCypLAIbnFsjqFq/PYiUCCXjrw0r
	 YXj7Y/ugzIk4NdFxZtSyko9huKCEa+4AThuOAwzepJjeGdP1d188prjtp9f6dJkJA9z7E
	 QoKoY2mGOp4lrdH7LoLDk57VAVS7dEFzEOsiDMzKaTDK1FsWLYP0RWcxEa1Qv3WhGhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296391;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lxD5zixKw7Tr1W31Lc/kVqjisXnCxr4/jEW2jAJqxqY=;
	b=fyysBzovlSsJau8OwnRrrZMZYCVESzj332hmXOIp5dxtq+vGuZ/dzKjxLMRE/4Q9Hxze
	 mF6TcP+0dxxnvGgYbAoD4iM/KVB9+eo80YYTLgleS560SoZz2PM3Ph02GGCFqI8+Ke4/X
	 m1JglGxcskCc5UTNBxVNLzOlRW3BsPeEY9no+fo4O+ZrrnETIWiu1H544/IfEDtS/lvDc
	 TfR9U9Xn8Jwosn+IzqLf5S1Dx/cCvRCzc5oVnH3AKHYfS4cSEmRUOMu4HnPbv6rOR04Vo
	 2+TlFpR6fqi8WVHJK289h827TcGtC2jj3ksTQwskSir5m7MYf7BlgUAgYpTqw8x1E1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428C5606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428C5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67da3d03263so2187399d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296390; x=1795901190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxD5zixKw7Tr1W31Lc/kVqjisXnCxr4/jEW2jAJqxqY=;
        b=1T0UP9rmKRPMH0ff8fdSHWl7S9l6p/kZAZGdAz9dzd3IujRQyWjOh4dMm06V7Qck2V
         xCqdWYPuIVOE1rM5VEgxV6BDOUSQS5lOWi3smwLPYGxDXseLpfu5Dknw7F4SHUkjfive
         iEhay4FC92GAf40oIZu43qYdvOx7IPB8zPWZnQ/OPBYSEqjbNmaKJBvhehdY+xOUMJQw
         jIXtk6xA8XTspU9rL9/iuM7kaMAlPzBdwRZq05+mKKn6cuodr2KHoiiQe4K8QHi17KmR
         gPtZVWB1opU9s0h3L9AIQL5bywenvZ5iBifpxvtmRAuwhXhZQgjObKW1ogs+FgUR1BGe
         swug==
X-Forwarded-Encrypted: i=1; AL+hErGho9IzipAz8pMeUWTAyXEra9CrGDIHmj0o1dI7VITffl7iCIhwkKXkE3H5ueb2loYPGNvY5oHgw2+TJYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zUEfWOdMdsH+tLcPKpD9lHPNYlp2Z+CkZJ4IIWe6vHgr34XAJ
	RTsylAD4CQYPspPaKJlLEGzSUySN9D0qyT92u5VWRuY0nNXVLQz6d+gFfuYzLhPq
X-Gm-Gg: AZFdTZcFr5J1IFdNOjWFGwAGQxaG8wX2Y0EKi8DKWEJflx8DRnGqc3TvjHmJ25ajvks
	frReIpYji4AGYHVCJqK1vhrqJ6lZJmTxFN/qnDc/3CPOXX/ztV9+o2kuZZQCNIeDxwlkL+P9xi8
	vEi6CW/ITwJDgDZDM1oFdN6IMwky4gBHrEe+X1Gt9RB6ipvylTEsBj7OZzHnYN/D7Vo+ZgWlIsl
	VfeDVj9PcwSy41ePQbFhrYFciYnhdKtliAVx6yNmXfLuE8rUbS/cDo+epnrZ+22Ws8PAIwrBnM0
	LPdLNG8y783srVq7vIqECPMgkm1O/3LEDyKyolCcm6K4dHGvxt2uE10ZMqQXptBstfpfeZvXZ2V
	1QgAxgU0r6K9GkhllAHEkXmL8DrvBihZZ5KDqRwjmHviqR/Y+dShksr3CNEMXvqBWHf1CiyXPz9
	7ff97aXJDwiHJ6h0vKyBmYfJj+/AmpRZw3yCeJXAurwhn5eQNdVEsjYZPoKEubNi72Ybn0emfa9
	mQadIC6U4dC+L+zJgeEUcLM2R6OkHN6kxW+UlaHeATb20/9edYYF8KfShYiHlw3GhhYZwD6H0hb
	YF7i3abm+uhCacvTH2Q3lm7aUFngLbOBWEk0dqKP1g7AzZujUVBOqhshdQ9ArkGXd6tCB5x7PPI
	ndf77UXgjIJkAGyozDmO0t3FVwS1ZRf0ZoE6a9OFVsaLVNN2RhF2JRGz/Ww==
X-Received: by 2002:a05:690e:1385:b0:67c:18:cc98 with SMTP id 956f58d0204a3-67df44b0b01mr2406639d50.134.1795296390274;
        Sat, 21 Nov 2026 13:26:30 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df330d552sm3404418d50.5.2026.11.21.13.26.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:26:29 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b335ef6441so13911157b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:26:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEgW5Ma82W3sIRAZ990sIff6Dcv/OFeSIQAGpUUht84DKIknwHnzSvxcNH9iDIpVMjGeSFyLO45cu8gwoI=@vger.kernel.org
X-Received: by 2002:a05:690c:7206:b0:8b4:e51a:c4f9 with SMTP id
 00721157ae682-8b52032b68dmr26349417b3.1.1795296389589; Sat, 21 Nov 2026
 13:26:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-8-tanure@linux.com>
 <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
In-Reply-To: <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 21 Nov 2026 21:26:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3X8BGwj5ydk2TN3tDNLrrhgfKx1X1LQqjePYXJwqs5LA@mail.gmail.com>
X-Gm-Features: Aa3M54ryC1wrMtzkfpXZSCYbt8X4yrGmEQflHHmQnHyfNLikt3muwFhwFJm0PEo
Message-ID: <CAJX_Q+3X8BGwj5ydk2TN3tDNLrrhgfKx1X1LQqjePYXJwqs5LA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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

On Sun, Nov 15, 2026 at 6:08=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Lucas,
>
> On Fri, Nov 13, 2026 at 1:19=E2=80=AFPM Lucas Tanure <tanure@linux.com> w=
rote:
> [...]
> > +&ext_mdio {
> > +       external_phy: ethernet-phy@0 {
> > +               /* Realtek RTL8211FD-CG */
> > +               reg =3D <0>;
> We've been following this for a long time until someone found out that
> RTL8211F has a broadcast feature.
> Can you check the strapping registers (or simply see if the PHY
> answers on address 1 as well)?

Checked both. The schematic (v13a, page 9) straps PHYAD[2:0] to 001:
RXCTL/PHYAD2 and RXCLK/PHYAD1 have 4.7K to GND, RXD3/PHYAD0 has 4.7K
to EVDDIO. So the PHY sits at address 1.

A scan from the running kernel agrees. It reads PHY ID registers 2
and 3 at all 32 addresses through SIOCGMIIREG, which goes through the
mux to the external bus:

  addr  0: 0x001c 0xc916
  addr  1: 0x001c 0xc916
  addr  2..31: 0xffff 0xffff

Address 1 is the strap. Address 0 is the RTL8211F broadcast address
(PHYAD0_EN in PHYCR1, on after reset). The vendor tree uses 0 and
only works because of that.

> I'd appreciate it if you could update this patch so we can use this
> approach as reference from now on.

v8 uses reg =3D <1>. The PHY attaches as mdio_mux-0.0:01, link at
1Gbps/Full, 941/944Mbit/s with iperf3, no error. The commit message
says where the address comes from and why 0 also worked.

Thanks,
Lucas

>
>
> Best regards,
> Martin
>
>
> [0] https://lore.kernel.org/all/bc8c7c6a-5d5f-4f7c-a1e2-e10a6a82d50e@lunn=
.ch/
