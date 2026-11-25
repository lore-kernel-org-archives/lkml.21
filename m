Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638107;
	b=g07Aa4Yxybbjxb5SmwLVmu+B3sdN0VnNMSZJLVFs1xyOIl1yravkSsYZ2SH0aXYLTVuG
	 u+/ehzE1FcOKDYE8mnO4rLpUepu4FcMRWzGUJsPWgro6euZx1qG0B6n4sbmTM6aM2RjU8
	 YiqpTAXQHTgIKJvbSKaTAvBRCgWshkS1dL5WtEIQiJH2w6Yh0SxnUqIxko9FtlZgAy3Yp
	 ULaLgGdX48EeHA8HTdDAZuLOkxtaHoPdWk8DGwbdKFfNXlMhOrt5riFZ5oMn7rS3zwLHJ
	 j+y9BTtPX5kQsuGee221mkXCPXLmRMhPRri7BDYBRazMIYzjXv2afo1susbVFv4mtIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3CfQrYxGmVhqVfBjXz2JxOYBYnlyriKE0w7C0oW3eCw=;
	b=sARJ2HgjWCe889WUJIJjv1crdwZIXPP58suUV7ZwYel102k9dA6XhCphV5NHFDvdTCEF
	 Dlff/Sw2U7BNdmF5YxoAHaGeVaV3mr7sjR8+R0AeVDLWtl9yq0v8VB7OHsjZdbOeTL5xU
	 ABzYEpjcnFsfXMPsEHcUuPF4TJzJ5z84xw8C7n8h7ifjaO1Sws3GVUcwpBAb1uM/OxDeR
	 W4zs3N1HsdtYpEXOQN9NI5hwkzG3n6gA8aMCN13oQJgzci2s1FM4z4RKoHhQIv7rrW/Gj
	 u9zu5TfO3MqJ58dXQQXTzmWyHMTAHg8KtXM82EG/4kRBDM0uG1fPWFBYnUVixZcW1Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=yvL1qbup;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D69606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D69606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=yvL1qbup
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-57148b8ec14so2262613b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638106; x=1796242906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CfQrYxGmVhqVfBjXz2JxOYBYnlyriKE0w7C0oW3eCw=;
        b=yvL1qbup9iqNKVVTLxLarpET/deJHiZWhfe/gHkYx5+N0idKilfWyv3K/XqdT+n2lZ
         lgf5muna3z/KdRp5A3+UrrU2U4QC0wrFU1txXmSQrcRU6MUd/8AxqFTA/VZNhycOu7aJ
         PTGdx1VdDxANBe8cmsOUEGCOjLvcD5V9nbJ3w0nNSE795XK7JHb7kz7J80xdbDadDxXM
         4D0RuiVWYPziTvo3JTv5rFl14ciQGGXpHJhr+Kr/smdO6DhvySOY/b1fCqQ4kI5LYLVa
         Hh/3m1kD3LcNoZIsQEtUSgj6KLUUshK68BWFUBTTsWdG8HRZacDo5K4XJoACvLIbxRiJ
         9muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638106; x=1796242906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CfQrYxGmVhqVfBjXz2JxOYBYnlyriKE0w7C0oW3eCw=;
        b=CPf5PET4YgQD0ManBE0J729AOPg7K4GPHNG+vwZNBmFGTTcrYVb9GcxK8uLwewPYyc
         5+qLXcisvkI138ZtmMJxRk4YdyNKPEg5Dcf0afR5L28I98CsjxiPinGW9jTt7CEi+cky
         rCTj2VhFmkmtodj+pm0efRHaUhUaUcDI0nREWMij+Pujo/YX7BM33y002X3aC+dxfwV4
         pGDQdDiKY/umXEHRiEAegid3modUkznuxuFVy2Vk/l/7b0fnzeUCb9CNG2Cm0hLStpwG
         UUuHY5c25ND+qICfCOuKqO5GZUy6/oloDPZueXdO7Swiy1TZpVcJjsJL97lbckHOvqmH
         dtUA==
X-Forwarded-Encrypted: i=1; AL+hErFq2huni7PK49qz7M2gzCUVMQehC6lT8NTn5pIFg5LaPAL3k9H72Nxe+HDLLBkWxeyl5T5byPlsr27Rf/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z96PQNfqYSPn1QHRy1x1o8o2/Zt1H4PCEQhr8tvwIW0jL/RnKq2
	XlbEh0a31/z5KvfWWqU3mRVucv/+rUcOq+KDzFsFG1zUNU6Y7vpa1Ev1QJnFxgX225k=
