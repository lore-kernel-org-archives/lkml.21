Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992964;
	b=3ClTBJzNnE4NyrqBItHW2JMWrUvUrunYM1Sqdz4dRhUsx/1H44cKe0cVpcjhAJya6gDF
	 KoyDVSat/S/hYJDqweNKusb9+v+0yiEHrO2WosducRf6JgXKjB0494bElyNSSf0xdaOzl
	 i+fYtlmt2m6fTPIKAKZM5gu1NzFb4VtGHac0x7sWAwF/5VsDidY9alI29HKXxFxKnF7/3
	 p9iSOduU3npqruRbTVkEhQHSe5SI9GipBvdWkLrF/0Bzfs8HGpqu6rEMeQERcfJmVr7nm
	 IfvT3x+ofqQfSslTfE3FqFaF571bjEhECEJH82AwE8m5SZxXluh1VXDx5wdmwn6O1WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
	b=l+OSv3GRSVrFreOK0fZhsLAer619LnAdz0SrSixCBa43ANHh63Vfjy0sTfNp6fsCgGTd
	 L8ZaPOumtfiJWgMW0TYrtuy2E9sOwSnS0ntkXvk10QnqyHHxjfI5OHb+uiuC6qeSnmIbL
	 n5usLKuftQ8JoFQ+zYL+HcpoJW77lo58pX1cOkAzOkblzdQr/H93leB1auTVaShm9xrmm
	 aYSRogIZnr+kn6jxxK04T9cFakATGyCwLAEsshQzVPnuHIFoEH0dxZisdVgAKaq2fHXzk
	 8/lE2/WznRhrHKhvAqQBpHH7ddtfzF4cvgzsWDsyV1nKmzeJar/ZB6sAHxV4omCTz2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b="k/5CBHUF";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CED606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8CED606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=k/5CBHUF
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so4992525e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794992962; x=1795597762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=k/5CBHUFtEKe8geT1DXvy29NoiBNG1Mt8Hy95ZhiTXcEoe+VIZgYMi2ugn+SYCpiax
         Y9hbglI3IwiC+ioTHCqrsmqfhP7tcFCVNEK8Uc1vvdWvwgHEa5PvsW3HtK251xuO9+x8
         /Xl1QLFbeSKJc9gLfsvsPzoyPYbC6wJEX2rYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992962; x=1795597762;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=aOL/GQBpXcdtQHF89oFxQb0SCtyslCRVJE76cmOy5DDCE3BteV8aV2qMgPr/XY8LRd
         jnCoIPHy3M38JFBl9yobckHpaUYOlki1bjKLMNf7uvJbM7NCWqo/KgrF9aMyNpuCVjCa
         V2gJrk5gGMuvnr+a3kqyuzbjp98Q9WD1sBAg5oyiPyQMJYaPhuabGugJ2U+4j9xf4go7
         fZIoPwFJHvV9dlsYVZFg3YQCb55suatoujvseofsTno2Jfq4OGKmdkT3rOSThD3j+eyf
         IyNr6YxHiHWxtSgdNpNtsJe1r4p+2dnd2sZn5y8k3FkfQEXE9ReCf1SqDHc0W1Je/wXv
         CTJg==
X-Gm-Message-State: APuU4Z8ka8BLtO8wDe+g3QdwDvqNDqocln05cjsC1LLZoL7r+NKJbx9c
	5NMJxWFP80W8ThmcVVFuyHrCMAFMBCQbnNET9wdbjn2fq3e6pqfTmVh9lnp3JfT3YFK5Z3MIpyB
	7VGdLydA=
X-Gm-Gg: AYBFou2GjHeGSrAaPhxjHXX5tCllbhPDlw0D7AN4Y+0t6a6rDp/0cs8sd5ayFGUI0RU
	T2ji4ztNTO9icoteN87g/X8/Jo+2r0YyXOFT08c2EPw8nj+6P/fL/5Y4zy6DLNJ5XezvtrFNoBF
	Zu3D7LeS3wsZgFMmEZHqcTWmVXErFIAVlVfeoS1HD9qG3+VKsrd8uIDComtH5jn18BTkVX25ItA
	CO5lgGnorxvoQNZ/OohdpeEYSFhbU8SH206DOVS+1aKpM3j92F0WFlV0n+YRVQSsUZSREfC8UKv
	qJhFC50NA8qXD4SEpSIrFRlGmSD05esihz74/Ys3RODn+IbFmFNOBgnAubXW3Nec2EivMtMgI47
	hCqHE073iiPz/fMlQ+MXOXRX/vLwSxQUhcZcQlMUpLrXAOzT/V3gk0W61dlRUrz8LGWkLrup7Nu
	OxFC6OHcTCfzt8VQWTOLyIulz3uQ3ZarB+zL1L9koazGaQ9BqXbRKm8Ur0jpdxwZR9/cwi8DE3k
	aGSAh6OsVIGAGmTi98u2LUGzwZnyTS/sqNo/6Ek+c26irnG/0RT4oJsY1qiVsBPFxxhYlkHFoFq
	NnpTEK1TGp1Ew4CPUAM2BVd8x6bPQttKsNKSNKAsJv8L1w==
X-Received: by 2002:a05:600c:8b34:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb7d6cd404mr33290135e9.1.1794992961833;
        Wed, 18 Nov 2026 01:09:21 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm185770195e9.8.2026.11.18.01.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:09:21 -0800 (PST)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed, 18 Nov 2026 11:09:10 +0200
Message-ID: <20261118090914.38082-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
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

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v4:
  - added the missing GPIO_OPEN_DRAIN definitions on I2C recovery GPIOs;
  - fixed the halved LVDS pixel clock in split mode;

new in v3:
  - used LLM to cleanup most of the errors and warnings;
  - proper use of dt-schema this time around;

new in v2:
  - add the tag from Conor Dooley <conor.dooley@microchip.com>;
  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3

