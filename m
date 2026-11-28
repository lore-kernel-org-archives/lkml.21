Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875307;
	b=fhBNFUc1yXowXEPMKHVcSEmIc2s2sMA5hKbyvmesY/nN3mTngyD7EbSmMB6jihE2Lr9w
	 RuVrH20B9ch+pgL/Y9zQvccY5nivNUVz0SXilau54cimaiWx6NDB6ETXzu0GftG3MugRK
	 9BiDa+12Sg2/qwWfpe18LCcrv7/9eTYc93goBVPHTQpc0RKfi/AGISUh7/pX4ufbktKNc
	 MEqiv+wdoF3piKz/lm5ULFLfTG697PSi8l91PaQvTANv+LZSTqBYxK33GHP66WAP2d5sO
	 k8B7JHWUqeacbDkP6i8Ms3Tyq+aqxs+lYIEpL6WuGffJyYCK4Mp4a1Iw4HRIbB59Rlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=;
	b=sLrzIttI1HIQtAyGvtHRD2aT8xfbh9xz1YJi64wVNVCLtfOVWW4oqRn3tRtXGdnEHXXE
	 FMmIhfHwCtS6/RPjnWc1cCWK2+ALal2yb9vRYksepjRzgXCtG1PZLpIX3KowYra4UQmWf
	 H94qI/drszFYsRwiEAHN76MjeZ+ZUOWNXxINStTiO70fLd7YxY8lxjMzKRmV/+F/Ad0A0
	 7eHNB7+s6Irls64BZFdpm3E+ui9a16bnViQXItT5ZYHKe7uGxJks2KeXd62zF8W9j1Xnq
	 8SiTEZD2ks/wlQG4vUBcj3QtqZnusLDDlx/9vafbx4ozZKwdXz7aX2rGBnjv879roWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/wuzQHb";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAD606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCDAD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/wuzQHb
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso147929eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875306; x=1796480106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=;
        b=v/wuzQHbD8nfeNbSx0XGxb9bZ6T647gP1hj6dG+zdKBlNrtDRuqcefzv6m4RhGTP79
         mmGld9iGkATVHczfUZuNavM2051luVlacG1Ew1TnEjG8Y23c0xB+znir720ZIfWRwyAv
         waF2b2dUoI5zJdxTsg7npmXZ/RjLRHsXqX6yYCratmiQqj2BBrxJGELtRjZU5brjQTHV
         dyBlTVp0TRWcp3YI0AW/yuqcssP2oI4STazXV2aJN7hztjooODIvTL5R/gBsLfJQd6pW
         kE8I6rtafmaTT4yP9suCEN6tub6t3Z1e//qc94sXf9sRYivkN7dA7NWfm1TFIkxfnGmr
         6+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875306; x=1796480106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=;
        b=rQyueUzZxwtgBQEaAAku8bCNJMusPGMitWLR0aAuOk6kv91u/9JoeBVZyISMCceHq2
         BfC5XqgWWfX37/dXo6Fbb61Tl6rmK+HtcCdu+4iSfkR12t52ZrtIkUfsBqmw1TrexVg/
         Xc5oQTjBNZARxeKBHpHeATAWf23HuhbK7wrJ9vsSeepvn04fDS32gBoxrU88UvtEEgF2
         boNWWavHf4vu5DH8Ou4lxFooCPu/jIomRJjnkWNCq+oBAQYMZCcX7m3xPrfHLjv4rfjn
         t5HknDr2qoCNbAi7BmT2ZjJmZLXE5MaFoZo7Z9yiGP+R+c1vl28a8HDVY5H66QlKKQJR
         37pA==
X-Forwarded-Encrypted: i=1; AL+hErEZbJ1Vayn983GNnLLEOkT7P/lr9KFtzjMtWdgOUjn6i6C59Sf53IzqP04UrE6dssw8Cg6rrJGXFBIhiDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oCqmPUESYBnPiqQtgupA7988vPVeNIGE4Sg6l7Dze8Y6PUdE3
	Tuuxfb6msGT4HAzNIEbfEzjw7eSwFIG5016cmcg99wT/HLoYAxE+v1PQ
X-Gm-Gg: AZFdTZdjaS63mawFwKjoonKEpn2+cTUcU1sn0xOexv1Ov0KzRSmgBxmGwrsyy+O/W1g
	q0b8IfZDSlbEfVpECYAQhPRkeeBeFQ+KDT7HRz6Qgluakq7QPInVI5J8KkA2/iLBELJPWhwy9M7
	tHa8v/7J9D3x1gvXAL3Sczvb+jdXRF3yUg88C04FjeHdSa+fDPM+T6plSfi9u4pFMbm0gTruenK
	5I2aQR8kyGUu0WDCNhV1ghy5LOVCKZGb4nOhFxn5gkipDmuHxZE4QAl55H3Tb3j8ehUY5RpUcZZ
	12XeEaZ19SqTPpn9wGYAeRTMvFcZRRJFG3U6EKFQfzwDR+pMnzpOqjhUfLSv/JDRqi9VXE3CfpD
	r6k13HDCgu+HAbStPeh+0erVOswvMJnTNxVk6RCmajM6J5lPF+pP0CBGOAmYlqlSBnZO7Myb53I
	PwpjUC9vOeOTyKY27bb4wmk57g1omcEj2bKCxOCtT5/w2zwYVYgKx4bc/tuDIOC9NQC3ItoFKMu
	tEHqDon9+prIvS/M6BHHSQfwr/dWLnAw5BD6jTev8JI/IDz3fugrey9UsTGQytKz/kFNeOy+f12
	7UhdtQWO5zX4kxsc3Nv5r4FDj6GjQwwOw3nF8eImBZnyWU2fJLD012nXIrNsOJ8V7sF7deTmY8e
	hVFmiqO+eXnmGuPHWEGwRj2fRcL0w
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr24469794eec.7.1795875305781;
        Sat, 28 Nov 2026 06:15:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.14.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:05 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 1/6] dt-bindings: spi: mediatek,spi-mt65xx: Add MT8189
Date: Sat, 28 Nov 2026 19:44:25 +0530
Message-ID: <20261128141443.13065-2-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
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

The SPI controllers on MT8189 use the same IPM design as MT6991, so add
the MT8189 compatible with mediatek,mt6991-spi as the fallback, the same
way MT8196 does.

The vendor driver's MT8189 data differs from MT6991 only in not setting
must_tx. That makes no difference here, the driver then just supplies a
dummy TX buffer for RX-only transfers.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
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
-- 
2.46.0

