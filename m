Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635412;
	b=R9xaPaXDDMrMN2Dv8lRYEiFMaKGFrnaRt+3Yh/QZh3xyCqcNJy8ZLjv1hdyxs8pcOI1f
	 fOnwRuY4ic1Jj9vJlT1U4cYyeNOvGhRLPP4XIuSIikrO99MhJRcg7Jzn2TbGoxG93uW8t
	 OANrX2J+aLT7tLuksOnNooeVTxdyJg9/j/AxhIm+9NR5y5cKRSkd0UVqwbkp2pIdzFB8m
	 IF2u8/dm0Mk3V4/KxTUH27q+F35tGRu/kCGN7kvzpfwuS9SQ297bC6hzNSdZUmZr45xKX
	 rwEY3WzYPHnGVzkMs8RJ9oU58oica63BFjWVRMukqPHvA31Mkw7aY2Jz1KEbDWaBH2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
	b=l9YGvX2kHApK95pZ2sp2k7qwaHuwAfaJtikkvg3D5YqTxm1cxez3QAD2bVlw82O6xZKn
	 GHISyXnikK6/ILR2/WVxAzsX0AFLU6m9TCoRe1jKqAtEbu3HHisJzSeamY2Zo0pNU2lAd
	 PQHwHcWvDOXkawgtbnlB3H3timNVNEeZnvB50k/6cC9WUdlyfiPuKACeaFLnyJV+qKIJM
	 +Otw0y/h185/QFobw4tLu0Glh5NdB7sDcx1lW8H5AeS6KIo5lxVxjwXTXlDONvm0Y7DIf
	 /viWfW3aCepJuJwWAdidHDliiMk2my/bUxUtrnnP/+M2aHYjHwP9KWSYlqoBljpJYMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=aoR5T6p5;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226E6606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 226E6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=aoR5T6p5
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4804181f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635410; x=1796240210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
        b=aoR5T6p5un41DLJj8bVcpqBNPTQbYrGbWu4Ev/PsYHk7rJpNI5jNAWntAarThZJGVF
         B4k74T1hyoxU+baAFqCkmlPuBIsZtA6tTBndCvufKl2ASm+xAD/pRZN/8MtmOY2UHFzf
         OwKfXj/9uww3JzaYnbAyc988hyiVYIdDzrxoTwUiFm7nRLKdywEvJmPv7cA4cumbjFCE
         9uQ/zusUdpSY5hwjPX/lCvRqoiE+uOknsx1eGnr6hm4OEableV8COUWEpzyhO3uzS6Q6
         tI+oSUjJqvq3Y8Lup03ffkzA46/KApZDKOZU7SwrK7NYbCcJIsvWO3KjYiTVuJ/GahUI
         YBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635410; x=1796240210;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
        b=oa8SJwXd9MuCElRqlCJ1Oqe+5PiVhtemq9xlQMKdJF4LoiKJes+f3IRv4cWNQOsmog
         f05GhJiF6fJxyXe+1VG4ZEhuyLK51e8lKjl8kugz6P8LF1VsNiazIPgo8yJuEKoL7hQP
         YdPV3kh+YW7OeF+Adv2QoSqSMQMuvN5dtBqON5W/R2LHlH7rt4zMrPO+Z7UyhWIk5wTr
         0C4EKL3q7jiS7Ab4DrOasH6myPGHZvTS/0x6nJEUYWqBWoU0tvyhyhQVdkntr7gyhiST
         hb+GfG3sd0AnPCm9FQYFeRG2LmzDPszb+JYBlvTEo+jkMlUqSp9DIlZGPFiWVpdXGYR4
         NdKA==
X-Forwarded-Encrypted: i=1; AL+hErGDApwFuMIczE6FX4fr7WhDGUWMUvLTKSe4GSgLK9+q0jGvaaFZFV7n2RIt360EfyI26bWkRquyFrL3QFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O6WDXqj+AapHIa5fZdTF1ha0APachJ+C3rtNrIMxlDP8QTpY6
	UNiMpFKisa+tQFjmt7hHelWy7tHM83rbO6uZm84Np3nmkvym21bEjpNG11cluKk5ZCc=
