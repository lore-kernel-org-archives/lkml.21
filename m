Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496484;
	b=Cd1eA2KbQeR0Zdm6clNBjkQC/8+aEttdtdL53gDMjyI8Rm8qFMWs3dnuIPzx1m/M+4b6
	 UvQO3VMhkUOMfuNFCFYOaIvRP3BuaKRsVN97yqN00WQUPwPvFHDt2rnMuGOOyHovQWnI8
	 Ge9GnPIZ0ZepNsHwEy0RicplSzR1D33wb0o7yeETy9620tzonzQObEbWNpwpqfhQeEt6v
	 3n0LvvkTLIbRqUg6gJRCjlCC/IXVlgLAx366SljjbPglPd3pNl2hzx8pCa8msT6vQiHop
	 QkevYjgFpH0Ntm+xoAkm9oQPY7QuTNvvFAceirJsNGwVa07CjiXeN9b4XtCukp5wTWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ktgJZX8JcFhhcfmNRdxV4CsSaV1czgWtlUVf7nzy85g=;
	b=s3DpW/iwAjgXTusrmhS4TffqAgtrII/GdhpOCCtl96LQCpx1z9uVpTkdNBQUZ5vMGoVk
	 ZfO+o11bQBx0pEkIxtqY7lXxikN2NotGb7Rfs3SDVrIG0kkPMeXuyz+y1vyz8b5WI5sPZ
	 RhyBod5QQpwN7OYB7SklJjD4XCYV6dCS8lCfm7FWjgoTYvdUz80i5i2pPTXR0u2FZ1LSY
	 YoZhvHAPlQlS5c2I7xhycvtJFyXYEHMEkRg33WTr42p7/BDf2Hm0mP8eFA0pvwj7LM0NX
	 FrpMfoBAlGF3yLzkQuRBaw2bBxS7iN1N4MPKx/5FEtaSSevQOM9IaZA5kJzavWiGSOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFwW39wk;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7401606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7401606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFwW39wk
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so34225925e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795496482; x=1796101282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ktgJZX8JcFhhcfmNRdxV4CsSaV1czgWtlUVf7nzy85g=;
        b=fFwW39wke2UeMDCDyevcDa0QjkORf9/JkWrBApvM1whIeu/MT3idKy4WebrycEYBil
         tC+PUgojm8iYFB5tml3gP3Q5qoYXeQZLfjCRIcTphSyDUmzKxadrvPT3vj3QH3QQ/6f3
         DigN9ccmvY0F7qid5AISIGgJ6jCHfwK5u7s0G01YvulQAgnFvxZbnWptKFZbge5hkMy+
         30OCIlQMWrmeabbQ4o0X2dvLQ/rY7Ecz4yFfTIZPx1Z95fkIKxUY3cPHHJtjjpUwQWTH
         vGCluAYEbrh30LWxsvE4Jk1SBFOZFMa23dsMc4K+wj1Ixf9CaxWfROVbATpuhAxiwU6L
         ozdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496482; x=1796101282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktgJZX8JcFhhcfmNRdxV4CsSaV1czgWtlUVf7nzy85g=;
        b=aid6+AyFySW3fa1LWki6Q4MLPggUhkNE7m083WO4teVyXs1a9FwmWhrfUL533yxYiL
         0sQcGCpnUYqzb0s+GKESsmQtPt44TP0xcfzaaJpzPmgrRjp7+P9WnuQ6X02ovkmAzTwz
         mPStAk6IHaMd7Ed4MqvrHTQ8J+S9djI3yBnyI+YQZTC2zveSzLmFMlEu+a5fF4/PdKtk
         gX1BEm5B6AemSfCH8to1oYowOycf6yRrRlZadH3Y39p/+oVdDmvcPHVks35DWDwGrbVv
         FaKiFYdrxAQrtifd9nzObet8m5oefG0VwhknqprIS9ivaI16onwuPEourdklC74SfNp6
         KCxQ==
