Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604746;
	b=vn2C8rbxxFuhp6XstTa1KRDjLnExgQDxwjH+JNrbOaskRogakyXh9b+ajIKl4RPrVG6j
	 MDZ7j60QzFmIoihwjvKTeG2yqBPE3uxlc5KTU3JBcjVwVsyhnW+u3pz0wBLBo7149V1xV
	 9zuPG3qjH7gbjem3i/NIlIt3RE1fgKks1M3U/cd5mOmJXaTkGH0Qx9jfabEXtGe9pLYxM
	 /mO7tMeC5ZlYmJkiyJUJ0E+PxILcG4naoF+hCPuTkPgIXixbzrC0cQYJJU7Om+ckfFoLA
	 L1gpT5Vfx6K2LVZNdlWrRJsvJ1Tu6ls/UJ55L9U2+Mrxi5+vG5vDCLTNSL07faoDyng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OPDvf4SUkuKOMrhgiVRjuWrz2umiGud9bUVpsZeAnuk=;
	b=e8FYMgm/OG6I1+BYIZMuHSmrk8Dc25I+aE7MuFkPR+1p/wwgvs6x562ibDl0qaJ58SOR
	 MUcWQpcvrqiVvBHcFCJoQgdeUX2md7y0LUbCD/yPugvFfBBOGAmmMrjDs/aYoVzRwQY+f
	 Hd4I4/rCMHYqaADZ91Dj0084LvH45p+Rmu202m9niADP1RF1sPQ0YUYi+ud0wQv3g2D9u
	 GQlaan8nNexyy8WrkG4KRO3j8XflgDHS+NvLac4rnJve3w2xrL6CA2AbGJkWbaEv6WvSB
	 ZSKBy8zxDkMUToyypej5xer16O3pF/xJTQLqd2PrtxREw5QrVA4F1NvIbGJIaZmufAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D15XaFpv;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38411606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38411606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D15XaFpv
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso5004795e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604744; x=1796209544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OPDvf4SUkuKOMrhgiVRjuWrz2umiGud9bUVpsZeAnuk=;
        b=D15XaFpvj6mJXEZ/XxMEq5qJWi7OtVz2OlvvM9hxJvWG2UVk7/p/hILZOySB5hHBnN
         Uieoz1bX37JH290ixjaD1fEBpdRP9bzpyc/QgdLvdxPIwWsg5pcKxvFxRmCUm+Iw53LF
         tfN5NX9VpW2T+uGUml039axpKqrst45Pw0se05jw1q7UEGRrkrdHo0avBA4LuScZUqCG
         wZ/nNryEUT/HgOdfxHRMtjEUjEUwttW+Tq1ft6Wm7QZ8+k33nv2XvHU+PIvvASQoHh1P
         7splO423sL/0HvAQxvgp+Mj5V3fO/KumA+6EJa5LdXQedr1Ye9OjoatPzQSfJkhMPCMk
         40Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604744; x=1796209544;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OPDvf4SUkuKOMrhgiVRjuWrz2umiGud9bUVpsZeAnuk=;
        b=cRNdtTrjbO4lYZcwKv2AoqOiURQtJdTOdRTDf0riNpKxlxXqiyBFBfjOlWZNu3tJA/
         inPOALsC/GWavdwNRZVPG4iFic/IkHqq0uI3ORJ0coy04obP00Mfvz1qQpWGkF/5EjQc
         AWp0FvESrLGpVS0nKV0Fp3c9piNcXL6XdDUtQ8fYOzb13TbdUPa/ZPTMf/TNiGavIw7P
         ySPC1crFrl5uIl/rt7VovioAYO9D1gmsSq0dcOL94KRfYrrEDSY0bzLHZ6hCAGAE+ZJy
         dLAEDW+WuHTDRCyp6ZiKOA/KIS7CmmKknj7QwAAXvkQeGZ/qcrH7f5KITJ3gxgAbYJVj
         C6Jw==
X-Forwarded-Encrypted: i=1; AL+hErH+9qJKGvNYo9ZVSAd68twM8IFq6wV2pjcuOsvIQiE0I8iJRg9L9OXgA74QaDojg3vs7XHmAmJXKCZQMIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xlzSz4TrgfTZ4GO6A/ZvynPxPjCuXBfm2cHGJdPfyj+dILLVT
	Imoj1OV8kWW3VhK2xf7S8MagC/1ua0i0Mu1fP3hjjCj/wfi/dcDn9Zdc
X-Gm-Gg: AZFdTZfbY0na5WqzH6fRlL2nxw2V906r7+uDLPNhk4xgDcRw2Nw1MNAs2DODh9f1Dj/
	Ddqrc0QTSokpTmFvIOfFFw0sYZr6gyqqzqahDgfrtG3fVDU3QwQprvyyyGZ/6yAIISCepVSwO3R
	n5kjfIVpz5SE2VyxUwNju8vP6Ng2Ws8weM3LfgW6jmkdcWA8oHhHCIiQzCDjT4Lc207eDoA8Doj
	hOZYAm13XeSSxEi9TsDG7r9kPA46opAy0soRkESSoUgr6hTPiPCLqq5LvJi6l4lms9WQLQUrIp5
	bOTPxEMoUbRi1Sv8cPeoObG1Gki4p5haF5xUKsagIb4XrOLbHR2d9za3pKaDCuvcc7qZxt0mYM5
	VX14xRV4+7VE6tpMzhnL1KWM27oLtRUjoFdltQuI6RJRkg1YmPRz5QZmLhbwbOZynQXWmp82AgO
	jW8ui6EFEzz8Um7Shnaq+JXpsCLoYQuCYxG/cC69S71X/NrG7s3OUs7FSb3sbV1v6IN2sU9qx0E
	RNojU7z8DhMolL1NfaCRXdr+AAPLS5ONIcBTN7m2uvvZNwDmluAVNa+wSYCV26pdb84+PMPIXAo
	VPz5mZ13CxDwlIl0xTlad12pmIRJ79RDHx6G9VNQjOSDUyF/OgG1NDNjrOr90L71
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr338366475e9.9.1795604744528;
        Wed, 25 Nov 2026 03:05:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:44 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v9 0/4] Enable USB2.0 and TSU on RZ/G3L SMARC EVK
Date: Wed, 25 Nov 2026 11:05:41 +0000
Message-Id: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAAXBBmsC/23MSw6CMBSF4a2QO7akrUiKI/ZhiOnjAk2Ukl5tV
 NK9Wxk7/E9Ovg0Io0eCc7VBxOTJh6VEd6jAznqZkHlXGiSXrRC8YU8y1/iZjjcm2hFP1iqtpIP
 yXyOO/rVbl6H07OkR4nunk/qt/5SkGGfaCN7ZxjjBVW/WOuKCpKm24Q5DzvkLN8YweacAAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=1502;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=26F0Gx6SkwUZ7Oiw0xv/NVjSYSUNBgnf2u1Ptjdfq1I=;
 b=PU/eeRLOBV8z8P/k4LIfDNeyIJdOHSL+KZFuDaXI6aRHtwChs7ypp18+Nu/TAu5+Yy3IyL4u3
 Md2YnKyM/xVCDm350K7G64Nn4lwBOs6wCCHBMDUhkvAUAZ3fZ1RQGLc
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Hi all,

This patch series aims to enable USB2.0 Host/Function and
TSU on RZ/G3L SMARC EVK.

This patch series is based on top of [1]
[1] https://lore.kernel.org/all/20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com/T/#t

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v9:
- Restored usb1_pins to fix over-current condition during boot.
- Link to v8: https://lore.kernel.org/r/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com

Changes in v8:
- Moved patches from [1] and [2]
- Replaced place holders.
- Updated commit header.
- Dropped redundant nodes from board dts as it is defined in common
  board dtsi
- Dropped usb1_pins.

[1] https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260925061617.127349-1-biju.das.jz@bp.renesas.com/

---
Biju Das (4):
      arm64: dts: renesas: r9a08g046: Enable TSU
      arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
      arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
      arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 193 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  49 +++---
 2 files changed, 217 insertions(+), 25 deletions(-)
---
base-commit: b086ce5618932e5ee2a0fd5fc759f70ba41ee1b9
change-id: 20261104-usb_rzg3l-16fe5cc8a82d

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

