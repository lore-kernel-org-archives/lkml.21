Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174548;
	b=TlOMAqHXYpbxIngHLB3p7XT4xhHfOTtDuQROCusqF8s00sAk1qWflgsvfsBAAnT0ibz5
	 BLacEPMlpQex/4u5Ywi7RGOkFtHqfctYBNMalaD0mfVxPj47Cmk6ujCU7JPNEvqUQSoh2
	 vdjV9W1SsTHuaK9pAr7GE3ar2jTvA15hoAXrtP3Fmtymv3kEwvEeAQHgxuj1QFWU8dxPG
	 ag8x5Xlu8QOYIyJyp3VD+aU7enCnbEg0T52mvHLa/Xva0FfDFlGLg/bTwMakL4NDOKEJF
	 3JHEnedypPi0Td6ma98SAy6al1u//J759HLBl4T06Gld+pGqeBhbAt1KuLm97aGIl0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HvhrYvkQJ5ZpS127ix42A5EcPEqRi5eUCbysMzVh1pA=;
	b=ptjlnfYTIrBWeMqUPNumDRqUDxJsTjRmMiAD8Bq9FNGZRSTMwmzsxRPN65tHcjElOZRz
	 O6fYJKskvu3kjIAffvnCkcozBNtHdKU+1cg0lYzzTqfX16TwsBrJwRJ1jPnPMU3+NGi+C
	 4aYjVXwZmKIvw5szBjOxbtg+X5x90FdTIVGXzfUZUDZa1QCoNfBq5D0i8TSs9c2Gbf5km
	 1fNzwDJJMrfQjxRGqgSSxE/er1p4u47FsCkk99M1bH6Rme45eg05qF6cD7+BDND/TLW1L
	 e/b1WXRRYVhzxxQsABNRQKCefNGP40f+fd5pAtgg29YAB7gyg71vgm39G7NErQbP3/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8804Fsh;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084B9606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8804Fsh
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-3831d564bcfso270977eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174547; x=1795779347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HvhrYvkQJ5ZpS127ix42A5EcPEqRi5eUCbysMzVh1pA=;
        b=F8804FshacBXUMg/wH4Wtr/0VP2vIO3Dm4XpXThTdTquux0tCMMcJdodOwqqYYLeut
         S+MXrTtXtCRvItpFAva9SlwOYDjY74QZ8AhJIv/9LZEOPqXRSvxNprxxPo4cnQdxxwuS
         ytmVyXPxChg1iabq3Iwd1F1vHJvuNgfYp473HvgpMKlzbvZDVuRqZaSP+n1r/kAHUh63
         3f7E4sH6Cyfh4VDqd7+k9spmogKiOLKHTrcZ5jxA8lGylgvNNr9zRYFOQ0o1ejpA361z
         d2wACCl1tPsoQ9IBb+DX23jOmvaIQShaxhykkpCutMA3INrku01gF2BLqjrdXH0wNZ+1
         NdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174547; x=1795779347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvhrYvkQJ5ZpS127ix42A5EcPEqRi5eUCbysMzVh1pA=;
        b=B1kkTDTuC7lwkwBcTKjzJpbqZMcGrMu2lhdhMHFA3IfAMG9Bx6hVxI/Fpcte+UlDy2
         MNZcEYNWPP3OsLazPK1PB3ZlYyWdiAZaxcYpit32Ib1otMVp2X7cpoZYV9pS9Yf5qHFY
         3TmicLv92K0tSupJIsGDRIY6VhJL8+TBCpmkpYKd0XjvGemMW7oxxhK88pK9rc5yvH3r
         m6BoaYXjdYNItLn/v8sQUNVk50eGhgkihSPcRpG3NQ6soSZTg111D8Tp3WQ2R5nk0SXW
         xk/RMR4RABBsBAQ/3TLymicEys4MviyONpqL/kglxGyx6f/7xEQvhWS+pa9EzpQBGWk2
         FWjw==
X-Forwarded-Encrypted: i=1; AL+hErG8k4C5r1eSvBgUQPapmcoVuQ200HTgbOEK3r86yucSeLtaCAKkObFSMb3nZP/svqEvtusmXn4I+OC28VI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q+evwK7UJRLPIn7Vu3smM16FWOTtU92r1xWHz3bKcE8XVVZ5p
	XGLv+ggXTwYwIj2iNBs/6w+Uu97D1bSPkA01SOWACF8guqHnbvusu1Ev
