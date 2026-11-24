Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560210;
	b=L3QiREJO7WsO/l5uk8l5h9kOwcq+yOMYft8S/TyDEoHHMxZhKOCyTc8B/1K83UHsJ0mV
	 bowb+BYoTUuC8q2qqgZO3kuFAzwMUERoPKFumv7o2LdVMUnFcNoRHdYaBiPmB2d7NWsWQ
	 UGRf35PpYmv9gkESEf8xcf14L3riy08i1rqgASL5JrTO3WlJjV1iiLJqvnGGuUYNqVY8d
	 6aQn+fCEBgscdhxUY28fR4xd58qpNRB7Hvx9R2ymh9jQBkKQ6rsroJ2/2f/9brRNjiasg
	 HIPdIRiXhGjMWxMy4IljMV0gr6dqVueE+b5yjoPUxwsVEOSWTbWUKE6uOXyuqSV/LWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UeYF1YhxOBA70+hLap1314b1v8sPAVWV79jWbpYOTzM=;
	b=Eoah3bfEcAuMnOH3ANzVRo2Y1ROsCkrsf3f49yPem2BJodRuowcikfarDmdtIpH0XKSg
	 CZQDYdY0+dqp8FcC2Md6yWK0Sm/mypL4hVaT4BDlVmxxsyhhX+lgfTHk608iIM698sKu5
	 UImsO32AxDXqZuWKzVkzGoEcacmRp2xl6vMXYga6r1jvMeluZ+BSStgpRUryhPlRfoZ9o
	 uAmzUEyNWIdCkGOVcNycELpOJ3epT5sOBx7T06BmOz8TeWEPSGvyRnJO2kOqZNn9A8HzD
	 og9rfuGAMyj+M0JbUzr2pSmAqdU1r5za8/L1spOzTkAwssyAHjGjz7CUBMDfNaGJfBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6Y87bUf;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2198606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2198606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6Y87bUf
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49412eb1474so3282412f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560208; x=1796165008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UeYF1YhxOBA70+hLap1314b1v8sPAVWV79jWbpYOTzM=;
        b=m6Y87bUfvZ0KQCkyx5b+doVux65ENRQbe3y00a6qqXDpIz/zXXVYLO+bfiyn2MEAJB
         Y4Is4frgh3smtjB336R3Q+HCp2qG7TD5KxfWZfPlJYfX2lEei84e+y1ABKVg/B1nGsY0
         C+shhsVYhA6Iy63v/N8iVADN4fHNumlTUb95W6WyBUHHDui9UWOjGZgd4kkugaqzuMex
         hPNmjrpsW3isvGLb0ylhIo1UVODUXkFHRt5zl//MxlBIj9BxhWbKG83wihLEbOm3o/km
         OmQ/D/wikGQkzqcFEFoo1Y5ibNe/wgxqElzR4wpL/ajmOJlvK6dp26p8oBqkiytF1SQW
         sT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560208; x=1796165008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UeYF1YhxOBA70+hLap1314b1v8sPAVWV79jWbpYOTzM=;
        b=CfZmO5AHCfNpbfrHd0cg4lysQ2WOL60Nns+PFH/SSQng3cZSeKu4VPmhqjRLLEu2+l
         KLZzNr0MwnmQY8OC3r11AwL862YCG3bLt65RJXErwj56XSlzClmpqbjhzoQv2fh0/iPU
         RiRRwRAROg8uk9MHOjxrOpr+itq762umCRPsEMXwLOiQZ/IHB4IgubCyORWnxFdKU5VM
         svLX+j6pPlQRS4WuRuMWdKz+AFOW51xcznUvkzQNnFJHzF2zMOYpFKG+ZYBSKTvB1d8m
         FzrwQQ8PvTLbIBrXKnar6uGMTOkGNB3/+f39s5aPmv38EUyvXjPTyvIppkjhQvWekb+H
         GsTA==
X-Forwarded-Encrypted: i=1; AL+hErHcaeJXFRB1adDVkVIzzpd9AH+7fZ14MkjPR6HIh/hAzQ/UPrQRLnsBDQrg0fDpnbbiDaI71njEwCvvaZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jDCUYyfuX2HdswN8R5s8LUzfzOCclB5h0vx3ozKfPtatz0utZ
	ohmaNJygWel/9s1oEIGpb+5Ax/tdyd7qxTgkR3MUlwZkw1UoKMLgPZ6g
X-Gm-Gg: AZFdTZfb3KNlpYx60jq+D5h6VFs/+HLpPVVwSuqUZZgXYOOO9/HLvGYB9HN83zo9EF7
	s4nvnG6cicDS8ge+5VaKaidVZBXl6apv+61D4UfD6XdbiGi2gssMNoo0hPqQk2sY/h+NKzJAu09
	1A+Wo+JvnqtzZoZ3Z1hLMoGbw/GLxvCgTFrWruFIojSQaira3E9k0DAe0DP+NN0YyVA6Wj9oktW
	BkHqmV/F1p1foX86pvjOvWln395804PTT9npKkIvQtXeU7o5/wTau/Co7duQREfq9mh0DYcpDsD
	wq/I0GOTS9hafZ8bWi9Lw2qVzaWpqcEncw7gFpjVCn4R58YAiCbon/bjz8lVcEXnB5gAvvbf4jZ
	F0uew0Wid4ZMqo958Ub/01Q4vQfWM31yJ6DUFmxrRlz4sS0T+xN7Htym4P9cwH7ofrB+0TYpu3H
	Emz9UVwGqaOB7MxggrfrWu8RlV/pdExh1WDvG/up7o6ANf2FTiipmiHa+ZH08zbe1KYX2jhb9iK
	aoigXGJzihqmiGetxB2mltzPVSYTmQ1EfNSz4wH3AlZWvtqGmQm1G9Uvw6zX9a8kQy1crc5DYOJ
	E32BLbL+Jpd6dSLya1+550idWj+rrec7B2ZWclSiQu9UoTDGJZHIeNcNthGDBmC6eaLqvGJiLZ6
	YHdQ=
X-Received: by 2002:a05:6000:2906:b0:4a3:777a:a964 with SMTP id ffacd0b85a97d-4aba58de987mr30782702f8f.0.1795560208068;
        Tue, 24 Nov 2026 14:43:28 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm30900915f8f.58.2026.11.24.14.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:43:26 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Tue, 24 Nov 2026 23:43:14 +0100
Message-ID: <20261124224318.227478-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v6:
- Rebase on top of phy/next
- Address suggestion by sashiko bot

Changes v5:
- Rebase on top of phy/next
- Add Review tag

Changes v4:
- Add REGMAP_MMIO to kconfig
- Better handle exit
- Add additional info on QPHY usage

Changes v3:
- Improve example for Documentation patch
- Deinit G3 PHY on QPHY error

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example
  Link: https://lore.kernel.org/all/20260827122127.18874-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/airoha/Kconfig                    |  11 +
 drivers/phy/airoha/Makefile                   |   1 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 831 ++++++++++++++++++
 6 files changed, 1293 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.55.0

