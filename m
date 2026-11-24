Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505375;
	b=2o2rPjEevRhMm+RaSZDU0TikSFZy3i6uaM352ZGMJ6sBuuMWKbPqWhnNKUJq8XoKZFU6
	 BBine3g2FILaEb18BS2SFpO7/sK31JyG/7mUsTyKaJHsmCMu4m53UAoW1xRmQ6FK94su3
	 vajas0q1pO/895qLzD461atd9J5MrWCJxWl7WcYvJpLz/sWVggK+/o9dcc+SrIDJsJ8Sk
	 rvYYXAt/ThJWXBT8Eq9tHc2MuVXzU3TRji3mO+ELO1KkIJ7NYuUE+DN/vqXeJyLVlmTou
	 Kbru9Eo1M3g5+rrV9w8WJf20yx8pA5GlRgkTXLF0Px3/quyYtUVAD7WR+9ltYNTmk+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
	b=mc8xZ0ftyobVYH/k9uhFWMrif2SiSBU/rFWgWmMmSwMzCqau5G1QzJaWqZjYuzoctlNp
	 8IG2TLEvmJj6dWEqa11Krkerblc01mzI5pWZZ30CzZXzhc4vG2OHJEQ8B+fTEaBtxP9QT
	 LvlaPuLhxYPWVkcXixB/NPmu7/J62wH9Gx5EPvQTeYqmaFbunlf6uj1U3C19E3Aiu8+D0
	 RKwWP4dgptupGaNB2LBZyqMFg6/pP6vJiFn3vldkKXbhv+ErL2xwlfZ3T+lP4fCGqi2w4
	 qEpm3RWDEeAX0fCwVK0sW4fQsC3KwlK37RR2JaViJAXkm7hnxNtMlQDt0IGnwk6Q33w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmJH+tlV;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283B3606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmJH+tlV
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb9f760337so2609897a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505374; x=1796110174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
        b=EmJH+tlVZK1LsNPWfFtvfDQRHW9875Cvy2+LpAGhSKF/UW5Ul7DVuQGke9zI2N0EL/
         xCpTUDfa2rLqSClt+IhND/C5kpdRpxd+HEFK5HF8Im5vabKUIs+ewpNc/fkBulTj3uN7
         orQFCQvdETNvxubYS2GSKxDRlg19aVA6BwzAOT5UM58Y3bdymlQJKYmKkmKXATlmv4io
         bd0ayc5DHPdNT8Lgc+YMp4a34wBqS1onoYJEBtvNIlklOFlABTiEL05CvSi8slaC/NI6
         XD5UfaLI6kNx2p2xvdwuWGv8k+QorqBc0sXxcalYQei8NkbQC+pg+AfQapNiS4VbaQck
         QOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505374; x=1796110174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
        b=dcZEQCkdXK4c0CW+i5sY3oVfLRB8J6baUcCzVZ2hLehkPVt9i6YglRjuYBzunb/lFc
         f2zffgtHwhrNgWu+V/MKcAUZHLsCw+NPPrInYGhhOtY6Em21wL70QGUEemivzOfPIhf9
         0R/g1LsFurle/iUGsYMRqIc/En4xYH6pbxVUJVmNaaMxpi8FyFNkoYfpMtVXJGvG+42x
         8c/j2PwuOoFxHQQM5IJIoyRi+vv2FOVE0VHiizd2bOmwGXMY6o/O1IKkNqvLuQXKn0zr
         I6O4j7eqdXU5PHbeni9FNupa4kfmxSNB6DikcXdKNU+jINdrTiYi3jYSmZ7bawPxdr7e
         C8jA==
X-Forwarded-Encrypted: i=1; AL+hErFG9HfpqaHduv9wSxRW4VE/uWZfUTad5/o7ANgUldRDo4zubjJ2/i5D4Q7VZiop5llIiV4j3K80EsQr/28=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JTiO+Xe4pi3iSYV5bW3I04PJVoueJ7XMRyI+0c/9AnoiHu9W7
	7yt1bbbYX95a90gGM55qIOtsxyEa4PX6P18oyiGJ1umxcHFKTRItgUZG
X-Gm-Gg: AZFdTZf5gZk/pQ08EisWEW6c8Yxs6WkiDdrVG9wxpvJ4NZ126AcWQrfD9QaBPzqu4HV
	BZHoF5/G9xsb+9AWNxkTTp0INhoiMKYYnyZXl7wPVoB/Yy7bAaw7r+BkCGS0e0KAXjUDEuApR1l
	zW5RRNS5m1fJM18qkVcbkJYat96vGZO8XyRphGGcHB5iz/bH8I2Z08j0q1pZLjHmznOK98fLpwU
	0iQl4CDpc/eZKCZmwhbwJ2Gfx8bROjA2tohCmvRhiR31UDQsecM10w37b8EJVyLJA8KjRwVGpR5
	QfPLosRvx4XCAp1h10PnGCGkY2mdMsHvJSNchwVuj8Y+H6IB0zIDelce3yfy89nwwXKdGSXeto8
	ZUcxNor9N6D4HMH1fdFT+P2+WOZJvrkQsltuAKjlWYwCGO0xptnrMYfQMlyo+57c4vA1fDCJ8AI
	/zCRN+b/31It52Qc+5Zjj4ld1Z/hq+TjLWLoOb+x+cnnpwNY/p0Ui21kw6vfs0reF2eUzHdL24e
	0Gv+vY5JAFB7GrridKtUDLE3B9Q+TrYvqp9Hzq5UJsv3Y6E86pOSBcbvMjcWtTuN7uB0foReV88
	LF3LylyekaFm00qGbR5hYYifhwo=
X-Received: by 2002:a17:90b:3f8e:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3b41c7bc85emr8885243a91.5.1795505374392;
        Mon, 23 Nov 2026 23:29:34 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm8759683a91.0.2026.11.23.23.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:34 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Date: Tue, 24 Nov 2026 15:29:21 +0800
Message-ID: <20261124072924.556678-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
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

Sophgo SG2044 uses eFuses used to store factory-programmed data
such as ROM patch, public keys and other factory information.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/nvmem/sophgo,sg2044-efuse.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
new file mode 100644
index 000000000000..c87e028dc557
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/sophgo,sg2044-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 SoC eFuse-based NVMEM
+
+description:
+  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
+  public key and other factory information.
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sophgo,sg2044-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse@40000000 {
+        compatible = "sophgo,sg2044-efuse";
+        reg = <0x40000000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&clk 0>,
+                 <&clk 1>;
+        clock-names = "core", "apb";
+    };
+
+...
-- 
2.56.1

