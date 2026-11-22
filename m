Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375126;
	b=4s+B50TYNTH2DZs/6re4zPSpLbKmlPASoUR6rgQjUN9YvhZBIB66okdrNM7Rp4ToD+cR
	 09mzhDJPeeHsvI0mhCWnyKfWEV4j2pFc/6gcppi3dkANgD3+emOMIlxrFiJGxDRDx3L0Y
	 ZIiNXCUANoawDQtr7eAAywxWq9fg2ttAOOOu3YUiqOC3PP4BrKu9e8B7/Gi2GBrG35VoC
	 SlZV2igM2fPqlwlcN6JvCjexrAnnNLRfrNI35QEspkZr6qItZrmGp5gtpkaQVoCHkwndE
	 7kHTeSuxNICNeOCljhLKCfEw4v0MgukiCfSrPRLTbsLkuQYEnUkPHVBcOnegT3atsUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+Uqhop9ybLEnfZjiktNvan2dFW98Stkgcu+CDpZ9vF0=;
	b=wHiAJC9uLWk9iK5mszbyWHhFotBvnI+MtfGXHFzFLj929+paK7UFOybf8lfXewZUyAzY
	 JE/45Y3BRfPOBc+kGmLb7rI7ihGAlbLth6kqSxhN/5E1jol5ODdsm6R0+FZoaUcjAuALS
	 OVwfuRQJvmpKQlZXCT+UlFJWTGq8ifZlCgdPzwWe5Z2ruvl01nLq2oH6Ij7uAtMqF856E
	 wmpQe2EAtmC4WzQZ698FlZBT4Gb3KGWn4Txr8br930R508+QKT3U82I1/szo2wepiAUvo
	 QOayXD/mZamo5JVSIUB9E5gCqKuMBRZ7Qh5+8a5tEQ97OJKvPRHz/hS5Rdc1C8Rl/Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTMlfTU8;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A1C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A1C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTMlfTU8
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb606491faso14108045e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375124; x=1795979924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Uqhop9ybLEnfZjiktNvan2dFW98Stkgcu+CDpZ9vF0=;
        b=kTMlfTU8geprJcn3SJfoU8Olz/H633H5rA98cCtRissMONe5M8J3YEH/E5oj67UV+I
         fLcqmahmop+FsUy6WJEPQ2fHZm0tckySeUiMtBaEDjJ9lXKNqJ2/b2e/egAn6p4g7L2w
         6N7+IMRqEKxPJaDCAnNHiWEBk2RuIc4THzlLdlbNNTmoX/RynpxEboaweYHUdfkbwC6O
         vSUwArT6PYJsO1NFckFoyECFS/ynxv1H1yyQQ/EN2dgjq3Up43KmiFRnGLBBfzLvZnFU
         kv6mO+lpVd/S1w06eivjWMTLr01IllIOwEKyOJ+hXmrvPJVEqj2Z+AlBzTnK9gTvuB/Y
         Bprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375124; x=1795979924;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Uqhop9ybLEnfZjiktNvan2dFW98Stkgcu+CDpZ9vF0=;
        b=jWKztvMEWrlOLobdiH7H1FGj/c6TacfAmBuTwtHJqKXj8+zWev2RK0b3g/Bdb2+ZDx
         DFTXlBls81oYLK1zu8gVGvEoRJ5tlnUfnP+x1FxXde6RM4XhseFiDa7EpOYwQOrUsotP
         PtZnIep+QagnK/ZAblKGTJ87GKNmFlaoAoq8v8gfFTIR3+Jk3Usn9HhcbvVk5DA4o0ea
         diLbkmrXDhg/F74fxl0eis587FNr/b1oYBFMhTRJUFkFEZLFZ3WofLuwK9szsLw6GLSx
         vzlStKF8WH0Rj6GvJ7k9HcLcGNPYFoWRcE7UuG2mEJklxC01H/bDCT6S5WvqaTluhSvZ
         wBYg==
X-Forwarded-Encrypted: i=1; AL+hErGk1ZYfhoIMxUWq++ChgXs7L9xmjUq69bFvVuQIwwSU+ToaYtcqTtcwhXXR+/bncdtpoSvyU3rbMUhA33Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1LFb/7w9a11nn1heZxI6pCsRaOv0v1WuShAwFWKPbId5x/VIg
	KlfbJaCKb9DfxNTfy0g17SCPdCzCJPW+LNh0Bz7yEpT+2TVIreVo23ZU
