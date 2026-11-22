Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335541;
	b=Bkr2eepLIoJqiFOcmNYuU9SLadL/XptQDzk9X+KPNSUE2nc1IhNsHCi+kNU1tMx5z1Gg
	 FVXlwTAqekHCVSQG9v/qS+dTCsqulPAZipekNkpNLDBpmnSKN8DRjsUDsGUKFzWEjeUSe
	 6bT43Y2SoSMEQDLLSdmiD7dizuFxhbB3UPUf62qZDHF0xyQiDdlj5FI9XL9rVyRg9Iw9A
	 +DsQhy9USbepPcvuQUHC8JSCRzs48u9db6mE3QyIbNun8SYufSvSk/ks9/xo0Aig2UU+a
	 sK+Kko3Dpou/WlKr3OQAIbyYJdCxZXi/IgLSizJC+qe2SiTwBEO0IzJ5iKrF1KT26qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
	b=CpoD7LCd9pjsg6/PdAQ12n+bUjanV3LdCNmg/0GBE0uQaemhB7pthqvEFVLKp1fntNNK
	 IUsRqQUseW7HP5xCN+2QNFaKQVMNBRUz7lTbgt4dF7DcjLFpmhK6ui/Rhhrva+oIuAEZn
	 oePkSGf2xjwhR5ovU/FIkFIJkFfiVm0MDzOGZ0pH9QxHsoxpONRShRKWKhbaoiiV5G5hO
	 XqjR9Tuh1v3gZVIzknmuNQ8RVxViMul3JHBB+rJcV8krdROQY/GSOCy1sAPU//xKoQX93
	 VLggjktHM2Kzyd1fJgQmcHZGDArHK29ZmPDqgg2F0OcMo+qbUss9ledatxEteKSGa8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L5Q/M8uY";
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E15D606A681
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E15D606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5Q/M8uY
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so2821197a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335540; x=1795940340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=L5Q/M8uYIldfVMCbG9nkGWzhI3yv+hPggYAhcn4NsTzzrXBGzMTp7AuuPmVkTkSGR2
         2mw22jkytpEuAUQsSe+4yA5TJ6cIZKARXPKtVKjrAmjASOcUDWDpDMU9VIxAWB4SStlC
         DndTBSLCid+Y7rvo8KXmt8mJuI9OVteBzMKC8Z2wM6zisQa+v0E4jMmTTcyvYAK8LTC5
         c6T45HGE0k/3jEcXxD77c6yDb11Kx2ZZPLRXxfqDOKFauoeo5reLvdoaWo+G5YOW3Wy8
         RQg7AC6NP4hF/7Pks1DnI8GdBvRgB2mSSfaLuoTGxmlmt+dxYNuZu+JxcdR0ew72DGBl
         mtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335540; x=1795940340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=XkfC1vWxGfSdbaF+wSm9Qo85yfbdrS97/cHvVk9P/Io2SIWjEfhFzVq6RwJN1Useho
         tmi4+PteOFzLnKPh+DlkU0noKCzNXDzkHpiccX6/7VrEKBYU9x74ReZEbskmLeYjaNEn
         4XBMJUyqEvK+WEkKriBe8jzJuabd/THCKfgEmejCVDguWuhaGNyD34LwAr1JvyWtmHLk
         0dETYuRiKW0teckPd2uau93ZOtDU9JjaKazEe/cbJxt456uHUYey78nCPJYPlsKxYnKd
         vEWbgXM1MjwoPBKI5vCc9OsrG4zOEJrI0VPCWRERw9vykI6uG4NXipxKgn3F7H64ahWF
         ssBA==
X-Forwarded-Encrypted: i=1; AL+hErEOXoPS9RwzgxCGKFw0hIWv0LGg0zB0+hhog2fyhZ+A//VGcmmPaE7AjcIKJ+LbesCDSNiSMbmJLDC9tdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hx4YJ9ZEFJgsSMqEUEJptdIqtVYPpxQmcC1m4FjAC51JMchtE
	8l0YXGaqvzC+20rP8P9GLIpo3+dI+xoV0bORTF3PLOjHvezxPqKCClHu
X-Gm-Gg: AZFdTZeVZjqsA0PYUfb+qPtU1NWYmM/V7nb0bWvRzhpW1Jbsks991hri06KmoIiGe3B
	zL1tPuq46S49xQ2ATnUqoV8A8NLyWKfoamyRNXabIVir5O6ix0e0QAG7lNr0EECabP2XJST0Uvw
	CneIni+swUs7BlrL0NTbfkZRWy6S/nPuRKeId65PWnQHXWtnAiA8sKFc/amEuU1Qs5UIXMxG38J
	5AqzyHBCaV5KuuoK5KKh4ndZOZRpfcaDAKALCkZBZ89Sq8UbqottaW8UQgZSJvhQszicxUl3EOx
	RNjAB0dC0rBA4VbnYQgTgRB/6SrHlVZDQpXNUH6Ilfzxkzqz7mZGVwIv4WTeSNSYTJ+BtdNXkEU
	Z1qZFkP6RkKhgCA/LoYW39X8v79B2wtEMD5rLPJqYJ1UX/xND5kHt68aGDrKwo59hUSKUYUHFpC
	CUTPJ89TQdzZpitvj4VlDGJq8eNqJJTizxa1nLHo4+KJlxej+5LWqEkrU9MiZpMPJfDbo1Lr3CN
	FNQOAd+RaH+iH+sNdmIWiglmI59oZuuPB/Two/pWThRaIbHy4cLSqHC0FE4BjvtNbD1PJoAJUZD
	hHPe+gHciAYuc0JBH9KAs2MV66lTBiKNEmxd6RctLRRcwNQXLCfC3FmDXZ720DxXnIgbhg01l1w
	DuNs/EAv32g==
X-Received: by 2002:a05:6402:210e:b0:6ba:9d0c:cc83 with SMTP id 4fb4d7f45d1cf-6ba9d0ccee5mr480982a12.31.1795335539667;
        Sun, 22 Nov 2026 00:18:59 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:57 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 07/12] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Sun, 22 Nov 2026 10:18:15 +0200
Message-ID: <20261122081820.53199-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

Document the optional port node, which is required for correctly modeling
a dual-mode panel.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
index 59e1dc0813e73..0f4837648d179 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
@@ -83,6 +83,12 @@ properties:
       gang up with in order to support up to 8 data lanes
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: specifies the connection port for the dual-mode panel
+      and is required only when the panel is operating in dual-mode
+      configuration.
+    $ref: /schemas/graph.yaml#/properties/port
+
 allOf:
   - $ref: ../dsi-controller.yaml#
   - if:
-- 
2.53.0

