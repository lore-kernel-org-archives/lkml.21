Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685492;
	b=3vaVLKJrH+VAjVta7oVuSZ8nUGE0hDX1XKDhUhNf6qNnqLlyOecIWQnWSV9qNMVoMLHy
	 n3Amo69XW9bFSiFfIQ6xJQ+fiwI+9yv/JIaoyCYpilQJ6SGUgrcbauA0wmls/C2YTYw4y
	 xTmixTysQZwKevP93/DJ9pMrydos4r5zL1xsYKJv1R493YAoj3csh9nwDDYJhTgHQm8AI
	 +XESeiZxU9YZKqbrsu77XRgfJ7GsO67OmJkUETYESPg6brnDgRw0n5SiUqE1l+dVZ2mVY
	 G0UP0phXOJPVsiLmzOTdSik2EL2BF+ebtynL7chIUb0ZNGDxw6Zka7t525WVB9x49ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1Hsp/nKJQfa6z9fxFEd4d4zCQ7inN3vyv8oVcbS42Bc=;
	b=Ox2tymjImYi9o5h0HWRd60ZoaL90XhzQVLoVdTTK0nhMqrcx7lzMMXF5X4Iuar7PbtFe
	 HZ7FFgX13qei7QLIVK+QKsQFlB7kl30j/7tYPTKEsUwCRuBypm7njkfBmZWNm1MsCPsxC
	 82K6tRxvgAJYHWKHHLSbhgRYw/fIo46r4LvKdcfNXoy4iZsoylM1RGmCliecHTLNFWzwI
	 6V1OXJJexlx7vl1uQ7bNwjPPBwh+PzLDu5fZeD83n2r5TJYvKJV9TAjIzVPNofIB0jkQB
	 IJ5Z5B0PHPiy1ZQFkbBdjYBZvQgwOWokwPX1h+cQZ+CSJlTF85wXLnlEd4NN9PWb9ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWiADtOA;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F1606A69A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298F1606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWiADtOA
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso13756426a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685490; x=1796290290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Hsp/nKJQfa6z9fxFEd4d4zCQ7inN3vyv8oVcbS42Bc=;
        b=UWiADtOAPdIfy2Td76h/yXsK6/bP/5BR4o3HCPmj7HIw8jdapX3wPGP7EE4mS5YqJj
         Iv2ezBrsDwiYaM99rULbCEKIRMFI5VtUV4K2hacDbTJZIjPGQp4uyOJJjg4X+1sMPuG9
         le+gVTEjQT1sxHEuCCudB9vXXtimZWXAyqfV3ZsSVWXZTcy4Zv/hmy5M1AKmNEW7MOfc
         BgSxdMfxxPDcAIgyka7+PT9TSnwa6h3nms4SlvDGGULBvqVrz6/Fei6CksVpN+VMLGQJ
         Yce1vDvmTkbGvncZrsDzdbSGj808/nn26X7W3IekJN1MYx4O7O0FHapg1VWWjx3EZ6UU
         tw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685490; x=1796290290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Hsp/nKJQfa6z9fxFEd4d4zCQ7inN3vyv8oVcbS42Bc=;
        b=V1JYJv0AtGqppZ+9TH0KWx2hFKpfbwuujph4WSCSytYSC6Bss9QhYyF/ty1BmfXZvT
         NUhWxEPTwVC6zC7S49f1KTrAF/ihYy+2WltrY9f7qU/MpgizjnhOsYhT3FITeu/YFJ4i
         a6Dg6U3hL7G4I2l6ClLUGIUt7W93PCkKFxzb/H4qhZO/fK0Q/rjTOj8F1CFLw9HFZuMV
         EYdN3z9mOFgR/3V4t+ZYgeklNURmpdeEtebe4OY+BnBNkmUvTT9rDi/4YogIcDoHGmyX
         ftDSI/Uyz76nwIlI6pCESghncSjqG8Ts5ll7RexAaxBdLWcSUk13obAvB2G98SKFyHN6
         IgsQ==
