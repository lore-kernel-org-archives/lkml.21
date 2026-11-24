Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539471;
	b=rMEEj9Hkgx7Y74/24YHRTaVzQLmFjyXbAmv+pgZ+bJyTRK01fTb8sw+UcG/vlCAaJ8VX
	 POeheQTCjgj/514dogInKXdGIw3XUgoeg29x4LrrlcgZDZVvmxgFz78aYn3pR6X3sMcfj
	 VZFhNMZyoMt2FDbNaWs8krQ0TNs9UUSxRdaIqD6i3s/xtNaX2UH2AiVE0Fxj8rxLxniv0
	 Vr7+lFTP19NVO9ffT24zL0qesgY/VzK04MohTEXBwwy4kKCYdWfJaWUT6jeSJscpf1jtl
	 vm5RV5F0CTXtDiqrMz1mjq2NHNje4a0Bnv3n2HzLDNuRSGQ3aQRBZrez2cH1nYg7UiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8ZI8+XAVfJmCSvezhsQ+NgrHMpYW4dThTVsOo67L0wM=;
	b=Q7cQmGdye+DQ61R8ZrXV4bq7HWzisfyTW4npfeawHVA54RdohkxasyGhTcOMOSGa7gAo
	 VWmG7JfbduIlCU8fylnNYcd1xLAkaEPwFUNaVk0BqQ02BjflQZwNzZaBn9ZT8wyZ1B+qf
	 d5+tjqjpP17uAGtrZyhroB2rFLr2Jm0cq4hMDG3+A3AbVCJ8E/5D6vd7ugl3OF59o+UIp
	 Zr4hPU3ezmk5y++BsU+ZbN2UWadsjHXqHYyPG54neLYbG+ehgipIODFW9S2LLMUH79S1H
	 6aBKyWDHvGENt2obkK4ZsaA3YZj8FW+JaXBiTmqBIcmEm8sp8jshP5Hz1Lg+IdAovcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEFO6fAb;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD47606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DD47606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEFO6fAb
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso4114288f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539469; x=1796144269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8ZI8+XAVfJmCSvezhsQ+NgrHMpYW4dThTVsOo67L0wM=;
        b=sEFO6fAbA4G3XO6q+zujY7LGmdUMiGjT62QMyhVzKOD0je/nwpy3WYgt+iQYdYsL8N
         yH/UMA6ogU8mUzKeMIOoFBx3PDqTusT56wYU0ga1M27JeAor8knzizwnvA5EYOKU5x2+
         x6VZs5gBv6ri+DB/evcL/nIfdVU1zPeny4iyaR99YLFxeZ8SSZ92vT734Q9btQwSSNLI
         0HHnw4n+e917y80Rio68bL51iWoekuzKnQsIZTYVQsSMtedXJkkiDCXlpdR4mYQDyp4c
         8SV9nRPNrNpS8ZnSo7SiyZw9gyCOZGJRkfrZIPy2IwUm/h+eRS7JiUX1hZNFMtdQlPTh
         1NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539469; x=1796144269;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ZI8+XAVfJmCSvezhsQ+NgrHMpYW4dThTVsOo67L0wM=;
        b=w/XWoIxo6HmXNcKF5G1jO82HKX/xSklWQPw1mtoYGi3cP4AvquzSUfS1vzcfkPm0U2
         CKNMAknLTIggKgVWCdKi4P2hh5VDinz++c5oDcqXacVRdX9OCuyHzJ0DDvtszbJpE74v
         X4fQ8T55qYvEuL6lZFlw4dDlHy/JLCrzYQY5UvtABVo5xX2s2kh91xrbG5wckHWvicAf
         CYqKI12s+NUO8qtGal40lSgFNsd3y8VUEeII0cVQQNjuUivxNZyd+nKtmRH7veRzryQw
         3vUVZPAo1GFU8WwYTUqtNW3A2U/QXVr9z9ME4VdlNX0qI2iKdoFYcHdbXuYqZzEMcv7s
         UfAw==