X-Gm-Gg: AZFdTZdPiaw9AQp7Q6EtUzSQYmDMybf99ZiSJ38SOEpnVYnqpeZ9Jx4dL8/v7H+J2GF
	LXmrjzuE/EV63lybDJTsvfiP42dKQ17oFg5x6JuNKeT/I5g9Pw2jrpzV/3RRdL0LCsYjN5YqB1f
	rFeqpf/Lq2kW5Ja8q93cnqeHarrfgzThPp6YhiNyw/2g+kDlo2Ja3Tp7hTPosIKLi8hLx6WELvg
	tQkdlSJaUbANDZ8KzL+J0A/tJgEOXw7PPPcNMa04G1RUTs2yTuBMQHy+EqZLRp42BHDj5DhNd3H
	CWimsSoKNBqz84wnqB/73cui5df9rzYv/b/4JiO5IOhbFm7I0d4HBSN7GOedl2C85qctca3YqT7
	kM+phPmL5V1mRFnDknNWkzYYkC6XjD3PT0d23ozicwV5yHdPQq7NwdDAL9iO43kjvmngcLIEx/j
	wEz1B9RSPmSm0McD8cRDGTkOo04PaLa7XCL3EPSjSYLQqXXGAiiEttowC9P0ddjAbAkKTaVoDJn
	0tFsZaWQY3cRjfA8dqEFVkqeGvi3XEVBie0919Ik9QRu4JAb8AcvKchTFc4GjrvG1RMxh1G/50X
	rbgUtG39DtlnGiyZho+MXmDL0hQiVd0LMaA9NSpWj22H
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr196302675e9.31.1795375124413;
        Sun, 22 Nov 2026 11:18:44 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm19437148f8f.13.2026.11.22.11.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:18:44 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 0/7] riscv: eswin: eic7700: Add support for clocks, resets, pinctrl, HSP bus, I2C and watchdog
Date: Sun, 22 Nov 2026 19:18:42 +0000
Message-ID: <20261122191842.2183685-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I tried this series on a DeepComputing DC-ROMA RISC-V Mainboard II
(FML13V03). It uses an EIC7702X, i.e. two EIC7700X dies, with 32 GiB.

Setup: v7.4-rc3 (4843f6873f7c) + this series + a minimal local board dts
that includes eic7700.dtsi and eic7700-pinctrl.dtsi and describes die 0
(4 of the 8 harts, uart0, the firmware reserved-memory regions). Boot
chain: OpenSBI v1.3, U-Boot 2024.01, GRUB (EFI); the kernel takes its
memory from the EFI memory map, so it also uses die 1's RAM. Initramfs
only, no storage.

Config: defconfig + PINCTRL_EIC7700, DW_WATCHDOG and RISCV_SBI_V01 (the
firmware's SBI is v1.0, so earlycon=sbi needs the legacy console call).

With clk_ignore_unused, the non-I2C parts of this series probe cleanly:
eic7700-clock, eic7700-reset, pinctrl-eic7700 (with a fixed 3.3 V vrgmii
supply; no pinmux consumers yet), the four dw_wdt instances and the hsp
simple-pm-bus. The console, interrupts, timer and SBI reboot work. I
left the I2C controllers disabled, so patches 5/7 and 6/7 are only
build-tested here, and for patch 3/7 none of the pinmux states in
eic7700-pinctrl.dtsi were exercised. I'm therefore replying with
Tested-by only to patches 1/7, 2/7, 4/7 and 7/7 rather than to this
cover letter.

Without clk_ignore_unused, the board hangs during/after
clk_disable_unused(). That looks like an issue in the already-merged
drivers/clk/eswin/clk-eic7700.c rather than in this series (I don't
have a single-die EIC7700X to see whether it is EIC7702X-specific), so
I'm reporting it separately to linux-clk and the clock driver
maintainers ("clk: eswin: eic7700: EIC7702X hangs when disabling unused
D2D/PVT gates").

One build note on patch 6/7: eic7700.dtsi now references i2c0_pins ..
i2c11_pins, which are defined in eic7700-pinctrl.dtsi. A board dts must
therefore include eic7700-pinctrl.dtsi too (as the P550 dts does),
otherwise dtc fails with:

  ERROR (phandle_references): /soc/i2c@50950000: Reference to non-existent node or label "i2c0_pins"

Is that intended, or should eic7700.dtsi include eic7700-pinctrl.dtsi
itself (or the pinctrl-0 properties move to the board files) so that
the SoC dtsi stays self-contained?

Thanks,
Mervyn Pretorius
