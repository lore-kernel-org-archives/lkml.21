Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110615;
	b=YQt2w/u8LJXfUob4nUjhMXlfGg75B2RoJrhAHksJVxWqLKVJp0Jk9SG16cJHdOEsKY/1
	 1hON7Ptif7vaF+P3a7QoLGFgeVgzPdjD0UU/g/zMd5gWvdmqzf67+t4wo+TLkrrB7GxDH
	 jSQXZ6eA9RAOVm4Tu/NPCivb9/nUZXvQebR+nzLUacY4AWdgLGhDogZVVIBaIV6f/Lcp/
	 4AQCIr531d8shNLwO6iPzfzQo9MgDJJNfCzJNTr91VA2wHbyFT02uW25+S722+EXkG0hB
	 gK5Zusce4Vx6xoA/9ShQUSKAxP7DwLWSlcgvZq6r7pMtiZD1Pb4qjn9H+zJoavB2maA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=esT354LfgWAtzd0fzH7vF+hhVEnmCcI3/TAJZroHtbo=;
	b=Xb0TwDmBl1NxbROU5cwjqFLch0h5s6ATlgrQkx8dsrP1mgTKQ+1JsGjn2OF3yETKCL8j
	 Uolrwf+tWXM59GmhCqmMnfmzQSPsceX66KoeqHOweIX3qPRIePt4cVc5Dsl8cmTpN/PGk
	 D/rBoFdiV3HeGtsd3fqk0RU2hT+mD7sxHORY0mXWlUvevRJmR3Qk0oG9gweOM6jtKtZEz
	 66eWTjoOi9V+2SW+semYaqvV/0NN4jYbDd74wGS4FGSKRFxwVX2JTZ7EsnwRQXDriWtgn
	 Whrz0MHf7y7r62brYTYQxu4GHmMWsSvuufo7YTwlCBKGbiGDZuEVu2WbQIbqmzhMgww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HqIwrB7x;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F1A60A5BC0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F1A60A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HqIwrB7x
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a357b1c649so1695743f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110614; x=1795715414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esT354LfgWAtzd0fzH7vF+hhVEnmCcI3/TAJZroHtbo=;
        b=HqIwrB7x2+DpqqIgAt1fYw2X+S0cMj8zCUqo/TtX86KaS4qJ5mPzW9HLO8eqO2WDh4
         f+Khohjj9EDyDE4t1MOVwWqhBgN6AjH76sRgY4qojJCrR7L1gJ1A9Fdd2lpjkHyHD6lt
         5VNSXCEizYBZRgwGV32R+VJPHlhk9toLuBUl200ttN5SIS68yC4iCUGC0blpVJmbmYxL
         EKvoeT6aFBbexdCppiSSpaeeAcR++6QXZG3HB2r4kmmF95cLAX0hydKb9sIo3CnsQdCu
         vsuCknPexkSExhRu5B7HWAu4hRQ4egkHYCs+QC+l9Z2clQ4LZmhyI0afLUfzzFGEUIYF
         pdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110614; x=1795715414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=esT354LfgWAtzd0fzH7vF+hhVEnmCcI3/TAJZroHtbo=;
        b=CfbdSL2I1rmLtbTs2mjVUSoSC/Q1KF/J+am8abckiDLWzniOKiu6gaQnC77miKx+xN
         HGqdz8KTxh3DQdsuxpEYnA+75yj2Erb1C3dcRY3D4vUoFjb3qWAYpYK2ss5R1yRiUPfO
         Q+XbFZZZmotPTJK5S61gBYx+sf1rkdVBJK4LS5AjKVGFFpcV9EMrUGXSNKbnJnWdfNn+
         98qwVmjEYHxb8IWldDz6L4ZSABWkmqs8tuWDvFOPdheoBqLO3M2nX5z9dOC3RswAn6bP
         +WnxaQN9fVsyP/upzH6donRdh4O1acU5mQz1hHBksQVsKW2A0/+xtzQI0VDP3J+HJAH1
         giig==
