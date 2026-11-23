Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442280;
	b=ufVCnH3F7kzxxK5E34VmePBRXYTpBY8En58+9mdQEX//7rBuQMHJvBIzbOm9loLGdqSO
	 YgJvCJNTkjxFn5ak+aAhY5/zM9qbTJZK2a7lYP3cAMdC2Xve0uR8HnOf2ZSmSHmsaIJgT
	 Q5gSStATcr92e0WnOwzs1Z2CyWYbp9IbLKAxtq87Vi2dgSgCvNngkOq24EieXi4/7dXeL
	 ddEHg83iync6E4cLdk0tl8oo56LFTyfw77nY8Vve762LISSpum+WmDLv5yZD09SJRkGXe
	 fH3onf45eYEzDDOYQMwlJpjk4NVKJKv7hXo58EPY01bACks6SdG3I4OoDiJGGxEpDag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NyaSsWAPZgC5lXTBhJenr8CDoN3h5umUpUBYZLSGCnQ=;
	b=gWjibETXDq2JFwuyvvLOc6xNmyvkqOxrc/YHba6QhT8ZduVzctyBU0M5BSgUt1Blto6w
	 aabhK/owkcETKqGQCKAhdVuoX8x9osOqqHiIuwIqes4ud2OWMNixxniZ5P8qquIt11NQv
	 lTKuIVbI35wnO/E5JadGXQD6b+BI2WGYpnCn9VhuEnAYhFlFKWbasnbdxnTXPoMBYEw8M
	 rP3ZuNN7SIKdv/RNSkTal/bjDZL0R3mVB4tLbMLdgBHCi+Avw1wXw3CWa3EdUmCb38gXW
	 PtIEZu/iO2p4cxdgUnOzUprpgFWPbgfl2GmpCx8lnUiHo7NOnGO0PMgU0XxdcYNmMTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzN7U8sT;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AD4606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7AD4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzN7U8sT
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so2768806f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442278; x=1796047078; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NyaSsWAPZgC5lXTBhJenr8CDoN3h5umUpUBYZLSGCnQ=;
        b=wzN7U8sTKBWE0hnIdo4hSl5mB94unptq0osmgd7FUp1WlhAnKCMGAXL3l86ygWmb7V
         s/rQje57Vpi+05Ehs0Hc4IGwxho5PZ/5DOv16r/NCYuszsLV2pLx62EXeArjLORct3YL
         o63K5hYqGANmph5kBH99+P1hCQ+WsV0QnIUdc/fbLZptPdgXuiF+VSK6iP7qpIBHLYt1
         N8oXIv9CrsKz1vAPo0o5KU2KLytiauPMqliW8QMtnFR9RXo3oL5cEWPZuknt38kAUWNP
         /Z2zfQZi7y9XRtAJcICkVggmfN+A/Iqfv8LdLOQ0Dkl5qZMvxz7uIo2/ILhZdR13rigj
         zQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442278; x=1796047078;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NyaSsWAPZgC5lXTBhJenr8CDoN3h5umUpUBYZLSGCnQ=;
        b=nmZW5BlgPGW9ZbUB24KETo7ckGTwkmdpWm3jExduQ2BO6o5oHMtY1IaVK/z3+sWiMN
         gVtc60WP4DyC9CRz28BqQt/V7IdwtebNlRkTudPbX+ySYuu1jf44SroP/kmbISksPs2f
         FX+XJCkYpAZEttn+RF02Flp4mtNNw+3ID8lgVRqedSxaOhVHb0BTUM7xwmQH0ZHVfHVg
         Z4ar9q3tk56yU7GgXpfRM6QKinpIUzoez/UyASVgr9UHP3Q5OxbzH+PkCRSGU7FseaNG
         V978ZiXvx2nXSzh2btvFXglh86pQwUNPXnEO1m87qzNSidTe0+WHyAz3JT+KaVA7r01Y
         Ekiw==
