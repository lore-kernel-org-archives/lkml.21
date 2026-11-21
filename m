Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223490;
	b=rHEoo1u+Zu7ug+SlZGsS07r9XdoLMUpvmANX7TLUpEQ5WyZAPDe+XlsvNM7UCgzyUo7s
	 UzFBSkJ2MrK8FRTcPW6j7T0REcDU6zQvZm/XBzKjPxXznDWKYojKd5Wc5l46fTef9WLLK
	 +Z45BwcrXaMnWm6Qa8XNcr+Zv62ftL7JMrg3/u6na/KzAizSbFWzKEqHimHkfgoobN7IR
	 R0VUBC0VSKzGMN35qIVN8kdoO8P+MjtgkvU66Y/5prn5NyXLnZc/8o/BIf0+qJ0RiI8yk
	 RA5slLphyBC5sKrFyqhtBW02Y+qe4YftjV5hosPG2ohKMBlybvCR/jFLUaXA6J/6cyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
	b=hoq5dakty/BZ6iplxtnDE9hLlWmARTstVGY7MwjGs15URasapw7dgMxqYlU4Ug/gxm84
	 c5RnXPfitHsae6xyzxE1mi9qS6qJepp+dyCTof17CNVQSOJsVE6gFJQu8yjbVcuARrxJc
	 /VfHcr/yDCvik8f5kLokYSynlnMENO/jhkpQ2/hBlvAM2IT2sUH3NJZNdB9Aj9TB2y8cc
	 Usa20uB9rGfFbT1TJiOcpt+LgjSrnSKumLPZealgY+E1z3Lr0iVUrNt8V+U5wyBfTZl5J
	 2XzOGJxJfdE+fXBgnxgMlSKpaQNIrJ50XtzEJVD3GXW5hQBevrD9F5+iSBs7k+DiEDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFEqmXol;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62DB60A6F7F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62DB60A6F7F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFEqmXol
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8631e07b756so608898a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223488; x=1795828288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
        b=HFEqmXol7+asPcoNseI+jxKp0GwSh3YBIw/yac5Dna0WcUaUQIp5/WOl/eXE/xjiq6
         KD96QHmz++ooZHw+Dn7GJzVuW4il8Zu8n+JPLbpfXUjAS/pGF1jtK/GrBgyPT9LAjOAm
         dtUcBRNt9wn+FQpxg31xHyEyK8w234DrCxC0PdmRxgJiFFWst6HxgxaO8OkH7b+CbqC6
         IzzieWsup2RsKr1gcVaFfQkRbyq/Rt3kdj7yR/KkwQ5VvyNe+6D3D7v2koavYEJBZ20q
         thlfDb4OHeSivMVkr6PYIryZfTMmEMH/3YLgnbm17pkNbFaN8UUlHvFqUxjcILJ3NNSF
         aA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223488; x=1795828288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
        b=wk8Qh0O/IvaxyfmcS3jikuM0TUch4TmrFbJxtw/rkXbuYLFzQNQ6v8K5YVwghWVEOw
         kT5VDTgT5VIFWdKF+cgT4Z4EZplESjvTRy1tyFwkZyOfyY5lijVAga6swDyIierW415C
         VCHUm7hoGRgGgWDVs8c1Hxdvj2Fo4lcFRToutrxlbfwukdTrR11V5ErR306zj7zG+L7O
         cxSznoA/BduyqF0SkoBU0hmMk6Yd6EdPLqJj2gj8dHFhder60DAzL1tD+DueWh9nzEuy
         Wi2bNVPuFfF65Y7Mu0fqzJVoJ9T1kPf89OwBcDFfy3Gi2/vym1/m4WQnThQo8ae0KHgQ
         s+WQ==
X-Forwarded-Encrypted: i=1; AL+hErHHNiKi4n8i5g/N2HGhr4v8hcQYn0Ruo1lYXroSZWEdLoa+z2ScVyvl49f+nX7rYxOm6cd54xZmfcn+RnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NDN4W2mGYW6rhgmD0RKBf92g9C7AssTrIjk8sKjHFYpkU2B+M
	IrRh/ManXQOHdh+h3SIxljmzzE8xRHrZTYnmoUWddUKH1cKQQaR7sT5i
X-Gm-Gg: AYBFou3X6fvMewCwMFtE0UsnHBb3ZKfnqHLb6Fu71Lh1r8WBNZVY+LO6+hHfzsG6lyS
	vg/JJGVO7yk8iZuO7Kitr1ifWKURHfGW9lXOGsOZc6U59UMcZ2ZeRzRc6xjJuF+O/l6v7mJD2n8
	eMvHwPge36ARuQH3NT0prAB6ebLQK6vXgP77U9X92fxASep5ugYcsvjF8gpG8Aa5/6SypOzneMv
	38u8iDxWYPAkAROxXnhWF2Bb8zD131BagfndEi32L8QBejTNQC4ysotEmcwGCS+mA6WOGmk3cdG
	cED9onIuQGUxqWMH/RAoOGFFmYjaVGX48LTtcMqgJ7pMTuRr6qZ3LuTDpSsfX0d+e/xg4BweACa
	iXr07MoG8ja0skquxQyoezg6P9wX+ZoE82Y8yQubuj7T4WSn6MR8K+KpdM2lxCmooEwopIGJBtv
	ShkKtUK45XQt0SInoMkpxk/xieiurrpKwJutDI/HWgg0bUBDQQrB/ns+aBIDZ317t5VB14C2yQL
	ndcUp5ypqre2pgCFUG67xEp46TboECCdysqnrDmzqPAyDPPqrAl93y40wMLfq7ioch1UsMunzpg
	ikoWn3rd1Q3hiM0b9xhOzHDv1JpxeZHf9PYgXkcl8KIcSAUdbLKE8deVkSnClCtpKhJgZrhRkTn
	n0IEVBzYq6mhxuJqeuqmZbpINfbdLGp5vug35kHYMDgbeR4FcVxisohlFtyiP8c//uTpsT+vqew
	N7wwW8wUVdT3bQAp2ADL1F7xZ+Y3mfYmVBgdWxl35iJM/AVMVa+utu
X-Received: by 2002:a05:6808:2220:b0:572:e8eb:36a6 with SMTP id 5614622812f47-57a0bc9d273mr5655190b6e.56.1795223487680;
        Fri, 20 Nov 2026 17:11:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:46 -0700
Subject: [PATCH v11 23/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-23-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

Normal NAND reads and writes worked on H616. Fault injection exposed a
failure when recovering from an aborted internal DMA transfer: the
controller's soft reset could leave the first subsequent read displaced,
sometimes without an ECC error. This was not observed during ordinary
I/O.

The controller needs its AHB reset to stop internal DMA and restore data
ordering after an aborted transfer. Require resets and reset-names for
the H616 compatible so the binding describes the reset needed for
recovery. The in-tree H616 SoC description already supplies the named
reset. Older descriptions that omit it were valid under the previous
binding and do not describe the reset needed after a DMA abort.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..ccf616fabc91 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -119,6 +119,9 @@ allOf:
           minItems: 4
         clock-names:
           minItems: 4
+      required:
+        - resets
+        - reset-names
 
 examples:
   - |

-- 
2.53.0

