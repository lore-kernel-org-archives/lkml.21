Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432749;
	b=Cky6H+N67rHLGoMTOxeozfUEcbj/jHEKcn/ydM0kn3MkjFLOrWJ3Gkoc29SAOIK4NcDQ
	 AftTopTFmDfC+QwKW0m8HwBOC04fyZ/XiIv9MLrM4Hb9n69DGHBSYvW3UTovrng8dljJE
	 r2CGKkCHkIE1GM+EvF3dtAheiQfSg/yjaFF3x7o5euGQzZlQT8RbQurpai6JN5X99UIzU
	 VIMP1tsWpnTj6fRUWJgl9QuIVgWtwtF2ZJyQBPVVJRSv+DWZSwxkDf5LAUCeRUnoJy9ph
	 eMlyzEvit9goIsDe7ucVNMN3GWg6AWlU5SKpzQIDo368pe/ZrBw4wPMJEdLo8KCyJIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
	b=co0eBqOwNHppjnISDcEHBoFVPEXGqmughMGVoDQ2FwfhOr8Cx2hj7YCBok45E6NKPZiw
	 LgO4J7bfg6jXbggw+RIqgH1u9rupVGjrEjdfSyn9dhn9e4E7MkU6pGzVp1aVErr+2neyM
	 X+m/HJBfx+41cJfAWH5yEwclrNyfng8QfO4pLldOu7GDistk5Nxegi8R51JKpLtmWD8wg
	 RM3EYCXYv434DlA0Bct/mnA2RDSyGp7Asa3ZH0qjPkQKtw9mF/5m6gaIbHrFb4onGA4sW
	 iXnUuw15zU3CsJYwTJDt34QnBgt1LCkg8tStmN/bJ/9m22NfBtoP4aR6kujYwAE27VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTqjUcY9;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB0260A2617
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FB0260A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTqjUcY9
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so425296466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432747; x=1796037547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
        b=HTqjUcY9hLartbQ+wDqUUWh+DYA5uBQlIQNY8L8c0PwQFxlYvRUmqcKq9vBHjiWlIQ
         ZEUY4IVw5jmJePNOlSkdFejLPzyC/gnES/8A9mJHHXOsB8T5NCrWqcjznvksBUyFj8fX
         Gdoirno0KXw/7rEQXjyZtluV4Rd+3+z/PNlUakMZEHUQWIAO721PWX1/mvJ6P8xawItb
         ysROTquAqd3jS2dFl+6sDSphM2xYXtslTN97/hpIFiJOGhGv7AuWUlk/hK1ubkcgPaD+
         nmyLdRZ7rePh/oqb+a8G6vq0onwln8KbWQTA7ew4HWiVbD2Xc6bis5BHikU2+BPy7iLp
         b87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432747; x=1796037547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
        b=KOnjCdRNNDOCTWIE7AWSIVbbXHhQ77u93lsmnpsDSTLRgt2oMsgIGCnoGOPEz8Ehip
         ieWUFqeXF8Z1j3WvvN1f/i/D7Ma4aR7TyTaNL23oeuqE4bb4/KRA2W/1sAIybkdPLY4e
         cH3YivKZ7huQj63+Jmdy+gL5eTFy8leZTVRXolKGwiRLsYX0R8hujqRkhzRDMhOxjucY
         VuUgAa+XCOfHcnCe2cdZW9MxcrYB7aGJLjuZ/UYRPTmfInPMe260Z9R24qwh6nbGNQIL
         MhffYJYpaNwwBy6dJGtV7ZadqqxUS4EnVh1mKCUwbzrRP3GEBCXtqMhs8/m9h7w2twVQ
         2UOQ==
X-Forwarded-Encrypted: i=1; AL+hErGorHdO8Tqj82FOIDmhCcJ4A7H8xbv7gYk6fZnlzOvY8GA8CNF7i2reX6esTDPa+lmU0YEKEFCQN3fCyT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W9ioaZIP4mcNU2SmcH/G1XbrGKZ/XL5J8R4DubWJxWPHDMkBD
	hmcwTVzlz6mszEVmSXWbqt0LSKrsPyBoVvWYXLQ7AaFPH7orTv4csPRi
X-Gm-Gg: AZFdTZcs9TubEb8PpTjbgCvjA7rwCl8osv35GOsqBt6Cvgq9sLjkU1oAgr/rn+eg9Cq
	HvVL9lQ8tapr0Yfg+6Ma1CedmNwMTAZYjZ8469lDE35QyqhTRxWWc6gBc4bSI9mju5M2quzgGFz
	QIK0l5yr/bO5lYnMdcZkH84GXrYWw1ursPlprCx5YLTGul7CeIGtmnGuSq3oM/1LsIHmDco2zWu
	IIOdRnmciz3XnNAqdwza3p+sgQdy/36K6Zmp41qDpT8jJ91qTTsf+YhFf9K2kykuPi3dKYRMhnD
	RQxC9S4cz8pVISBQ20PqK+Qv9UNRApa8cAPmSteWzBSylLlai/YYOQF2d+VgkiWnQ4972lH7qdW
	HmSg/79AOgEFmnpcFistZVFl2zjLq1szqYXEI9/OELiHeiB5ED9ed+Dn2vo6aw9VuWjEKQXTKvH
	bqKfCN4UbjmdojYhH2NVspmB8xvazJJ8mZUsfw4b5wA2v+xcy2LdclsLWsBLMhFWt4f76mzPGqQ
	0jWHH6mCUlfW/ShJTiCj4ypmnMFfQ7uupelL7cTeyxpDdsbkM98rFPpv9/fMFAhT9cJ3QZjpPyx
	Tm4M/vz6igLu5kyMausHoK24mR3GEQ57/655mLKDtbsbcKSS4EBrugX1uelE7cUBDA==
X-Received: by 2002:a17:907:1b1a:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c513a5ea1b5mr863152766b.11.1795432746902;
        Mon, 23 Nov 2026 03:19:06 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:06 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:36 +0300
Subject: [PATCH v3 3/7] dt-bindings: timer: mediatek,timer: Add compatible
 for MT6895
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
Message-Id: <20261123-initial-mt6895-v3-3-95c46597e63d@gmail.com>
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

Add a compatible string for the system timer (SYST) of the MediaTek
MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
through the mediatek,mt6765-timer fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..ee4af54c29b5 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -40,6 +40,7 @@ properties:
       # SYST Timers
       - items:
           - enum:
+              - mediatek,mt6895-timer
               - mediatek,mt7629-timer
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer

-- 
2.56.0

