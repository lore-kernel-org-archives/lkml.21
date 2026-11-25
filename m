Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618564;
	b=AvqevyLLo8dXAKgK/kaA2QfVE0EYKCfWnjKrs2ozTOBuvxbjfzaS2Zu2edFqqPCcXCSv
	 RdRDNITGPZ3AmZxxfqJixBctCes5BKrwVYrxxN8LVd/nfGXyzuxww15MZ2aofxnnfXK0Q
	 C71vptD0dqy1iFus7T08bvsDgCbGnDOgl+1ZC36IKEH9nLcc7NiVL5Jz8AweKNe6vn3Ci
	 Q3Zhg0EudZ5cds1RJn169eBVgTNtUPhcB+TTHzQLIH8xhKktpkuOL6MiF9LdtIiVh6Cng
	 zYi9F+se8KGs237VihbCuzQy+UCqAVkXS8DzdpUn7/Q9aC46rwjxJtUppnuNwpGxmzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/cd+VsEs2FzLrKaZ0JDNDcQff/j0gUW6+LeqT4o7nk8=;
	b=YUm2kbd1xsJlxlIHpM5XFZMtFKxduy1xGsqfCKtwv/DtPTH96Rsmv/WqExWdosIPTkzw
	 4AsUm2aIYiJDN7lGmaJEPbwyKF4ElicvsloW4f8GZm8n+lsSvLBRV5opifTEnwRFwnYlz
	 nsiZXRxF66vt1I6wwA/7J4s79vAYFHrmHTXwRne8/Vdq1rwoxokLqXYl6cqBRfN8EJIxh
	 b9MPZdQQJo8JxIM1iIcSM7W89+dmlw9Mp+FyMVdPseHXHNC8otaTOm4y63OYcaXe89tf9
	 LHSrZq0T/pI2pbJMdawHoKQJnFagWplAXeujRf6G1sEr/PP8kl38EU8tMsDmKt3KAmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLgqSlkC;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377F606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E377F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLgqSlkC
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49465892f7bso4273788f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618562; x=1796223362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/cd+VsEs2FzLrKaZ0JDNDcQff/j0gUW6+LeqT4o7nk8=;
        b=uLgqSlkCyNa6YWaxVkGRsskwfv9XNjMbwjrTcQVdOsxrH7dKqDUqlH7ymEnX7y+tRx
         9xO4Ri5p+VJvq5+lPF472wv0dhuRiSeAng96wsIq4dZUApLsZaAXqh/+LH+4QqHDQvZG
         5RfqnJo/5XGZWYmLxq5/8c5EtMIadJ6miAaecgGxRz23L0J204u/sVxdQo9x/fW6BU0b
         3jtZZ1QIn+b4CNordEVQRv63LP0raB5lTp4QFgz3hT8QfurcBNNalQEaW3Om+D54tJif
         yi7DwSqiWz+vffoj2QC7RMNugLi2V03yg4x92QxaPQJZDrJDA7AFbZLEAuRUDdObei35
         9maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618562; x=1796223362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cd+VsEs2FzLrKaZ0JDNDcQff/j0gUW6+LeqT4o7nk8=;
        b=zYgw8976BZZdMTOT8stVdSC4dVZpaH2A02uj0NX6MgNuJ372GOgzvVLc4MK77wglVV
         vMK83LRqcgQCxXOQ+NefG0M13/7ON102uWwOmFTeGCDZ3Yiv7510XGo2B1LbTWTFnww3
         Fi1IRDy0ZVAUkW+xnml3X9rU3759DLomEr9PlYMBGJcDe9AsVvLGXSTrJ/h1kkOd921D
         jlUmi+vIHvdQbfWYN8ywrsW+cJOZv6FyqfC1sLeN7gkQjSn5MydSiRlPL3ZtS/IfO0kL
         487Q0VAOaVqQBAHqStnIXfBhDHIpd0xc4eaK+A2Gv3f4vizdOEpiBSEzt3NpwB3lAXnJ
         IeZw==
X-Gm-Message-State: APuU4Z/BNtwlQdxGy0gKmB+9g0TMCzmc0zNGXKdPFkcj2KUbGnQAdIUz
	bJ3yxCkTtKCIyumyylFhizjpPpQOssZ8J+aciSD8IVdREAcn4HMMGoPq
X-Gm-Gg: AZFdTZc0IPs/BzTKa3UNEA8SOFj6F1lVyV6vq/Oft165xz/2wgmYdVKp1pTDv1lo357
	XsoYlM0UDrrYP30sy6bH0hljJH097XHmWfxF+rrafTE1z6fpzNgxO5nYdJ9BWDQhULb9xvqoLQe
	k36g6ZuxNDcfQojtwb+lArJ/k0D40XVl/vRVBiKlD2VzNI0A95L7W8U45d7lb0XIUBaGkr+PzcL
	pKd2o4ywAH7uiW6IJXV/vQ1vKKOwMcpd7setU+xqGL/+bEiaeih227GbcB78IDNOleQF2mUnUBp
	4LciqfZVLdrtVDkE920dRAtCq6nPTLWhw6zJLaKzo0tiIiRHZ5URp2HY7cHN9FBxLXYHlseFs1c
	pLTRxn1ISUaCOD/jyioEVBMuNCM3fce32AuDuE1taeEbKDZyyEffErBJ00egkbsQjEjwpULX1WA
	503m8soocZvCOe4ac0aEPC/ev+FRsSSo118EQSXAb6xzLmXtCwD6sL8kIzcBNu2omPrAe+gc5HM
	oEN0ibGzaaF2Qlz6PEP6PyuH74R2Y2rvso8PnZySe+mBACSG+EuQeXNG4EYKFDImn7aPIee0E/M
	pF8HnGtV6XMkx/YL94OixGscf2E0lrL8ULfKynxFCeIoS6pS/lFOmMgQM7KCwsw6JSWp+6zYTkw
	i2fNl6MGjAjOX+afNnNtPosUNlYwXfR9L1Q==
X-Received: by 2002:a5d:6f07:0:b0:48f:fcac:a5e2 with SMTP id ffacd0b85a97d-4abb47b243dmr33442304f8f.38.1795618562038;
        Wed, 25 Nov 2026 06:56:02 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:01 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>
Subject: [PATCH v3 0/5] Add USB support to Exynos7885
Date: Wed, 25 Nov 2026 15:54:51 +0100
Message-ID: <20261125145458.2594179-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This set of patches adds support for USB on the Exynos7885 SoC.
 
The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
PHY that theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

Changes in v2:
- Clk changes not included as they are already applied
- Add Reviewed-by: tags where appropriate
- Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
- Use unsigned long for set_ref_clk_rate
- (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
  error.
- Keep dt nodes ordered by unit address.

Changes in v3:
- In exynos-dwc3 dt-bindings, use an enum with the exynos990 entry to keep
  the exynos850-compatible entries together and keep code clean.
- Add Tested-by and Acked-by tags to phy driver support patch.
- Move maximum-speed property to device dts.
- Move status = "okay"; to the bottom of the usbdrd node to statisfy
  dt-check-style checks.

David Virag (5):
  dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
  dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
  phy: exynos5-usbdrd: support Exynos7885 USB PHY
  arm64: dts: exynos: Enable USB in Exynos7885
  arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  4 ++-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 28 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 31 +++++++++++++++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
 6 files changed, 93 insertions(+), 1 deletion(-)


base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a
-- 
2.56.1

