Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981348;
	b=KvrHhLrTnjrKGv7cK7kCPLwssuWcS+yH8faIhNBWA6AgJYn1yQhWzT29dxQMjtbTwo/f
	 dmYcN3UoVDUYFainv/OZ7G87a0hJaEitTDpXJp1g1vBcry2HBwJi+Bvb34OfYKfUY82Tt
	 iko2UmQ2LQsGgLuT8d4oTrRhcH1IJyEVTNu3Xl6VtjrWOscUzjTIx1QkPSQO/fVRwelul
	 JLE4aqMkH+gIP7zAECuBMcHbNHslGsWs6Oc8anghXLKIpMfwCmN8p7ekC2URtDzOiDTWd
	 V+/E6MrI594zQ3zgtzuBmZPCJze7iKNJKQG5auA3CRgPtK6t1RAZYwknhsc82Jrfdzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hpSIJOUQjOP0Sdyl3LIT9vfFufPLepKEgm5OjTXs6D4=;
	b=dG3Av8p0colqB4Kej8qEq4Yt62qPMOJ3j0WnElVd8fBDGQGuOSiyR8nNersodhTd9HUY
	 UD3j61TjHADOPvtiBhaFehNjOokswcBVX31TdbFc6zi/o7wQYLlBxbrsI5o78uirJQ7Yy
	 noy/lj47M9medF5lpYgyhUs0ngk/rJKz7XHYrB6EZu2YIwh3exrfvT1mh2bWF8jE3TpTr
	 yBLsM9ValkELahRx7IJGGQ6TJZ2p1CvcvDK7ea8w5MM06QxaMJZbUyoXkrnhbk1yFB2qJ
	 T74LMC/uJgFzbIznSLKD8Y8SuzzdyS8Fa3Kcv83yYmy0Kv7As+q10wp19vOprbEJ5BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zI+KiSws;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B4606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 832B4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zI+KiSws
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdd74e2f608so3986a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981348; x=1795586148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpSIJOUQjOP0Sdyl3LIT9vfFufPLepKEgm5OjTXs6D4=;
        b=zI+KiSwsA4PQIkGo7owkdUDnN1TPNh8a3xf1LTOkrKVgZ4G8n2qVOo699FBdqB1D1E
         Or4XU3NxYij6VvZwmsu+UTmLtTmSO9Myt4ctnji1Ooc6UjaSrQfprqaLq+Ll148jfnkH
         I/MI34gSLdaKiAOXPL/wZT2ILp9w1uxwuh3R+jAP6o7n1a+HqW72axEyVYQ67dCdMfp9
         oNRNVu4H/WwzCqC46I4DSiek0KBsE8t+e/umq3v9VWF2MhIVTmkOcKeMETB/NnkLRKIU
         QhJk+Tx8IYITYPAdkRc3AFXXjH5z6BjvYbINfwSQ2KKZG5Pf1oZ0Au8wv/kGPefatKle
         NwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981348; x=1795586148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpSIJOUQjOP0Sdyl3LIT9vfFufPLepKEgm5OjTXs6D4=;
        b=QJ4mQ/ijrKg1ifHC3+j7ZUYPRzHkQDLRXrlJLwkNprXTlfcigZrdo+CoBvbylgip5I
         CEB3Pr4uhis0eKM6BqQZMm8RxnyHHiDde1SpOQVrvu599x5kn/nFDcjqK6ndm8JBFGky
         yEIwDe4VwZM0WspxV/yNKDGQs/c7zpbP5H3qJN4KRFs4ASAOvmOmUAnsLusOQV3BXZq5
         18BwgIhbTO0dx/lxRZiOggg3ZwL2Bxa96inkOPUeEpMTQgQYSrmmprPUttMQv1BAgg3k
         lMGA/7MC/0F9nZa1IptSt1PkvGa9ZTzxfZb3jV7MEB9Dk7QG8bCGXXwsZ1QysQuZW0/H
         G4aw==
X-Forwarded-Encrypted: i=1; AL+hErEYJiHAr3anGspPec7mV7ixwvfzq97YvDDraFN/U2jmGskiJo59z4UfWbrgvQFWPmco+m4JgA0D2DX5K+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S/EocYZJzhcy4ydlR3uLKc7n5JhGHXkEr9JHnokjwoCHv+dNP
	3vszACxFY0HR1Ure7CwgdMfYEt9SwllgkgpJ51FFTulnCf3hQMGk5zhG
X-Gm-Gg: AYBFou1pRU2FCBYQidXc+DskTcDDgZWJmsh4Q/M0MAHyR3J1qOj3kr+u/i81c6uQTgH
	LytvmUzA1utOecu5SRMT0z6D7p2tch/gDDfc6cwjzMLwmMHh3aQKEefFnGikY+tF7vkL9uwVwEp
	gpT00g1XNpw4++9uS4VpvZty+y4lA0lVsfFjKLpM0XT3NxtvSbF2Li7JDn9qRuFN8/MafFEnotX
	L9H27hwL2JPzPk1pf06ahPt7FwxqpNZuPQxlsE+BNcdSVZD9wVv23dMdVQjVNeJ6QlnzDco8KKp
	ToNg8Fn2QkggdeVmw6yPNyz1dQOHfQECOvcjjB59Xed9qLGYlpB7gf7GuqRnlCn/axPD5u1eI04
	cqB+f7uJc8BLqvaw0D6dAYfyu2suTgwJsSBJEayrZui51rx+NlPzUl2RO5ozu/IoL9lPO0J2lQR
	OrrEzhwLYj3gljgSwYSXiVBmznUDyl5trFBEHXxLqr05S8MecXh9wfReufhaXr74D1CuVxIRXr1
	GoFE6Mpc4ZJHpZm5wIV8Ir3d4KBXlF5J+gmKj995SbNT9pgAZg4cQ8Cv+DH1DnxSavQy6vGecE9
	6dJdU2EZDmfvjatsv+qwhRHBRwllEYgjapWzQUBnzQG4032cJAAZfE7L0vxf8DqaGc1p1eiq3lL
	A4IZXM0HURkr8E1teiGR+
X-Received: by 2002:a05:6a20:8c24:b0:3e2:3392:540e with SMTP id adf61e73a8af0-3fe83bf23fcmr1761880637.0.1794981347492;
        Tue, 17 Nov 2026 21:55:47 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:55:47 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:14 +0800
Subject: [PATCH v7 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
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
Message-Id: <20261118-dcphy-rx-v1-v7-1-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=1462;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=7sQblceXUwwCxWuG4J0+9R8T6ZbfrV3Py9uIEDjHBZ4=;
 b=IISL7MaqFphE9FGykkbqCzIkGXZYfy271E+jKBfZ7rU0dt4KAzfvgE/OuNoSaciPzWsAGmK4E
 OSqwrJ3fqQGAyD5ybTFE/M9BPzMkGPkV3z/56WMpIf/GGjEDLoB2TfW
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
blocks have one of each and can use them at the same time, so one PHY
node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
PHYs.

Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
host.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 include/dt-bindings/phy/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..9ead74d9a172 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -29,4 +29,7 @@
 #define PHY_POL_INVERT		1
 #define PHY_POL_AUTO		2
 
+#define PHY_DIRECTION_TX	0
+#define PHY_DIRECTION_RX	1
+
 #endif /* _DT_BINDINGS_PHY */

-- 
2.43.0

