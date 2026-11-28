Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795879014;
	b=bMogbcVu1McZy7l5jA1LqwHI+In+MfZM/aXuARZbv8jlDflbEWsCaNOxbMj6pdV7GrOk
	 NSASBg6XorMGjxrVPZEP6wb4hRuhKLjVt61PuyEMfU37xDCP2FSJLl3arrKa+UTTn5df/
	 dtuYrQM1B6kLQF8fSb45Tx0ZjUDodwvqKOJl3yHm2O1LDg5ZtWNlIYWdTcrWmCyflHwT2
	 vH0vxHoFe9hLvHspNUMA7kojxg6Dhl781FqPMfkKsY++jvPCOUQ/0yo+iWwabdqhQqS/B
	 DJCfo0miT0xMj0vI112VGfGLfmjaRlOamwDAZ3M/4OWTMYApoTUNiYToTIXz6cIvTJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795879014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=;
	b=AmIqytETf2GGdsQ+FwdT12kHXNvz4PuIHjndGuaiSuD1bWQNTZOQhcGVnxn011Kyzg8K
	 4kZZvxIjMNJVd9Mov/hJFGhG+J3fWBnLtsCHUt/AzSFx4hqQtPufABgqZ7r3sSl0kzwuz
	 lt370zonSGuwtGYsc+bga9V3E9+Ud9HRopZ/CZOMU9c1rsI1JO5gGWZ0oFS/wOpVeqZi6
	 y5hQXwIPhttmsrwSU3yJDkrap5ZQWKxRvoC59bZE+SHh0bTEbjKRJv4vzJmi2XG2fEFEZ
	 CIaGcvElG8gbopSuFfL+l0HOLKM5ZlTa9iLy29V617+mWLYAaejnmHPhWnTI4R30XFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTAI1v6I;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6B9606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 15:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E6B9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTAI1v6I
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso5517490a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795879013; x=1796483813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=;
        b=RTAI1v6ImNiBmtc0EHCMI2++E9uOOU+pBNG6woahNXDhDoMnfErZMYgNztUondWek0
         AwpeWg6bsv1gOOfotB0jSMBXVHjY1DFOWs4nx+fb/yQC3QYon2t/gnr5pwB5YEvgdpLn
         u825zw1vrc3i48yzo6iw/rv1KGGumukpnTjurYf19nL/8hqAXdJm3dhLa4pdDx4UBTZo
         5JByY+srjJCAqLGGawigeXsRILq+HMPpp4didpeRkjrGGoXW9RTkIaYG2B3Bvrjbw3sK
         wWihN7Gp4dIUZLzpyDPtY3Ex9VeY12YeC2drR4oiVSp+nY+vxaifP6eAxFlBmTkLuzBL
         jk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795879013; x=1796483813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=;
        b=XzQ9m+IBMHfrsPKbOYCgXRD547G4ciB8d/0Q9PL41pCQ7dfUq1C8KE7EvSsScNVffB
         /PFbhA29qgS4lgaih51aR6pzlDhkmuZwJHED2OtHqPKVE19qxTJloKEXZ+IAWD6z3pKJ
         xGkYvQKp6m4oRL+4RVKSRt9tm0Wy84a5zRC9SrW7WkrFn7Z+SElFDarxN9bqz0lmksth
         FODX+xaZn/4oGqU6+fHtnrqVY2IDBx+je6wz9d00oUz0poI/xh/Q+1rMICrtZy2un5ci
         d5+wE6u6i97yLvwZ9qIoZdTy8UVJmBcklvsv/m5AtjlvqO6g4VzaSpfHzoVo6U9rXxC0
         niWg==
X-Forwarded-Encrypted: i=1; AL+hErHOoZqGpyzmtVPs6LEMBPD0OGrfGUB51kxS6tErrLuNDIsOMQ0kbj4GZPsNcsAYbTfMpOmwaO0mjVvCdmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z++4agrKq3PuVOSC0INkGMJFw4cxqb1wbbYR8anXYC95vOFkkXx
	3rc3PWhlFbUJA1YHlWbogUDDfYPEIZEL64CSpReV/FJeJkrbRIq0S7nz
X-Gm-Gg: AZFdTZeso+r/RQoqTj9anbXYw5KxYeUl7i4uWj0543btgmxP0Vj1SIVb3S50BciY/6y
	SWeZnLMKAc7tqgmp3wAG26itoTJHsybr25KjNVW7Ay6kQNcNL6LPWyRszn1UPa4uwv34DsI1ePH
	QU/UlgmB2SxGrA7LpeEwAl9VrWEQZEzq89Pjw7KyDn7PFFBQ+KKvFqmQmlv/iPsaVN1jsH4lPlx
	/U8KPLTrvDoQkP4P4seNvDtRKkjW4dMfrxMKMReEYit5XvaNyJ66YlM6PNKEcZy7gIxDEFjEiQI
	DW+xz3gqsTBE+aJl1dSLWvSZhc+tv+3ax1hy4EuPpqH0gmvUxqj2cW6jJbvn3u6t99+E9//SNcl
	KQ42u/18WLjHlONTXDjhNsbWZR9lhfI+fbnr36wlUUp5PrFZrkLcxQTNu0auZpx6Zksv0b/in/F
	Ay6uFcvUcNmpJCMttmPgggwbitkoIujs8o4TdMdNMbtDa2MW3hztCfoDBEfbQi7uRY/qUH4VdPX
	R4UEeEO5Lr9vF9am6M40LSLgXipP2umbUsNBFg9yzlb6fxpfgVPVuGzrRT2ebaDc6I/YgSIu1Wh
	mjLyf0BlgO5/WS5rzamDAGDwSJo8WEHYWktGCqmEu1WaSTPkLMXmgJOcDR+NQ6NAypvB3bby9PQ
	ZbfWgX2AEDFD33tKJesEqsky/e7qF
X-Received: by 2002:a17:90b:268f:b0:3b0:d0c5:c110 with SMTP id 98e67ed59e1d1-3b41c95ce7fmr27156870a91.56.1795879013360;
        Sat, 28 Nov 2026 07:16:53 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm19769280a91.3.2026.11.28.07.16.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 07:16:52 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Leilk Liu <leilk.liu@mediatek.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH v2] spi: dt-bindings: mediatek,spi-mt65xx: Add MT8189
Date: Sat, 28 Nov 2026 20:46:41 +0530
Message-ID: <20261128151643.16934-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

The SPI controllers on MT8189 use the same IPM design as MT6991. Add the
MT8189 compatible with mediatek,mt6991-spi as the fallback.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
Changes in v2:
- Sent on its own so it applies to the SPI tree, the rest of the
  series depends on unmerged MT8189 patches (Mark)
- Fixed the subject prefix (Mark)
- Link to v1: https://lore.kernel.org/r/20261128141443.13065-2-sinha.aryan03@gmail.com

 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1f8..34e833745 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -41,6 +41,7 @@ properties:
           - const: mediatek,spi-ipm
       - items:
           - enum:
+              - mediatek,mt8189-spi
               - mediatek,mt8196-spi
           - const: mediatek,mt6991-spi
       - items:

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.46.0

