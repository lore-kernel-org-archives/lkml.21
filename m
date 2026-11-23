Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455808;
	b=2Ez1eSLg7FBW/uqQo/rEOoTM50g/jbIIRPDzg/hAVa51uO2bBaDnaxrfqsN/Hp3erugJ
	 ZfSnjNn0DktxKvkqC7FDB5vIIpsrRNTtGnyPC8uH9a3lYxwrJFvBwp1fRcmZcbj0ZUOMq
	 EK8tAy6BB4IT5OYwq8qykYfbknEpa4eFH0tmMTKdBT8wvBCoRK8Jw7fN35yADEPfmtEuB
	 WFaeRNABwDIrPdw461hgw4k5knku3G3wHI3a9VdoyqNyL40l3WKY/7jiDep0SAKSXjLEk
	 0LupltetSoolL4qTbLAlIrJjtw2xYvK75o/UG7nUifUlhBAut9+hAcQO554d5Va5BeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=HH0N/fL/H1cdlXVfbRCf3zvBDKyd3qa4jIZxCvneNig=;
	b=lcK8BJuRp6d+TAfWaKEWiFkbjlUl1jdnYwBIjPbIXjFmPCy506OFEIc0R1AVJ36LB5PQ
	 oQNy4YB5drBA8nYON/DfMI0lxcLz3n5GLSXiaUAW2uFyeOGUS9YDr900bdubuJ4LoGxrn
	 +yfhoTOcG86oUNqHw+ET3QXHImQn5Nsjd10X1dOq7Z/pRjKckzgzBqV09L7Wd/XNlBt5k
	 7AZg6oayMALCWvHi9A9FsB6sPC8jSVqbdmm4Vb9cozb/XZd5OIW3hVVjBiC1c+SgdDHK4
	 cCQ7pfDsvBnZQXsf4Sa7MvW7O5cSDyOr2KLJnMO7Xi4CHajKXlxfxAnuRigZssHXXAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4fgG2MI;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FE7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FE7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4fgG2MI
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-86288992de5so2749307a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455807; x=1796060607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HH0N/fL/H1cdlXVfbRCf3zvBDKyd3qa4jIZxCvneNig=;
        b=U4fgG2MIDGLsQvJIPtDavY6Fo0rlWwsf9WWi03Pb2ofNUkuY6bs9WNl+s7NJasW7bs
         JkOQMBWIhnoNJOi0KsrUlseiMSnYmslE42v/0TBmWnG9SGPIPWsjbGR4S4A4TCwu4JuM
         BwX0/d0i5bQPdlWvk7P9k5nJh+Sz1D5b2gESJbtJHc1yur/sc7ttetVESD1ErsKE4n0W
         SVQ5WMjX+Lik4swn697mEZKl88JS6TkGOmvXCFNO6okUvJxJUzRwccJoo3FEeW3mPQcZ
         otsXDMo4S4ciTFWdJx/O4ZQMs2rQq8D/ZYrTb7JjTSsBI89mWdFR1qenK2uSkItVEyM3
         EeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455807; x=1796060607;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HH0N/fL/H1cdlXVfbRCf3zvBDKyd3qa4jIZxCvneNig=;
        b=iSgr1tV9v1rF3/27Zfw5l+gyshW6oXKl42tsN7OXzROyfvEiVosfmASEgFP5g1hCTC
         VX7+x4DChNj4FFbhT3r9jbDeaAIDhELsQBKARa+WRR4VU+o6rtOxOv+SuNksyeBdQNxB
         tlomkTQASro0mSf2vD0AN7wxVrpAAh8ja5QlGaKM/FbLJkAszMVHC0QoIoenKBvoiWaC
         Iu0WUUqgK+YlcYLog+XVGxN3jK4kAsoWV9yVQM9G6ne56i02IMaekeVmreB/N2H94gcm
         3umaDItjSwndqXhlp++EDZv1C5aJI/dTtpLicU+zZte+X+gy20dyxSy7pOzbWP1sabJU
         VUeg==
X-Forwarded-Encrypted: i=1; AL+hErFghhPuhX33V0Xek26/A+M2HhqKUmIKfBujc9/B70CygeJOqLahJA8VCiLs1rXB02iHahxzSnH0dr28g0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3FoTUecB3zvocDqCUdzeSNBcV84dOcE3t5HKoyVdYzLqMyOCQ
	niwbvErzoTtQy8mE925iCbGr8vf2jFld4gWeik/kLPRCW8zQmnyOBdUX
