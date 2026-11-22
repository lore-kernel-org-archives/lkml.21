Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369127;
	b=WEsYmPG29sNrS3IzPzkQkddrrlO5jVpGCgq/FUoany3qrEC6OWUdDYYzm96aH0MW4Jnc
	 T9akU1RbJSmpLtSDFKu/AyMj/WCMxsNznSNQK5UqVH+puGeShjS02FV9kzJwkSU/Z5O+Q
	 JCdW1F63avHctZxS1stPKT1BGSI89ClSJOewOGoqPsAgLqPK0BQ6SYrSA9NM4dubrGs1J
	 fYK4xljkabWyf2BGW6hyQqAi1hmH/cWBFf8FAAVQjK0Jk+Ql3dqDXFCFpD8Nt/ZUJKReX
	 l2YztXSLK0BI47OJMQQMeGJ+X/JUUSyuzaha6cvfzCXVoTtXiX7x7y8JqWhkaow+AEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
	b=bB+SUudfRXYPlHhZ/I7yN6LYjbOdfZkapiUHcatNj+YLeEKpBF4OLcqNh/edTLlGHt47
	 IRWy629yyXy6nnVoKlauGjhxbGfjqB33e8qZUxQg/7vRlacyk7uLdZqW8DtsvQ/6aFy/C
	 AtOUp1mZiiOKYG1mBTX6mOxtTsP3QXu9QtpyuqZzlU/b6ToNc6uDeyYISRJVuhndzKhtB
	 R2WK0j1+84/a/A9RIzReEDAOY0vvOwuWDuBn9ro2UWdR8lIU7u4GGkorBL32qmBAmwnmw
	 tt7+P+GvPG4cPDN5SZzicpmNb7MA1Paxqkzg1EBmEi7wqsgcHVJwKLb1exB8irey3hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTwHHvqY;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F09E606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F09E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTwHHvqY
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3866a784546so3094545eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369127; x=1795973927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
        b=tTwHHvqYfjW/n++ndPB2P73YVBQbaAa//aYE0JB318M9ob2t7dFR7gpne9VJ61e/RN
         pBniat9w7WF/ij0iWB1h8EtHcLHHSHFDH2w+2CTv8Xkjltvv+aRlAf3+IDRSCb1mP2hV
         49BxUOle+04/PiNpSNaaDahhPL8vjcOBbJs9buq9AvGdjA7rqRJdRHqYvC3pzELP561i
         XgOr9XwKthBT8H1LZEnKcd35DE1r0PK2T7luqeRQ8Oi8bQLqq4ChqQlloLAdMYBD66gF
         M48x3w3QcUjTYcmGKrZwTBEKQ/NLCWOEVrsdrCy7TTDvIhkOXAjDSkNfjMKTTm+XSD5t
         YX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369127; x=1795973927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
        b=on459p6IvQAgsGu7xzYrsv4qx+aGacy+KrJp2uVNEUx3OT4Il08ZYOxTTXbVVWbthN
         PDNYTE3rLwKVAeqOZQ0a4Vgd02h0Z+LCr4MMzeaHGu1QBHWBuSDU1XGldhSeMRonkEj8
         hMzU0mV+O4rYQfRZuADLIdfS9py2i/bgzfiCpJZ8ofgMfkJcSKRy5LmzreXJ1rftqsS5
         oCo8q2ztDz8WwuOkd+QJEof/kSbXSAdm3nnKx4F84FPB1/8LRIRmur7cQ506Xqbhhn6n
         iBdLi49WLjhyLkgg5sWkkWIjg+rahxIOzpdvquT/FGCyl444GZPG98q7eb88g7YjO7qT
         2m1g==
X-Forwarded-Encrypted: i=1; AL+hErGju04NdzSwK742ivrOh3r6caX9ORx4jefth/TfNXMdhRYBXSh/4zyLEXH85UEhNP6iRWyHJOO9puX/74E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pdh5/LxfYMFlbyos/ed+I2RQA5UxX1uPcShuv5AiyJMwg4Ge9
	vO5iMbkcUyqLBOIoqyEEGTXVnnjfZ2PcEOB5UxDGm5NGYg3T4oIGOmhB
X-Gm-Gg: AZFdTZfIm6eYKKn/60kQw8RGJO+O/1viaz2ENGLgnrsAqMW0Z4pqA0FFwZSWnCwr0L2
	b0bSkiqTi13/VB+09Th8DSphlVXRR6LRxAR1YXJarDC0MAgUsA5DJJpShrebaHJJASMXBz1dVW0
	SPRdx56x2B2/I/GBxW4YK0awYU+gG95Lghuxmr9UKDBth7kULzcA0XE5TQyuPJDD6ia1ut9+CLG
	e1Vj7oThgcYCTY+us4CjU+nw7HPfdkphNfHX+KorTZZRhrc2RnGnbAv0mdB7XYl07Af//8vEgmx
	kcKKrjjtLGDdBIHnrgZOs5oBaJngFIIgrS8phSMje58ZdIqTkmLZq6YbcUi4WrvcgysClF9+Kt1
	3giuKsDaSbPmhGxL+a92KfEoweyFevGMJjDXzfMmLWdNIZZOI5vKPa4UuOfcDtXnJj09vXccrqg
	dgRG1SVRouoscdQAFO78zB9AXWRgomAPYOFFdLfNU9tERIM5fez69ue80lE8BALLXYkNJFmwLUf
	PWBFiQxa2WQVIkyZsOIy7Qf5X68+J0e3J07mOuAdxYi+wxN7xnfQ583hsUT4n10jWEz1Fb18FtB
	4tUifDy7neJY/7pXjTS5lS6PCom9zgyWYBP0A3nwXmqQfy1fBg==
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3856c2c4a0dmr11040411eec.5.1795369126430;
        Sun, 22 Nov 2026 09:38:46 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:46 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Mon, 23 Nov 2026 01:38:08 +0800
Message-ID: <20261122173810.2409146-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
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

Describe the SpacemiT K3 eFuse controller, its clock and reset, and the
bank-based NVMEM layout. Banks 0 and 7 provide configuration and
temperature calibration data.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
Conor's Acked-by from v1 is not carried over because this version changes
the NVMEM address layout described by the binding.

 .../bindings/nvmem/spacemit,k3-efuse.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
new file mode 100644
index 000000000000..a7c27ed1e3d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/spacemit,k3-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 eFuse controller
+
+maintainers:
+  - Jiayu Du <duge1256@gmail.com>
+
+description:
+  The K3 eFuse contains 16 banks of 32 bytes. NVMEM uses little-endian data
+  and places bank N at offset N * 32 bytes. Read access is limited to
+  banks 0 and 7.
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k3-efuse
+
+  reg:
+    maxItems: 1
+    description: The 0x400-byte eFuse controller register block.
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+
+    efuse@f0702800 {
+        compatible = "spacemit,k3-efuse";
+        reg = <0xf0702800 0x400>;
+        clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+        resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            temperature-trim@ea {
+                reg = <0xea 0x2>;
+                bits = <4 8>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..0a9eb764ffee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26525,6 +26525,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
 F:	sound/soc/spacemit/k1_i2s.c
 
+SPACEMIT K3 EFUSE DRIVER
+M:	Jiayu Du <duge1256@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
+
 SPACEMIT RESET CONTROLLER DRIVER
 M:	Guodong Xu <docular.xu@gmail.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0

