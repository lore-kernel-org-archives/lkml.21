Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044617;
	b=slDOhLI1Nyoxpvku7G2nQ6AAUZiZPXjiX1bpcvolwfdW5XGY0zfE55I3MvYa47ZzUgQT
	 EYv7rEpoM12GcrOO5uFlRp8R/QSiIfRekxhGqC15+NVu9MriFWtpgDSfwYMP20w6BGZJm
	 rBkR8Kpf2R9DTwLZlG5tejSBqWOO3IJfRX5f1yh3hFZ/ibKScY1D5bgVubaLUKPZBSxli
	 PNrPs3h6i2JvhR2/eLhN6Uxh0EeS9saWAqyIdm/JI0dB8ruo6sZKxiX52eu7zGmbLUkiM
	 ophTt5BYFM2q4fbhO8uL3Mw/U7xd46Gmrw+BnJYEYXWka01wky/a1CdTy9tItlSntsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TJp+v10EMij7VbtZSi1N0VBoPPwdYg/YL3FSqlitLFE=;
	b=jDq/kkJTsE1R3g0F4qGNUTFYW8Gwi+gX3qh4nA8GoPKHYJiEzBskHJASsEQVXz/oM3wf
	 +44/JFDFcPNXS61aYrB/RHxnTKbH+RIal3x2E61seWb3keLcVfHhKdZXU3NJlQZFuPGac
	 8P/ylUEBqwz1I5rkBB9V2WZMT4WfBWIPPxbgFj53CBC5YKWp4MGBjWH04PcrN3rIN+c9F
	 uqGTBChyRgOhhGMf6JHsLK7TbQZ/BHJktogvf/1DoogwXpHnRc1VftNCBrVMxGYJeUh+1
	 UNlWHKEj3hG+xQp17JijFScOmVxJF5YsiXCi6iQYkQZvfMzPTDNTE7k24GngC9/Zviw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAJKQCyf;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6C606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F6C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAJKQCyf
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5118deebcfso179274266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795044615; x=1795649415; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TJp+v10EMij7VbtZSi1N0VBoPPwdYg/YL3FSqlitLFE=;
        b=lAJKQCyfN1OJVC3Wm7Tq2642xQZI81QkKLG3G0JPjH9fYRmoXUQ1p36ZDYqObIBnut
         T9GmE/4v3/pimsXbwIrSWeaKv5Ro/p1jMrbEAuEe/gnk/qMyPdKvimuYjlRhFFvUZMdU
         reP9mAdWjqlN5zIRKqK+yr+zoFDKaXzct5xtdcX3L5FHLJegG1j3Dk/sCiXHLM90xmSE
         fwExbSgtuYKzfiuD7AqOtnegIB8Rs5hh1xeOrx+8fAeHskWpiqEqhkesd7BhMIWERWD1
         j0K7klTVPvc6F9U8WXjuVSkVtkLplxootCbYN9N9TNQC3xdyjs5xYC/v7if7F/8F7E78
         TKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044615; x=1795649415;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TJp+v10EMij7VbtZSi1N0VBoPPwdYg/YL3FSqlitLFE=;
        b=Kguq7l+B6f4V8DRE+o6byJ9CmZPcQQgzwCpy9Bg1LFLmEI+2UCYoffPTGorXyAA0Mf
         9PKxczcHo1V7Ub0SSOyZWmkwijYswPzJkbdRng823CD1UVbCQ/rHvAQZUU56n3cwAWY6
         w7GDrXvg8SdrPFp8sIIyYyL+cRb5P404skhKtwDc0vz7/zDjzGiqgHOv5Ulsi9xvJo8n
         iS9TpHqFdRv/WEv872j3D4Ig2QQqwBF8tqsSnNxapH0rETPgg2qWjjUXsfAZRhqbk/UD
         9fdyDHncJJtMAuV0igg4R4Aeec+RAlLXmHHH75n7wx745Fr/sOniE0UTLIbMnUJx2Elj
         XHSg==
X-Forwarded-Encrypted: i=1; AL+hErE8cmkBrnAh870Mm1jTTYKz+jALH/sZ3kGVNuAKT8NR655UFuGyBQHgxvtBDBpaMo0e30tMiO+/wSasHps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PBsZOgi0tEnS054bhHyltrnsBkINNKGRkvskPtDemjLh5yX2G
	sNQDx1oG/cFmnEPq4/Crd0OG2J6I+vgDKlfifpLqoBdRmtKk1sWWgVPIBYCAXQ==
