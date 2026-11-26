Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725242;
	b=Tj1LdWCKk0rnXs4pK1uPXqYO/RzwFMOhaLxL+6/SjbIdRcqpQEKLq6t3ShhnGD/6agfb
	 jbM1py2D0Khw1ERulNoy4/k4Xb78ClriFIVCcGgsnkhfEmfK5xOk4/DE3gx1P7hZEhyU5
	 9LS4hC9pQuaiarQXKk5z/m7KZ1SbBlpGcc7/P9ehmqYGx+dPamXMPkJIrEAPUL68PMB+h
	 tGQhOFJF+h5q994u6s5Pg3LQHrlFRfAOfJyHpQVXe7OzwW+5sjJGsNpodaatiy7ncvIDt
	 g8qmylAqaikWnF9gOetolZ//mDFATbNu6oSC8blyV3j6G1k2EvocCPVrEDCs+55KUSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
	b=uw4L3SdjI5rnEUoTjutjDNT9UGTdKN4HP9d2QAqmSg9Y4IX2PEMks3grjb5HQCfNCwAD
	 2LRqjcH3d1ZXS5tkV2vZdVonZWiIQ5C3p7ks9kpR/cQ+/rOmTyIqTcNs8a6liHAuwUXmU
	 licKOoWmGzzDHe7VvmWynJIqRxlu3M4ede4J3D+7MgAxND6/XCUIc3WRy+Inp7rVVcPSL
	 sCgZ05whba2qSUOn3SKHzmuSFLWbpO9Ofqc0jmxqOzPcLBExgqTFqs3bjqRTRNTvS83IX
	 hwMHcAUsvOydHiksXRXwO3DTBwwWIOIoX4vkqN0nLhXc4KOKQ2t+9JCsas52/tqJZ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fz3HcMez;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA15606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA15606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fz3HcMez
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-847ac7ccd85so4171984a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725241; x=1796330041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
        b=fz3HcMezGU86xcQBiXAtOQzCmQrdU+nIxnG+Xrqwv4M/D/HCecflXsaHJKFxSLds4G
         A6PKNB1YV200bUo3FtONGIid22PLKAI9AhlA1DweyLX539FRMqybOpNFd9f/hRRvBPrY
         wLdcq7eI7bnyzDQxsftrF9QGG76bNdmjkPYX+43De9adVNwffe0xps3ayGtqwQ4eaq5e
         vPiLS6l2rQUDmTNswPh6xGEcxIJn/PVAlnhpT5BjDE0T459fE+e/ujIN4L4jp+wzQDKm
         yu0NmQqnv9AFO3VdakCzqT0pCdRWkrrKTMfhfNilnbFdjuh+152dPAXBOE3IMjJmgis7
         HnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725241; x=1796330041;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
        b=leFF679KiyrbNLpRGI+8PgWJzwlI4lUulKTYpQONbuP3E8IHbhH4YNCqz9iNl+6B+y
         Wmu+keYUE0+G8/7GL4YJKzdDXtBWS+dtjBgqTdxArMr3oVh1/+DPPZecZ895JKh0m/dF
         cZBGJoG9QNMvvxlVBkS27OFU+yYyb9Wojhe9YiMOb5LONJ3qkboIBInga0Z4HMnCG8Dn
         5OPjqm+kB7xDLCUdSrZZeTC4ZW7ktFDD3UauF7BsDRWXnLuHKdiSgdrN6kg0Xj4TA1Uo
         r/G7fsRo23dOTFaXgmh4WNTdjUClZ+OSQOTre2m5rTT4Jmd05/zN/hm03uLeBaYGx1KY
         UCxQ==
X-Forwarded-Encrypted: i=1; AL+hErHe75SXu8ePw2xqbmmMdN/Ufip9S0CyXZZvtmlrFzWM0Tqms9/FSC5Ayvw49h5sbPq3xZrrCWdSue1YFoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oHrJDB1cqba4dST8FoWcCbTNdCTp5CV1+2FRin0Bg+kgX62zf
	N8/6dKGxowEbb/FJtOh97kARzan06y7OHDk6LqPNzm65Y+V+1t0zc3zM
