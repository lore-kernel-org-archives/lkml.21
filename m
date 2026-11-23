Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432746;
	b=eILRzXUOIpnRHlMNj4OL8cxqqYTLcFfxzQOk4HL+W+vYCVBpxZDmkLSLuqicOAsA1jaH
	 lcx+m/vZyvnpNdegMVi19sZmrRG6jswrgK/7pu2e5yy106JziSVSsbA9xtCQ2bRadAl4c
	 1eztKjBVGag8kSuVVnWtbnvTlR4Fr0czv2eP564SP139vQIcpoN17pSAl8vUJRX+LGn1t
	 oQdL3v4xBOWnZePYyfhCSLzzXIyfCvmLIf14PnIpj3TO2J30xHKUVfRVoBARODXMlDEzU
	 iiWXN7+OtRyvt7m/HC65+O0RyJQ0rfXHK+XiSzXU7bWzjr5gqIZIHYOE/+fHP9EEbkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
	b=cqusMhyBq5onX8KV19anzo9/SqYJLGqbAsf+UoUuHo7OEErlvcgHyU7EcT+vz+BDBvIu
	 cYx9xPKGVpdnMqZm2GLKn/tjAv8WIDKjfr6m5Z+4MakADovfDt9DRo9zHHWw7nz5X7Uhv
	 ByZrMqzcMDfDZEKRt0Vn/F7kJ2EFS+vxWTW+M/diZf4svqiHH0qYwebVBvhsD17lJuXRC
	 ZlgAoxpedlfevb/NsvgrbkMI8hNQUWqj+O4neZzpJB0S8MkfuomdHdGCWGdDVb9iwzLTW
	 Ri4JPbUpYCbiVkGvI39Qqwl2g/kgXLVBxPjZ9XySffk9JEGYvi5uqUkmNxkwoGkiazA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VfIg7S0N;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74CB606A682
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C74CB606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VfIg7S0N
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c515369b627so266676566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432744; x=1796037544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=VfIg7S0NyjDFiESdcciLc42EeZNUHkJFW+yGCnS+PA5FOZnFbalkEzBPwAkLuIayTa
         eRr83rB0tVsFoar4KBae9dFGYMZVX68eI4RjOO0yq+tVzl2VhYKSok73vfwwVjZbSg6H
         d6ewwLont5tR6xs0d8c2QiD02Y4M2y5Y02DebZ/RuAAl5cc1HPD8id35r3iMfrsLug4z
         MijCMWgZ2iXwVRvzNp7hJH2BQXLmLsLnSHzmlnWqZq/sjECnDCsociBw6WQ2fZU1z1KX
         zmfHulnVN2dQYmRqS/w3NZULcuK1a7Ac/Y7lAXMV9j+jf3FA7SbDfrxoGfY3rN+z3yX2
         SM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432744; x=1796037544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=yUqerhy5AMJ+D1IvSn8zvyQ8Y7R7LFh73Hi7SURHebyLcHSM/fC7RDJTTFVdY9U61N
         l+YMRzheplL2Mex3s8lI9brjkIn9NUD/d1PMiPfSNEGdEDKEnsFz5is05w4PJHjBcSgO
         Qmr4Tf4f5ylfnKDCNqaycLmFIH/okq1WVlaITWJAqQeHmLhkdWKZvtKryYKJsz9MTcST
         lM6H7VBLY0wE7osXdF/6QnWkV5/KGMYdvIY8BT4ktttRudmhiK6J2lIR3TlhFCHgBCNT
         iaBvmbiu5wH3da1q4/9n3+B3I2q1N6V2fVMiEm38+leKzFJF7LprxPnO2WN1iSZ1uFsd
         O4/Q==
X-Forwarded-Encrypted: i=1; AL+hErF2rDrbFBCYPw3XdwIPJwA5G7pbOSASWaoAkaE7oWzoMP++KbXNa3nGzEA+oecdhO/bzk5bVkNrwg4O0io=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PnzshPqYGBI/zycEuf59flywIW7sBPeEbUiXStzTbICpN4tG9
	7BqHLw6EJ4InCUlnduBctFPOIQJCZJ/kqbqal03Fcudd9UN5DGFKBZv7
X-Gm-Gg: AZFdTZc75l2iMHtW5x8mZM0bDL5wWhYuuqZNTQ0giR7mK1MbxE5B07kCzFkhSF0wHXN
	e5OS4RDLK9xnpmryxiVOktEGUt6RxU6YKgORugEEfEXfPTq7rWVRBUCdzPSp1F1S8CCFFhCdBg+
	oguBuaBWTJqzDL8RixBwPBKUsngR3F9kpW8aZi1TJt7nFl/3WUony2sTtdiLHwdEFzKXRubMzX+
	CFFUZthsmtNsrf2XWJEEnhhdyi7lP6woRh+/qRcMxQ9rSFsZKFxcajfYUKxPmoL9/6QYhvj/zwe
	aI3fw0NTuVpM0y0MVCeRORgJiCoLHlPsX/UFTVu8BuRwzIedIJs6maO2sgy/m3ydd6mGAoTjV3C
	XaMx/WVxcOH77Jd2PYbY8r5Ipmy6OwAxQ59ShMjyiuIsAo0rQ7DUxB4JCkIRhgiXTGnB3VK9JO+
	vfYeDhwzk0M6NPZ17738fJOwt22c7/B0jmOMfH2qSX3RFHFw8EFFJqVaGfhIrj3zQnIUjtb5Lrd
	phDrqhz0mIRwnEndt0gOXAaPVP0TXeESlJXtyPYV+4PmNQTMt+3LO/NuN3oIt1NvwWbdwff0t1m
	WU9lK/fI4Fv9peEpfy6K2TjnoyuXISaLqQnJbveX11xkYTbQl05lMvugsm0mUB4w+A==
X-Received: by 2002:a17:907:948e:b0:c51:3b09:f7f8 with SMTP id a640c23a62f3a-c513b09f8eamr826376566b.25.1795432744060;
        Mon, 23 Nov 2026 03:19:04 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:03 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:35 +0300
Subject: [PATCH v3 2/7] dt-bindings: serial: mediatek,uart: Add compatible
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
Message-Id: <20261123-initial-mt6895-v3-2-95c46597e63d@gmail.com>
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
 phone-devel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
8000/8100) SoC. It works with the existing driver through the
mediatek,mt6577-uart fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..a3969cfdea7e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
               - mediatek,mt6893-uart
+              - mediatek,mt6895-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart

-- 
2.56.0

