Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875337;
	b=DICSCAx5lQc7aWulLLgsRJda6kFGZw7091QtsMWCUWAqqgIzNhsplgTP4SCnV3TJeYFl
	 rGH+4FHz25r9e1CxboBFqAati6b6H+3H7peZiYk5Ld2OY/v1CgelZKwp1ZC5CMb+xwrfA
	 A7FBrIaBVix0UT8AMzl2KdMBMRvrzehgjKBTB56pHEU/je2YlQ2qaLSXAysY6EpXBVkXK
	 TM2Hg+n/dEbSnimb9VZl9v3X/ZAxO6SCNJwflX2N2YskP0xSNdO4tiXrKmMzvkPRAmYDe
	 57GL8MD/PvV6nI/cB8Rm+W8XVyNnANymDvLrOfSGO0HDyi7gBQgcp/jDwIXuuVaYdfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=;
	b=mEDCDFf8JoBvbT0T4o5NGm0lDrWaVUjQkwBHMAQzmJLRugbaE1pxwLUnjYkB7BocrMqY
	 t7NihS2JO6/NoSU8PU2SckDDyTjF6H5/ZRvEa5gxlI56E0O2tlzEU1QPhRRgFg0VR4hBE
	 NAsKtOApQiCnInRzSeEby71TUPPs/bss0CpJAV+iM+w2mET3yjlPW5NPQBjuobHozIxCz
	 934ak+q5T8jUNQfsiBZ2E7AH83uF3cxYYs4AYfJ1NnUL3HIBh+s5UJNGzJUf+gsubSmR4
	 w+nR4uUdMzdxjyzDz/lRHHacRmB4kKbd+QNZsoJVYbtP9EitGrG7LrpH790JhwFZkQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1DsrwTa;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB2606A327
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4DB2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1DsrwTa
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so6874501eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875336; x=1796480136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=;
        b=u1DsrwTaOKllraREGZcoVWCCXfcM/os898fEU8LPndQQVDHGEzlD5p7N2UyXdVPgQH
         RXIpWB1t7EgffrIl5qn0bhq7WQeAIXSV9+NxKYZWo1PTt+sJPH/ZbElXh0NRvhU6ScM4
         yaVlvvZ9t9Qa38Q/DRNDzSvQdfae6KzjJToK1mqtwQOjWv50VNzw7EAI9ZNgrQgObF3A
         l8Gl7FXBg65zpyhRluX2Psw7sWRRTAvta1JotOnAMwa1oG6FbPV8QK3usjYQ5R1KcOIA
         cjyWjW2EaonbZrKaGugZW9MdqYWhX5NrE7ahE8QBFDTnP1+0vSTpnrRV02uZVt9uewc1
         mG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875336; x=1796480136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=;
        b=pBd2sqXwNJDovTWPj486c6Hq9YAWCHie76no1PP4zvlqExpA2zkPq3lwuxpViIevoe
         zFAXWrc2fXjOkaHS2myrb5q6p+2T6Zs2FFyRu7hpDFLnF7NrtVbLZUymqlNhmujeOYX9
         5Fde6472K130i42i867E3vNDQbOQQ97qRNs1iz1mvA9a8iL4qf3AU8xvekp1dqLSeU2H
         kgW9QZ6ngih+htgCsoBl4Atl0Wty0RL2Rg5ABo+21WhWtJf9sVC4bGg99/aRdeuVy7lo
         RcClRMx/3Xd9eugN16fUI3fZtXREqyEnEdY4Rxjo77K4ntQEr/IaFyW6Z0443qTpWnil
         lpsg==
X-Forwarded-Encrypted: i=1; AL+hErFo8aX4/hvE0mj2qB5eZG4yVKR/Q9/nyfSTqwBOyHbIhkImPjJKr8Djw+56uMGFznrs5qIitL1WWrQ4QG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oe/exN461e2JAgyLCuAuqxTZdGrszKGqdlghFCHh1f9U6ZT0o
	ZwfzgU/yccsi0rRqdVS7iZnT/vr4N8B2CZcj9Nw0CfbWOvRWt2jPQJk+
X-Gm-Gg: AZFdTZdGqaOxSK4KEw3CouR2lfLYh5ynk6EsknoWPhRyefmVgBZSX4O+4v/DIZ6UcT/
	oXY1fNbgm/Ax9UxYuS5HdB+IdTnymv8EU8wQo63pbmB//W1KX7nxT77eE26Q7p9rjJgV5tHnYni
	j+OWE0xaWjD/1rlW1HanTUoWFLSk/hx0YookoITgmMxyj8nnkXfiSIAevg1FijL4U6vzo3RUkHH
	zqP/Uyo6S0QGLjdBtgAu1xj9mUcG96mQW2VZKpHQvufmffGS90N/h4V55jwbtrag/4DPtEcE2bO
	CnUDzQYmLqzQRUonkQrn8a2Ql04oZOM9MXpYidK3GUWIcBRJFPizQCyd5soMz+nbvP3pWfhMCQV
	jZQEIrpMRkaZmdGG04HQQH/0f/8c/rhOwwlawYTJXF1Xw5C3SIU8A4FmxOKtJ8c3uQH3le3NCGO
	adoJ8ACeNNhzxLD1epymJRqKbfXMxvsuYyGLy5Ppyqacwo/Ps6xRix2LCcSoIRGAYWXHZBQGS2s
	vKDeL9ALMaE9jLY7UMgErI2LjQlq0KN+EWryVMLSNZDAPzA32rmlDh7jvG+9OWWhyNX8rmbdLyF
	XAlC8pG4gGuJmyZ31bpFQ5FNUT9J/sHK3tF/msQUqNEB9mNPJhUCWnAZy7SyphtWotnteaV5b4l
	G4u+VqU3flJ9rBLmBCXj7WvXwgyb3
X-Received: by 2002:a05:693c:41d2:20b0:386:ebc5:4747 with SMTP id 5a478bee46e88-386ebc547e4mr5532315eec.11.1795875335508;
        Sat, 28 Nov 2026 06:15:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:35 -0800 (PST)
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
Subject: [PATCH 4/6] dt-bindings: arm: mediatek: Add Google Tarkin
Date: Sat, 28 Nov 2026 19:44:28 +0530
Message-ID: <20261128141443.13065-5-sinha.aryan03@gmail.com>
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

Tarkin is a MT8189 based Chromebook from the Skywalker platform, sold by
ASUS as the CM1405 and CM1406.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 5a4779d9b..700dc4293 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -390,6 +390,10 @@ properties:
           - enum:
               - mediatek,mt8188-evb
           - const: mediatek,mt8188
+      - description: Google Tarkin (ASUS Chromebook CM1405, CM1406)
+        items:
+          - const: google,tarkin
+          - const: mediatek,mt8189
       - description: Google Hayato
         items:
           - const: google,hayato-rev1
-- 
2.46.0

