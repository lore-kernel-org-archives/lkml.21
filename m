Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009930;
	b=jbSFILAlmi0PPqmArhJP8I7LLLNIVnQTm2rElpoFRVbWGBjr2s2yEArPv0BpFlDYQcQn
	 1FlkQQ+A6k8VV4jawLpU249L0g0oJSy/xP3GrIfGsl1n52JVC2pMoBjxz8BC1kEJ0wYHQ
	 H77u1uI2ktrvyLfhmSN8WMbocRS8WnR7j1RPWjRuam4eVT+1hj6XIEccEC2tLE30nSSrF
	 PZTuvN3YMgnHhrGZa6GalsVVLlPH65WAhMGwIV/jj75sTTQe2UXoABaXWLiHWlXLRYlSG
	 cNnuhwWI0VuyS8KW7G5n0hmY3WRY4nSUves63MpBG7jRzgIxSrpQz6nwGhMyVfq67bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RZ3vrLi3jrHMyymz0x9oO4kFMwY1lDGMb6nA1tnV5sM=;
	b=VulwaZ7i/kwzBD5255VBRO8rIPjTTnCAxhbOfhRBt5Ye7i8kWuL+XN4ICje6/h6i13D7
	 5VPtXuvH2e3Vqq7MJTaTSvmOuhUQmH2MqRosdUn2bkCdPF77DuomNFIK+HJfPF428WQeb
	 77J7lm3rGgcdjPQeVv4LJKrvde81HbqO/WMX24bNaWs7OjUViM05rzdg3tjbRhNKho0lb
	 BwyvtAPyGckKcyhlT7leqlZde3sVp+ZtcEgjG3Z15/uX4Mr3Ya3J8U3YM25vZ/a2NCbuS
	 gj8r6+dFW7NwYwkGgTeLXo4W/W1WDRF5ZO116yv47HY5kYRRB4RkDakOdDvKD7xBtLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUh7vNMO;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2B5606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B2B5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUh7vNMO
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1525707eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009929; x=1795614729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RZ3vrLi3jrHMyymz0x9oO4kFMwY1lDGMb6nA1tnV5sM=;
        b=jUh7vNMOX92+1VlBCYokd3NJubAlepAkfnGuQtZI9Dhv5lpHfCp/h55IsavVneJCKg
         bCcv1DTxQeopWLPAI4K4g9vpWzDj9y09Oa1BeBwPtNCvmSn8dsT3yTLX1Bk4ERa12XCS
         rQh03S7Hr1CuEOyKL6egrJqiaZMF4jbUjJW74GzzCNgCanUy67o5G5zGrDPBHGI8Zdg0
         +CvV4VOSUE7GE2IH5KACD493L3eApA+/DKyzkSL0gyjX/26dSB9EYDWePBjIeZdhdCo3
         XQ0IVJe0INHwXbVPT8HCNBBiMBTQY7PN09GMvVvvvtmiz7X3z/pjpkkVDChNtNwHap1I
         r5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009929; x=1795614729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZ3vrLi3jrHMyymz0x9oO4kFMwY1lDGMb6nA1tnV5sM=;
        b=CPgZiKw9Nq5x/lPBn6OdexwuzfWmCR94eKr4H/m8lXinoni+QNTQ8D13CA5+WloaF2
         KfsXqlsN+pwkkcDTZCvpoVvNL4N9GHCLcuno3j4pB/OSh4TMZjK44LODxiT57xF0VIPW
         OEpfvEzy8f3ImT2xkEyVi0Evim8YUZCaFgNd0LCon8b6tMJ4hUBPAGDQ9r0nliCCAbmG
         awFtXlHrwPtLisp1s7mq6GnlHJpvi8Tm+EHWRM2bUHSIudSz5PgvDmN8DBxzoUg3bS8E
         X1ADxqIqiuibdAJY0zZOkfvoNcxbrzDo+enOkHhjFG7CGjNVT7NavIQpJgJd+5YJiY/T
         ENlQ==
X-Forwarded-Encrypted: i=1; AL+hErHqsB6EbpUOi4x0PKvQfEc/Yk1CPiPgB7d5cBRM0RGH43VjHmRTB2Wh+TOtm8uz8Sv+hUv6Z8Lf/qJQxJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UuLfHUlkjHzhOhSJCM7R8HnRgQwuT30ZtKgCkg/5oWYG2v8bm
	osvMQJaPC8VcH7G7m+1+OGVqs1lX5XNGFVfhfnsu7FqUVANU6pLJvTQ=