X-Gm-Gg: AZFdTZcYxkHAAYiOxrhQzF20gZQU6DO3nsZyJfGg8eufzSWVEOOwQvn+zMDWLjR+W5n
	zSFt0so4yjkXeI0plTnkpffC/Ow7fGwD30nyds3rpXK4JUjBp7D2m4sf+kbkprzpOSeqMRjwLwM
	Ot1bLY1p7ncxs3h2CzzCQr/+8HzH9Yi/Yhq+X9ElunUzIRKPckJDnC53YjiVDvZm8ACR5KYP38x
	mbxWq1WxIx3N/77fWuwm1qb/L7C2lzrl+WT/zBVDs1iFTQKl0L3Bmz0QcNtlph+ETEHcbJdvgRh
	kKP64FtRMLSTTNuQSiBXg50fq5gH9uXgYEl14XjVntKR2xQV5C1TsArxan9MfX8PRXfB44rs0b/
	W9VvAONdpGxt+HHzCSLataw49MEAtwhZmCiaYvvXo5f9aZrU21EA33v5Ow2g0OlQu8RfGxXCYnd
	3Wt7qpzQ9v6oR+TbEyvgqKkJbVmaRY6XlorrW+ftNzvDBKHdsPU4yvHuOYj5t+jbKmPvYT3w9Xe
	xbPSMvgdOsqLpxrne/0jMeUwNE7xFPCBfP5o2Uo/Eq3bqxn/+G5evnpycy48JYCy6zQ6WasgsFI
	IgcL+f+ukRuF0ZcL1YkDzWTH9DWeTH/UXFcE5wLWQTJ4v1+WKTzmraq+AfMYsvToWvR8CZp9Dr2
	1X9Q6
