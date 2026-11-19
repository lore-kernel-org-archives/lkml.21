Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110890;
	b=FBPa6/QnCqmbEr7uIwghpKYFj9E8A8eAoeoUi66C4QlW40EfhtPpCYWjhkNgZ3aHTKqP
	 t2kXJU2I3EYK3T4kjfBLzH2ejhEoTgRYXvqEHSvxmHbCpnk8dxbRV+8JOCedQ7RFdpi+6
	 /OGzeJVy344JpKx37ztwa+x4Q+z2gx7zAOwhMMujQS1OxlcQ2YskeqDKNzMhdJF82WVIY
	 tZjoH6MGnzCxAMGuWHMcxWAG9dXHr+NaCvNuN+JxLa8hVBCO7WJxPL7q2c7So/9676UQc
	 c43VFkAAjAc9LXr3iCtO4EN8CIqgbjwcwhRBcBkxdYoIICkcMR9KH2HsGvwJpeuYwiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
	b=i8arZxDvaY/EWaL4ujMlrtPMYQpCL0HjuBwSPRKbwj5snB5mNjs2+HlpToix+EvbUeef
	 VlhjrGdzNHh65XnEldZ2PXGxZctLZgcM4oPfrFx3H8Jrv8hRGhC/76QQUxuR5AbruqnKY
	 KFgU5EFqALHD3IAG5M5xx4ri0PeXLvmPxBLShkFuJymMIevZ+TwBj8zdP2lBKe+rG5Ntp
	 OPNYy2IAfehar7vR/nqLPyr4/qAQOy1EN5hv4b0/aWcPK0DnkDWqfwT7tIl+1WQET7NIx
	 Qn4Z05fe1DcbHU/Kg3Yapekf+w/DW27HFLiyLm3k5cyqf5CtgOdbxXofuDpG8GpM+1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu4GF3RV;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FED860A2628
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FED860A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu4GF3RV
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso1332400f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110889; x=1795715689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
        b=Wu4GF3RVtlMvwvQYTtY5Z/8299Nrj1/0V7XaDWzkLj+fWvG01N3GBBjvgOz478SCTO
         aHPMSWzpaZgFdENoTzcO3nBrd3L1Q08CKY9UtKbg2pMdygeEy4PMELy5KHzaqbzrWIgs
         rDFXnsp4Z4g7z8yVJghX+9GHg5r0Ww+PNSctCiTwC+LXxhb45HEUqgYOG1M3H4v8Pbp7
         jBbvvBVqPQGsL+Wxox68DxCE05yuU8oROj4+lJj3y6Wg5wLQAV9m339KH78hGRJaqMHO
         KPge38ObVwbq0lhXaAx0RaTQIyjmY+ZDtsjEqn/53C6HS6EXvI7MTOpCuwW0wPe7c2X3
         aYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110889; x=1795715689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
        b=ei6wgZ+6WfzISYz4p9QuEXAqHrTIIDpaDj37JTRJbJHDdFWpznsL5SDF8++47wUKZw
         VpPxpdqxEl8jMY4VhEgvq8qkDmJbBRzZ8vc6mhEQ5l8wGUbM+2VkXBYk2lKvFjcyTvZH
         5nLbiHZEfGTaJUd9Ak91I2NLd5hj/3MH3O5L0hd4HJn5LFhWAs+z8QegoBMIoqtFNtFF
         pj40CqLRZa/RGpANm/PCKGyR6XTDyl7PXmHIGVh6Y7CPzb87ytZzQTPR1ZF6RKZAB7x2
         +HEXHZB19K2VdA7ZIPQAxPQR8Bxs2gqyu90hrDUV5IxJfNOSH+8pRAPd3PlTMWxvqXDD
         i+/Q==