X-Gm-Gg: AZFdTZeATirvbXilZ26n6h4uBsLu3jIkAXgZLQGAsbLooxSY1B763iZZpMw4guhuxKq
	rxYo8PQGwK1tLe27FNz8cveI3InF+RfdiltpqqnFcivUw1o/2nIWCk/ncnx2+XBIIz/nZgVg3Mt
	OdSmi7tWFZWhlCazV+iXGbHrk6jEDen77rSdFGKGCUCq5PFccmovjTYSjMmSxFVBGkSJu/Q+XzT
	oCabYNhMZ1IZdTgWhOE3Xa7d3UrNozaWzLBcB/uK+OYuHxASs9ieV7c49gqM28bNUTN3GbX95DH
	UVFSzHfxMrzeidgJHheY2/CLkgt0dgk/oghwhTynyC8Gox1LXZklpt5NlgOkFitnoWqmwTGA3Dh
	VGgCTQL4ffEi7GKOWRWNK9bJ1zADHNSxhbUA4UQYDemRqCx5LxJOScvRaRCxr5ZvAIbUWLG5I6f
	CKlR59LPrstS5O3GScWoKPJLUQxwkh0pOu5w38nyJKJkR1lL8MWW5nbx3gUqruV9KpgffIrteTi
	6zLSMArOm5+qk2TG3DaDAY907wOkHhvm0Ft1a5fia510bKirbEc7Qj8JS3YYM1znMdlioFSanXo
	j5DKJegOshzEtIkUI1TzzzQCPusXfMnq/zst+PlpH0SurdkZ/+k6mSlPyEGlQGHOVOVx/T9/byw
	rYi9X7bPA+g==
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr24341175f8f.38.1795635410326;
        Wed, 25 Nov 2026 11:36:50 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:36:49 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v5 0/5] net: Derive stable MAC addresses from a unique
 device ID
Date: Wed, 25 Nov 2026 23:36:37 +0400
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNy27DIBQE0F+JWJcI7gU/usp/RF1guDT0YSNwr
 FaR/72QSFWq1upypJkzF5YpBcrscXdhiZaQwzSWoB92zJ7M+Ew8uJIZCGhELyRPr6jbhk9z5Da
 eg+PvxnK0vQCFTnSdYmUaE/nwcWWPT7ecz8ML2blatXEKeZ7S5/V3kbX3z8UiueBkeokaWuEtH
 PxbiJHSfqSZ1ZMF7hnYYKAyamg9gRkk+t8MfjNSAm4wWBglbKsbZz02fzDqnlEbjCqMUwKHzoC
 WEn8y67p+Ab0IaeKhAQAA
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5804; i=alchark@flipper.net;
 h=from:subject:message-id; bh=i85cUXhyWb7m3a6ui+zF4b9HUAnpfV7UPHIO1a7Igto=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5y19/A21y7VXBHY2fcuT1DMuHaewckTewWz88TyO
 W4mG+l2TGRhEONisBRTZJn7bYntVCO+Wbs8PL7CzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX3njMyrF9XWXL25prW7JVf2c0qD+Ql25xfV8fvPMng3/aTB6K3/GRk+PBaRrW
 QQ/Kyc0jP60UlW0IV5zNPfRXnsrzoC6Pc+VIufgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
memory, and Rockchip bootloaders use it to give boards which have no
dedicated storage for a MAC address a stable one anyway: they hash the CPU
ID and patch the resulting addresses into the device tree they hand over.

Kernels started without that fixup, e.g. straight from the SPL in Falcon
mode or by any other loader which does not implement Rockchip's derivation,
fall back to random MAC addresses which change on every boot.

Derive the addresses in of_get_mac_address() instead, as the last resort
after any stored address, from a "unique-id" NVMEM cell referenced by
the Ethernet controller, so that a Linux image can use the same stable
addresses regardless of the boot flow.

