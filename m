Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795232506;
	b=fqwqN9UVMDbl9qYm9a3oHmdJ20vLmS8LyyFBckCYTO+36NXl6hOfmenhX7Wj44IgonZV
	 eIo/rV/+nN0Bn+ccwwQj5bTIzKhOWJ7L1wm/k0rzwiY8ynQKZzUlI/oF7Gy2ZDtKCAsHK
	 z2/IsAE0ed0BZnUZMh/xTaYEb0yuGIZY1x5LYug0zYpr/Azrd3x8I4myzyKmpg+fviAVA
	 md1I2F4szTIAFfsggDRVg6g+5hFRceMznf7sqONZzP4zl0RndU6wMiT0oxc/sjogKOcfA
	 7uL6SDFd6cMyfFiPclcrH8H+pDysfaiosaSmtT0wBOLXUlQmh2qK5I5I0bDZRjVXrOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ah3lmmwTO4kTFu9w/FRtwILA0EF2N9TZsivGOFrxvGE=;
	b=bLeozwpAAwTnE8VKqbonSuAk1LdIfpnBfMavVF/DdMnLk1g5RwXL3LvLOrX3Yuc2ImBZ
	 Wh8jkbQ90JReXhE/dwUmwmn4Hbkzz0IRJIHYZwZXScxsISqbl/AwtrdiDP8pofOpHIjTU
	 yclJCbdbx07VPrjoKwkQhXnNYl30lMfqg9Ig9Cv1wBrW8J1faQc463RRRFdRPY3WbJH/F
	 o7aDDzJYWxWe5mW3gky+ICDXJ6hGeMrweYLktZoJkHr94IfEAABnZF6qy9LykGNJkgdpI
	 ONWA2VWT1iboQiPg8h7JM02FEovrSGO7V2L4T1POaMuxiFT9Rvf6LNUgt+K/5xUbSpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grCEIKR4;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E04606A6B2
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E04606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grCEIKR4
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso3205407c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795232499; x=1795837299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ah3lmmwTO4kTFu9w/FRtwILA0EF2N9TZsivGOFrxvGE=;
        b=grCEIKR4cJMWF+IQ+i5NqGc9xVN2CF0ZHSSlUSV7Mu+7qXfp2Pk439cZfm5xDIPBk3
         vPtzQYQ4lqCwENZ3qfD97Dor1tlQDKOcWav600UXFxRCe4Uit5gsAT+Ae6M20ViCB+++
         C+PFmzVW6LbFWthQwxqzf19b8F/h4iQU1Zcpbb3/OyFNX9LgEgTwUAB4pNNxOeO6var8
         p03cdy8K3T5yFT1ONv/e3yI43ZL626rpWgH3yl4P5q8QYhzDdE/fB3xLL0UkVp2ec17C
         ZshDT97Ca5nx99k89W/kGSyeIAedhRDKXDSC6pepA026x8nLqCVVnMW4uwqkNu/R7Ju/
         4VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795232499; x=1795837299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ah3lmmwTO4kTFu9w/FRtwILA0EF2N9TZsivGOFrxvGE=;
        b=Vr1WDXiEd0yHLnZpjG0WcgmzN4MS2f0yDlkzMhmV+HrESMUqLbk9E2a61IhAaL+Upt
         UOGOpKsUt5Sptbl5Z69iL2X5KVNdQyBmrrJchHyAApEIjZdsTj8MgUVvJdK0WAL2FA6I
         XCZVX5FiaF9lIVrDnTH1S0k942YRo3biJGUQWtPT56z4LQWoY/1HKJgJsKvJkeP8sM36
         S70m13cKLog6czbhprqNOh0ty+e/YreXL6KqlJXi7hPacjpMGTKHjSGX8zTQcxyEVtdA
         1bCB6aKDVvT7d/yRB9aWC4uNctqfX3biwZLHm8kVFiHOCTgMuc+4d9Gpo9bjXvjA/yUM
         SAyQ==
X-Forwarded-Encrypted: i=1; AL+hErHg/1H1A7cwdqQp6AYiEoFQirO0SYB796TBcqOi8NkoSPKBCvUog0ITVWyVlkNb/iFb6W9GhOxEuU+jH+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9/EQ0T+WGhX327fzyNIuOgSOoptoDoe1oJ1KqpmKyWiZJihNz
	fMD0t6cDCMmfnmvhOPO2ah2cwNBqMmkiHqfN+FcNZCWu+Lt51eeQAj49
X-Gm-Gg: AZFdTZf+T5ZcJVvwJEeRZmCsZfM5BWU5iuxi+N6du513CcgnaVVaJbISMP/zz5EO8c/
	Ar10VYkkAxJvyYyIei+pChmrV/YUSdg00v3QQ9+lU7z2ASTU1NVMtL7/6w6+bI2FY/7lOWxsqxo
	sqGR1ABtdp9VJES5C9fYcmNZU+C/DYoi4Nrksh7Ddu3x2ptSZd659NKP+3JADeQi91vv3LDANo5
	HprBF3gLGQw3JIGOS3KaBXVHJsh/yymzkNol+kxCqvU7k0qFUnQMKsMzXfPDIETk4bedpB749xd
	/3pTW9sXgguZIPJuDsmEMUwhrNMaQerhsAE3xqCWj4fK4Xo9vQRtEIZDqohJXXMZvjSqwtolEoS
	CyVaHC8qVvX4nkni9Nc5oyKf6Kiwk0V+b4zK9/8Tn2G0MpIhYQsfEsOfGNLGOBbciw8lGYXrq4d
	xP7p6EtkWAyW9xf+N8eiRWFEjHVIS4dCjYQAy3lx5dEaax1b32+LFQHzDHZ417kA5uD13MnQT47
	8KHnLJoVX38auZP9QWjvGH9uDj03EcMSx2Lbyvw2D5Uyhp7oVLhl865n/Z4+VPN1jzhyX3lEYJD
	Gu8DtJZPFil3dbVFjEvZzok10pGOiMlRZAvIllCCGAJzKA==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr5305042eec.23.1795232498643;
        Fri, 20 Nov 2026 19:41:38 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm20891464eec.3.2026.11.20.19.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:41:38 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
Date: Sat, 21 Nov 2026 09:10:52 +0530
Message-ID: <20261121034053.39878-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
References: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
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

