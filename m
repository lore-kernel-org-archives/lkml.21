Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745300;
	b=ozzDm46kHwyseT+OeAbpgr6n0+fV5HeGrctGhlZsEl9XgVTNYD9PFlV2GA+FUiuw0QKh
	 YwvilW7JIJbkvlqfQBq5VGbcw8c7PvadyX6/vA9UhrQYvgWCH08TrMNd+rmko8WfS0EJS
	 xh47UBNB9DdYpLpGfZ0i66E08/RpR3zA9SpvQ9IExqUDmjVz81DMQuJFmR2JDB39xXlY1
	 46IrHH/wKr94YfqUtgUruAT0j7aBCyNGtui2fpiBum1NnGbrt0ziB5RoMcod4MxUx6yxG
	 fPLBHs8l1sJRc/HfngjEzSi/glE+jyP1lMLxHVpH4oD1HgZxqmeAldhyNP7maUK3whg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6KzTZReNBeJl6qCru1asKNz/QUPw2Qe74+6vA5RmLK4=;
	b=SoulYkJKtCztSxIvEQyKgElmhLf708VZR9X16D/k3WS2xZCEMFJcs8mWe+utT8xOLvPl
	 At7QG8AELTpQo7vKu5ApIowU38iLBhMaECrW6zvwCsQVZU8EsX+E6G9JczoEJNJP8iQKv
	 2cxZ2W/OHlbQwg3CIh+3Nt6U8sHcwOqwmGa8EMdhIjMzgxivpONcUgb26wJKmzYMmKsqI
	 Ad59IT+Gy67j+sFPQKlaxsudn0vKnBoDpNAtqcwORAgg0WMglnaBnLabW0GywuLM1sOof
	 Vc+LfWtj3PjX8cYL9ax8PpfmMDcOeJiuwNx5BTV0OxLfNOXtWOTiqwpMx/GKeVqHCWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N9C3/FNF";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF173606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF173606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9C3/FNF
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5121697f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745298; x=1796350098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KzTZReNBeJl6qCru1asKNz/QUPw2Qe74+6vA5RmLK4=;
        b=N9C3/FNFP3MR8xmkielU+FgyHHqBrpcO5Lg2JkYiZe8pVA8Szc0gi9vCv8uDi1/mbx
         6S3fq+4PiRYNNMeCOoPLck6OzsWCK4Jy5tYTuJy6ji7X3/U2MmFidXynqUwkI1qBbDFx
         VDClOsAq235UPJPRlj/By2pnoLAoBygVTC7PnpDej/dwhP/L26KDg1UKkrMpvCUxuZlA
         Ft6vo5HlqBNg8C771CGsA9sJzIYomtTYZlvG2SZaKmAXI9pe0R1+g6giJycubhX7o3nW
         hgvsoKrntYy2gptYNMOjJ/oX6MGoJSn9pLLg+OUrIm1TIimdUVlGvDqr3k8C9XXvwrl0
         fP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745298; x=1796350098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KzTZReNBeJl6qCru1asKNz/QUPw2Qe74+6vA5RmLK4=;
        b=wlhlQc6OseP7sglElSIiDwjeh0K4hbNK+f/LlXRYAvLkTQARcl8lywKKxfC6GB2TmI
         G45yBMVOv6xDA7p88AYhZkQ6jCl5wE5BEIyiUH6WCWr5Pf4y5HUxv4OzWrhyfoha5N3T
         OFSn4g4QruSjuCFzh5UxgMhMzsOnoHhEZVBRNu2zxeZTWYP7uKgEYCQjOpSwV2bhZiKQ
         MW1EXgQmSVGu8xnHDlPUSQiFb9zfWRgxbgiNy6rBJKhGtWnY/uoNgZ8my+FHh9WBEnaA
         kA/pof5aug/RmjqZTBZYFofmPiuB7Gf41hz65n2t0Gx7gTuOLukEQMUaQun+JaySttMa
         uAHQ==
