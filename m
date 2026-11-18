Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044627;
	b=IlG6aJ3Rg8kMWyHzdpsAHR8rGco3pZgdwffz0XL6NjnUEAsGb0DCO5gNS+sHagb5qf99
	 LLt4MqGTsw0sHM9ctYo+OWARUP5YMnYmg/Gtc8m0z51M3LGXJtAPDUXWODSv9EseCUPT7
	 fkuYcf/n5V0gt9whD4EmVCx3Nv9FZJEBiVCHzyxQJLPNw1iIjJfl3tqp6ShPhS0vJFMIJ
	 ATp3643siNNQjhbjxxREHCHDMTu6x9esTggi2cSfcqVt9jwg5ysCnay6AgN5cGjkI1cF2
	 sVCrBtMW2OEyVJceBZ1JjEIRBcxXldQ8qJta52y3DJ8xhBrByQOMJqHXVEjShQkDWmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=;
	b=DIx9DcQqWK+nEaieQlL0Hfr9WDADk3BOLiIj0S8+w2Rb6dUxHE0gJCX7n0h8SAg2+Coo
	 nHf2nmK6LSFWstjbbvaeWCt3JU0jUIka+jMYUrsv7kWl94eMIKIzf3IynpUuKi3ARIFU8
	 oWpJil83mxb7wVTwXMsHqwziYZkde01C06wS+L2/CY4u3PR95s5JD9mTpmJAaxNqnMUhW
	 a/RL8Tbexoe8i0XTDaWptPWaJGSaLLx9niG68zlR1o4rhBadleOWG/sX3hdJtJBwueUtN
	 asQLE4iwt0RO7iOFLiTknk5XLpO+YMrhZ8v/seQY712QhsInVHdz7/tYbZ8dAx6I9Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQHte7tw;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B83C60A262B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B83C60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQHte7tw
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso92519266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795044626; x=1795649426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=;
        b=fQHte7twvVa4ti4AxeR3ITcPPyA21U0F3oX5LUSp6ezZXwCo8Ey7OWJob3LF0UVAAr
         I2hSfFTBtO6ahErE4Sa7nZkKv2B06BtkHuN7bMEOGpwxaiRIUZSDlJ8IgxL6rfAPQFnf
         FdfXVYD/bFQO2hVWPOd6BboDk8yn3XxgCJQkn3LdMBTMl28FeDtWuO74QQqNRgp8dGqa
         /b0NPin21kI/JlfjlHPl6HNpyQx2X7DNsvGxhyllbGHYhwsx/KEfpnnP/uMNscEajQUD
         A59I2/T9EcWbLLwL5wsZFVqG6uZ1OJVERuMb98S9coSUcftQL18qWAwSEfw2sprW5DPW
         bnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044626; x=1795649426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=;
        b=fM0o4VJBER0AVRaQ0WfEYc7OEC4yzM/orBFeSBSSIFSOUPrGGRF+d0hDIfBuk22Dgh
         ALP6fK5i8p5yWkkSHp9fzEZQjjA28Z8KGT86skEpdfR9eANfSyIwVNg0QGc/O+iG/Iwy
         qlJG/Esq5FiaZqZZUgNXSdZUKm/clM1mXUxXep1LZad4iY3n/t+QKhOFxgTfE7M0ynlz
         J8y44YFS1Le4YHgWaZpA38t1zHVgIojT1L5SnIJtxP1AUoHFV+20j+Qr0GoRiazo0uzK
         QyNCeUEB5iibZeyIETCLn55YbTBQvdFNRdhTd+EWthw4yDrwyeLps4mzIF256d+ODoPe
         /v8Q==
