Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795554890;
	b=ss+CVd52OYrMliV7pNu43y+kZPA/HemZd6+1w+f5c+aiwoLerW0DFFdP5agdCY5baXPG
	 ucPGCjsLA/l3Iqjaf9IQ0Ohf4/cLlorGi4FPHtjvZvD5JilmQuzLBS1aU+eEC4kowmpDk
	 pOqu8UYMdJXbdHUpYxCaXBi2uyhwM1vfk08IxIVLKiCEo4ylWUyHMt9FE7d4QGyUFL8PC
	 5OrstPa9rPjsjKIMwUQlbLAFsF8HK4lCgVy5EsAvXUupuBf5KNPtIIC0Kk0wrZcDYnnF+
	 ++zxvUg0LLgyplaTusNqrtWS3Byv8YSg/bNQ+4dza7C+K1R908sIwTcoBdhiBXaNN7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
	b=qm/OCL4alck+dIi5KwhDqPwhYH3x2USDZNnTbrgFSbwRrAFJrSU2BsRLMtV4sZDP/ljp
	 BzwBin+ATLGDL3pJvDjp1bNNQh1xgiCzYP1ZISd7cymCVQ+qEwJl8M4iJSj+Bw6qUxcS2
	 K7OQqOoEgBT6HlIAa+bEn6B/70g/77MR+7VgqEYV/r9ZVuqBY+WRisHkOYwtamEE6Nggi
	 FnO3q4gYDTcjrnlSiVyU4wykyNNToPoKK50ioE9D5yjhdJie9wOWfQfvmNL3vaQAMzKAp
	 pzhBLkXrMc4hO54JrT7OTKUzPeEjeOxnMHUhXRBlrA0Kp4sRYF0iWu6HKMIwP3Tw6DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=IWBxgdqF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F66B606A338
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F66B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=IWBxgdqF
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67db23d8892so5533621d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795554889; cv=none;
        d=google.com; s=arc-20260327;
        b=SLRoJiJHdD8mniG82TBgmpYKSe1ef1IaM6pOake3zdU544s+pTnLlArK4+o0wv9l83
         2pu+yGWnOQ4BBxeWmXyun3KtsLZ9EPffNQA5zroQmZYBvulcZYCsaHXBCXJE/u1YQBgK
         sz4TQRc14ejscDhsQOhVedq25+kKGJnOug7gwXEJSAp6/a/wgT4wQI0GpPcc9Id5hfhx
         vsajB8DXwT9TUiktS6RfVqObEL0CzBBIHs7tmfgSDYf/Ox6+XEzZOHalEXkdcZVnJ3a7
         7vlb1kPkGcD9sG+6v08iSnFaTo4FQ6udFZQxNwc2dB1vzcB5gGNJ0Lsgyf9iZHS9+P8M
         C10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        fh=H6Hq1Ib3xrw0au0lw7RJTXDbckJ4/xdoo751/iEsm7I=;
        b=Jm2L/r5OaV+4ydgpugYwXwE4+d2Zja7k//28BUuarhrIG4ipo2YRwHS5IxkMTbAqzX
         HXupf3Dxn1yOoAtg/HFvnEH3M8P+n3JvtN5zI7yKoDFTxzLpOZqWG8Lz7Axf6VlHnGVU
         X0AwL/E/ZtZu+QACk560Mwl1nljb2UKqnWV8p3uBPSmXcyz+DU2fqNZNVqYwLV7nCeeB
         BrEbPkscUyUQ0F76N1polzgx3W6kokfVh85e5HxcAT4Zie6FdpuN+Uvrmia+Ev+ZK/Ak
         uBISOPk4FJvdg2foFEoLfcS3osucw2mrXaZIVkAbVgyYwlGvZmhRfMy0v1kky1l1dHkc
         5DQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795554889; x=1796159689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        b=IWBxgdqFp2x9XfPCnso0A2FH/xCUErU25ylGd9luJVJO+mW9jwjDcUc6j56Jo7eMZn
         UjDsGcxdVnO+JPKHL86/tNrDP03a9uOsvyZWaE09Ja/x4zZcuAJZBx6g1lS521mwQm1u
         1t1xtyQ5Xc/UIv2Iwa35nCEWMfwoQOZ6v93+xvRe7lQgBGjqkjpkS3QMmJFMP0J1KUt6
         U3jD4FvtgG1wLixarS6ha+vluA8fPBD8j9xI93MGiiJw3J/1B06xQFmp6aKwiJ3g3wHT
         VDaJ8YFqJ0riQg7jkTA3zaSONIcRhkwO0GSFsrd1WFKF1j/sGlGYViwaJL3wGcoyle0W
         01+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554889; x=1796159689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        b=atWFCgt8XwyFD/pQXjUPcijUhvWUCpXanX9bpj7LdkjV6xOA09gJnvXRkdb8QyrST4
         KybUfTi+E8BMjmZJEGpQqF6SVqS+x5f5B33R1NDEUipmCgOUUmgP1umfgCMDs1Lj+TC0
         ooXptHkF7ava8ivTECkQ49aaSnRuUWOmjVMgqTozSu/7sHZ4JRNIjuPjrTNvVWAiyPrk
         ntf5YTkA30SuRSdRTk9wDufhG5bHookUc8GtOYSDmtuO/G0u5cgZ8WYUy2tK8iA+Nfvo
         xvN+B4LyYiLusyMEta7D9h7MD0H1BRryVwyL3J4/dIMsdx0eT138ONwks8ORtoZYy9pX
         ze4w==
