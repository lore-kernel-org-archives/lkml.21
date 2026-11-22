Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329129;
	b=CX7j1/NVXaUMGODG3s+NYB3xPsNpUkNbfbxpTwFV0MXHRMA4MXxrGLXL6g+Wh3kZfZdt
	 r2gNbvob67Zxr7KM2FWsu5kzj+ImVwDRe7IGAkgRz1f0dRxeV4OKKvD1mGYFaWNNmUEa0
	 hJfBdKJoaKF69UeQZ+OLo2WSxKSDHCXxJ034M1YpMr+3Jz+pH9dlgOsRV4u5BQqH183GQ
	 Q4UWAItc+TYXxhNs5NJ8G/PwFX7w3g9iH2Cp1kH98zpNPXL6tLubhdL+8e7a3njs9yXVd
	 LaL8GEN8CuCqiatO50mmcwfPf0kui7ewTmfTUQ3HPE/6KzNInXFnIfVfj0XG8l48IZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329129;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Wsg3BjglTLTmRLGyC57EsYH3YV9hlJeE0KAaIAYSe7U=;
	b=foQJyfoycB+nVwBSXN0vpYvhdKXlJf8dKLi06fXFpb1twla1nCZDXJh27XG46jBmfe/3
	 HapvGYNWH9PbQCOtk8/4+7JDhek3fKYZd8eGZxr5SwgzG8IjZwlvdZ/iVpek5mNKA8ZcM
	 y6rV/hesG1hRjwckAH+YfT1bzwa1pOfgp2phjeRLJxjb+nECEpQ3xge300hGVyCkaB7Sa
	 wiMcX/h5+ff1vvgq7dWjB/bt7N+hIbB+7/f276sWy+rNVVh9DE2AlLaiEUi0kgvfMzPLU
	 /sVptuBCO7kXU4/CN74EUWQZdqCDb89xK4K7sEzlVg1jMiqh8iuPFl2nIRKjCb3fBOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="aBWG/Upu";
	arc=none smtp.remote-ip=91.218.175.154
Received: from mta0.migadu.com (out-154.mta0.migadu.com [91.218.175.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7838606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7838606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aBWG/Upu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fy4214U4nEGoGa3smWlKi7CUDB4S9Rd1+HeWfT3oEV4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795329126; v=1; x=1795933926;
 b=aBWG/Upu9FKXA5cM+IgwH7+D8o/6PXis4xo3+rThp1+XEQVBH38impwhagJFd3X5iFWwKDv3
 lLvvpgpAj41fWEkaYbfyiZ7taIkWMKv0GBaA/zNmKoniCj0gNxrK+43okp7nVv61BxVv9fPYRF8
 8Kq3wOfMAYkh4V1NJZohZojk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bfac500b101236c2;
	Sun, 22 Nov 2026 06:32:06 +0000
X-Mizu-Trace-ID: bfac500b101236c2
X-Migadu-Flow: FLOW_OUT
Date: Sun, 22 Nov 2026 06:31:56 +0000
From: Akhilesh Patil <akhilesh.patil@linux.dev>
To: jic23@kernel.org, andy@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	dlechner@baylibre.com, nuno.sa@analog.com, conor+dt@kernel.org,
	joshua.crofts1@gmail.com, maxwell@maxwelld.cc,
	u.kleine-koenig@baylibre.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
	akhilesh@ee.iitb.ac.in
Subject: [PATCH 1/2] dt-bindings: iio: chemical: Add aosong acd10
Message-ID: <45372cd111b6f23539227e6b568fd807a0b7cd91.1795326744.git.akhilesh.patil@linux.dev>
References: <cover.1795326744.git.akhilesh.patil@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795326744.git.akhilesh.patil@linux.dev>

Add bindings for acd10 CO2 sensor. This sensor has UART serial interface
with 1200 baudrate and can measure CO2 concentrations in the range of 400
to 5000 ppm.

Signed-off-by: Akhilesh Patil <akhilesh.patil@linux.dev>
---
 .../bindings/iio/chemical/aosong,acd10.yaml   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/aosong,acd10.yaml

diff --git a/Documentation/devicetree/bindings/iio/chemical/aosong,acd10.yaml b/Documentation/devicetree/bindings/iio/chemical/aosong,acd10.yaml
new file mode 100644
index 000000000000..bd6bad01550f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/aosong,acd10.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/chemical/aosong,acd10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: aosong acd10 carbon dioxide sensor
+
+maintainers:
+  - Akhilesh Patil <akhilesh.patil@linux.dev>
+
+description:
+  aosong acd10 is NDIR CO2 sensor with measurement range of 400 to 5000 ppm.
+  It provides serial interface over UART communication with fixed baud rate of 1200.
+
+properties:
+  compatible:
+    const: aosong,acd10
+
+  vcc-supply: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    serial {
+        co2-sensor {
+            compatible = "aosong,acd10";
+        };
+    };
+...
-- 
2.47.3

