Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605996;
	b=IZl3dxctCIHIEIYkNHK8FAaTc2qtutySxTdvsWoKhIMPHF23EKG0n6U8oIulFjbmGxjX
	 m+xHqU1VgGOv6rBCHXMsfZrJ3IJwBiajY8gDUsqK2M/gYAOx0tPvQZpMhmXi0oEd4hf3i
	 TtGY1q3h2pufDJe8ccpOCzGyurcDfeqoM66EA+t/M6lcdHbHBpv0d79nK4nE4CHphLFCY
	 5bYxJKjSAmEHH0VIEXiFJuie6wVO87AL9CK4ZKJt4iEyEmwVnV7O8nhy03G6S5aY2HHw0
	 Em0/sEWyC2Tqco1wdzn52Q0GrQAGRCoXwkFCebRq492hcm1ij1MBE5+x9dRWXWh4uFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
	b=yZ7Oc/uogJ+DecVC/JAsYlulcXhDSeOMu88p0lay1RQMNaq3lzSw1daArjXCJohQVFdO
	 AC6BRXi5wtxMAjBpVoxFDbcxCvhlTQuL2OebJrQsInbOjiIghmKaATZ2WeY1sSoWThs0I
	 eMfRd0DqXHtVqsi4cTK9VUBZcyees3JWe13Z1Bzji7peQ7NZJCktU58deUxYN4bPvHy0W
	 8lfaXLRf/jST4Tf4re1IK1vJbtIFFCtQJU619wbOZzmB9JzeOUH4eRARDhDQlZh5nWnpw
	 mXP3qDI7r1/8LMulpStgJhBBArBD2FBhcWUgNE3/pk9y4tVvNayYargxiTTyaE5VEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuwcP9VL;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4DE60A262A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4DE60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuwcP9VL
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40e30c26a4so1260559166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605995; x=1796210795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
        b=QuwcP9VLjjET9UqnaCB4VTQ2KnNQAGTJSJ3bQCTHzKaIYapakl4ZQWGsaACsILb641
         W7KtxrisONpVDq4EpSVbWTvDXy86CqnaQFgdLrlYoSRKHlIEdQMtMDh3jijgGpFJF1yh
         EVxBpkbnO97KVy0aa67HyS/In4fpz0Sutuq4O1PuslmAC7w+uAGLD12pCFNFvtKF1c1A
         fKiicqVlZygJkGR80dlBjz1dOvPKQ1ObQ+qR2AxlVaY6MY5TvgX2iFg7mLF7XMYnoGrL
         tp2c0sQwBLFx7gQ6YUmGiPGoArhrmeIw6QsLxL3k4jTsuJKME1vvwF17PuVO+18EfydB
         JsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605995; x=1796210795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
        b=klCl0og0FisM6VuirokDhWEc0QrkipMhqaYIJqQbdICO6FF7of414Dj0ocWiSsFWSi
         CLrbUH2XmTkObWHZhks4UzQryBdbx98PZ9ooYSHllaG10XWfiZhTVA1VGYVvaUSleKlS
         nXQjJyOXM0OcPhyA0uS7Y3tWpgQkpRsysis6q84vIEWQ9pQuLBDPAHT//QoSCEaQMJBz
         4wgSalG8h5jr0VbeJyaGr4vnZDsADgXO1rkBCC/em0N4sE5t1xTfuLhsf+mpvdVXM7/J
         B/0I8CDfxEddX+1WXl31YC6n8p/5wgHAWDSQsORTz8y8EUN1abZ6Q5dNiH8drSknuqhC
         3Q/g==
X-Forwarded-Encrypted: i=1; AL+hErGrfXbSB7os5fgitKAn+Z4s+9lX1OyfeuIphgLuQXwotaxwOKArT4WrEJCAxscdwhbmhpIyF9/PJLEoqQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VQtWDFfJ8aa5H9U4cTek3gbawwFW2qdS93ZACH6UtzzJ+klqp
	WK6UwPedzButeFzybOESwShfNdkJf4ciKEfT/tEevXlUXL4jWtlW9ztZ
X-Gm-Gg: AZFdTZfPhT6gmEIm8MVDUa6wo4dHhmh6GsShoT70sOAOitPcKuHLtzFsXOIG/BeAgx2
	LDDWi6dGSJp1La1pQfeAsNjis+E6N8hkQGA6Qii2jAjVFNivWvf/t3KJqMX61QDCey0x9fl3eq6
	LGWET9IzGkKXX3uEl/MA/T1xUBSwS6EBAegi9G4UI155D85kvrfrmJSrfTSWCUjmzv8RLOulU0P
	3qCqNCAZ3YMtbOLN5X2SlQKwBRuh57oWSDlsZaRFy2Mpwt6+GmZcAezclO4fg6ipvYYKbXAFL2w
	rGclAp+2EWOAMhwinh811m7rRBOmAV5Pie3xy+RM0swLg23TL+A7lcI2qtWPH2g2Lk1GhE3no6B
	2bg/rQprDxkQdE3pSbZ8xxc/IhZAtdLt9REicAXiBW1sSEIYjOWeTBY1fKNjPvN2POkdywCfLxX
	HtqC5flEFTK9XzPX3TxWC8Nk8NQmK2u8qqNQ9xvV6nZtFf9yV3MblHgqEHJKZ/+AVEaH7DUrUuv
	IvW3qPBYA6EdnSjex94tULyeqvPZk/yo7ZU07w1axr9CJuQVDtcsVViQ3Ex7Ug0V6gF5kpS4Sj4
	lrrFj2R96GItBOR0e+hNd0xTgBuuWxEebxMeypcxIJvMZxHbhd2lCAwN8X3ul4H/64WoCxBMq+/
	5Z0mXkQFXiRIO3IjgGQLdVqAIBnwI2GQ=
X-Received: by 2002:a17:907:1c8f:b0:c50:9412:93f0 with SMTP id a640c23a62f3a-c51317e3208mr1522656666b.8.1795605994515;
        Wed, 25 Nov 2026 03:26:34 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 4/7] dt-bindings: display: tegra: Document Tegra114 CSI
Date: Wed, 25 Nov 2026 13:26:10 +0200
Message-ID: <20261125112613.237333-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Add a separate compatible string for the Tegra114 CSI, as it has a
different programming model, uses three additional clocks, and does not
contain MIPI calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 37 ++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
index a1aea9590769f..6296f3ab1d0ce 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - nvidia,tegra20-csi
       - nvidia,tegra30-csi
+      - nvidia,tegra114-csi
 
   reg:
     maxItems: 1
@@ -24,12 +25,12 @@ properties:
       - description: module clock
       - description: PAD A clock
       - description: PAD B clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
 
   clock-names:
-    items:
-      - const: csi
-      - const: csia-pad
-      - const: csib-pad
+    minItems: 3
 
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
@@ -121,9 +122,35 @@ allOf:
       properties:
         clocks:
           minItems: 3
+          maxItems: 3
 
         clock-names:
-          minItems: 3
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-csi
+    then:
+      properties:
+        "#nvidia,mipi-calibrate-cells": false
+
+        clocks:
+          minItems: 6
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+            - const: cilab
+            - const: cilcd
+            - const: cile
 
 additionalProperties: false
 
-- 
2.53.0