v5 moves the derivation out of the OTP driver following Andrew's review
of v4. The CPU ID cell keeps returning the raw CPU ID to everyone, and
the Ethernet controller references it as its unique ID rather than as
its MAC address. The derivation is picked by the compatible of the
referenced cell, as the algorithms differ between vendors: Allwinner and
Amlogic bootloaders also derive addresses from chip IDs, each in their
own way. The addresses are indexed by the controller's "ethernetN"
alias, which is how the bootloaders assign them to interfaces. Doing it
in of_net.c lets any controller with a device tree node use it,
including PCIe ones, and needs no changes to NVMEM or to the handling of
"mac-address" cells.

On the Rockchip side, the existing CPU ID cell gets a "rockchip,cpuid"
compatible. Its location comes from the cell's reg property, so no
per-SoC data is needed, and other SoCs only need the compatible on their
CPU ID cell plus the references from their Ethernet controllers.
Controllers without an "ethernetN" alias keep getting random addresses,
as they would with the bootloaders.

Patch 4 moves the RK3576 OTP cells from the deprecated direct-child
syntax into a fixed layout, as the former does not allow a compatible on
a cell.

Only RK3576 is wired up here, that being the SoC I can test on.

Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
U-Boot match the ones derived from the CPU ID, and both GMACs get them
when the kernel is booted without U-Boot proper at all (via Falcon
mode). The raw CPU ID cell remains readable alongside (e.g. via sysfs).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v5:
- Moved the derivation from the rockchip-otp driver into
  of_get_mac_address(), with the Ethernet controller referencing the CPU
  ID as a "unique-id" NVMEM cell (Andrew)
- Indexed the addresses by the controller's "ethernetN" alias instead of
  a cell argument, matching how the bootloaders assign them
- Added "unique-id" to the ethernet-controller binding
- Dropped #nvmem-cell-cells from the "rockchip,cpuid" cell
- Dropped the net change accepting longer "mac-address" cells and the
  OTP post-processor
- Did not carry over Ryan's Tested-by from v4, as the implementation
  changed
- Link to v4: https://patch.msgid.link/20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net

Changes in v4:
- Dropped the NVMEM core change letting post-processing shorten the
  output, as cells have a fixed size (Srinivas)
- Added a net change letting the NVMEM MAC address helpers take the
  first six bytes of a longer cell instead
- Made the OTP post-processor write the address into the first six
  bytes of the CPU ID cell, keeping its size
- Link to v3: https://patch.msgid.link/20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net

Changes in v3:
- Dropped the OTP read serialization patch, applied separately
- Replaced the SoC-specific NVMEM layout with a "rockchip,cpuid"
  compatible on the existing CPU ID fixed cell, so that it works
  alongside other fixed cells (Ricardo) and needs no per-SoC table (Ryan)
- Moved the derivation into the rockchip-otp driver's cell fixup hook,
  which also makes the layout module unload issue moot (Sashiko)
- Made #nvmem-cell-cells required for the new compatible (Sashiko)
- Dropped the dead match data and address validity checks (Srinivas)
- Allowed MAC address indices up to 255 rather than just 0 and 1
- Added an NVMEM core change letting post-processing shorten the output
- Moved the RK3576 OTP cells into a fixed layout
- Dropped Miquel's Reviewed-by from the driver patch, as the code moved
- Link to v2: https://patch.msgid.link/20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net

Changes in v2:
- Switched from a scope-based guard to explicit lock/unlock calls in the
  OTP driver to avoid mixing styles in a function using goto error
  handling (Sashiko)
- Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net

---
Alexey Charkov (5):
      dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
      dt-bindings: net: ethernet-controller: Allow a unique ID NVMEM cell
      net: of_net: Derive MAC addresses from a unique device ID
      arm64: dts: rockchip: Move RK3576 OTP cells into a fixed layout
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/net/ethernet-controller.yaml          |  11 ++-
 .../bindings/nvmem/layouts/fixed-cell.yaml         |  24 +++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |   5 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 110 +++++++++++----------
 net/core/of_net.c                                  | 105 +++++++++++++++++++-
 5 files changed, 200 insertions(+), 55 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

