Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432751;
	b=IYwCkq+gKPXIXDchuaFjNVSYVqYqw2DwXg7EQEV0tpLOt49g7tl2rBoKCtuCM8ic0kQ2
	 YC2KHDWHyuTZ94jsCVkKk1Bx1kXxviGUuE7iRzX3OWvvpt/nr7AaTvgcXyRXcOYsgaYvf
	 1ZT2T7+FA4hRd9njzvFiREZwGd3RdlLNGzk8HpA51UqmL0EZ0CvHEskwzJa8s1CdDUBNp
	 uJ5f0pyj8PA8DLQZbvqqy44cg08ntRImoPeRyV3jkmxW1fHXAIz2CtD4R4gf99X3YMBMg
	 MblQiXAgBNAFeuuMR21/2wl0s7YGp3t0cMDrKRa/3OdBl8MfvI1DVtfrh87ZK5GyunQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
	b=RQRiH9CEzVgm926yZeQ6YRWAigHxIJbHnN2p5q9STrifk1ELXbpyqVHJrZoPMB8q/IuT
	 9cdbpaaMunAGLnuCtFhNXoOzDkqVpZDQA6wPs8AjOxX4ZehJk365FhNizRIwq2GTIvAv7
	 pwEnm9H4aw8vbQ2jIDhiLYMLkCIuwxQjPR+kst6g2ebwVS+tK1wlxHaxfnqnDAIDtVPv0
	 /GCE+hSJ3HJnyVzkjmg4Hl64fFzqRomd0lsFwzuCpvljusorgs0xDIRIo5OcJ3Nv3Rrib
	 YKnN9DURfyj7KsDknsbWEW5yBF6z6S7umOZ2IPdLNv08wfOGrH7b6Zr3OjRnaC9/9Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcoKie5q;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5D160A2623
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5D160A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcoKie5q
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50e26763a4so577887666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432749; x=1796037549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
        b=JcoKie5qcPIy9VJGNJOeooy8iE89M63mPT4Tj1eTTLSnqtXq2b1lwRilTuF8Wo+w30
         2mxiL2i3Kgv1GdMK5qHeDH7IacTvYGU6YHektDgrSNsjjnCE7wnipEghpMjLc55Zi4Hj
         kgzPLiOhYpRTUT4KP2wf0Oo6kIWuFOkV8cF6MluV+qhv6OhNdw5ZYUmNc1PDQCzxjgcM
         CV+RTr5c85OgIHVnYYn4g2IuTNj8mjnugocu6PNncbEOYSkWeudE4IVx9G5+bwbOTt7i
         HgpA9vdDoDQCptPRtZwyqsw4GEVjsXpuOQPBTB/cDi2VXoVWy684JhnOA2J1Ipoh5CfY
         548g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432749; x=1796037549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
        b=Qe1ceir618X0BdY4hQ6n2xdGaIPUZigv+VsZUzPwqldLs+jwz3JHi0GLW6rncnioSe
         wcAKcqlfAiNyoKcGV8CI4dL2IazdKBEBk+50PzMYyWMZuBWaFy5j5Mt+zUp1PH79DUsN
         mgXp+7oPjkmnC66LrS51DNPrsgUOy+92BiPDWuzHjvFbqTMUOc6/S66lQYNO8FJe9YWY
         EnUbdTMNw1BUpJPDzp/9JcfZAPty+BdsXfwX7d56jSDe4jR1USk+lXQMp117SzQFJNF4
         jXI0ZoiW/FZcWFge1p7X3ONb2ZmK8cYb8nF4kSKxVB9hYyuwFbQvr7N1i/8n5i29u+zM
         1YCA==
X-Forwarded-Encrypted: i=1; AL+hErFENOuCGTqoSYzf9McB6PF+JdKCjYJQWZBkLycH7B9F4/3hezW7GLcf65zqETlqLNIdJ1z6t6AvUxF8Pfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bR9B3qtEjtNXI7twAIA22UighZH+p37hAPvhncu7sJ9GkvR6H
	Cv6+Q9bmZWMseQoG7pGw2zCrINS/I7XTEOS3iWZ82K2/McwtjTyaaIbF
X-Gm-Gg: AZFdTZfTpfrtUKycMSl7AwmCF97DOuk+N1UucpJMiR6+0oa4FfAvGLq/5YTineWRJ74
	C0/pi13sKigB/tCqAgyi5X6WOJeiKOlXn4frBHOv07YmvrwnWit/4xuIqJeNDgRssaL7vj3766c
	84nG68Yd9mYbOkQsrabdB1Q5mNpKym33NsralOxCRyMDjz6uEdTXGND+KopYx1BPw8P3PaHkFo1
	yU8pkDGJXyuruFhouKdbrJoZ37udcXbVVxihg8LiasB0mPUUGZsgYW0QGw/Ce3MLXOVMNc0qC7b
	Ev63OhqTpkzJOF84CJlwT4q/t7CDjT7ETb+fY9DuLwQkXq0+9ddN2NIwkyuUmfjbgiM6Ub+iD0V
	pZ3dnBl3pDyapBDXZKnduE5uLjiAdfewUoaOwDWL9pVzsa4y3WYh6AJEBTZYfMp3W1YreHq9pT8
	Uh/IlI8vz8K5a2qSQ7LWJL/XCtLFgLepI08eiBXRAOIGTe5QMuvq8XIGDoVq2UHNToAkXs80Azv
	a4IJYaZXJbWsE7By6dI9VJg0gEbYGhh5LWAKyjOUiyjg3n31TgwqpaKFOAbi/vbrJWKC+ekY7Up
	mW4G8rWjP7ZWo4SH1rNovZIWlzMvupyr9UedB0oKLNOrqZjk5WAkYvxGTDxN8goARg==
X-Received: by 2002:a17:907:84c:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c513acb5be4mr952960766b.48.1795432749405;
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:37 +0300
Subject: [PATCH v3 4/7] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
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
Message-Id: <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
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

Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its registers are the same as on MT6779, so it works
with the existing driver through the mediatek,mt6779-keypad fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 9f0da1240187..9a1369c9ff4c 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt6572-keypad
               - mediatek,mt6595-keypad
               - mediatek,mt6873-keypad
+              - mediatek,mt6895-keypad
               - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad

-- 
2.56.0