X-Forwarded-Encrypted: i=1; AL+hErF4CcpNXUtlPKDFW1Dal5nZT9oOdira309oUFoFLrdqpoz9vGCMa9RdLONB2SWfIhim86MXZ2XcOjexdGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qcw3/NtmWIQfd+2X4TkcLyn30rP9xfcKbf3ANja49wHFapkau
	f/6F0wLAjyPTVc0EgBdKiBJxb5ekCO8we7K89KVfWq7bJOxmuOrILnI2ftHkoCLjnX8=
X-Gm-Gg: AZFdTZdOT6xnOZ0ndmyJBeAslGZcW4SfgGPAsgQc8fBQr14Dm/fU4IoD/an8OnCnDqB
	DRk5VdSO3WdJeMKYGbQleASh317pXXuhSO955RxFlN2t84f8SMlJoJlLJCtt/z14QPYQgpkNIe0
	spozvHx+BbPZM4gy3FHHHuAMLHXe+as78mSsk51sWmU3QfmQs+7yzTTBDT9Ye+es2uMKysgcABE
	ve/C3dq6Ua8u6ZYi11J1Bozu4Alg9n0duKO5Z1d/E6UBGuIU4ZnVbVYNJmLaVcbkkYApBhSPFBF
	/mMYD5CZXF0PoBJ1sNQbDuGjJVlcFf9KMQyRYyCk9n6TsUDPeD3GCZ663kRL6SevITbf6FC6GYv
	x0zypZsM5H2IJSiitAdQrgMoSPCHliw8IlgK7/hryvikj39aPu1KXEW3LXjZAm4zZ9my42OJ0V3
	WtZIe4RCugW96+fpXHUP4jmxUJ1H2EEQcY6tntlXdxG5Fz2zoWrK74XTjH81TVukQveObSUGPKD
	5rInXXLTg/zsAWgeagUGPCBDz3nEKDx4KEZ0pddYhkG3QQJSVJDlaNFLmzYJdMLnYGOfUANL6Hd
	mfBJnr6C7/S8h7v/HVg3Nie9Vj42fE6Km75mGmumjK+hl+ZqLWkFc0LW70L+iRb5S0JvSPBtwhd
	Qyiq87FcI7RcYAXIZDrhGP1WTxj1Tpt2hJ+rWj6LoldIh2BWbLT2qDHTp47TMBiaeWn6RfeVjY5
	crjQ4=
X-Received: by 2002:a05:6000:4a0b:b0:4a7:4efc:11d0 with SMTP id ffacd0b85a97d-4abaf740155mr279928f8f.12.1795110613914;
        Thu, 19 Nov 2026 09:50:13 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm876032f8f.30.2026.11.19.09.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:13 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 07/10] dt-bindings: net: wireless: add XRadio XR819
Date: Thu, 19 Nov 2026 18:49:59 +0100
Message-ID: <20261119175002.458988-8-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

The XR819 exposes one SDIO function. Boards may provide a MAC address
and wire a GPIO interrupt instead of using the SDIO interrupt.

Prepared with OpenAI Codex.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 .../bindings/net/wireless/xradio,xr819.yaml   | 49 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml b/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
new file mode 100644
index 000000000000..4f6919b6bcbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/xradio,xr819.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: XRadio XR819 SDIO wireless controller
+
+maintainers:
+  - Arthur Heymans <arthur@aheymans.xyz>
+
+description:
+  The XR819 is a 2.4 GHz IEEE 802.11b/g/n controller connected to the host
+  through SDIO. Its out-of-band interrupt may be connected to a host GPIO.
+
+properties:
+  compatible:
+    const: xradio,xr819
+
+  reg:
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+  local-mac-address: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wifi@1 {
+            compatible = "xradio,xr819";
+            reg = <1>;
+            interrupt-parent = <&pio>;
+            interrupts = <10 IRQ_TYPE_EDGE_RISING>;
+            local-mac-address = [02 00 00 00 00 01];
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf311e6c4be..6e7b5f6beba4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7211,6 +7211,7 @@ F:	Documentation/process/cve.rst
 CW1200 WLAN driver
 S:	Orphan
 L:	linux-wireless@vger.kernel.org
+F:	Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
 F:	drivers/net/wireless/st/
 F:	include/linux/platform_data/net-cw1200.h
 
-- 
2.56.0