X-Gm-Gg: AZFdTZelD+cVLyTD8t022wsGiYHwuzqAlQN20LcnsbdmgohuFI7ntKgMsVsCZvrlIYF
	qVb2WT7xNoVPD5PD0QZ2Qd/Ot0MGICv5pIBtc5MGi2TEamqJdJh8+B0ZZg7zx2H/O+lm6Mo/eGJ
	wE/Su2QVTefyY0Puve+FOt/wxioV9H48tna6w9zqTeQMOGophqX8lzqWodXru4bU7VwDeSMPmdi
	Truh8pl6TPmwPUI0V77CZlrFhOGUnRzBKxm8sPnJxM/YCA2X6EcbZ+0aDRXvqNYD0kBLqbIH4NG
	CM0UFTAGyvi+RprzA46jlPZUCGASXUkvZE6QgFmN2B8iEQaEMUM6oFGev6h9UzYyUY9fk/ushYp
	sZRbPAsHWsc9OO0GqJx06T0u58U258qx4dWCyH4Y9pe5X8u0ebv4idv2L43oinW3yxwf62HyMTF
	kQVZdgD19FtL8g3OuN1QqjkC6udtieFlbtvW+9wpKoowixwg8n5wxqxd2rv+5banJj+FIL9vlDb
	Kccsiz1SD+KgvDu/iYo4kORSZvRBSJOeoZhIxLf46oZFIBrT1Xo8QVNqPecKcxCBb54f1eFf7L2
	F6EX/q4hHWt4/cY87BfFzmwDPMU4P+pK2xZX
X-Received: by 2002:a05:6808:1310:b0:573:d802:fb0 with SMTP id 5614622812f47-57a09504ab8mr19901858b6e.13.1795638105859;
        Wed, 25 Nov 2026 12:21:45 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:45 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] clk: tc9564: introduce a clock and reset driver
Date: Wed, 25 Nov 2026 14:21:38 -0600
Message-ID: <20261125202141.1288493-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
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

This series introduces a devicetree binding and single driver to support
the clock and reset components present within the Toshiba TC9564 chip.

The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
It includes a PCIe switch with three downstream ports.  To one of
these ports an embedded PCIe endpoint is attached, and that implements
two PCI functions.  BAR 4 for both PCI functions provides access to
registers controlling blocks within the SoC, including the clock and
reset controllers supported by this series.

The first version of this series included a system controller, which
has since been removed.  This version addresses all review feedback
received on version 2.

					-Alex

Version 2 is available here:
  https://lore.kernel.org/all/20261120183212.1264522-1-elder@riscstar.com/

Between version 2 and version 3:
  - Added Lorenzo's Reviewed-by on the devicetree binding patch
  - The devicetree binding now uses @kernel.org e-mail addresses
    for Daniel and me
  - Cleaned up the patch header text in patch 2
  - The Kconfig option now depends on RESET_CONTROLLER
  - The Kconfig option can now be enabled if COMPILE_TEST is enabled
  - The generic gate clock controller code is now used rather than
    implementing a custom one
  - Only the gate clock IDs are now published in "toshiba,tc9564.h";
    the PLL and internal fixed clocks are implemented and accessed
    only within "clk-tc9564.c"
  - The PLL is initialialized, followed by all fixed rate clocks,
    followed by the gate clocks, to ensure each clock's parent is
    initialized before the clock is
  - Updating the reset registers (read/modify/write) is now protected
    by a spinlock
  - There are no more "unnecessary newlines" in the initialization
    arrays for clocks and resets
  - An update to the DTS file is now included as the last patch in
    this series

The version prior to v2 of this code was included in this series:
  https://lore.kernel.org/all/20261104004332.2141282-1-elder@riscstar.com/

Between that series (v1) and this one (v2):
  - There is no more syscon, so its devicetree binding and driver have
    been dropped
  - The clock and reset components now have a single devicetree binding
  - We no longer use a syscon-generated regmap for accessing the common
    range of memory used by multiple drivers; specific sub-ranges are
    instead mapped
  - The clock and reset drivers have been combined into a single driver
    located under drivers/clk
  - The config option for the driver includes COMPILE_TEST, as requested
    (last month) by Jerome Brunet
  - The help text for the config option is simplified, first suggested
    by Philipp Zabel
  - The driver now names clocks using dev_name() rather than trying to
    hand-code a unique name into a fixed-size name array (also suggested
    by Jerome)
  - Certain functions now always return 0, which simplifies callers
    so they can simply return what the called function returns
  - As suggested by sashiko, a counted-by field in a flex array is now
    assigned explicitly

Alex Elder (3):
  dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 clock/reset driver
  arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  15 +
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 456 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  40 ++
 7 files changed, 603 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

