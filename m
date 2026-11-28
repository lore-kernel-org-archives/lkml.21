Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875328;
	b=Y9B2nEpvusFXJCzy0YfGy59qHMHtAPGY0GSU5ClaHHQfEXqT3/jw1pXVmWU+vxaMQeAn
	 3v6YoRjDC6RebrR7UYhH/OR/jA8xCpfZO1QMqJuUP5E9G1FV/mRFtivj8lgzzkJE0YijF
	 WpYYnHrAJpJghdCGF3crtSxYl8/KxRsGY4ST4uM/hpdlLu7O3LkFfkEZFnQLJaEC2kRX7
	 oCoSDJhPIkv0zyTt82Ls37csJ8Jxb5YLwY4cBS+0fvKYgXbC7UhTQrhZYwPNbXww45AEm
	 IUmJwlVSul141/KtdOmhdKTgieSdLnT69At1YsbOEJD/tVG+Iz6nj4cm6p+1aZwU3uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vKok+0ThrlCjoRPesLMsSdjxyl9vGfxVogmiolLgcN0=;
	b=kYGQw7SbMyF34UvtNf+NycQbecTOL4FS4R5kpDiBwf66iWnjF1UP4gqYF2OnGdmBJguD
	 Y5xheWYtQZZZsvw/lYilq9iSm9Tq4lP9MHcwUkxCGIEIEoVlw7C5PjQNyyPDK9jUhZjYX
	 4Ke3zfGQVCJ7sts93JlYynRZLAOB2s3z9f5+y2mqpPydETq2BuHRtaWIZ8gHvTVRgSG1E
	 xcZrwtsbY7unfAdMG5nMwgFK0z/9AT9mobGLKEdeQg2OihuqS4hywIRif846pKNfZF8yU
	 EZRpVnmuEtPIGS7PfETcLZYW0cRcH6Q/LLW0HG4RZv282zuMYYIab6cYoKtcOqhGSKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=giKfUiKB;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CB7606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CB7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=giKfUiKB
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so6874304eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875327; x=1796480127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKok+0ThrlCjoRPesLMsSdjxyl9vGfxVogmiolLgcN0=;
        b=giKfUiKBEopfwSmoLT7DAXtnLN+3hUkjenmjNDx+C7G94TApoSR7lxLzVQ/v3W5I3i
         w+b1nIqLcjhpXP2d6ylJbcPc1tCpS5+GU+fS8Qaf421tS90YKVvkrY+8q4w4IRE2QKCU
         r7t3yIGEDOQxbIbT1nvekJV3vatYc9WsAtqBrrgznfKT12gi8HLO82lhRMscweRbJ9ca
         zIcSKBffW/5ZkUi/xmTe8Mai488HemAs8p92sVTXrWwVUMOlWB3pA4TDWCEtG8S8jWNw
         xv+2Wvdu9ZAuA8DX9vSZGAYfD8gocd++6mbC1ZCBXGoFDxmSJa6BDGTlmK9bDT6IMbBr
         ZyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875327; x=1796480127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKok+0ThrlCjoRPesLMsSdjxyl9vGfxVogmiolLgcN0=;
        b=g95+cdObzbhA7kCQXyuqlt+JDe1cE6/uMo1jLcy+sC2PDR9EUGdcVoQsnXmt1wtCQ3
         1phA2azNHnuVN+oK2AluQoAz74VajmGiSond+lLu4UlOkoK5vaIM2V9TD6nCc71Amngt
         WQDCwEDjABc++m5X4BZGVCNXEtsDzaLXu1kNOq6LCdmfYypJH0l9xb5CUktua3mvije9
         GfLUqqkkJHDrxU7zKFJd0DR+ORKpQJuRWFLUPjHP8cmoTMI7OpVNtvktA9KYQT23+rMK
         CvMJ1e3T/LT3IC7+xl2yqKr4LMszp66KXBTHfLLZ1Xn3MwQw7ojPu9mB0CRlm1R35SFt
         Xz7w==
X-Forwarded-Encrypted: i=1; AL+hErEwQCmmo1xYWbDo5y+cBuIbPAkSvk8lQICcJBUD+qBZpu3XLIgjuSu5AQugL/GQQWMhqehqVyWLbYK4/rU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rYeE26d3CcUmuPe6YzwYtj7bSUOa57mm/poqSBU8rLs86voSV
	E5MfCZmKZkigIj/M9k61thwF0k4CZmEa5nDeXNrZBL+Ogom7Qs04zKde
X-Gm-Gg: AZFdTZem/HCjKTVvw70niGXKHQPrxB6by1ZWH1Cj6hpDnL4UJ4JiJhlgZ2bG+bjrfN1
	T5mTIm8LAmeVDYptYAIiUfuf5nH4Becm2sFyPw0J8WxxZuDz4tfgfjpvBn25QUBWDUky/8BkCWH
	o7EJ+23QsP8cSNxGjGWffQlnFM/ZhQjpmVpZDV7ZMiL8u9D3HPQHP8yNGg2cUN5y2CHNYsRVG73
	HRncmIIJU+76GOlGSJTWq8eyqKEhiV/JM04a24uCYuZh05NeE2j6FN+pbxbQBdUV3VvupwBBEx7
	9LGexrqiLuzyrRxjgWdzi5Sxt1/SJcgSBFwW71rsizjtNwKWh69P+eD9JhpZtko63u829Vn+ZgT
	yaKTZVgCchl4JpMKY7dIsD2tDrEr3J6Ulyq4ReMO1R9PjqQKcf7vuWp2op0x8nfQIiU1wBKLD77
	Huxssxfukr/uC6BXJZCi/1J4P6csn6u43ObkjZEK3e22JyM3h4C8M+xyBTVPU1RJ8YvswVqxChr
	RrEYRssSaIR3j6tlZ6rN7kH3b+qrofZS5LwLs23unajtb5+D+ToDKbjCqyxEWLDAiQxN2W9CkdW
	4naw22PN4wfn0IArlyzY8fYdeX6Mqyav5JRJpqGDNlCay0E1uSGhdnmWM6uhbZBjJwCXbyb5OO8
	Oa0i71Y5knRnjWXlxNeBIoNeAm+RU
X-Received: by 2002:a05:7301:6405:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-3856ff54addmr30382725eec.33.1795875327352;
        Sat, 28 Nov 2026 06:15:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:27 -0800 (PST)
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
Subject: [PATCH 3/6] arm64: dts: mediatek: mt8189: Add watchdog label
Date: Sat, 28 Nov 2026 19:44:27 +0530
Message-ID: <20261128141443.13065-4-sinha.aryan03@gmail.com>
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

Chromebook board files need to set mediatek,disable-extrst on the
watchdog, like Geralt and Cherry do. Add a label so they can refer to
the node.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8189.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
index e0883da15..8c80a1b1e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8189.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
@@ -1014,7 +1014,7 @@ power-domain@MT8189_POWER_DOMAIN_PCIE_PHY {
 			};
 		};
 
-		watchdog@1c00a000 {
+		watchdog: watchdog@1c00a000 {
 			compatible = "mediatek,mt8189-wdt", "mediatek,mt6589-wdt";
 			reg = <0 0x1c00a000 0 0x100>;
 			#reset-cells = <1>;
-- 
2.46.0