X-Forwarded-Encrypted: i=1; AL+hErFqvFjHjEfC+Hq447g0rzjmrMoDTugbOAnxyTqfXdXHDduYVDfzCeLUa/x/x6o0Y2TtzS7BOOtTDS/UMrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LOZWq/eCIW9KpQOTjig/0Tjwust1ucd/gsRU9dpelnT4qzvNp
	btgIy23DLHZnI1op+kTLzOgvisy+thwL4Ic0XXcLxLnJ1ER4PPhsBjeHlO8nFw==
X-Gm-Gg: AYBFou0XC2wIhPpMzVMp5Y6pDoSLwscB6Qh7RzKaK+EVCVaWeztuvCOK8LVvUxGMr36
	cNcWCGa+IrZeG6Q/04GT07G955NGXzQa2GEuoZ4azHAs+OTInYIpTb8O/375l4Lvx1Xz+PgC2lU
	+DiAfSCcQJQ2XJfp8H+NhepJ31HaoJrUK/PaSwoZ2I60MRTNeP2Dq5nMzof6KW9ToT0GCiGfuIb
	gDcfKlVdXxE6bNBOKyApBDy9gPbxaql8t7MS3hCUY1CfZOIaKK1mU2nLCWE+uwlfqBGg5mkXnEh
	HXSU/k/fYgHo3kbOVjf9iYDt7/1e+k1uUyLHCbwkGYSjh99vYTfG73ZffORJrp83o04oj8zIDyR
	EqplnO73sPZwdy7g4T7H+K8dD0OlokF/WK5Uex2L9Q+2547VYUITlF9SptPBTFYnFv+dBkoD7tN
	/sX9FCV+2+1g6inobCYZlLSuTBvI+sk1x2izAE6WQ+Gc5XsIQ1SIp8Vk1fKgoLv0RAjeOXEvuSw
	pj6T0lCBaY1qxYZY+vJbJV7D+HLz525fJFDdQNzEstCDdhC1Hx4AT0uHfs4xmSSIt5rOolLJsBU
	xIn1XF9qjY6y1bo8t8BVrLBjYPit0wlbjgo9SK5L0Gk=
X-Received: by 2002:a17:906:4fcb:b0:c51:249f:7215 with SMTP id a640c23a62f3a-c512b8a55f1mr7876266b.7.1795044625877;
        Wed, 18 Nov 2026 15:30:25 -0800 (PST)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm47809166b.78.2026.11.18.15.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:30:24 -0800 (PST)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Thu, 19 Nov 2026 04:29:42 +0500
Subject: [PATCH v3 4/4] arm64: dts: rockchip: add FIT-PCIE-SATA overlay
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
Message-Id: <20261119-ok3568-c-v3-4-071840643591@gmail.com>
References: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
In-Reply-To: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044612; l=2276;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=BU4GHjU/addW49Fi5owY8SmKZGnqIixi6vq82uwwdHk=;
 b=/neaR05ZN3d8VDseWD4vUUFnzqAFmowQBx0qURgqWIMzl0ozaAIRHvzg4a0boh3p323u7e21t
 FjwCaP2NmMlCftIXe3BWOgr3mCScXHJSAZQuCsYw4a8uF5wZTDs6Ok7
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C board
and allows to connect SATA drives to the device.

Add overlay to use combphy2 in SATA mode.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile                    |  5 +++++
 .../boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 48c83f79f83b..45e94a44107e 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
@@ -275,6 +276,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lion-haikou-haikou-video-demo.dtb
 rk3368-lion-haikou-haikou-video-demo-dtbs := rk3368-lion-haikou.dtb \
 	rk3368-lion-haikou-video-demo.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtb
+rk3568-ok3568-c-fit-pcie-sata-dtbs := rk3568-ok3568-c.dtb \
+	rk3568-ok3568-c-fit-pcie-sata.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
 rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
 	rk3399-puma-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
new file mode 100644
index 000000000000..474488ea994b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C
+ * board and allows to connect SATA drives to the device.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie2x1 {
+	status = "disabled";
+};
+
+&sata2 {
+	status = "okay";
+};

-- 
2.56.0