X-Forwarded-Encrypted: i=1; AL+hErGRnJULgHmYFAjs431AHfOEbz6+vMWi++qmE5NmKjIx98NR/aBNbGAei2zgisrwzhQDet0GhTU4dq4wukM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eU1xP/BOVxIReZFrG8gJP/9gTahvo8Zh/CkO95camphp6a967
	dX8xe7mCQHR1LRCQOr6aNYNeE/cBB8oxcV+a3A8cdWLQpW8h0Cba8ab5
X-Gm-Gg: AZFdTZcukpzIBnro2t+WHFYbQEJtSc8cQ0GbTW8aKQLkdpdRs7Wkdsvk2NgHN8ySnZq
	8MwLYMFZPdA1YwAIRwczoqug//vMX2kQSIofvMmn9BNPKbYtxdS+BVuOijC/co+zkQZzWwM69jZ
	u/3+K6mON3dZdy7AbQlsW+H6E1j25HAkOgB+wxXic+qIGfm/KXmylmUkbOXMi/sGMiVF0aPF1T9
	rwZ9qT7wUfSbtIOHd5kZh21j/OrjD992Onrx2xShwGlOL+lPvoIFgbA8WO8PQnA4SOR7d6QLRXv
	uMDkf33m0v86U0UPAztcR2S0Ctd46m1dOURAN45mTMHwCtvQI9AqG/I3nyJvC0zWQRNV2Gc9K48
	PmTA47kLLv9lllddPFD0Pd26jwqxNJGTh85n2LgEXvZRATIYiNesT+Zk9TojTqTSX3yWGoSZw7P
	VID/3RrR2/LLpHIlCjVpO3XzuuepQIIbHh3g/KjzzGETZMt60Kph14nwE/Y/GKwkx2NldLXskJ3
	p0rJZgB4EeVOZTvzgcvkm3upLlxX0zMY6ndXW3ay05ogYOrMlQh2XEZRmbCTk8eZlxPBDOe4/+L
	5oNNPPN0OTPJ0Fb/fvN/FmLdsSb4Ix8r2gHHgLAaW+BHDxolBy4cTRcUc5ioBflGKc+Ui8buFQC
	Hf1oAUTig4DXBFPnq29SoGHFr+zlrE92YWg/l45AYlwTWDA==
X-Received: by 2002:a05:6000:2482:b0:4bf:2f54:9818 with SMTP id ffacd0b85a97d-4bf2f5498f1mr939131f8f.34.1795745298260;
        Thu, 26 Nov 2026 18:08:18 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:17 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 1/4] dt-bindings: display: panel: sitronix,st7701: make the port optional for DSI
Date: Fri, 27 Nov 2026 03:08:12 +0100
Message-ID: <20261127020815.1621790-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127020815.1621790-1-romain.tisserand@gmail.com>
References: <20261127020815.1621790-1-romain.tisserand@gmail.com>
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

A MIPI-DSI panel is a child node of its DSI host and the driver does not
use a graph port for it. Commit 2f50e0a0f9d3 ("dt-bindings: display:
panel: Make DSI panels port optional") made the port optional in the DSI
panel bindings for that reason. sitronix,st7701 was not part of it, as
the binding also covers panels with an RGB input set up over SPI, which
do need the port to the display controller output.

Make the port optional, and keep it required for the SPI-controlled RGB
panel (anbernic,rg28xx-panel) only, as that commit does for
ilitek,ili9806e.

The Allwinner sun6i-a31-mipi-dsi host links its panel through the child
node and has no output port, so the Miyoo A30 panel added next needs
this.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../bindings/display/panel/sitronix,st7701.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 044b84d8638d..3ca9aa215b7f 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -54,7 +54,6 @@ required:
   - reg
   - VCC-supply
   - IOVCC-supply
-  - port
   - reset-gpios
 
 allOf:
@@ -69,6 +68,16 @@ allOf:
     then:
       $ref: /schemas/spi/spi-peripheral-props.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            # RGB input, controlled over SPI
+            const: anbernic,rg28xx-panel
+    then:
+      required:
+        - port
+
   - if:
       properties:
         compatible:
-- 
2.43.0

