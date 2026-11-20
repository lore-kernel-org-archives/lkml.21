Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181014;
	b=sz1c2bF1lKe3ejinf3/HIqG8IE3KGhia0XAAimEk/xALJojNdAL4VkctmHmsBw6laZ/0
	 D52dtSNJjn1D4Cj7/yz4LA1WEMOfVOWTP1UpPPqdicQFqBPj21hpWYzKbpfcs5Qwahsnb
	 dZuzgtbQCWq5xTP3WJ3kA0OWM1Sl/UX+7XhN1bCcgq1+eGTXwbsF3gh1fw3tq3V1Zd9zz
	 f82gHYX09BttALTtDUJZFD6o3yh9fKKG4izIlf2RwkL1v4xFvh2EBuwV2oZjmLgY6OF4E
	 zang6m6fmVH2lE2uOzyVSs1ojj9+3rh33dbGHJ8Ns7VB0ZU3JkjAXz8xOFwfW8QH0fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181014;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=THZx2uVqsnNjN7chBboOD7x6p/ktvYcyg9pppHAmV9s=;
	b=zHWsTMPC+xbCnr8TRMYod8bi2t/ZfEBJUhOF+vSsS/9nLQh+H59aLERTbLza/Z31TiUw
	 K8sDur/DQw+lZOvByNhu56rPxfPxMUeId+RrPL0+3FARmpLn5yt2eoGzKDVwtEW6AeHfq
	 nbQppyKzbP0uVi8vZUA3kpTA/uzbjn5lloMuuvlYw3sBo7JSLC6fJ1QeCdZKgKX+ytZO/
	 sL1cUp6UHbsSgv0ghIUKqQPacoD2rsN745qmRSd5ilEQfIBCFzkgLJNe6FpjnXDwV1qdN
	 VAh/VhyotWZJYH6jf+zGzeG1S5bfGt8AEs1Bm6xQ3HB2lgb70y74hvFCabJcEwHCQyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DD660A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21DD660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso494545137.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181013; x=1795785813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=THZx2uVqsnNjN7chBboOD7x6p/ktvYcyg9pppHAmV9s=;
        b=x+VpqkIMrawb3ufKXgt6ZhRjCQJzxWE08isHWJ//54K+tlziMW7H3kxlIfFs+o+ZT5
         ojKpdW+CQzXWDTfSqDNh9tbSqt0ptairJfB++H+dVfQZYRJ0Kdsf1xzFooLnnLDZyFpR
         nniLgZrJiQyR05db34G29+KZXseIXDekwB+BX0YEXQKfGRnJEOsF3abc3PKvRgdrivC/
         Y6SNG74p9ibYkihoo48ywE43F+sBRxb9G3uat4SG1YGmjgBEugcJR/yPu5uJfJba+t1m
         aKluJLB2yzt01lNXKVax4Y46yAyqKxZxoxJnq4eme/tBoK0ad1vLgPzOtPaLnufHn2fg
         Tspw==
X-Forwarded-Encrypted: i=1; AL+hErFg0vsZRNV3PTmvjmO8MpyiCCYJBLKyDafUjq5OsbTgoJ7W/LyN2D7C0cmzG+68V4SUQZkC3B5CaF559Jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E2L7ihcs6tHlUFT8883QWV1SxWiFakiTgFKzfOyo5eYfxI6k6
	Awf2i9Xy0175kws9MhPMAFnDM7Vh7bmSvOVp2saEcS1qBK3BRQvUwgDi3Qe0a8xW
X-Gm-Gg: AZFdTZen4aVhUSlteK2jvDrKs0nJ507u8NDrILf9PPZgBTIA3hQQp8K+ihgx2aqZBM/
	79EWHK7xOHOnqLZy6f7Yddx8erIHoBIw0whBIZdVaL5JejgL/Pvvn18hxEvd1PreQ19NVt2np4O
	+8G0sL3NmsTfO045dn8s3+hwrSCMGcla85AQbdx4nfl/aXjnWhxgoX2uFry2Krwc8eVIKJJ1tWf
	/gCQckczHhcIrXMbKtTPRnr8OC7m+XbtA5NTKWUn7QgepW/WSNjax2kf8Uopbtau60F/5Ukz4Ur
	TYhGufWnN1TEnbw14cIiUms5Hfn9In2SK21uc7bx7/isfwfZsqniTYiibqJT+T7D3VR7+nbnFzs
	t52BFyLR1cwvCazFf7wO+6H4r4LRxyhwNejHrq3MsaZDymlYbPY7HGeM//4v4tSTWEEvTtpc9SO
	wRTXue8mZ5aDjpr/O0XvySNCJLEZz9FhnvbbHls1nD/7PvH7v5oBEMMACW+iTYpqlz28SoKBgm3
	t10HjaUpAMoE8Iayl6qEroorW3qB++kXcmPBuFyupMfnZTD7GoatbdIEhCGJ1avmQH0cVHY+0D2
	RtV2XTx2HZdtJHEsXAzGyE0a5jzvHoWhj5r1R4TiYUGrchHwOmrlqp4duZN52had1Gs=
X-Received: by 2002:a05:6102:4245:b0:7ce:62a0:6a14 with SMTP id ada2fe7eead31-7d7393908e2mr1275877137.9.1795181013044;
        Fri, 20 Nov 2026 05:23:33 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a29csm2873867241.5.2026.11.20.05.23.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:23:32 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so544266241.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:23:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFnstaGtSNrkJTmdQwJAZ7rqKZKetg6C/PLEyQKGk3RCGjOEKlvQWV2JRTtI6hnHRqCehRpZNh6OCgv8Zo=@vger.kernel.org
X-Received: by 2002:a05:6102:6489:20b0:7cc:9a7:7b83 with SMTP id
 ada2fe7eead31-7d7393ff595mr1025562137.15.1795181012215; Fri, 20 Nov 2026
 05:23:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com> <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
 <TYYPR01MB660300EF63BBCDA82272C45C86782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB660300EF63BBCDA82272C45C86782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:23:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+Ny-0ehq=hCK--OM+5gzpf8+gNnbtHVr_Kxc9c5kYWQ@mail.gmail.com>
X-Gm-Features: Aa3M54qdna0I3eJOyWfJ3w7gw8KDkW8vBh5kvgBGjyn7BKPR4dhZV7bkK-pEADw
Message-ID: <CAMuHMdX+Ny-0ehq=hCK--OM+5gzpf8+gNnbtHVr_Kxc9c5kYWQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 20 Nov 2026 at 14:22, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
> > > voltage regulator for voltage switching. SDHI2 signals are muxed with
> > > I2S0; the selection is controlled by the SW_SD2_EN macro in the board
> > > DTS, which must match the position of switch SYS.4 on the SoM. By
> > > default, I2S0 is enabled.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > > @@ -42,6 +42,7 @@ aliases {
> > >                 ethernet1 = &eth1;
> > >                 i2c0 = &i2c0;
> > >                 mmc0 = &sdhi0;
> > > +               mmc2 = &sdhi2;
> > >         };
> > >
> > >         memory@48000000 {
> > > @@ -355,6 +356,74 @@ sd0-data {
> > >                         power-source = <1800>;
> > >                 };
> > >         };
> > > +
> > > +       sdhi2_pins: sd2 {
> >
> > > +               sd2-pwen {
> > > +                       pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
> > > +               };
> > > +       };
> >
> > Just wondering: why do you use the internal voltage regulator for SD2  and GPIO hogs for SD0 and SD1?
>
> Just to give an example for the customer usage. Either use GPIO or internal regulator
> both are supported in driver.

OK. Please clarify in a comment.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