X-Forwarded-Encrypted: i=1; AL+hErGX928gOQZB9SjYjzjdNnFyFg89/gBZY/1yy8MmxkMjb9M8c8v8hXl6xSXniNc4oNFEjr4rHRg3PCVL8MI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pYiW9azeL4zszmAnOholH4da5e5pu3MlA8rhDdrZJ5mX3hA6G
	4obynaolsduWTN/mCBdwop4cH9lTmGXDU5FMIdSf7wyB0caEmLjGOk/8
X-Gm-Gg: AZFdTZcje/ww9szh7CPr1v29S2MreLdTqOzlNmD6sE3v/gAoFKJrqV5lCFfUIlFTxfz
	dmAwze8H7kQayXoKNQysKIeUkxgQ2NWxro5Y1tZEwuqydbVjTjVf9815xKE0c5la9vEWfdz5xAu
	n5ou57nUKwTw1kZqDyu2LfZ47Za0LqRnDhOMDtbYh+pVwMQHiBY2teZxLa+d1ltwVX576aEO3c1
	K9RkrzbMnvE/s0eAaVZjeff1GapcTy+QV0CpxF1V11L6pQdFL8+pA9Ueuy2KsUCAGXx2hsA9FvR
	m9X6/pOgmIqa1aNeV7/U/2HI5WVk9WuAZlgm/NztoXYF2asmzrqjpJS4uZn6Sq7Mz5Hr1f8KxCY
	2EzRzmGaLh/WKTV2tL6ufGit+omrHqRd1BZqGI2urP8eY/4pUu0JSFgCS7y37Qf9JKz/v+iW3px
	RJUMk+UXhSmxxBUm6+Mv+SNamvWUVA7dj0CxBJzgcuxVWTNym55G/7RnK5Lk+B4PrxC+IQLVCZH
	06wnwb1MZxalIZKD9bOmcLnIBHgccplzqIZmcu35Y/duf0Zvd7XVo5SAKCdfFLdL5StlEIwnIOU
	XlGNIwSnuTp4KL6enSwHGGuOdYZRA1aWuCVsir274/jhKfnR73UYRyEVO+0fC0qCGQ==
X-Received: by 2002:a5d:5d10:0:b0:4a7:f82a:7f6d with SMTP id ffacd0b85a97d-4abaa9769demr24794089f8f.6.1795442278093;
        Mon, 23 Nov 2026 05:57:58 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d6f4:1401:6558:1dff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm22109308f8f.36.2026.11.23.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:57:57 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/3] Enable RZ/G3L SDHI
Date: Mon, 23 Nov 2026 13:57:52 +0000
Message-Id: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAGBGBGsC/23MywrCMBCF4VcpszYlSbFFV76HFMll0gxoWzIS1
 JJ3N3bt8j9wvg0YEyHDudkgYSamZa6hDw24aOYJBfnaoKXulVJasI90S5+puwuUbvA2DC54D/W
 wJgz02rHrWDsSP5f03u2sfutfJishhTOdtFqeenX0F7u2CWdkw61bHjCWUr6C+u8sqQAAAA==
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795442277; l=1266;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=nfHK27eamabda+l4/yT+G4It55FfV4xdF374TgHVIUY=;
 b=jF4MLo3rk6NOxho8MwZU8an6T6CD2cpRrIil80n/V1/95q9+MXJEWUH3U9O375bYUx7mDdjCa
 onZ4gKACfplDkOhk+Q1Hx7o57ZOt1V2HaE+d3yv/6W7VRWvHy08GO0p
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enable eMMC on SDHI0 and SDHI1 on SDHI2

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v2:
- Disabled sdhi1 when RZ_BOOT_MODE3 is 0, so its pinctrl and regulators
  are not left enabled.
- Fixed the typo RZG2L_PORT_PINMUX -> RZG3L_PORT_PINMUX.
- Added a comment about the SD power signal.
- Collected tags.
- Link to v1: https://lore.kernel.org/r/20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com

---
Biju Das (3):
      arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
      arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
      arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  73 ++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 102 +++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 231 +++++++++++++++++++++
 3 files changed, 405 insertions(+), 1 deletion(-)
---
base-commit: f5494a6f6d818ca30f70063a573eec8c982ad747
change-id: 20261112-sdhi_rzg3l-e0c7dbf7cfdd

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

