Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797399;
	b=HTb3O7CBp5BwcXa5IrGiilL2hZHb3XFAJkjcIRJHIM/fWWDKKAR5NBcVY8cZBJPQw28c
	 +4ZpzGTGDhzcvIkRGeAUkC0Gy0LapKvIFFVGOZd22iB8f9HzwdG2fn+zXxZA73KFKTc3m
	 hhXK55W7ZzqROJW7R5Fs+Q2CIfoUc1ke+tlyX1bxY6mkuDiNNXyb2tAzvWbu13RLVuWaF
	 P7opZPUliHbJ9/GtWOTwmkDd9npwfm9whm3oIJx12NGRBA/S1otEJQ1tO8uJ4nshHBbcy
	 w5OkjFrYvA1tych1fp2dnCx/QBmwiNauoOBRq0pWVe/o3JEygaIn9DoFsZZkPl/XHvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
	b=FB8vZtaTHUP093s5XfIYUnCIKhhWCClY5L5n091Kb/I6qvYeCBviuJiNmZ/eH3auJgMV
	 irTKd+hi67FeXg8CVNtZFc4Mvo/tlIhKo0z2vT59UEEzawbFqKun3w4yfYfJzJJHECytd
	 Z538blVAXCo0o0qEiFwhR1QS7cePr+8FESEpcfK4fTC2A5T1iM6oGSOOBSsqFDfmhXnhu
	 /cF8kE+Sz0YlY3Ah+lMx+/df7LWZtotJEJ/7F8Rm/CVFFt42IzsymFiwztYuGTplru9FW
	 x8gjD/U/jSLOGKhJFCyZBkxnITZcacGXpRz3cuYIjInVFDxQq5lxi0ABeYQ8p+V4aGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOTWacyc;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E02606A334
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E02606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOTWacyc
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c51a14bd405so440052666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797397; x=1796402197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=cOTWacycUrZnuCs2B2RKWuHRmIncyI0AtBdF8CI4VyB9txUVXVgwDPMZQ9Izod3ddL
         5ixk59VwKGe/ksQqZ3VkH4jCiTeygGfZK2K3dxJv2VknC/MwH9VlyxZbpNjPwJEC3yu6
         bdUgW3qc/6tEH2DPNdR5Km8bWtncLjYmHz3f3LxGGNBEIXCABiRqKjeC9oCjC0QErzpZ
         icwZ7ymNoyf/YO9aVlZdV2uQt1vVULXdsgf5cM5UdhMt5QIB/i11rGjImGXIsrvy57qs
         yc9HUPdigt6+xPJkOhquP02tOgkdrIfqpJpaCQg86noB7zNMDXa2BtwtSlCd2APfyLTn
         3m5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797397; x=1796402197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=I6+VJyFduBR1H2u9yyLyvZT23nDZ1MKqLTIqDBhUR7SDDNX8yUDcU0LfdtDf5s1rX4
         +SrJkRhHKtV6OJ/JWcLER5wTk0EoRANRSiW1dHkeoG1RCEl9A9ngW8ZzbVBru5CmIpf/
         mAsFBqQMhbcuvpyQ9Sfg8y3Al2xIabeMEy3miekOam66WcdJo8d14nAZ3HpbZ8h2WA1d
         r1au/bA9hNOouHxzuiLJ3E0pc2QlgJZ2v5kNzZB66pSvYwsWY6KI6dapnej33TELyDUY
         8zOR2BmPxkmoMYNVvaSdVHkfV6JCWdfrZUVjQaYIX/VyKsO0wG4qgCjV6NIIrVJXP/2H
         OQUg==
X-Gm-Message-State: APuU4Z9BeTEw0cYIosORqwVH7OzkwR7znNonY+n48uz/DUmLlo1OkCmY
	l/IdLbxxSS3O0KlRtjzICog3NtqkOzs2npb62tOsum1e5JRNEopy0u9S
X-Gm-Gg: AZFdTZeNw7CSxxHJdNymsuvNjeCFbuRx8Ie0IgfEVy6jg/OM/CAnzdHMrsaI3pELE2b
	4T65/S9/+s9ipCQo068OYbuPldv42GnZOCEpSOKEMAYEpoprprr8yrNCCuxIA+C2qMK/e6Qk58h
	ksHcuJYhmN4bj77LgijKkr/LQ4qEo+P92+hJa2S+ariXvX3yNWAzvun2k3ASzzQrrXwEbf0lfw0
	v7GE4yfu1h2ARA7hre66u6rdZ7wjYLdNDreyvGSbKcHL8tEmIphPfu+zIn4WHEXAhtE2REJ6K0v
	mKvM8/0CwXBnZy0SucVEE4+83neSutFFPy34fZyatStt2b2N5W+wIe1p3cw/YSyODskNC+UTSc3
	oiSMvOzQxfTTYgBqLWdUKQXHTJfEkL1CK+BAPjLCQMCTPrbZEKKwjGOND/oVH5m0/neScXmQAkH
	C+KYiysWMylX4g+TpKoObOP0F7Dqfo56UizuLlb25JzOHcmMm2oJematdEMK7xLvYGGDAQ6ibzy
	W2cHlQA9WvP4yIJChGiJhR78O4DTav0Z9thGiEGTC1dPux74vu8eneM6YD+nu2SES9YxpPfFfwP
	DBh1buorV5bjTcczmCVGAbSC8G70gtoXGe7CJYz/6uwCZa80nPIEmpVKzPrvzQ0AlsmCN/BHIO9
	VLMkxDuzcVb8=
X-Received: by 2002:a17:907:6ea8:b0:c51:3bde:bfd0 with SMTP id a640c23a62f3a-c513bdec070mr2097785866b.47.1795797397430;
        Fri, 27 Nov 2026 08:36:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9dc7asm893079566b.41.2026.11.27.08.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:36:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/3] regulator: dt-bindings: maxim,max8907: Document LED support
Date: Fri, 27 Nov 2026 18:36:11 +0200
Message-ID: <20261127163612.280186-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127163612.280186-1-clamor95@gmail.com>
References: <20261127163612.280186-1-clamor95@gmail.com>
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

The Maxim MAX8907 PMIC supports a single LED; document it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/maxim,max8907.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index 6cf8e93867e1a..ee1a305d1c210 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -31,6 +31,10 @@ properties:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
 
+  led:
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
   regulators:
     type: object
     additionalProperties: false
-- 
2.53.0