X-Gm-Gg: AYBFou0cH62v9O7oL5jMYt5k0BGbuS/Ce+O/5ZAp/LQPkO+9DlJPHjaArQC4tG7drI2
	KYyJ3DS64ndxsM16dXabZ6uuAey97+yu1jiYxJMXCLfADQCFgQ4aCaeVk+ZLvl33r797G9zIvTr
	4BteBpgCRjF1Hk3j7RPu/QxnM7eRIQ38I1mQOgMh2RWKJylkJN83wpEIFHNPVzs+InWCiO1lC2s
	3M8/P3swJLUO2Jmx9yHLHlaHt9koIoVW4EqKE5o/zY4t1XNmsWvjd8I8latjJ38b3ESs5RVVN7D
	ti70ny7LvFz0gzRmCsmg0axL2YuAEZrPMxIBGbODD73VM1lHFC1IlbTNUt1CKNFyfkrJ4XBb5XH
	JmZtlxAP9/zGwYAw6md8DJ7dyHCBAWiK7r57UgkBhQyTttaANF4N7N0wAJtvs69tADv+53VQm4e
	c57lPsUVVS71qp/rzFgQ4ERF8GVmaEFnkgasM/i336SQkQcK9qPhobAfUNMs4FwKH+5fGEzqSdy
	0nyIB3MEhdYXqVrtDEI/dZd6vnNv5avueazbchZfjWUJ7c5Ph5c3otwZJOYyg5M68wumIoXNzTE
	F3+3Mrh5NMxW9eSzzXWta3hQXl5tp3K5vpJXUaGUc2E=
X-Received: by 2002:a17:907:3d8b:b0:c50:5005:8ecf with SMTP id a640c23a62f3a-c510e0e8be4mr378449666b.8.1795044614898;
        Wed, 18 Nov 2026 15:30:14 -0800 (PST)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm47809166b.78.2026.11.18.15.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:30:14 -0800 (PST)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH v3 0/4] arm64: dts: rockchip: add Forlinx OK3568-C
Date: Thu, 19 Nov 2026 04:29:38 +0500
Message-Id: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAOI0/moC/22NTQ7CIBgFr9KwFvMBQoor72FctPy0qC0GKtE0v
 btQE9OFy0nezJtRNMGZiI7VjIJJLjo/ZmC7Cqm+GTuDnc6MKFABkgH2N8ZFjRVWILmkvCWGCpT
 nj2Cse62p8+XL8dlejZqKXxa9i5MP7/UrkbL7k00EA27AWs255UryUzc07r5XfkAlm+hPJEDER
 qRZBFFrUR8YGKG34rIsHyni6izrAAAA
X-Change-ID: 20260930-ok3568-c-c095925b1e26
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044612; l=2429;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=yfphZ0mTqNHaO6RXY1MSM8psuzP4gCsZLr935QJ6cDE=;
 b=neG5FXjHJ3lCTzvjwqvTzSD1TXFJGfOQShzFZwf6DbnyC1XRKKAAxGFAUAWz78in6AAG21nNg
 boa7IydzY68Bg+Dw2CevsXCSp8YiulDdybhGSbFA898d0oXb2CSm1Ju
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

This series add support for Forlinx OK3568-C board based on FET3568-C SoM
(rk3568). Patches 1-3 add .dtsi for FET3568-C and .dts for OK3568-C.
Patch 4 adds .dtso for FIT-PCIE-SATA adapter that allows to connect
SATA drives to the board.

Note: tested on v1.1 board. On v1.2 RTL8211F phys use dedicated
crystal oscillator instead of 25 MHz reference clock from SoC. Patch
should be compatible with both revisions, as in [1] solution.

[1] https://lore.kernel.org/all/20250704-rk3576-rock4d-phy-handling-fixes-v1-1-1d64130c4139@kernel.org/

---
Changes in v3:
- dropped rfkill-gpio dt-binding patch as not appropriate
- dropped rfkill-gpio node from the board's device tree
- Link to v2: https://patch.msgid.link/20261016-ok3568-c-v2-0-068d68430e6d@gmail.com

Changes in v2:
- added patch for rfkill-gpio's dt-binding with reset-gpios property to
  suppress dt warnings
- removed mmc-pwrseq. AW-CM358SM has only power management PDn pin
  for both wifi and bt. Using shared wifi_bt_reg_on regulator fixes
  bluetooth failure on cold boots
- added bluetooth wakein/wakeout pins
- moved leds/common.h to the SoM dtsi
- switched gmac's phy-mode to rgmii-id
- added rfkill-gpio for modem reset
- dropped unused wifi and bt pinctrl's
- Link to v1: https://patch.msgid.link/20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Yashin (4):
      dt-bindings: arm: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx OK3568-C
      arm64: dts: rockchip: add FIT-PCIE-SATA overlay

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi | 332 ++++++++++++
 .../rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso    |  16 +
 arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts   | 566 +++++++++++++++++++++
 5 files changed, 927 insertions(+)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-ok3568-c-c095925b1e26

Best regards,
--  
Dmitry Yashin <dmt.yashin@gmail.com>

