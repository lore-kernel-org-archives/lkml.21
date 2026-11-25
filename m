Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607287;
	b=CKy6lM1r9uwiMAItPTvC7vLdtVJc+GYO5WjTo2TMBzSSLnckcNpp40KkvdE2EDTsBFGh
	 Q/JuoNOlrW1ucHQXWJqSGPY7XaxZjEatrqRLrXZJYXQhLTXsB73g1WHCYdGvHkK/rfSlk
	 O8ZoYhjnUxEnAerL0yod3oO6cmqoN/QJFhkHAXQwAU/pJb6ofIfvsOePsrVoZI3YyKIBp
	 XD4fJoepFdIOpYfdX77O8UphF4UIPGpWtLtfnvl2CHrGnjW9FLlolybk9qncyslCQL8tw
	 SIA12SYcL19bUSiv+L+mrxsDaeu5y0koNWRQlet1778lx5S5uOHWnq49gv5OBQhUZxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vpR5O1RFGnmEKRzAE5aTOTm5Hq/TE8oYJvYgkp4gzQg=;
	b=cxynDG0gp+12DQVH2h1KwoXTi31tbBt7BOphemg27h6c3MDZlpGtQCaBqc/53kyxh8ax
	 7bw7WTVgYSIPILdKGOGEZFj6mUZmHu6nrVDi1ECr2XHIhW72p+rfmMpba0akK1DAxO/Lx
	 rBUtLXVYiUEV1ybh9z94eXz99lKB4C3sICDpDkU2LNkwci7uYODr83AdtuvJsVFDkOieY
	 95qA4RPtzUAkpFiDrsvawhMFPF+SQmxf5hDb09VjBgRD1bcvKErfzTsaG1So48XVYYVc7
	 GANFTv2wIuxO+UcxMwpW9RwK3lSgvommlRu3VG8AxyLvMEBLrs04yeDHMq16phE3Bzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SOd/SHC2";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F039A606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F039A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SOd/SHC2
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso30602785e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607285; x=1796212085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpR5O1RFGnmEKRzAE5aTOTm5Hq/TE8oYJvYgkp4gzQg=;
        b=SOd/SHC2/qmpdeMOhbgqoGZxaq4mJVoIhZwG9XfdLjT+KxSBTT7h5bVZbvgevpsqji
         TZtNY1pNkT2igqKTwkzfXxg75vgVeg56qVrG9vPUKsoV6KSrhHmKuKH3pnbVPgiM1W17
         iGmjUl9dxtRJYrXnSjxlCb8HkMY4Lsu8CuPkFVra0szY32DDgtzO768/DowbyydBjc8t
         EPqORUPqEIZMWBL+MoqkNGFMaEUy2Ymowy1kTeIdr8wDktrHDUle7Ql4IFXddMVMTAUJ
         /WeVNccqUcl7L87CMj7OW+UDNgAHzOZIcbKBIBw37OB36vIadbFY4Xn3DXlJZ1VTqHdV
         erzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607285; x=1796212085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpR5O1RFGnmEKRzAE5aTOTm5Hq/TE8oYJvYgkp4gzQg=;
        b=nvmr3NrHcMC8oHQc/Ay3QVo6SlE4X/3D9pchFmk1akblvs9KtOH1pPAHuX1nz30Y3I
         qjY2vpCQrebgOC3ZSrPo7EZVt7ywy/HiFf2yXHFUsYbIbFk3v1hdojp8k7+h8RVYd/xB
         2A14D+kIJwgTYQn9fep/rohoNMLa/G62w9Ui/1DcudLFveE1FGgV8c1xeanwAXHATZfw
         VlToOLeR2TUTXDuZLjxltSN0iHwa3CGj9+JZp/pRvo1HqEIujW6YLcGe6j1ettNA/kva
         SX9wDHS4MaC4f1wpWsOogUL39zu3VZdz7cpAJOVUx1ZoPYmCIFYS3YOP2WchTx6Z9xRZ
         M8xg==
X-Forwarded-Encrypted: i=1; AL+hErEsgYlD3BRORUoON00lu5DNowyrhWs1qdl4zgVQJ+pOaicouF/R1c1eLRs3ydOI1zhSSy5GGUWx3hzigu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9wNqV/iMndAfwGc2LLii5TuBaKodRNTF0dBZXXLCdhhJY2CeY
	qzpXSPVlxFzI6fSbb6HcXUr0MyhCF7dB73sZEfi3cUdKdWC0dSDZChts
