Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580147;
	b=I2hctgPNQbzI43BgyV/xAEHK6oIVHxXJ0om5h3q6ss5KtarGZM51CWg2gV1g/3aIjHn4
	 Nte3jlnin6TiyNKfZq06+08pmDb85TAlJ5Z2dOdi0zxi9/d1osiLnpNE2IWojIVnBAdoa
	 rNepuIIZvByBcFAWpco11X2pjoAb1Er2S6Z1qTS8atlLGti54MaWFwSQAbeG1qdJOWQ0I
	 Ggqkmudwd2nlGjzfwzbWbxueb2shsx/8bSAja7nS7S5/meYp17adofCrRkQNRKUsWCKMM
	 HidZkkM18EO3N35pjyUp41MZkGvWKu+KzZQ7exfGnRd8/HJQwdJ1+VdPniGCLTrwBVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
	b=fBvkcia9/qEu4u+FoHeyJArXvxwGTSL2uzlUrGsURFfDP1Myrcy3DNGoIds9iozS5GEh
	 9OCZmTUAFZmUsiGtX89OzmrlP17QKxfTmnQNyuB/p8rynrkhViCUrUXsasXsDAXws/IKx
	 clbkPpp9fd4ANTKrnA9l/NOhkOS35IoqZ2U5iUW/iiCUsp5dQaFLQ5TYW2KIprip4KpfD
	 dPxyt5C3IKSpIz6Y/F64/8LIwiObt9eM5fw2wYHtsA37O4PowS8bt1+X9y+HbcPY0Iqmi
	 zfJ8JZsAlY7Zj1k9p5QzN1+0xC0BA25RqpNLGJ3xzCXz1+i7uloEa0OIe1fnc5XHU1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RY9UffRu;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F47606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F47606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RY9UffRu
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so2396636b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580146; x=1796184946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
        b=RY9UffRu/b2u3n5dhx0nPxdAeyUJQhaf+fZ1XpKlVoaBHtN1QcheQI0PhaP5qVgqN6
         8QRqa4tEnEXCM21sRSzXp1x4YhLKv50d29Y+0RrgRjssM3+e0GXv+js4bzR31xJdXK5X
         pmozDbM9tovgNHS0blZx7WxmktDhgT5kSa8Q5uK3O0drzUR9HjHJw1+6nxXZPd2sQTvs
         mpoDTlOviZjjxdxdnJT441Qk2q7bfESj/BVstY3mZ8l33WGetv7c5WvxJoPR862XTtag
         1qWkLuOMZV5TVR4LSVxEd8meTUV4bLmMizPewvZXUvH94g3pcDJwOD7sBffQzyVxgngM
         1NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580146; x=1796184946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
        b=SuW7MjKHJUem5A19hJB3rjOluEg3QkiLVyKszun77duBvRyCNI8stu2nTIsSkF4MbC
         gaxSML63ew3KOP2ahuIAlAwPBQMJq0/KcJNVrUaott0+TZxFB9hnav6aZGqY81LoR4mD
         5CU79Rf1a424/q2a5zWxL5sM6FFs6HmeNyXtqNG+3j98iuPPxXJanQ4RSR+94Id5PT17
         cT4qr2r5ij4cL04m7PUaYmHdxOyuKG1Ycd7nhUyfM9hDikBWnRQrFmopITODSESkpRuC
         IRO7PeZ7Ngmb+a5EGh+ziUB2AImY7mSWT6bmKOi6io2rrg3jpeCfYvfm4Q7IIxPqGAsQ
         Af4Q==
X-Forwarded-Encrypted: i=1; AL+hErEwvFeJgU7BL6ggtTGBL2EyX19oKJcfcGxS+LTHCSYq10HUpBG0gNFJ6Zn4q7gHS2OusqpTkgFn16RoGx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lhy6S/cpobkT/FR9MIXemNzRLKUANrBKpIOs6oWZtDNKEvP7y
	kBaszF33s4r7ho+eKpqa0z9A1oPRl8Vja7OgoplQcGQgI0UX/A+HenPv
X-Gm-Gg: AZFdTZd24B08mxkpXGkPazbW/fyDP3lFjt2ItlE0dxVn+Vbq+yn9LmpjGv6BpVAIE04
	UoFZ5E+xiXOFveEM+IlRORTPi7Pqb+7EoL5mxG3K9I5gkFg82eJXT/b3s2QLjJkf1TRuZZ5yEai
	CuWhJIP5cs/uQLOSifnv8xGB8Fb/k0hPIsiroahlzgRZd+zRhgPtKveenb1gdmMp/CXYEBt8h6k
	j/9D7D0DQtxefEowztEPvu0yN6aPZb/SPf0Ipy3k66nkr4eGsWNhp+BzHBWcTb58idYQ9uBAbr4
	99iUzNnvO1scE15xga+yX/CMHMJlCmDIX9zYZ6DTw9vLY8JoxxA6b8Li5bDTZtktNUvEJU3FAOo
	VCu6RVfaAENavfNxP1OBOmY9TlyjdCGeP5Y1VCGHsKXTVZPlrnzM+zGklunP1QUppqarcdkba5k
	AyFJ7rZtxX1kIsQzg5v2eR/XFF2frXStEiO+flyW90SL1iTtqtLeJJ8EguaZKWHXIJTu6dWC0+A
	ejqU2NSEy03o6H4QuJ3TDfp5esPnCOUgfc1sS2awAKQj+CcHGTSZWILp4D447uDZt364u4rsz1/
	NHlEhLj8sANgh2BTGnT4y9s4yBQ=
X-Received: by 2002:a05:6a21:3b8d:b0:3e2:1a24:fb82 with SMTP id adf61e73a8af0-4014c94a7a3mr16524789637.16.1795580145986;
        Tue, 24 Nov 2026 20:15:45 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c272sm8306084b3a.19.2026.11.24.20.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:45 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Wed, 25 Nov 2026 12:15:18 +0800
Message-ID: <20261125041523.242588-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
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

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for MSI handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..91bbbc8924f6 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        anyOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.56.1