X-Forwarded-Encrypted: i=1; AL+hErGVJ126qfONuiSc+zZsxstrNWC5VGBCN6Lqrl8uOVGXGDcjx70YWGTQyUvXYosFAWiPri1lnmHNu5USWkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JR5lB3vU/CGteSEue4fsfbdDQbbVGWfB6aUieFhTCsmmNh2oL
	L9M22PPAhrYsoMUBRMHECuf64rv9Lc9gwgzasj3+PWYrHfvKjNQ4KIVq
X-Gm-Gg: AZFdTZf5F3xnfHrHbKQvWiZIdRwjAL0vGbXlhUjqDmq4tQZ1weskFOoCUUNIQxdMc/Y
	cW5OMzHU2sqSncrp36VZhYeHfeJeR+6Kdp86xy5ByS5SRYTp0KC9PMHScwyn+VDjWly5g+1U0A9
	debW80RnxUU9AEst5CM+rBKl8dA+BtqlnuND3MF1DcSJE0d7kr4i29Hlj9xHhUJ5WFdPz+2B3la
	hU90aA3mb8Fwjc0pbwPDhMNhsE/khghLlBUPX58mGzldl4dLwgIHkCK96BMXdwpIaSIhbd+QTQv
	xKQ+qynNgSaHk2T8a9YjGptHxCd2r6SwZj6xCpdpF/dcymw72wGfLCMd2zmN2V8Z9si7pGTFe/6
	kXFKvD38P5Fbh/tzMx2DXeW86TPca9R5kS+mDlyR51QUi8j2qD3fP386OhZrTK7BebSOg+mUC99
	PW6mBibjui55tGlu0+SS9MsHu1040IBdSTx3QMTwfMzKf8UnQpno2EY+YzW09cTCMf+ktB9S0so
	vZc+AMENj7VtcHEYZonzd+z9lVL7F6MDA3T/eZhSO12/ysze15nkphBzBIBq9uDStHelAzInEC/
	5yaphveCvfzLK3eizJgUOliKF42ufwkfjiHYmehW09PNLoupxtWfA9faGAYMdyfHyDpPSek=
X-Received: by 2002:a17:907:ec09:b0:c2d:c6e7:9e9a with SMTP id a640c23a62f3a-c513a816ce5mr1651611766b.11.1795685490519;
        Thu, 26 Nov 2026 01:31:30 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:30 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 11/18] sparc32,leon: restore the kernel header offsets used by U-Boot
Date: Thu, 26 Nov 2026 10:30:16 +0100
Message-ID: <20261126093106.1345825-12-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126093106.1345825-1-linmag7@gmail.com>
References: <20261126093106.1345825-1-linmag7@gmail.com>
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

Factory GR-LEON4-ITX U-Boot checks for HdrS at 0x9000, then at 0xc000.
Reserve eight pages before HdrS in LEON-enabled kernels to restore the
UP and SMP offsets. This costs 32 KiB in the loaded image.

SILO, TILO and the kernel's piggyback tool can locate HdrS relative to
the branch to gokernel. The ELF entry point and header ABI stay the same.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/head_32.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/sparc/kernel/head_32.S b/arch/sparc/kernel/head_32.S
index 6547717aac20..d36839ca1f03 100644
--- a/arch/sparc/kernel/head_32.S
+++ b/arch/sparc/kernel/head_32.S
@@ -64,6 +64,14 @@ sun4e_notsup:
 
 	.align PAGE_SIZE
 
+#ifdef CONFIG_SPARC_LEON
+/*
+ * Factory GR-LEON4-ITX U-Boot checks for HdrS at 0x9000 (UP), then at
+ * 0xc000 (SMP). Older kernels had eight pages before the header.
+ */
+	.skip 8 * PAGE_SIZE
+#endif
+
 	.global root_flags
 	.global ram_flags
 	.global root_dev
-- 
2.43.0