X-Forwarded-Encrypted: i=1; AL+hErHr3PT1qExHcHxM5S2X9Ol7mVZE/kMyVWvljwZujbKhxFp1CoWZkr5j0BXkVa1D4lx+egtaPkbMyq2EG8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s37V+p+mOjqW0yI9lnm5/aE3l5uvgk+dfH117VyvKWS/vP+03
	RclT6IcVwlZci5xp01+L+5Asc8uPmog6RkeE6mmhOBDSrVORIsgjqJel
X-Gm-Gg: AYBFou2UG4a/bHsodCAclSAlmL9hEOuwfDC6Mwt4wZbln0nXEZoxtkbmjq0TKJjZRjA
	5LYxqORElF8rjoR+yw9QiaJMhpe9FT+W/OMRxrJdSKKjLqsyxbImswsSHdFjp0QKVFFvv4LXTBK
	WLHdLa7qFTpSWI2dOdQ6vclVRHCtRsltjFoU1VHtfnoRg9dbDwEpkdxo47UzC2NFv6pJV7+3B5n
	NQz5DiIRTYMdizsMM/7y95blU4XW0EZ+QaMGAVdj6cmg3xjdCXq5CC560r2S5bYZm3WQh+VbnGB
	xYEPIuAqL4vKju2XQJBdyPDaV3uz/cvVZWKrd14t/PUzDvd3NC1fUk0bd2xYlzetGNbZDKos9Sw
	m1GhOT3H+lCcPXO11oK2mp68ubS1eoinYgPOfd0+q8mHIAhRWIX1Pkpt//lXm0hyJh4ZEIY8C/p
	dJMmm/9Px3E0oc1eiQrvMC6cP9zGKOqCX1lFafN+0ElR3H6bPh8qB0JzPMDE2JhkrrCNov/Ft/R
	SUU3BlVmjJM72T4qSqOSM022bqkc0zXv1zLJ0BlYLFPxRPsaw89cdE45Z4/BdsOwDgqsirYn5l6
	yR3riT4Dv6RL3FSjsG/Tzvqzw+TfcYA7jccdg8q9YpTaog2nHWr9mhKJCkUy3qU2O2NAul31Yv1
	1Iz24Lf3/go3apGJc66PJ9W6dqnvUu/j/sOZaZXJApo+aC0nDRqgPYriQGD9hLBVv6ZJQN3edp0
	PsSKI9jOI80C7H9ehmXxEfNIXsW5tcC3WYiba6qdI59QYKCzfP3npgs5izPA9GEJGKDD4RDLzQ7
	t0FI9OEqBNWx+pcphzQqta473nSxym4XuqDBNg8XlGzPlJf0ZROegJy
X-Received: by 2002:a05:600c:a11:b0:4bb:69f2:87f7 with SMTP id 5b1f17b1804b1-4bb88812c92mr5507015e9.18.1795110888897;
        Thu, 19 Nov 2026 09:54:48 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:48 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Thu, 19 Nov 2026 18:54:36 +0100
Message-ID: <20261119175437.2520400-5-jernej.skrabec@gmail.com>
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

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Remove layer register space, which will be represented with additional
node, and replace it with phandle, which will point to that new, shared
node. That way, all mixers can share same layers.

This change is intentionally not backward compatible and the old binding
will not be supported by the driver, for the following reasons:

- It can't describe the hardware. Plane register space is shared
  between all mixers, but the old binding puts it in the mixer node, so
  only one mixer can ever claim it. The second mixer can't be supported
  with the old binding at all. It also has no way to reference plane to
  mixer mapping registers, which live in display clocks register space.

- Supporting it would mean keeping a second, mixer-local plane
  management path in the driver, with hardcoded plane mapping, which
  doesn't match the hardware and which can't be tested, since nothing
  uses it.

- It was never used. Upstream H616 DT has no Display Engine nodes and
  the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
  upstream yet, so the old binding never produced a working display.
  Vendor BSP kernels use a completely different DT structure and no
  other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
  H616 display support. Only out of tree WIP patches used it and those
  are updated together with the kernel.

The driver will print an error, asking to update the device tree, when
the old binding is detected.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.43.0

