Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110888;
	b=hF2pag7NWth7Ubhj3hFcmjnpoBloO1m7JyuQRmPTykiZm+8KiOiJ6YWUOvrdSiycJO6w
	 cl5MfZl5Lfdg3qwvQt7omK8SNPO6e8y3wBJW4yDEG3OfoUN1D+ZtEIcaauyeVB+AVzepZ
	 vmPCpDnXu/OjtzrEnc5L7cSCp/KGD1xvoH6k+wcTt6ctQsyLBIESu9993OTkxTCQS9yFO
	 7wHl/X5bsiDpUcTh9onrEBk1c+rQVyXCUyXHBQcHvI8Ms9x6MzrLwvGnSccOSoiP3uDeh
	 ZEM+m30Wzqyg62qMWfDJ/yOMF2HY9SNmOA0GDuoVpNNIN6QoKsODdDezEzA770GUbeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
	b=SWpKV3iL3z/EKileWEF9KpFZ7gdgSB1vYiGX5vMM10Kl0G/x8RcT594cFwjok9H1cMGu
	 bbFra2sZvVK34dFVmW/tZN4vMM6hdgh7YcnecPs+r9Mm+7FtOpT977hsHYac9LwUOTpcX
	 6kjqNE4zLWeiH8uQhKdpEJNyY6mdLhqdU4mfv7vOJcHrJjvHRAevSOxW9hmKwbAjopNIJ
	 6OIjwMmAtJp/wq5RbSQJ0K4YZnucMySWgKlvrMhL0bQPhnfxY7yGHkst/UwO6RkhEdV12
	 AP5u2iKXpy5LyViHZuK4qtfveVJwbUQ1Odzuw8ZJsG10cquXEXWl43u0SIiQryOHkKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLJKvOTE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE3F60A2611
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE3F60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLJKvOTE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso26687125e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110886; x=1795715686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=BLJKvOTEDXNRK+uNanov6SAE0KTMeYRZ+p8fRUvQRH0CAcv7TkgBqfSPizxGvjeqCI
         OoUYAE8HDYeUpWb+Bq4f7ryj/JodSV9iXr8KekXf4cB/bSHHs0uuhgjlrkL8sRJ0t7kp
         7fWyUU2yzGsUuP1XQUKR9dHrLZtW8azradpbwErmoFbC03hSkJPBvswb81TaNbv5BKy6
         mkdEP7M7Hu+2mGJViErOdxzq1TrJD5qQRKy1mebdsnxCHY7jeNZH8nbyujn7tmuoLxc9
         2Pfvs2ly3xX3wUUTYJMBYdMe3yNaWv8bkNNhfe5kBRHg6/Cq7QBfXQCAGFRWQMZfFwq8
         rjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110886; x=1795715686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=TtdZHTzAqXttxvEANYA12dhsuH7ww8yxtZT8AIFU1KOyw7UPd+XqYRfPQYLkm/6f2x
         Oe3x9m6eArC9xq2LsYJVU3joGPeU3EsFuIDfrflX/g+pW7LEb9xSYaf1JobLdxxg0wjm
         gs9aAjNgakFik0XOXGSoC88YDJd4v4OewSOi0zI/vminQgy6lIkyqFOnUuTbn/sB4jqG
         nZqU0acg0ERRln8gRNmo6tyNuBVyGIv3X9FakrSMfSeyZ4W11vutBWCPOK60VRQOmi4q
         H0MWtJ19ISNhylhUD4WJuggA8k7X/HRsdoUUFJwcGQ/cXLdUttleWoCEkaZsKA2pNTSS
         7uIw==
X-Forwarded-Encrypted: i=1; AL+hErFxEOKvQ31NP/dynJeByzAM9AazR5c7GJIVhFYF/WxnvvxJnSHd+EIUms6XuCoS2/g6MuxHWkf1hWog168=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9iDXXxTu5Q0YNNwUFkBYNSSQya1LPBMziLbECJf3/uD+FcsK0
	YdaqOYMSRap0oOf4WZi+SYU7ab1UsO77wcRhSwLgLVl3+PNTb0lEKUtP
X-Gm-Gg: AYBFou3/wr+cA5yoIu9Zn1Djoju40oa3cw2wIA7S4A+8cFtG9Ra0Kth9WtSW9UxAxsq
	+uK2cjw/8XAQKRnv/EoKpGy+FkRQxn9e+SxuKvytEJ8EV2OsxCUbplZq9i1cAyQc0wkNONEoVzE
	fg7dwhy+bwAWOa48/U+PmL0ZVZOs+RlZ1mz9su76PijPChr/cqcvZH/jnV+qRdsBtlfWGyT/Y2Q
	/Y+RjdV8KDvNPyHR0M+2sceOUYL6YoKS6IG+jWB9WdHhCXuNtc9Gwu3hkv+B34zJcpfGmN9GuYk
	PJ2gbMB2s5zblmVQ25vePIuOLtEDvTlwVHkt/g1oWDzmM9p68NkIoTFf160ZP7baCpWr8Cv6F7r
	fyLTatVGr9jiTCa5LrQLXQR0Ja0LyRKrx8LTlpUy9is/40eXBHMp+tBUFXe/qIU8pZInDHdC/lJ
	Pbv3p4YmAZyuYrodHT6rf2wVZ6QtRr5RzyczbetHQH/CgM2BBpGfj7AlYvRPYNQrlxCqNFD7Ey1
	4v73eancFApYM7gxGInLE/qsQNG7tuvc5HtMDXy4k/RKqAYnj9GjI8pZ/HeUms6jTAylEdNjLGK
	8i1XWEItdOhAaMmyvgjLPJzPCiUTTy1qUQ+a6j1vpfPRwal3qdJ8GGBUOuzVcOsw0ouGfWJ6odN
	WsumeXgJJzd3bj9YNFNUsX6bMGMLJL+fyiJdEv1awTh6jO2zzSsxyk1PBjQOsR9obBH5OgW3VNO
	7mt/E23VXLSeQjU3mMl3mrA+B+/xgez0RbNu2J/w9EUeh0+apRcB97il4jIvxr6d+/MUXoC+YJY
	V8K4CpiZL+DI+pWsT40wxvjwaG6VVhnbsakjw7ElyYrVg2QYOTo6Epo
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr6257205e9.30.1795110886049;
        Thu, 19 Nov 2026 09:54:46 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:44 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/5] dt-bindings: display: allwinner: Add DE33 planes
Date: Thu, 19 Nov 2026 18:54:34 +0100
Message-ID: <20261119175437.2520400-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..0a07cb8a5f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the device responsible for assigning (mapping) planes
+      between mixers.
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.43.0