X-Gm-Gg: AYBFou2TVoYsvwfvaYp0nJl4Ln/pOtdOP1rPI0mJF8aYSNQfESlzZBEeQEqZNN54F1x
	ZWxMufm/dxVIzeEfT72fcSOICafl+038HYZD/8gS2Wu1jqpVwr3aH935oVj6XBU/tiEuuqChYlM
	MEumUSHmsqOALGH3YlXiMB7Bc376Ha2gmjcAW6RsYYfLAkWDI+y2MFMYWhPGbziadnSSZE+ctFU
	xoh804yx7YXWbSywiikB1ZWZzyopTVtVrHyJ72KL1xEyviuMpJeAjop/ns/bdJ4RhR1sNdG9XFK
	51w1T4nuh+BIc9NCpKKZzuSpzUbiOULgPdkdJJA1fl3QXbZQv5ZEoYbiU3+WELHHcE6PSZKjTje
	oG3YFw1ADS3sTWqzI2dStBBPbtDQ08RlpowRZyYjTMOcy1y1wP9T2qde6hTxUaov95aYdywOa/g
	Bdp9Stt/dn9gSWBvMLKBndoyXczIjpWnwfiqsaTwm2cVEG5adPXimhmmOO1KC6q/R+b9PqDI2Ef
	wVJOu4i3bQx2NMrnO3yIoUOmul96VJWcP1pFP884dZzs7mA6oogUYvb8aI7I+9pQWYbCx9RJGwa
	C9pWV775D3Cf/v+ByXw+hV0tKNlnb7CM4RI=
X-Received: by 2002:a05:701a:cc88:10b0:151:6e80:ba7e with SMTP id a92af1059eb24-1b5567dcec1mr2519969c88.4.1795174547112;
        Fri, 20 Nov 2026 03:35:47 -0800 (PST)
Received: from pjhArchLinux ([199.102.217.182])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6274610c88.10.2026.11.20.03.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:35:46 -0800 (PST)
From: pjh456 <pengjunhao409@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: rtc: haoyu,hym8563: document vdd-supply
Date: Fri, 20 Nov 2026 19:35:01 +0800
Message-ID: <20261120113502.563894-1-pengjunhao409@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The HYM8563 is supplied through its VDD pin.  Add an optional
vdd-supply property so a board can describe the regulator connected
to it.

The property is optional because some boards connect VDD to an
always-on rail.  Describing the supply also lets fw_devlink order the
RTC probe after its regulator.

Signed-off-by: pjh456 <pengjunhao409@gmail.com>
---
v4: rewrite the commit message, move the AI disclosure below --- and
    drop the version links.  No code changes.
v3: use the generic "vdd-supply: true" form and show the supply in the
    example; reword the rationale around the hardware instead of the
    fw_devlink ordering; replace the non-standard "Assisted-by:"
    trailers with a disclosure paragraph in the commit message.
v2: rename vcc-supply to vdd-supply, matching the datasheet pin name.

The patch was tested on the Purple Pi OH: cold boot, same kernel Image,
only the DTB changed.  With vdd-supply, 3/3 boots registered hym8563
as rtc0 at ~0.6 s.  Without it, 2/2 boots failed with -110 at ~1.37 s
because the RTC probed before the i2c3 pull-up rail (vccio_acodec)
reached 3.3 V at ~1.60 s.

AI assistance: I used the HYM8563 datasheet and the board schematic as
inputs, and drafted this change with help from Qwen3.8 Flash Next and
DeepSeek V4.1 Flash through the OpenCode coding agent; Gemini 4
Hydrogen was used to cross-check the schematic in Google AI Studio.
I reviewed the result, ran dt_binding_check, and tested it on the board.

 Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
index 0b9f39ef0edc..ce9712e2c406 100644
--- a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
+++ b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
@@ -29,6 +29,8 @@ properties:
   wakeup-source:
     description: Enables wake up of host system on alarm.
 
+  vdd-supply: true
+
 allOf:
   - $ref: rtc.yaml
 
@@ -52,5 +54,6 @@ examples:
             reg = <0x51>;
             interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
             #clock-cells = <0>;
+            vdd-supply = <&rtc_vdd>;
         };
     };

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1