X-Gm-Gg: AZFdTZcG2+3e/TX37Ah1NacbFpwOfrN7HyMxSkzSurmxYPV1o+XNAmRL6+kz1k0fsww
	oY6NoBrN+zdRVRaoZBPXiVRoS8rgwcdC1X6eXjTCuiRIfXKolr+28SSxSkTcw7f1wY+5G7zS8HI
	u6SwD259NEuqgbBuxs8cst5b6FYiFsEBQ/JISPWfkQ+cIUrLyTAFa4YCF8hKwK9bpUnEzURIBhx
	C29mW1fkwEukiNdocGkTYIc/kSyoGOQlsH2MU8nE/JzetTuxZccjR3SJKLvpL7/QGxdx9BiBfXR
	B6AiaaHEluiVv3mIh/sg3UJK+poq3zO8hJBULtKkE/QA4cPRzcH0/nZeYHaqgYcjn9UgmUDJzaz
	59+lRJLNGE1haoe0N3mR7ycBMU2VPL3RsFJmM0Rk50IQGj/ouJGXi7D6AUnDIQw4myRWY17zC3B
	WhYGdNERuVrv2KYwDtCq8bQH1uNRFqYu6L4wq46hn3oFDo8lEK/fqzRh7PamFSSej+6aVPIKwo5
	MprOicLYBeJy3IcqsUM3lziznFd6OF8mhbsc2xcSHSifipep11j8C8H9mMFBKO6T+roI2tK1PhE
	gdVL5GcCfEn52FilVskaPAQOQ0alr/9nRQs2jVPbcWKbPI/Pe3TGeZQdFMXVATHQiEOTedhYznu
	IZ3rZUGtTc3apyCig+KY=
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb88785d2fmr350066075e9.0.1795607284755;
        Wed, 25 Nov 2026 03:48:04 -0800 (PST)
Received: from saeedvft-ubuntu.tail2d4112.ts.net ([46.100.16.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm514068355e9.15.2026.11.25.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:48:03 -0800 (PST)
From: Saeed Nourian <saeednourian82@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Saeed Nourian <saeednourian82@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add Firefly AIO-3588Q
Date: Wed, 25 Nov 2026 15:17:55 +0330
Message-ID: <20261125114757.654051-1-saeednourian82@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add a device tree for the Firefly AIO-3588Q, an AIO carrier board for the
iCore-3588Q system-on-module.

The module itself is already described by rk3588-firefly-icore-3588q.dtsi,
so the new file only describes the carrier: the two RGMII Ethernet ports
with their RTL8211F PHYs, microSD, the USB hubs and ports, the PCIe 3.0 x4
slot, the M.2 PCIe slot, the PCA9555 GPIO expander, the HYM8563 RTC, the
fan, the LEDs, the recovery key on SARADC channel 1 and the three Rocket
NPU cores.

Besides the board bring-up itself, this series enables the RK3588 NPU
on mainline. The three cores and their IOMMUs come from the SoC dtsi
and are bound by the Rocket accel driver; all this board has to supply
is npu-supply and sram-supply. Testing details are below.

The first patch only adds the compatible string to the existing "Firefly
iCore-3588Q-based boards" enum.

Tested on hardware with Linux 7.4-rc1 (for-next, e19bd795e8, plus this
series), booted from TFTP with a RAM-only initramfs, without touching the
existing image on the eMMC:

  - eMMC comes up in HS400 Enhanced strobe, all existing partitions intact
  - both GMACs bind, RTL8211F is detected on both MDIO buses, and both
    ports link up at 1 Gbit/s and pass ICMP traffic cleanly
  - the GL3523 hub enumerates on both its USB 2.0 and USB 3.0 side, the
    four type-A ports are its downstream ports and a USB 2.0 device works
    on each of them; the onboard FE1.1S hub enumerates on the EHCI port
  - a microSD card enumerates as UHS-I SDR104; no card detect events were
    seen, so broken-cd is set and the slot is polled
  - both PCIe host bridges come up (both slots were empty during the test)
  - the PMIC regulators, PCA9555 and HYM8563 (rtc0) are present on I2C
  - NPU: all three cores probe and report "Rockchip NPU core N version:
    1179210309", the IOMMUs attach, /dev/accel/accel0 is created, and
    a runtime probe through it passes
  - the devicetree has no deferred devices

The hub RESET# lines are wired to the PCA9555 and are released with
gpio-hog nodes; describing the hubs themselves is left for later.  The
display outputs (HDMI0, DP0, VGA through DP1, eDP, DSI0), the Type-C port,
the ES8388 audio codec, HDMI-in, the camera connectors and the 4G/5G modem
are not described yet and are left for follow-up patches.  PCA9555 line 3
is used both as the user LED and as an SD power enable; only the LED is
modelled here, and the card slot is powered through line 13.

AI coding assistants were used to help prepare the DTS (cross-checking the
board's hardware description and some of the edits, mainly the USB hub
nodes). I reviewed all of it and tested the result on the board.

Saeed Nourian (2):
  dt-bindings: arm: rockchip: Add Firefly AIO-3588Q
  arm64: dts: rockchip: Add Firefly AIO-3588Q

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-firefly-aio-3588q.dts | 434 ++++++++++++++++++
 3 files changed, 436 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-aio-3588q.dts

-- 
2.43.0