X-Gm-Gg: AZFdTZc1Yf3lLRCqdeBKQGtVlW78HchOA8sbsYirJBjrrWFEaG1OFMNzRGQyhq5ZJku
	jPmyNEpTINLJtNzZFw9sVJy2PX88MZf6PDqPSgfpI82db1XH5BNBl2vq/EfjxwEOHIt8atF9gvU
	JH/kckKrvKNsMhHl3sg2JibzgmUlNn4YlFB8xkAE8bn+u9xxxGYyXMkQjADS0+MulBgVWAIhE8d
	TpZpaFsuq3P7VQm6XaM7s5P/iCOckPN2Qa3jcx0nB7EWcx+aPRzeLdNW0V5ul5HglMQsmRBPKPD
	1tl+JZs9KH9qlSGqEF84FecnPfWFPJUUq9K1ic75/VV2C+EDlEQTEq4RM73unqDnJOBLPkQJNZM
	Mp4pFED8NCIbz8IJnwIlHb+9D1/sDqblkUEFI3HxKRXELvXhajxQipMBiH3ZKAW7LmH9eBiB58k
	AiV62gy9p3rJQOShQph2g1MmmU8lakVJ+ktIc+xh/zO0+ep/ZBJF8lB9wGszLvcYt8Iv0a8p0gU
	tqWlYNQw30NXl5HDPjgy+2OyB1kvqJyQlMWVsLjIn0JCkKgXQXKnetTQGhzeeiIu230z7ctuAq5
	rNglf9U5V3syj/+5xMNN2IzZaaUXlYjDRkvZqLEA53h0KXi8LgcZu3EZyehgsg/ugXmw38B36g5
	I5sgCx+I=
X-Received: by 2002:a05:6830:438f:b0:862:aa2b:eae4 with SMTP id 46e09a7af769-863159e9bd9mr23567439a34.24.1795725241022;
        Thu, 26 Nov 2026 12:34:01 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692f049sm16133926a34.25.2026.11.26.12.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:34:00 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: wens@kernel.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
Subject: Re: [PATCH v5 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Thu, 26 Nov 2026 15:33:58 -0500
Message-ID: <20261125-a733-03-board@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAGb2v64p4GvDMDKzDLfedDQCexD+=gu3+YxMAt=ARj4bZxR_eA@mail.gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-3@gmail.com> <CAGb2v64p4GvDMDKzDLfedDQCexD+=gu3+YxMAt=ARj4bZxR_eA@mail.gmail.com>
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

> "PS" is a separate output from the PMIC's "PS" pins. It is fed from
> the "DCIN" pins and has some internal resistance and a zener diode (if
> the block diagram is to be believed) for some poor regulation. In
> practice I would expect at least a little bit of voltage drop here.

Sheet 4 shows VCC5V0_SYS feeding DCIN. PS feeds the buck inputs and
UP11. I've described the two nets separately and used LDO2V5-INPUT for
the downstream rail. I've also renamed the oscillator, reordered the
regulators and removed cap-sdio-irq and the blank lines before status.

> > +       cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
> Please actually test this.

On a Cubie A7S with the posted v5 DTB and Vinicius's EINT-mux fix,
MMC0 reported four-bit SD high-speed at 50 MHz and 3.3 V. One read of
the first 16 MiB matched the vendor kernel's SHA-256. The mismatch on
the earlier 4 MiB read at offset 16 MiB is still unexplained. The
EINT-mux fix is now in pinctrl fixes as a256b8c8083e [1].

On his A7S with v5, Norman verified that PF6 reports the card present,
MMC write/readback matches, EEPROM reads work, both LEDs switch visibly,
and warm reboot and power-off work [3]. The v6 cover lists A7S card
hotplug, EEPROM writes and write protection, and 1.8 V SD signalling as
untested. The v6 DTBs have yet to run on hardware.

> > +                       reg_dcdc9: dcdc9 {
> Missing voltage range.

DCDC9 reads back 1.240 V on A7S. Vinicius cites a 1.2 V ELDOIN minimum
from the AXP318W datasheet draft [2]. I've used 1.240 V for both bounds.

> > +                       reg_eldo1: eldo1 {
> Missing voltage range.

For ELDO1, schematic sheets 4-5 label LPDDR5 VDD2L as 0.9 V. The
regulator reports 1.075 V after firmware DRAM training on the A7S.
Do you have a validated VDD2L range for this memory, or would you
prefer to preserve the firmware setting until the range is confirmed?

I'll wait for the AXP318W series before asking you to take the board.

[1] https://lore.kernel.org/r/CAD++jL=xA7eZUeb30xOnCZ8uRy0UE7q8h=8AA4p-tmiBf3Sb9g@mail.gmail.com
[2] https://lore.kernel.org/r/nh-1384c024-38de-4962-9d4f-a0bfb55471a6@google.com
[3] https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me

Thanks,
Enzo
