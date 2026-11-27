Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745301;
	b=eDXfPzBM92ovkX/TXasp3krB+pMUWTbacP5rMGfOllXs87zvxeKlBiK3T9enoKMv4Etv
	 OPsGovDQvEW4YayxHgD2NnD4HQ+bttbYHs2mdOhCevVUrD0P3BH3PYiKTb8scWxc9F1zY
	 z66IA31CNvwKZgkB7sZg8bkR2x6i1JgFVTDJXVN4L+V3rG9YKuJV4DXr9D8dce9apHb0T
	 SM7fSBY7kEEuQ0qnhbXfD35FX1zNNNm/S2NVywWhtUIHbaX+g1lnyoB9U7GkA7mxexSMZ
	 sYT5RMoIWOpMHtQ8rQb9s1zYoYO6wxNUrOMdrNmT9X3/fejkKC1ak7rPp9OQTpS+0fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A5HReqGtLLp5CEvytgVMxYdO2cCkWTCzRi2iOsig/yc=;
	b=P7GTjdhUlUr7xY6/wskAP3XO9xT5JrrjD5h94Ujczf6gpVzBHx9F592NsXuoPSMgWZjk
	 f5dfVoZ1OjXvphmq6bkzMtCvvWH8vHf/gavNNO6vDPNHslMMba08nmqdM/omBtEJOwgka
	 614tQrmmPZ6i2aKHcU7PG3qGFpNPCM7mvGzncwh/0RKmM/BQqWg6Nrl2fe3iGGaFTS26F
	 7wyVob33Vua/MJAW2Q6RcOu9+jmil/5rjzIv3gDU0KhGSvaEOQe2GsJaxOfdkGJWLwBnt
	 fCMJv83S/E7YmJBLGWrk9RO4icGfyyuNQel9W4MmjJrH94Bs+cQPJd16FluRkqxSqTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CfM/0Ols";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E68606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E68606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CfM/0Ols
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4158461f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745299; x=1796350099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5HReqGtLLp5CEvytgVMxYdO2cCkWTCzRi2iOsig/yc=;
        b=CfM/0OlsH62WuiyT77PxTB0L3F3uM36rJaeqxxAYh4mYoEDoOrwrNvo33O+fDrsuPv
         opNg69QfuIatHRJjBAUPWrNVkko3SJVQzraEpikhFHdaKE+We/fjdoB45fgLVM/TaJUv
         WNbKAgSLoLjT8JI9DxcTMKaFsvNHmP/2K5C+Zzjk5oiyraLwXHWRLkY+Ihpg/fnOVp/r
         ikwz/0qRzRFRGdfIoG9eI5NrJB9+t4Q5YXEkjEW5CMOErqeWOLhht1GX4rwyzDrnBTW+
         FMxQue7/ZicEoyG+m3NYqR2B69+IoCvpgbAxWC9WVKwuY82nxs7nVnqBEpwXpT5HqZvV
         ie2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745299; x=1796350099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5HReqGtLLp5CEvytgVMxYdO2cCkWTCzRi2iOsig/yc=;
        b=SHuQLOiEZxVck66zUtDMaEVbdz3js085isRUELsyrrW0TiAnMZ6wen39zjR2BY0XXX
         V7nx/FVbzNYLQq1vqd2zRiOHMaxKQlChCBWFWUBnpn2sS57v/2Qe5g2N3egVsxK5gMEh
         BLjUrv9mNE8aw8Me6MpTO/tMfxxZeh2upX8gpp6J8EJEroIUSVptfp/5oS+IO5E4Ep+B
         i/MtvDRbXvUvCjzRNkZLCV3zZGU2bVo9WqWETCoitiG/+tp9yV9Ehl5qeAswRo0Vb4Ix
         6V6sd8tf/S7WulA2oJYOe/rwzkYyphIqXUlKd7RS1rLJNDL2FPfYd1jHIklpleCC/LLJ
         G+hw==
X-Forwarded-Encrypted: i=1; AL+hErEN77lGPdaBe52OOvaCZ11sNAE/tXzHOLjvNfWN13L0/jMp/4aNXEBB0Y3P6EwzPp2s54uYp2Ykfi8uGxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cfrNTzgGx5IkCoRjPcpO7PSH7GUpxmwY+HLszm5EVDbCPbDj0
	nZpG9FBwuaNdNgJFba9z6esKSiKpR6x+BIJThj39Hz+3GLp6HSIhngVI
X-Gm-Gg: AZFdTZe/0fPwFdrduiW8kp2dwuEVnfAAPHC1XMB7hC+pTp+57X98vv+s6PvAKxBrXwT
	/3DK2zUPFhK2566cv5FiM0WWUBU/qmRnO9M2R53e6xxqavpu5+au2hVH2yYzvTTMVNo3BMh8Z/u
	NgDwT+Pn2FTCRVk3T8JHZ1Wkqhsm8ik0mOX7M6nEj7zpoLI+OPvrsOBUeLvPWVFEh7qyBhm6JO1
	gCa0Pyc26zHx1iPEUi8HW01ty3a2P0+tNpSKD63dVCrH9EqQl+fi0CBcIDDOzXR2ZlsCERKBiD0
	0p9IB164TT28xh3EXAjIx3p7A8qDsBg2tGAJipBU892vq0mAnHsZLhH6IPu54I7qRuzxN2sKN5H
	lUx6FOjFLbMTiI5Kt9I0LBe1CczN16sKl4oMOKh0aDZnfV8e27kvbap0OJknnPcbj6LpydbAm0R
	85mXIebA90DdVzWxY4Kh8YHnheZ1eKusXj5vjBa2h168V+KvBmTPweMWcPDioNWrfolAwTkmp8Y
	udS2p8NSZoYHMYsJ4317GyqJllVlgJ86IfABeCJEuEKap8lRA3qQDW7GgmcZIuH8Vw3667a2aHz
	KNUTJTOoIxfeAW1n9yfYSr9mbDwy6Dq6BdXvRrRXCgy39nYE79cTT++gY+N/dqOqQC/TfL/t0kq
	OAbCF+5tIzcej4ufwIXu0ODi4AqRSxqXZ4AnMQCB+hTHnfQ==
X-Received: by 2002:a05:6000:41cb:b0:4ba:a47a:f21d with SMTP id ffacd0b85a97d-4baa47af4fbmr12166998f8f.1.1795745299448;
        Thu, 26 Nov 2026 18:08:19 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:18 -0800 (PST)
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
Subject: [PATCH 2/4] dt-bindings: display: panel: sitronix,st7701: add the Miyoo A30 panel
Date: Fri, 27 Nov 2026 03:08:13 +0100
Message-ID: <20261127020815.1621790-3-romain.tisserand@gmail.com>
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

The Miyoo A30 handheld has a 480x640 2-lane MIPI-DSI panel driven by a
Sitronix ST7701S. It is connected over DSI, so it has no D/CX GPIO.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/sitronix,st7701.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 3ca9aa215b7f..8d9bddc8118e 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -28,6 +28,7 @@ properties:
           - anbernic,rg28xx-panel
           - densitron,dmt028vghmcmi-1a
           - elida,kd50t048a
+          - miyoo,a30-panel
           - techstar,ts8550b
           - winstar,wf40eswaa6mnn0
       - const: sitronix,st7701
@@ -89,6 +90,7 @@ allOf:
                 - anbernic,rg28xx-panel
                 - densitron,dmt028vghmcmi-1a
                 - elida,kd50t048a
+                - miyoo,a30-panel
                 - techstar,ts8550b
     then:
       required:
-- 
2.43.0

