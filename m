Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850174;
	b=IVG2K+2XvyLS0cE3Aj0HARWdgH2f63gnfYDp3qd9OMu9tfBKMvVI6ixNzZ/5iIN1zIE4
	 Zs8YggfKOUhBd0hXR1N6nu2NvLT7BsNuh4P8XhdAHRc8H8jZQ5CRkwPCwGzuvzgO/sM5a
	 okJ3roaUEL5xydpMIZhuCPbrF054LcdHrhK9FebGSR6Fn/y8futwXz/Duvt5pTtTzmJfC
	 sYuj6FgQOPs6M+yYLBsmWSDH5/DQq2j1RV8A+YFuLw8dB25MXagmJ1RbQaL0CiQBcAuZ7
	 6vXTOSZ1Z+I872koLdNSw3kFaG2BRY5948tZD50501QgUfDk6GyUFJpmw/dQ4gXcOiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850174;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dtqYmTVYC4JBzLZ7wsVy+ZmEXW7ipAMfwG1KmZFCxQs=;
	b=WU3zSZYtvp7ik7o9walWLeWXvv9WaXyayIjvfVwanwzUnkbVAK9AjuWl+60a73omE8aH
	 aDxovOfQWnJmFGtOsYOdBpCghdl0PXeuaXDaVbpkrCm2+hEZ9HnxFvz4NsrJaRsMAnaUq
	 TSv00qOHEd7+6FiNDIaaesE1iv/7g9l6LSoJYBVwO8npoLGobwn4Yp8MD9jHV1zQhS3qV
	 YjGcRfiUJklMP4ri0Mu2wQNiajeSq7h/VBF+4iK5dSJSnWSlO/JaxwSJbmqQKLNJ65Een
	 FbqC5zU/uYkBBevcx8mWaqw4n21bAftYmdil4JzCRaNgHe6HXE+9lGal9iMZr9jRzkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8836E606A329
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8836E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so60266185e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850173; x=1796454973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtqYmTVYC4JBzLZ7wsVy+ZmEXW7ipAMfwG1KmZFCxQs=;
        b=JmAbfDFgvIWe2ZYiUagsJeUkxypnX+15c0I6sVG99c64EaWYs1WzZfGwieagWIx2Fz
         FRrq7APhDGp3NXurR+OTCHvnZzgQt2KhYzDChcVM5aXi/uH9YJLed5K3ghAvX3r8v4Px
         /LafY6/LmwBOFTYxdDsC+L9NMyGoYBDB3vN3stSI+xLEDF9jcnqkixVTo0B8PcMZVWxe
         ou0AXsIAAzhWbYeHmTA25FNDDTnjc8/dK2tHNxlry5n+FjkcECImtMOL21MZkpSKiMKj
         D5u/IQdOPmb78DLIWXGiRFUyjlyTk3zoPgVNWLaBcqM+iqOeT+M56jMwnox/eTOySI7X
         VtMg==
X-Forwarded-Encrypted: i=1; AL+hErGdz8dTssSC/fL3x25MVqf/yXdZkLtaDLssjh+czjgOy8P13sG1iuoTkvJFKzkOnSR8S7n+VKg+O+apOlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IEhcrN8RuZuVFkEbU8+fUXr/t2MX7XxgubtjUD/vaW0Mjgt3a
	n+hJuJ4myZX1MZAcTG9su2dF30uaTaAle7bAMN/orw7upgxBIfIAIfYL
X-Gm-Gg: AZFdTZdawbFQUq38XkZMXagMMurBHaRA8Oj2A1BEepKXNzlYuOaGuXD3UTH0FMr9YaE
	M6QybyJvjqTnF5AqeLgp+jjgu716gPvw2MPBg0lRh6GcxbMuPBioHrv3En9gN+PFQUAHeo/XzON
	3dswBR/IhqvBvnNB+WN3BoWB5JTzSnuB8ZtXdehEWu67exdb6HaRX6DhMFcYD2uull1SEpTJvqs
	AgQbFByLNLS4vXu66jbCs1HvOdRpm2ctblftWuNfxIDbQYneR4EwQd/bw6cgpXvDyJKxpVTs/Sb
	A9hQdjVxL1CyY4wbn2Y18Kbe6Uh9nfbKGkFRvWcccC9IEOCYr6PZxiUdXdl2cF2sdWGHrryhnG/
	nls56MWm/JR4EJmyvjWmk2mAjqZqs3zFirwCNfJJRDZZuaXEOZHC5WlW3DnPkG+KeHAXHE21yzD
	XHbjYngsIza7GY2MFeIlbPR+3M63ohYM5oev8uDFZXMwNgg/QJHOH8KuFOfU1gTtJVr3jlILu1O
	wetBsIJ5TKqLobbB5yIuNTVn0qFRaFL2jmls/tNX8C5xclpKkZc/KyidUGGzF/kJbeoUow2juYW
	Vl1GWkq0lUFDjPKQU3PqMXK7kO5yyamiM+zHbsvJCwJk1mSDaFACiCcO4W8mRoTsZR5Ta7DsUcf
	LUgrZlmjybkEJmjKM5n4kfvY=
X-Received: by 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr687806825e9.5.1795850172794;
        Fri, 27 Nov 2026 23:16:12 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:12 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
Date: Sat, 28 Nov 2026 07:16:07 +0000
Message-ID: <20261128071610.27855-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
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

The Amlogic T7 has the same MDIO multiplexer as the G12A. Document it
with a compatible of its own and the G12A one as fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
index ec5c038ce6a0..ad95562d1f3b 100644
--- a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
@@ -19,7 +19,11 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,g12a-mdio-mux
+    oneOf:
+      - const: amlogic,g12a-mdio-mux
+      - items:
+          - const: amlogic,t7-mdio-mux
+          - const: amlogic,g12a-mdio-mux
 
   reg:
     maxItems: 1
-- 
2.56.1

