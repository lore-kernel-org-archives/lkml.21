Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748359;
	b=ooookNgQsm19Iz0gqGI/zNPOsLDmUpiPBWwS0+loKSlrFSmgOx1F4FsAeaVEL1tn5HVq
	 VoqiyazRkGwj5UpkQfmARWvoYT+vsfIEwFguBFlkhVqUnKvv/0I34hS/Sskm2IFXqDDbr
	 9bTnG0ZbxJ31WcFNGgOny2v4o4cyEQIjdzl8H2T0BAl+3wz0OOU9wEhG/ZS6UHP/wBI01
	 t/drmlA3dVfZ/55NqT8c5a333FIKdzNDt3hr8STIc/Y8DL6Ln7QWvGYtGQchWQI0hA5lM
	 u2pUC07pzEyORnMcN+L9aLNoZ9hf0+TaXnbKA5GwXCv9QOEMaoYtdmg4obDvBkijjTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y5ExnJt0qck3DRDUPFaDvu8b7KIWwdeeXU4WMSYgy3E=;
	b=ez29CwhhqBasZJi69pNYd9CW2ydkxIejeqzchGuCcQTta6M0W9hbONBa47PRLZJ4Uopf
	 uwkaZP+UOeXy/OqnfmR9tg0ucqQbUOHHxyuJ1irIw8yvaXOSvWnWunagjQqmYeWNlAAfA
	 HqYExVPHkMaQkcmw7heu9RS5l+4ZIQK+FDF2oNjYdndwJj5W3rTs+hF5mS9qva8nmZypj
	 LKrL/FFv7sjy8w7eA95M62f3gNl9n+aBkRO27fyC6FlU2DzMlz7YpMlI+L+MYfe/mGUUl
	 gfHqsZolb2V3xUpqsBABw8duZHeo08PMV/c2mX/tuKwLLpu8tiKkdVEhpeDnUnhSdkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u7UWmy9z;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED55606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED55606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u7UWmy9z
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso16189612eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748359; x=1796353159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5ExnJt0qck3DRDUPFaDvu8b7KIWwdeeXU4WMSYgy3E=;
        b=u7UWmy9zeBeSOYShPfASmxB6MB79mAuvRSrMg5ptShul88p7K0FeVWEEuKP+nMH3AT
         8NHIr6C8kkSn7PO1gMIwTzWF3z2mWlYY++50oj75CV0acS7S6ElLvdwQ5UKJHB23ltCi
         oQcgyzs7pxcZcAt7GJ71IP7kcOZ9AZilZSmByfQHRvTp2sbhvAkF6XeZVEOF6dUcNH2p
         XLBA81RWGXM+ixwiKnd7UEI1yV3eKV5/Gmi6/wb90j0bjlSG0viit36af8rtImPxgEug
         eU3rf8RtjSFzZkncQhfvgXNAqHXL4vbrZKO3OemwSzLa1dXDHVYWvlxMaFwmoiSn6Tsu
         5BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748359; x=1796353159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y5ExnJt0qck3DRDUPFaDvu8b7KIWwdeeXU4WMSYgy3E=;
        b=rv283V6I9bNqc6lxo3h/z86rxvgDoTdjDxNKmQaOXno2yuYyooUQ02mPQxD50+tOAD
         QoQ5Bub1TX07HvQeYZqbrJKXdmXLLn5Jz6PmVHDVSjHnTn1MRsXy8kiPwyChpbRT43ux
         WGuHsQyzuZGvTmj4TtRjcXuY5/wxOvxILVNTjQXAwYsIA8tsvs0l0rxhIZDJTQfnht+5
         BQgh6BWD72pUezflgWNWQForXKVoHPHiNbrVlgo/5NaK+gqvvBGOigKU+2fL92/KaHlN
         HAzuYoTh8YpCQncIlfTZ06EkzPW7NwVpKtvx449vVupK2lnAKaZthpPd7fxm+pDENRTj
         iCcg==
