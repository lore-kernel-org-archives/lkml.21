Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196763;
	b=AABanfwz67zRmNbvzuUYM2aottg6mjgQ+xNBdiaQptcRLC6LRPH20bfTE+zTrLulwf+A
	 Jcdlku6fF1WbUw2sHITMPq/GZr+SIpJbf2ayzzYvM+J7C3U+HyG6lF9xWChqCagYTfjMY
	 XvqYLjVu6sUliqDdhzcxpH8fOmDGR/bCqB8veXV4Spf9KHerD3x6KiyFZ3MZB+SftgpzY
	 6XCEASEkFgcAw1bNgEJmsDXfkBETnoFRXpYvOb8svP3tofYtoIJ5xD8CtnxORSZ6+VAcq
	 gp9sQDdImznvqmYtbPWWwMHi+peCngHxvtJtjj1Ath7D6DRGRkuqZV0K+GCJDfnbv/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jv3MzpXevrt0l8qTf3owJxVOyRgS/1wt1ixwNzlgoyg=;
	b=e8cV56Hf9CHlmV9gB5Wd06DTO67KGP6soI6hTFOhM6oYXQyf0+RNmmGpIeB+r5eaQvld
	 TtL0Frlx0Rk4RgwidJymG82BibQlvIsEjYVvwmhOdheASFaOCJlVV0LDh5yLpkjmLCK7N
	 GpO4OsJnhmGmedbgQ923uSOowR9fmUZkMRC9xJHOmQZjUsZ3YcFrbd1y73LdHiuxoALd4
	 kpsOH6YezKvH1MkeYMF2PsZlU3r9Xa/FLtTtuB0ea0wj9udFh2YGe3ovj7XgLqC04RG5n
	 YXe1NjwK1jIMqD79qNnG1nm3TAmFm9xl/17t7+wbqPMPDeMv3pn1FFRQk7NKmyyCJjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcKekxQn;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52304606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52304606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcKekxQn
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so927629a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196757; x=1795801557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jv3MzpXevrt0l8qTf3owJxVOyRgS/1wt1ixwNzlgoyg=;
        b=LcKekxQn+ROjfMk6duFoADABHEuBPGIOXrCaipvMdm2ps2wMWiTwRXpchpGTcTT8lV
         mayMYXudsTVG2zi52/NZGaSG0Ko9bx1qmmF15yP+aX+UcFMAZxegiZD82yW7KKIU6trr
         BtS0fWaA4UM1AaP4krajbRHyiugpwoXLZawzmFqng2ZxcUAW/lSobWb+J9AX3kzN93Hz
         lsv2cfMZ6KChN5A8yMG4oToUOSaN0I1sDmK6D1wVJkOldxIb3ObkS9rFo7hQ44KkvOQT
         rZEojMQ8wT0yV7930mHgGWCFjQdjrVLHgkyBW2+Bzal9FFWdhYA9AgFfr+llRMxcMKeS
         X2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196757; x=1795801557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jv3MzpXevrt0l8qTf3owJxVOyRgS/1wt1ixwNzlgoyg=;
        b=i6g/yZ7o1mdUcGYOEPl/aBtfn2VAdjpsQWGvJUtqw/wK2YuhWDdGot57+w7OxcO2zb
         zClTvTUiO8HYyFjg7dKrjAj7l/8dBXrDdmcBryum+PMgBSWAuVFtuFtpDD9DHzDlq6ue
         hSUN+KYAb3CHQFKZNS8+ytlsijYTlp5mjAALVDGhzdgBi/qtYc9muKQYvMKdTLz56pfo
         xaC+SgxgPhSl340RBL4Q6xe4UprHQug82CMtRMj/UJ/qQ8QH1hC+hPqkY+miHSRzI6c5
         aGXzx9RO9bV9/aCFYxxp0CtCV+eC9dCCpMnl6it2Sb4co/I2aTXzB5I4GNyMZ6fer5tI
         ++1Q==
X-Forwarded-Encrypted: i=1; AL+hErEHMeLVXBTPdfnWrT0PvBbYZkPqFZslao8AcFIirM4OlUlwuW0D8Q5iYQY48lYwWTPfCAW7NZGi9YN3v+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X0mCSaZb90HEnb2Fap4kMzsVvf3nR/Il/uP3EanBsR7ZoMpTP
	xzAgdVR4oozL7grBdd/FoIrkiuhviOilN1wC3yboniWkJlF+ZBdRIUTR
X-Gm-Gg: AZFdTZcszk2UZjwNd5Pqe4RjCxuONl9pxXpc79Mm37Ay3rOhYhN2CLm8RO0np2eeLw1
	mRU2llw/8Yt+22pIAYlJofygB5KyVgNArZVfGonqPQwxggBApjIP6h74AfXStNj9c85WZu2xLHy
	UbdgTWp7LIYP//sW0rLHpkVW8DEHcJslZVZbs54RFtDct6fDPBxKqeDfiuNtNNnK49/MNNcDOm6
	5qikQ53ZDXgrkxlHAcCq6YhoLh/SnprNhciWMtJKO9GCGvZwthsq3TmY2NKtxoWLwdn40Xzt5i4
	UjKF0Wr5pj9hUJ4MLBdT8lUH2Vc9ilIHBW1Y27pGZlE80rzCtFYxfWqTi2O773Eo+1bAfb9POOV
	v6XmUmIO/ka+u1Isv9xldQI1qNzmvEfVc1kzvAB3sUo+Jqix65RnP3kUW6rrrqB/zvik094tyA5
	CjgdyJN/AB3/Q7llfQ0X7ahxWMo/sOPGf3tgtAq+cBzSrQQwQKABo30OtnkgrE7z3qA1dYMGm7N
	QKq/n25tJEAozwJhRF2kxur2c6rbZtnLfI1eQ9I3aBeOECV/Sr6M+eh0XLJA2BKdNHjjaVfrUNK
	xIBg1+DTmOU5VoDv7sAE0Kxcb4wvNca87q8Bq8fTVNy+ag==
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr3378438a91.27.1795196756648;
        Fri, 20 Nov 2026 09:45:56 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm58052a91.1.2026.11.20.09.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:45:56 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
Date: Fri, 20 Nov 2026 23:14:39 +0530
Message-ID: <20261120174440.123487-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
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

The AST2600 secure boot controller also provides access to its OTP data
region. Reference the NVMEM provider schema and use unevaluatedProperties
so common NVMEM properties are accepted while unknown properties remain
rejected. Describe the cell offset address space and extend the example
with the read-only property.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>


---
diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
index b8c5cacb0..d8e19c224 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
@@ -13,7 +13,12 @@ maintainers:
 
 description: |
   The ASPEED SoCs have a register bank for interacting with the secure boot
-  controller.
+  controller. The controller also provides access to the OTP data region
+  through NVMEM. NVMEM cell offsets are byte offsets within the OTP data
+  region, not offsets within the controller register bank.
+
+allOf:
+  - $ref: /schemas/nvmem/nvmem.yaml#
 
 properties:
   compatible:
@@ -27,11 +32,12 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     sbc: secure-boot-controller@1e6f2000 {
             compatible = "aspeed,ast2600-sbc";
             reg = <0x1e6f2000 0x1000>;
+            read-only;
     };