X-Gm-Gg: AZFdTZcLHk0ot7aZO/QQ6PsFrPYh+EZezUxFWqwLkxrSUGitCWI1VwLviZZYC1An8ac
	Xraej7101y+ePIQ2Vz8RXKDBj4qpuPEVaOShGjLP1WPEXu5AaR75fTUCG0dEPVGHE3qF11XPMy/
	8TIvYE0aINbCZAK59/l8+rkarSPCboZ/8cPWU/WDzyAlznSF9F9aE+D400aMULsAd5nd2bpffqP
	6XUXPXlSmAy5x8Px6+aXcdmQZXrJWnVEVbz9V9J7Hv0D+XRP+Ba3Ll2lK52neVJgRZ/ypQUrPnX
	cx5SJ3zz07QZPI0y+lcJuf1Kjm0SNvydo9QUI2s4yk8Gq4ufg90cleqsdX/wAqP2srK76MEee4y
	RWIwfa0LMHQzT4UdUNwLrESyNqs0VddUkArG9HUZ0WMBxjBFeFc7ktqzhTL/KtDqVusNU0i0aDc
	J2WGdJ6Njx18RIJ/dh/4fZQGmwqAtBWu45SZotNLQcAzpikYJE5Ogtw6vvJ5aRzqenRyQ0dNwlQ
	YvBBYPClGXx5ZsjKge8HsvcF8OKk2gD/MJV9kSBz8nHEdXe0CN8E0O/PwQaBLiE79AOSGQZDCDg
	OCvqRNKEmIh9PHrascRSwOKMetU0WVHlqDbo9GkosfXpTz/emUTelwSZbK/rsCSwxVGabuGR6ih
	4YljN3A==
X-Received: by 2002:a05:7300:1c9c:b0:361:1dd6:531b with SMTP id 5a478bee46e88-38281025c89mr2808520eec.26.1795009929066;
        Wed, 18 Nov 2026 05:52:09 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7eaf3b3sm9576421eec.27.2026.11.18.05.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:52:08 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Wed, 18 Nov 2026 10:48:53 -0300
Message-ID: <ee36486140ce93f97d78ba526917cafc896b7e83.1795008752.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795008752.git.nico.antinori.7@gmail.com>
References: <cover.1795008752.git.nico.antinori.7@gmail.com>
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

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Note: Carried "Reviewed-by: Krzysztof Kozlowski <...>" from v3 since the
only change was the removal of adding Chipwealth to vendor-prefixes.yml.
This was added in commit 058ee00216a1 ("dt-bindings: vendor-prefixes:
Add Chip Wealth Technology").

Note: Based on drm-next commit 601c30449c80 ("Merge tag
'drm-misc-next-2026-11-13' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next") to avoid
conflicts when applying the series.

 .../bindings/display/chipwealth,ch1115.yaml   | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..6b037c40242e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/chipwealth,ch1115.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipwealth CH1115 Display Controller
+
+maintainers:
+  - Nicolás Antinori <nico.antinori.7@gmail.com>
+
+description:
+  Chipwealth CH1115 is a controller for monochrome dot matrix OLED
+  panels.
+
+  https://datasheet4u.com/download/1576606/CH1115.html
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: chipwealth,ch1115
+
+  reg:
+    maxItems: 1
+
+  chipwealth,inverted:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  chipwealth,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 0
+    description:
+      Display start line offset. Specifies the vertical alignment and row shift
+      along the Y-coordinate.
+
+  width-mm: true
+  height-mm: true
+  flip-horizontal: true
+  flip-vertical: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3c {
+            compatible = "chipwealth,ch1115";
+            reg = <0x3c>;
+            width-mm = <12>;
+            height-mm = <8>;
+            chipwealth,offset = <8>;
+            panel-timing {
+                clock-frequency = <0>;
+                hactive = <88>;
+                vactive = <48>;
+                hfront-porch = <0>;
+                hback-porch = <0>;
+                hsync-len = <0>;
+                vsync-len = <0>;
+                vfront-porch = <0>;
+                vback-porch = <0>;
+            };
+        };
+    };
-- 
2.47.3

