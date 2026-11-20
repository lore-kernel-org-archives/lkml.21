Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199538;
	b=zWFoAK+SybQ9FxjYF/mfa1rOzVG6EZUSDKJ8gJeHgBgQrrfw1WLsAVtod8Ou1wBgiMRl
	 oag2n3ywQrk7YNY38Nq4HV9bqnC2ro/J7vq9ASUnE5DB7We/+CtjEcL2b6BPE3R+VQeJZ
	 P/HaeNxMwk8+WYsM0mUmacXA08RGwiO9L+F8Zi/5Ejd3iN4BuOH6qdoJuzC/k1W4v9O4p
	 hK+N4lpvBol5jSK+yfOz741f9AUFMxKbSn8LniFSbstDF3LvZEUapsTdvyRaHUF5aqGt8
	 JFXJi6jDeqWxKxv/Lcn/ZOG+LwaVTgyeTp24wtJMr5HlsRnKH6VGtd5cMgX9An7B3Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AZzAJOXnaWIOq2H9M30kWpYCCj54bYL5bDJVJVQmzco=;
	b=Q/DzufJF/Svcn1LnHYzD92zpC+RfOZMX8WtcsVbDM10uoB17/IOo7tZNRrraVBtXMT1P
	 JCav7g2/6KuCFczXXa8i5xr52R1wi2YdIYJ9wEZw6XJNGPMHVdTvudmSoCq9OrtIqHkXd
	 AlD1jLn0iYk0XhLx5jDKoS+3RdfKO3pHMNSX9FISsZYbq/1ccOITwXWiOsPYv/POajV3N
	 XLbdLObHfyjkF76JcGqGxrm6TnfN/lVXUTmE+ckWQYpkzqs2PXmbP5EvR/sgsNvSteUaF
	 oCpKmRGnaAS8tRmWBJEmn8daMc2ApSEWVGZ4CKIcvpt+4bKpWfPwU18k4Tn0CJwF8/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="pRop/DES";
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CCD606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29CCD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=pRop/DES
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-53ec2cc397aso830782b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795199536; x=1795804336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZzAJOXnaWIOq2H9M30kWpYCCj54bYL5bDJVJVQmzco=;
        b=pRop/DESQLuxP12DPijGnblLatGbW1DAGt6p9yKIMDbz8ts2P+L+xZkdBsiH/xAPgz
         ZYhsgVYwJU1B057IMpG/BrtRjVgS1bkd+Fmld+8SUAcOTv9LYJj7kDT1GYvINA2DH8k8
         XO3g84acUey/R3/xpXcenODNsfzjHb24PRBNRLZYFeN3GHKxiVSKpKUAaBi2JMHbxu54
         9jKt6Of57JdmQcoJAhCaSfymigMZj2OkVMpiP6ufZlPzVdkB6gN/k9fTcoHBWu2bsQS8
         jCy5lF1rmzBPe7J50AnAXZSXV33bj6GvwZ3f4MKY8el828ois1u1DDjvhNbvQrSXYKiT
         r7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199536; x=1795804336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZzAJOXnaWIOq2H9M30kWpYCCj54bYL5bDJVJVQmzco=;
        b=ixDqFSw2m0CbWmIB0mG/ecaGYUEFwjweINFn4QzLeEGq+oeL7t8AvVVrJ1yNLmw+Dm
         UoRNlK3VR+4O2euDch0vSnuXVcHW0RcUMlymHUCv1ewMmCi95wJPNV8qF+BTKCLAivnT
         iPJTo2NkOnutt19n76OfCsjG63zbTUwyLR9dOggv9SkRit2AFo3zwnIe6uYNgtvzo+c1
         i0KCprvCGAnrBVR0inpCZW2NcxyByLXE6H3CWiw6O6DxGrbnL0JjghbZKlgCz3cmHDvD
         MN0SEw0m47ezJTxoIRpQIcxTYuKJakzxxfpADtRQNOZsQOMsNw2v7/S6CDUFYZmWBCvh
         s1HQ==
X-Forwarded-Encrypted: i=1; AL+hErF5vKZePpinmZeEtlE2g7G9I1wPW7YDLwJ/oi9AVtiv1x3zZFlqnWIlCDI7ex4fY2eQAhWKpCbT8FLAibk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kfrOibVBDcPQP/gYcT/Myl/OJT3SXmsYVMvX+Y8jhHxmbK87R
	a+LE1bkiVsTYpwggPCud+8HCJ25+gqkRSBhTuSo+BERSjUr8ULMKcuGc8CThpIAVkl0=
X-Gm-Gg: AYBFou2hG914JAF0uAudxTEHdHJXPDEfbuhyS8kTHR5M6p5PU4jpxkmPL3gNubP9QtU
	BqrnyakWvej82BREmtfxPlWoiSOK27FVuQtdFOk1kXYWi7n7M/lUGjT6EyppZjJKNNu/18Ahnfs
	ZZPedn/4UJ8fH7IxKkLJ5HQ6EhPwnzR03XogQj6N9gnes7IJBhYRq6ux+6QCkJrHVUndt+XxInr
	yQpLNVAMQQJ8e+QMaNHKvbFBM2TMWwMFnmh4WgylErsWcm+7L4JKmycg7uQoEsxvtHb3zvCi35z
	D3gRJ2S9Ep3hi4jy/zlWju92oHHgk28UmjS4sT3pDX+yeheAVtcuo18VcHMcGo39U76AD+u67Q9
	ZaovIOA3xQj0XA7hy2txk1ex3Hz/80+Izdp7ofHEcxpcgC2jOLK1jUWQ+q2Z4xYkeMRHoV2euJt
	knZZ/QFz/lUmzU0zZfDiTbzYECyJ8v2RiIcat+PDJcBHC1gPJ9xifcoBwrQNFWrp3Lwou6EfB7Z
	Nr90QNpy0FElLENHB+o9c0dgh8XUKWuoekQHgz1Ge/elFA4E2NjEaZxnI3AVhdez4tR8AoPj+Q3
	dfqwe02RWCh+E3Huo8pGJfKaZEB7gkt1HCYh
X-Received: by 2002:a05:6808:3084:b0:55c:844:98ff with SMTP id 5614622812f47-57a0a93940fmr4840248b6e.34.1795199536081;
        Fri, 20 Nov 2026 10:32:16 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35055486sm2619940b6e.12.2026.11.20.10.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:32:15 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: tc9564: introduce a clock and reset driver
Date: Fri, 20 Nov 2026 12:32:09 -0600
Message-ID: <20261120183212.1264522-1-elder@riscstar.com>
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

This code has gone around and around in various forms, having been
included most recently in a series that also added a system controller
driver.  That system controller has now been removed.

This series introduces a devicetree binding and single driver to support
the clock and reset components present within the Toshiba TC9564 chip.

The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
It includes a PCIe switch with three downstream ports.  To one of
these ports an embedded PCIe endpoint is attached, and that implements
two PCI functions.  BAR 4 for both PCI functions provides access to
registers controlling blocks within the SoC, including the clock and
resets controllers supported by this series.

To avoid any confusion I'm only going to refer back to the "syscon"
series", which provides some additional information including links
to earlier versions of this code.

					-Alex

The previous version of this code was included in this series:
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

Alex Elder (2):
  dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 clock/reset driver

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
 MAINTAINERS                                   |   9 +
 drivers/clk/Kconfig                           |   8 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 501 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  50 ++
 6 files changed, 642 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