X-Forwarded-Encrypted: i=1; AL+hErExmQgk2zAJT3Yak5EiCkZCpcynhENF3oCU2C0kNjGwz0Dwq+CnbLh7zv3GzIe6vbelDVadIxLnh3b7j/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YL8xvcOC8r/whNSkWBoIbxh61LhqGtlWNm2rYYyq00sQlKJtD
	2JKEZK33yt/BxDXf2pkegAvE7fYa3JJGGflw51iP5klxn+Pifft/jn/SSzqM5YdZkG60ul8O8XR
	dfSgBhZN937THDDD7/HDYBlECXiv7+IE=
X-Gm-Gg: AZFdTZe1KwarG6MgrhD51FrIA+SRWcSD622noh/vqBWIn7T2ywX32Ucai4VpdgZZCH2
	4OKH7ZwKAQd3b4yZbAMx3S9n9rkkmW2alhbaggu/Y8p4X13bIYtR+mT0Gg2xb3t9vH+jhdIOAI0
	mSTFwSVc+m71VJB6NA//UXMBiqvLrKXwSudmbRtI+NOtWyYV9qvKnYhtfMwrELSo8KoPDZ4l7WU
	zBvPGJ5WF+YduHiqoPWno+LPpG2fo3n1lPQKFmNwmFN8mWWpa92nheiyRUhrEJdR73nKVS4F/EI
	7tvi141v5IIgPqwRamXljgf5mKt9VM6SGZiLTSNkOXbMRVoJp4buZFfPwOcqlTbarLcmRAfCzTs
	wJCuY1kwgoyNZCxsdesWFS4Nf2/jRWUHc6IL66cBDU4HoC6dnt3fwPpglyw5v4kr56OfAAA==
X-Received: by 2002:a05:690e:4090:b0:67d:a5bf:ac89 with SMTP id
 956f58d0204a3-67df42b4d7dmr8236792d50.10.1795554889394; Tue, 24 Nov 2026
 13:14:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com> <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
 <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
In-Reply-To: <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:14:38 +0100
X-Gm-Features: Aa3M54rEVwCpdz6_8gjaGQEhKA7ZqL-_05evb2pOjFxPbafFazCrzB2je-Od50w
Message-ID: <CAFBinCCd==1Vf7jMCHP0VuWTNa7A5FvRfPYdk2zUaZ8eR54Z+A@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Valerio Setti <vsetti@baylibre.com>, xianwei.zhao@amlogic.com
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valerio,

+Cc Xianwei Zhao, I would appreciate it if you could take some time to
help us clarify the questions below (or refer us to a colleague).

On Mon, Nov 16, 2026 at 11:24=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Hi Martin
>
>  >> +properties:
>  >> +  compatible:
>  >> +    oneOf:
>  >> +      - const: amlogic,gxbb-audin
>  >> +      - items:
>  >> +          - const: amlogic,gxl-audin
>  >> +          - const: amlogic,gxbb-audin
>  >  From what I can tell it's even amlogic,meson8-audin compatible.
>  > Although I didn't have the time to test in on hardware yet.
>  >
>
> Thanks for catching it!
> Any testing is more than welcome. I don't have that board at home and,
> based on my quick search, it seems not super easy to find one these days.
>
>  > [...]
>  >> +    audio-controller@a000 {
>  >> +      compatible =3D "amlogic,gxbb-audin";
>  >> +      reg =3D <0xa000 0x148>;
>  > I believe the audin registers are 0x300 wide.
>  > Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
>  > that the register area is 0x100 wide.
>  > The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
>  > =3D 0xb8. The datasheet [0] (page 395) lists register numbers divided =
by
>  > 4, so to get the actual address in the memory map we need to multiply
>  > it by 4, which gives 0x2e0.
>  > The 32-bit SoC vendor kernel [2] has a header that states: #define
>  > AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
>  > by 4).
>
> I know that the register layout in these SoC is a bit messy, so let me
> explain how I got to the 0x148 that I wrote above.
>
> When working at this driver I used the S095 and S905X manuals that I
> found online, but based on the link you shared for the S912, I would say
> it's the same when it comes to AUDIN.
>
> Using [0] as reference, the highest register being mentioned in the
> AUDIN chapter is AUD_RESAMPLE_STATUS whose offset is 0x304 (i.e. 0xc1 *
> 4). However I noticed that before that there are a lot of registers
> whose name doesn't start with AUDIN_, but rather with AUDOUT_, PCMOUT_,
> PCMIN_.
> The first contiguous block of AUDIN_ stops at AUDIN_FIFO_INT which is
> 0x148 (=3D 0x52 * 4). The other AUDIN_ block you mentioned is between
> AUDIN_FIFO0_PIO_STS (at 0x2c0) and AUDIN_FIFO2_PIO_RDH (at 0x2e0).
Your approach is logical. And I have no way of proving my theory.
So the question for someone with access to better documentation or the
actual hardware description is:
- how big is the AUDIN IP block register space?
- what inputs are routed to the AUDIN IP block that neither Valerio
nor I identified so far (one reset line, one clock input, one
interrupt)?

>  > I'm bringing this up because dt-bindings are supposed to be complete.
>  > So even if the driver doesn't use a resource yet we're supposed to
>  > still describe it.
>
> I perfectly agree with this, but at the same time I thought that
> including registers which potentially do not belong to AUDIN was
> dangerous in the other direction, i.e. we cover a too large area that
> will be hard to use in the future if/when we want to use it and we
> realize it's really not part of AUDIN.
My concern is actually that the AUDIN hardware block spans 0x300 (or
close to it) and we'll find out later that there's a bit that we need
to toggle which is outside of the 0x148 area covered already.
Even worse: what if we put another register area after AUDIN and then
find out that this theoretical bit sits in the second register area.


Best regards,
Martin