X-Received: by 2002:a05:6830:44a6:b0:843:a64b:6e3b with SMTP id 46e09a7af769-863092bc6dcmr9078109a34.32.1795455806834;
        Mon, 23 Nov 2026 09:43:26 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863169105c2sm9566614a34.21.2026.11.23.09.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:43:26 -0800 (PST)
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
Subject: Re: [PATCH v4 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Mon, 23 Nov 2026 12:43:24 -0500
Message-ID: <20261121-a733-dt-v4-3-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122003932.568c099c@ryzen.lan>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <448e7551a6f560d8b8ede245ccfbc74101c76ef4.1795034153.git.enzo.adriano.code@gmail.com> <20261122003932.568c099c@ryzen.lan>
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

> Where does this limit come from? As it stands right now, at 3.3V you
> won't get faster anyway, so it's moot. Please remove if you agree.

I set it to match the nominal SD High Speed clock for the initial
3.3 V-only configuration. I dropped it in v5. SD High Speed still
requests 50 MHz (drivers/mmc/core/sd.c); sunxi-mmc's default ceiling
is 52 MHz, which an MMC High Speed card can use.

> Just leave that out (for now), the default is to revert to vmmc-supply,
> if vqmmc is not given anyway.

Dropped. The MMC core acquires vmmc and vqmmc separately. Without
vqmmc, sunxi_mmc_voltage_switch() assumes fixed 3.0/3.3 V
signalling and accepts MMC_SIGNAL_VOLTAGE_330. SWOUT2 still
supplies the card through vmmc (schematic sheets 4 and 13).

> Same here, comment about this being VCC-IO, at least for now.

I switched vcc-pf-supply to SWOUT2. Schematic v1.10 sheets 4 and 7
show VCC-IO feeding PB and the 3.3 V PF path, with CLDO5 feeding the
separate 1.8 V PF input. The v4 U-Boot preflight on a Cubie A7S
showed PF on the 3.3 V path. v5 relies on that firmware selection.

> We should have a voltage or a range for every regulator. Here it should
> be 0.8V.

On a Cubie A7S running Radxa's 5.15.147 BSP kernel, regulator sysfs
reports 0.800 V for DCDC2. I set it to 0.800 V in v5.

> Do we have some OPPs for the cores? The range should reflect the
> min/max used voltages in there.

Yes. The live BSP DT has separate A55 and A76 OPP tables.
The nonzero bins span 0.800-1.050 V on both DCDC5 and DCDC3.
BSP regulator sysfs reads 0.800 V on both, and v5 uses the
0.800-1.050 V range for both. The source is
configs/linux-5.15/sun60iw2p1-cpu-vf.dtsi in Radxa's allwinner-bsp,
with the supplies on sheet 4.

> Why is this always on? If I see this correctly, that's just supplying
> the GPU, which will have its own supply property.
> Voltages should be in the same range as for the CPUs.

I removed always-on for DCDC4. Sheet 4 shows VDD-GPU on that
output. BSP regulator sysfs reads 0.800 V. v5 uses 0.800-0.960 V,
the range of GPU OPPs in the live BSP DT.

> 0.6/0.5V I guess.

BSP regulator sysfs reads 0.560 V on DCDC6. I used 0.500-0.600 V,
covering the 0.500 V LPDDR5 and 0.600 V LPDDR4X VDDQ options on
sheet 5. Sheet 4 shows DCDC6 feeding the DRAM PHY and that VDDQ
path.

> Probably 1.1V.

BSP regulator sysfs reads 1.080 V on DCDC7. It feeds the DRAM PHY
and LPDDR5 VDD2H. I used 1.050-1.100 V to cover the 1.050 V VDD2H
option on sheet 5 and the 1.100 V DRAM rail shown on sheets 4 and 5.

The regulator core keeps an in-range selector at registration. The
handoff check reads the selectors in U-Boot before Linux starts,
so the new bounds can be checked against the trained DRAM settings.
Before booting v5 on a Cubie A7S, the selectors read from U-Boot were
within the bounds, and none changed when the kernel registered them.

> But there is no UFS on this board, right? All the UFS signals seem to
> be not-connected, so this power supply will be going nowhere. And DCDC8
> seems to be used exclusively for UFS, so I would just leave this whole
> node out.

Yes, sheet 6 marks the UFS signals NC. I dropped the UFS-only
DCDC8 and DLDO6 nodes shown on sheet 4.

> Again, why the always-on? This is referenced by eldoin-supply, so the
> kernel should keep this on.
> As for the voltage, the schematic doesn't seem to give a clue, so maybe
> you can look this up on a running BSP kernel.

The BSP regulator sysfs reads 1.240 V. I dropped always-on
from DCDC9. The always-on ELDO1 and ELDO6 children hold it
through eldoin-supply (the ELDO input on sheet 4). I left the
voltage at the firmware setting.

> Why always-on? Should be referenced by the pinctrl device.

I dropped it. The PJ26 LED requests a PJ pin and pinctrl holds
SWOUT1 for that bank (sheets 4, 7 and 16).

> Does this intentionally miss the voltage setting?
> The datasheets suggests that VCC-MCSI must be 1.8V.

The omission was unintentional. BLDO1 reads 1.800 V in BSP
regulator sysfs, consistent with VCC-MCSI in datasheet table 5-2.
I set it to 1.800 V in v5.

> And again, the voltage is missing. Per the datasheet, VCC_LVDS0 must be
> 1.8V, and the VCC18-LCD label connected to BLDO2 supports this.

I set BLDO2 to 1.8 V per datasheet table 5-2 and dropped always-on.
On the test board, U-Boot hands BLDO2 over at a 1.8 V selector. The
3.3 V selector was read on a second Cubie A7S running Radxa's 5.15.147
BSP kernel, whose DT uses BLDO2
as a PCIe 3.3 V supply. Schematic sheet 4
shows a nominal 2.4 V BLDO input, so the selector alone gives
no physical output measurement.

> Do we need this at all? I don't see this (VCC18-CODEC) connected
> anywhere?

Sheet 4 shows BLDO4 on VCC18-CODEC with no load drawn elsewhere.
The BSP sysfs also shows it disabled with zero users. I
dropped the node.

> Should not be needed.
> Voltage is missing, should be 1.8V, I think.
> Please try to double check on a system running with the BSP kernel.

The BSP regulator sysfs shows CLDO5 at 1.800 V, which is
also the existing v4 constraint. I removed always-on.

> Voltage is missing, should be 1.8V, I think.
> Please try to double check on a system running with the BSP kernel.

DLDO1 also reads 1.800 V in BSP regulator sysfs. Sheet 8 shows
the SoC eFuse supply. I set it to 1.800 V in v5 and kept it
always-on.

> Voltage should be 0.9V.

Sheet 4 labels ELDO1's output 0.9 V and sheet 5 shows it powering
LPDDR5 VDD2L. The BSP sysfs reads 1.075 V. I left it enabled
at the handoff setting to avoid retuning live DRAM.

> Schematics suggest 0.8V.

BSP regulator sysfs reads 0.800 V on ELDO6, in line with sheet 4.
I set it to 0.800 V in v5.

Enzo