X-Forwarded-Encrypted: i=1; AL+hErFQU11mfhvauo/bq4aMQSEjx1bXl9zjknq4eXy0B+hb/Fb+xCRW5aABszc0VjRpDQPU/ptDtG4jkgKJZb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9piWJiY+H9BKOP+EZ9mG6AvOd9e/gyvHHdmkLJNg0G6gC5LpKr
	JbeKDL6iDr0LF2AGXbdHu+iPOIMUiZ3A04h9D5PcHnZ3sdURaC5V7dUY
X-Gm-Gg: AZFdTZeLMhtcmeXtE+kUUNhh7LQpFX+COIKUyXuv0LWL80ZGIErnXXFmr46b/IMV0Ze
	6YK3KkWwYsnxMaUoZyoJBZPlKr4Y7RTfhOOYuzp4qnTRpMG9tplI0H2W0YcalTarWAWTIhprTdg
	W2Hb3Hlm+UMASlYtIjixDZY4QmGZ8gZDM5ln1BbkEDOLOVRCvXZVFF1ECSa6syeqVT8W3rxGd/b
	HUYLDG2RMxZJxDxXzdGjrLXUA7abHsIJ+rnDg2f+e9GFFiu9itIHgsFZ1wegQ6z6ovinEPXo1WM
	t8Mt7+BXCMzC4TH7k/X912CnfA5UE5lqjhpGgY1d+qBsqYbGric3j+F/t8qcZq98YPef3tK8dXY
	h9aRR4JwwgO1kYWLqerQhcb4wWCkSy0W3sdhFXcRkkERNxkday0eDr7Rb3U11oEKX34rnIjouad
	XJX27uX7pDg85KD162wgeED/MlLL0xMvzOPnr8gqSD/2ead2RP776a9oyWsu/khu3pR0z+kYadL
	/H4uhij6P6m17Q2ebucLfAk1sgcxYYzD1Qz8R1N7Nfctp4CE1w6scppLdVY/x539ORkOeFASq0U
	dMwI/qMRlGUqKMIRt97u5LyHckUDLtbb8QTBB08/eantpyGEcwpFNytWvZ6PUpMeLA==
X-Received: by 2002:a05:6000:27c9:10b0:4ab:6077:32a5 with SMTP id ffacd0b85a97d-4abb30b85e2mr22202041f8f.30.1795539469277;
        Tue, 24 Nov 2026 08:57:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm28794104f8f.20.2026.11.24.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:57:48 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/3] Enable RZ/G3L SDHI
Date: Tue, 24 Nov 2026 16:57:46 +0000
Message-Id: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAArCBWsC/23MyQrCMBSF4Vcpd21KBju58j1EJMNte0HbkkhQS
 9/dtCtFl+fA988Q0BMGOGQzeIwUaBzSULsMbK+HDhm5tEFyWQohJAuup4t/derKkNvKmbayrXO
 QwOSxpccWO53T7incR//c2lGs799MFIwzqxU3kjelKNzRTLnHAYMOuR1vsLai/PBSfXmZvNFO6
 VIVdb1vfvyyLG/0I7y66QAAAA==
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795539468; l=1532;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=iFo7sdHkGslQ1kSM+Y25akW9VwgPNIpJbKGmr8OYoYU=;
 b=6C7wS1kP5VKdYvjWxyVJ3aGWwaw55O51VZMSQjiPBj+3fuYpsPIuncCK+Ci0WVBKVfMdAaGOh
 Q37SBrL/oP+A4auyv51QBsShkRiLzriNRrpotmYuAGsNfSoMoiJhzzN
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enable eMMC on SDHI0 and SDHI1 on SDHI2

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v3:
- Fixed syntax error in sdhi1 #else branch.
- Added generic node name vqmmc-sd0-pvdd for GPIO regulator.
- Retained the tag as the change is trivial.
- Link to v2: https://lore.kernel.org/r/20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com

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
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 104 ++++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 231 +++++++++++++++++++++
 3 files changed, 407 insertions(+), 1 deletion(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261112-sdhi_rzg3l-e0c7dbf7cfdd

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