X-Forwarded-Encrypted: i=1; AL+hErGy6vr2hfnPmWo9c2kLT5jc3aszaqGTBKlSN9XbRkv11vHEdD/q2KKkqb0Q1uMnC7mDeIRxpeKA0dTNOSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9awzSRJ9rZEVUcYeDnDUX3bTpZ98FnISV4rYXaw6EWPbl6v4Xn
	Y5jDuIdaBUggrMoLF/+rGH9dpaKEAOtZK0bvOM49yvHA4pDE3cmndtPgSkLVYHve
X-Gm-Gg: AZFdTZd7skDyMmqBM/7/iUUszobOJQg8TEnM9JES1/Q2AhJStO5zObzC951OvZEtC7/
	rKEq80GklQBDftYAScq8nTNzPhw2dajgEmMniTVQlCowXHIpHAp/oXaZZVn7U7gUaNlktJ0Ws6G
	jM/QIV94IVP0GJs5PYt1t2kJPvl3BycWYU4advGV+idu5k1GoTdHo94r3D246TL7XBuNUMvVmby
	UzD/7Y5JFNg5dEAByLljVfrDoo5nrA1YgAryupefmlC6Wg/W+JQ95WLWsLSgwfxvMJ56eoYPjwQ
	L5FxTIt+gFE3mz1G0X2p2Os/RYDjFtUUlKbPH0gAx8BMh2DSl9ObHKrvF6cor1+H10efTr4KLId
	LR3XCXAct82h209JiG6rYri2anbAfIk429U56gYWoI+8O8FW5UHybel9g9brHZWkVXpASqKyP1O
	PMJMAQB6I/IQzY0nF7b3Ve8MMPnQURohbIjvT22HcODy/uv5eBFA1pWEe1RzWXPPaO659mtdVMV
	QOZoQTnUiC+QOl/CvlkABK88+Rz09S9UW9vk5YV+sg8E/Qm4ntD+tL5jy1IX3BkN07VB3Q08uHG
	Vx6JIPQ8Pp/mVekw1UHOpQOuAv3Yv/hBcEROH7xVzTXFKCLem8IZzSZZ5mw8BDeI8SbhxQEp+7a
	c0dAZSLtYP+TN7a/HlIXDOQ5mt5eUPa6iKEe1lsqUd9rb00Ex9hNtCB1EqWgs2CcKdP65TYpi16
	TDCGpEWbsKB/zoecy31JeroQt0OGLhdu4xNONYtgj9TaBPGapHlW09
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr272747495e9.22.1795496481860;
        Mon, 23 Nov 2026 21:01:21 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f512-85ee-fdbe-0621.ipv6.o2.cz. [2a00:1028:8388:a84e:f512:85ee:fdbe:621])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm353489155e9.1.2026.11.23.21.01.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:01:21 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: watchdog: maxim,max63xx: Add wdi-gpios
Date: Tue, 24 Nov 2026 06:01:16 +0100
Message-ID: <20261124050118.87944-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
References: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

On some boards only the SET pins of the watchdog are mapped to the
register, and its WDI (watchdog input) pin is connected to a GPIO. The
CZ.NIC Turris 1.x routers are wired this way.

Add an optional wdi-gpios property for that GPIO.

Signed-off-by: Pali Rohár <pali@kernel.org>
[pepe.schlehofer@gmail.com: rename gpios to wdi-gpios, reword the description]
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---

Notes:
    Changes in v4:
    - rename the property to wdi-gpios (Rob)
    - wrap the description at 80 columns (Rob)
    
    Changes in v3:
    * Extend description

 .../devicetree/bindings/watchdog/maxim,max63xx.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
index defe0401ded0..72f16d9f4596 100644
--- a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
+++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
@@ -28,6 +28,12 @@ properties:
     description: This is a 1-byte memory-mapped address
     maxItems: 1
 
+  wdi-gpios:
+    description:
+      GPIO connected to the WDI (watchdog input) pin, on boards where WDI is
+      not driven through the memory-mapped register.
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.54.0 (Apple Git-157)

