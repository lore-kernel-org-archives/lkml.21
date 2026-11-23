Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432742;
	b=QpW/2KbGROtpzLe0HqQkXW5L+nv3AIddyCHRUTpHqTgIL4WSlLLJAjVttipv+ZjMzEa2
	 AJDzhkCQSB/zBa8f4pmp4nhW89iKzGo5tN4wv3w6NbzX3DG7OZ9+gt+RGYRFyHEcxt1gi
	 kmcJv6aTk0gyYJH5x+omdwK9NhzLykyrkA22qokLhrGeEjmw4eUMoneZrgx9QBheHSE6H
	 sC/BxGPR5QiaE3tA79JZJtRcXqxMVgMhZnJ93QRxCec3H/RiuMTzH3vXrXZvC9pvH7lF7
	 QaQKT5c/2GM2DDMZDQVcrqfFpuRGqxHEDjSfBNe8keuIRaK/dTC49GVB7J/yQi1L2Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
	b=2h3yjWfqzHigbjaCi+SfB6djy9zlIk/Iw63hDa5p+1JeKbZN5jw1DcE5iYFVLnpZ4/xT
	 q8Lo3dcaoUDRuuxr121XfZPT8RyKnBakgELFM8mPBh8f9L8gZY2lPh1KatZuG9kF6H6+f
	 Mta+FIezWoH3QtR0o11wwTaYLckB+A8G59DLASg+KGP+Fv9393YSzqKTwC8jMUoLRFh2w
	 g76hyY9QA+DlWWU9GIb9vBK6WKP6H0R0b+cq4Z1uHIUBpba6XYtd3Ht2AbuNWvkZvDc6J
	 Nz4dOv1tU8tebRV5I3j+XholWvh8SKvr6hU5u7Gvz2T2Du2G3u0R+fLChGOvCvulLjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JK7SjlHS;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8286F606A683
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8286F606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JK7SjlHS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d581da0aaso411972066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432741; x=1796037541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
        b=JK7SjlHShqGKrK0MfBGja0a0+74eIVz0GikP/sp5w8+YnuWmehFbl5uiXQUjtJ5tiv
         tW2CXRUpyk7pKWHsifd/MUE+XHb49uhymcmyVz5d7wqN06KCa8HiFfLD+tRWDGplid5J
         lnDwwrCR3VsKX3Yxc16haWUr1L//I9LYp4XX/wkMBgZGlsyBf84J4pwNww6hnyGnd+Hu
         zMOgQk4NgPVyI85Hy+cZCo3R8HqtGjI+EoM7xtjaSUqiTDPi9nbBeaWxE02L6A8QQC2S
         ZYtQ36mx0ABEdHAAUuiQiYaBuO5AlXK+BFvFoojQxooRVUvAtKnl13KkH7qn6sxgkzAT
         jJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432741; x=1796037541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
        b=Rubw2Jbc9YNbm7ssHNkQSfbBuak0TH6Hj+1uql0uQ9r02hhg8FQL4+pZVYLF/NeGqd
         hA2IkbbAN7hfjrUZGTr607rtsUVMluKPM4Im8CxMPd2cl1w1EgF2TJKY4Bd/nOqb76B7
         Zpf7OqD86YNp/93H7RnhaVFlkKq8LZvPPOoWmL3l15WTk+KTH4rgDig/+HgE7xTgJzZK
         sHuuq3JikLNYRsFqSmCuI6pVUcphofkFeoS0VV/zfMePYQ8klL6jWCqNAqiJWrCeprdx
         vHCu4sBgCTl54mmcS2FDszvn3RULyLRKNr3eJZrByDY27PJTclG9UZDv5AFNXLlJ+I0j
         XjUg==
X-Forwarded-Encrypted: i=1; AL+hErHwbH0FZuzNYW4PiZJRIflw7abYdejCKTD8ylFMsvKa7WuA5qS02zN/tEYfX9dR0tRZiJKyR63E4Fg8XrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aPqZvb0q+oE7XNZiBIX4GRnGLqCJcmxGbJSEp9hGWr7+2AknJ
	W+DUy8mPyEonklra/LY1wxy+a3/Dd8ixz2zq9nbq2IK7rji4ERy/AOWs
X-Gm-Gg: AZFdTZcq7Sbvj2qhEsXAejOuTt3rc38EiggTpbBN8+wZ3o1ihWZvl6Eystrc9M+SK+4
	XpYmhPMbN5yP4ilZKz4QdAbxeXfbeObnP04YM1jPULZXMHKoF2xVxSOTX7nInbRinq19ETqtAXv
	eSHVibe0IYEPvPfkqH3z+oOk3S+WpuxNGk5rINRLhi5b8fwnJBf+1m3xp46d2zKoQytzh1VTeHe
	sH2ObWrQcrM9jLyhh65BkrGlNy7RxYb1zwkVi1NOA37BE0yc3RhgeFaC9uu0XQx4vYdTWGpOAsf
	3jVswwq/KcDQ8DnYHPexoEK0AOGEcHMOQbh2Mb3T8uZCTbADcyluqOQ++blsWuFxMd4lKt8S3yD
	oBc/9yVV/WFBVLjxX8E5LN02An4lioCJ7sAxz1XqSD8l74EvYmwck+53XFL70tQHd1/ou7QjkEt
	laorGOpF+ot3PIOkzr+TfXSPLhQtMriX3oFyzfOASkIIh7fD5I5//c8XKHgv3DIT8RRneGSwnnQ
	/U6k20QhM56h768ySjnL2/g2c5Yv6+bsEDPTQ688aXIa1vv7ZtN7iB2eVwt+264hUnU41neX1m0
	S6GAl9xMF7wiUQ5XvJKUUqS1XBMicio7t4iF/nMZjmxd4Zi7a4oIkP0EyBzymj3w3g==
X-Received: by 2002:a17:907:3e1c:b0:c51:53bb:8d70 with SMTP id a640c23a62f3a-c5153bb8ed8mr586385266b.16.1795432740595;
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:34 +0300
Subject: [PATCH v3 1/7] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-1-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add the compatible for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
along with the Xiaomi xaga board based on it, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 26f096587631..13e5c31cecba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
2.56.0