X-Forwarded-Encrypted: i=1; AL+hErH6hgOHQlB/6K9EebGj/EUxS6/NuuIpf0eQuiKuPW/HnZun638ldKl9nTDeTcjRYSgHSxPNbIxXalVXIT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LzL5EEA7SwB3YbDDcChoW6xX8tIZ9nOh7aScJ1xJVyoHDx5Nj
	G2cIGKg0HqMeyUNvE24koFYLImj1mihwPd44X8oZ0h9AjiBrHAsqB5AY
X-Gm-Gg: AZFdTZfpCieN4CckkJhPETJQ83WtLQr8hHFyRuzElOzerPJzpZVWm4AAPmG0Zns5Tac
	inQkBWcyILqup31yLOI0JuUmNXDcqPs5b9bkiTlXGs6+9vrrcoYg9WPcpeDOkTJsEHuBptXJlro
	bnNgh5zK1FNKvOnZ2I6wqqN7tUoPuxff503z1W4bi6nTC7PCSYRzrpqEOpVjbbiND6PjfI4rIV8
	D8FrEBlTIYHWl+crDpm9PQAeIwxPh7rGcQpFZeE1OaYEYDQkRvr7gfbL+n7yIDBK9E+1fWHy2U7
	PBOGVNhk1m+WTwrF0pT0P3wUhbiq6l+e+vV7/k5UiylCSXRUt+94ACdEdA2sqMz+7fdylGlt328
	vKr82QwS31fFtxu5+BFWofLrD6o2w3chTSII8d4dIeIGj/sAoS4BYyQ4+UEChwkzHA9Lz8QJYeB
	UE5nJIUAsEpVV32gJmeyp22OtqVVEKkdJCvz80BzlXxgCDd1g6L+xU80+qgpMkOeSp0mSGUEDim
	wHlxActYj5gPOZhpUg2lcm3j9mhA6/t5sdUE/3glltwaR+W46XlsGFjbgr5RaV5NyDhJgXmsIwu
	4js/wChTQaE5pct22e2fqOAUDsCecVcGqC1zu3F+p244k6k=
X-Received: by 2002:a05:7300:cf1e:b0:36c:b138:651e with SMTP id 5a478bee46e88-3857093fd1cmr27144602eec.22.1795748358624;
        Thu, 26 Nov 2026 18:59:18 -0800 (PST)
Received: from debian.prasanth ([103.183.205.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm72013313eec.14.2026.11.26.18.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:59:18 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Tan Siewert <tan.siewert@9elements.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
Date: Fri, 27 Nov 2026 08:28:16 +0530
Message-ID: <20261127025817.20090-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
References: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
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

The AST2600 secure boot controller also provides access to its OTP data
region. Reference the NVMEM provider schema and use unevaluatedProperties
so common NVMEM properties are accepted while unknown properties remain
rejected. Cell offsets address OTP data rather than controller registers.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Validation: dt-doc-validate and the selected dt_binding_check target passed.
The binding target used dtschema 2026.4 with a local diagnostic lookup fix
for trailing # in schema IDs. No validation rules were disabled. Two
unrelated TI type diagnostics remain; no SBC diagnostics were emitted.
The valid example passed, and an unknown-property negative control failed
as expected.

 .../devicetree/bindings/arm/aspeed/aspeed,sbc.yaml     | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
index b8c5cac..d8e19c2 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
@@ -13,7 +13,12 @@ maintainers:
 
 description: |
   The ASPEED SoCs have a register bank for interacting with the secure boot
-  controller.
+  controller. The controller also provides access to the OTP data region
+  through NVMEM. NVMEM cell offsets are byte offsets within the OTP data
+  region, not offsets within the controller register bank.
+
+allOf:
+  - $ref: /schemas/nvmem/nvmem.yaml#
 
 properties:
   compatible:
@@ -27,11 +32,12 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     sbc: secure-boot-controller@1e6f2000 {
             compatible = "aspeed,ast2600-sbc";
             reg = <0x1e6f2000 0x1000>;
+            read-only;
     };
-- 
2.47.3

