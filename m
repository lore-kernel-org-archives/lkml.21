Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725337;
	b=V0iDwB6K0jtvwLMggcGCeUSo6IJTFl4LzBGBfRxWs4nzwZRHvnIZeNUaUocXyFjV2k3G
	 Nv+g69vHbOP1EUG/Wt3q3NlC6a1tjcuz8HJrYHVZbYpoaUX0KRd2tOqyDoWDgI5gSMQVR
	 WWY3MkpUzQvbsnrAFZ8rklEgP4OmQRPiqFHVjw8QMjOHL+cCYhjzwTrynAaCuQyqmZNW3
	 T7o7FKyaRDoWP6mhwpCUmPdVdlAfIylFymNmMl25CRZP85C08OCbyy8nluc1m2FJudOlS
	 Fu8sL+p8yqmEOW2RRRXhXiIxljf6v4ClsLnF7cbc9yJXQ4w/KVVX9wJ6ygb2+X8FT9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
	b=bf07RZfqrXiwWUpThLFJ3ViU3sB2HYelP85rdM+9cv2JWWV5rJiTxEvsgjRLXREwnyJO
	 E/AjGWE/mnMNrCv+E2Z1tSBbnjsl7UlYfQEUfpF8RjrqcC/4OIwT2UatVDhNHg01fNFbG
	 o6LymIZIxcWPM90cOgDcPqY46j7yXBfSGA4wGbVYijgb36b2fyWXKYVWJmfx0ezyDs8GQ
	 lhL7XivpUDWTbcGRij6ENpe5I8AWlEnkFjY7lNST+Is5HsAwozaNwfnR5l3V7l0iOVOXf
	 CUih2aFoAmWFe9J8hOA4BvbCSdjB2JYFIHCArUF4pdasVpm8GOWHx02xztBG7DS87Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J+fw1+Z/";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9117C606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9117C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+fw1+Z/
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71aea92f666so4766737eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725336; x=1796330136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
        b=J+fw1+Z/DA0t2A3jmBVenxuj9UtF8YhUdjqwTZH7aTDMAIqoMEuQNLQYz2lEcy5oQ+
         yeqTp2a0odF5zxgD/EjvEaFQag6AcSj2ayW6f3BpId0Cr5ezz/z4CCYpU5dPFSqfN0bU
         YmcctUunnbHgHs0JN3GPHaE9ZcADXlEBLhtT3ID+kP//X4AHdJV9pEoNmoZj8VXApEER
         LbJ/H/ddRuNZDEIYeeGGR37hQyBlaCyhgAjKGTAOYOKaGeW4uXfA15PPvezDLJthU1OW
         d9v5m/Ncj/o1TenLwzobHz+39ne86nymg+13OUQYwqvh99DLxyf3d4+1OCs9iTJBZqVX
         1j3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725336; x=1796330136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
        b=U7S3Z8MoilLuqNzhz5Iqv9wco0tDTwVpOOR0bYGjjBYLGV0deyTakEHbOkCQO0kxfy
         SBV+k7XA96Kneys4cuCsEdNOheCFbZpU/fli56ZBAQhE3zRTFqr25H8P+KnNO49tZKKa
         TVDT1Y7GbRXBy5LrfauZuKZuAMvx6XE6L/jmJAYHejmMZ/kD81BQ1GfP6qRhMC7lbwF/
         dAQg2OSBxWNlHUJYXr0qPbybxQvLvGTUkmi84IBq774weIE70DnEsRGO8WSErRVNH46S
         JC0QYoHap9OQRPn9lJNOcod5yGD6kxDelY+QAxJ2WvSMxf3THFd86HBI4dJIHwipEoo8
         fvmg==
X-Forwarded-Encrypted: i=1; AL+hErG3lvSQFBoVtCfmIsuBOiKZ+ynT/oioXXNMuMgZ5i7fYl9pyUujRYlUX20CJfkb2TXnUtdu/XezPFMO9WM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L20N+7B3LpI1y6Vkz87PX2IsoENTnWKsndD1PKdIJ55d6Eq5q
	QOXPXZwwXPYf43bUXjhtto3QnblVqKE+oJESWEv7YX5w7LiiL9o1hcvr
X-Gm-Gg: AZFdTZckMZrwhuizi3mmpJBlaOqsOFxa79nP/EfTKiSoH8mi62NOKVZAtjdb69tRSMl
	ZUnWFh7N9HCaOHjYx3yATE55Skz7jWU5LBJKXNUiYE8fWpE0xJNp0ZGMrfdVxzTHWQGeRT/WyZi
	Gsggod1/avl1IOM0XaZmSd9euoMRWYqdaivbF1QV8fZTHvqdH2ih5f5IYUUIbIGsIFZmlVSdRse
	+sW/TStv1YxIzw+NMl1E89YRNqRzGVSiNZvQOsbMo6mqMpJ6tJboqAD84D3VCsA++ARcxHeN2Rd
	XYFfM6fJ6kYcdy2UtuXRkZ8YU3JooGjWPq1GMs1QcXTDO5qn7Iey3F8L6McspbPc2NN2hjySf6f
	/WeJa2seLe+aHopAXR8auYEdz0fZJFyrYAzRDjhd7ezpToRySshLHpvwbZBr7gbTKrVBlmjTUNX
	x27JnZ/DSUX/HDgwbhOOKoLk3fTxRomdYhl011sPLXQExYgYOPzP6n5yxXpjh3BBXnEJSDwPctm
	h+QBoJhMjFIokFwwlKGn7bxGvvcZXmCKMzbrBtVl7ozjxpotdO1NP6PXgwjlLwoLb6igYaTy3iw
	Z8LZqEjvboF3ZileixghCzVYnSxpIUaTGS7UO51ZMbGR9zdjAwgKoraqJuCvwEKcwOwcZ4coj/z
	JhZAgfYQ=
X-Received: by 2002:a05:6820:61e:b0:71b:7883:8d89 with SMTP id 006d021491bc7-71b7883ae62mr6639742eaf.66.1795725336439;
        Thu, 26 Nov 2026 12:35:36 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e5472sm15740888eaf.14.2026.11.26.12.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:35 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 1/5] dt-bindings: arm: sunxi: document Radxa Cubie A7A, A7S and A7Z
Date: Thu, 26 Nov 2026 15:35:33 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
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

Document the Radxa Cubie A7A, A7S and A7Z with their Allwinner A733
SoC compatible. The initial device trees for all three boards are
ready to use these entries. Radxa's Linux 5.15 A7A DTS already uses
the same compatible pair.

Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
Link: https://lore.kernel.org/r/20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com
Co-developed-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes since v5:
- Fold in the A7Z compatible from Vinicius's binding patch.
- Drop Alexander's Reviewed-by, which covered the A7S entry alone.
  Krzysztof acked the A7S and A7Z entries separately. Leave the Acked-by
  off the combined patch since it also includes the A7A entry.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..7a7f96f21f57 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,21 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7A
+        items:
+          - const: radxa,cubie-a7a
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7Z
+        items:
+          - const: radxa,cubie-a7z
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc

