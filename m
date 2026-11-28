Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795882077;
	b=l9plaWEZ4UYYPR6rua+ieskYencfLRnWCM+oN+z+XNT5Ri+Z9h/nCSwzkMeTUMUUss5J
	 A1Sv1J78F8Pw4xoT8doX+VFqaAYWJGeobDjfPV+xe+JXRpX2mLqxpXfRtrJgB4DONOqwS
	 bsqA3dzjHNpM8BgVAA4IfUb+zLp/XZjGu3JUIP1FAqlbODJve1qN4k9buDz/pyy2IAyXx
	 YglpyC5hK2gVFISJqvu66Vi6Hh0E2pjZszUvLv6HsvvnDX86L6YpoGey2lG0B4xSwnyB7
	 o+fJJuBkRCPPdcDGe7PMGjc5woly0Vgm0kKYcPAOMb9hOCkilrmNtYTwVC2mCkIpT4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795882077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oZV3wNrzoZWupHzsUQKbiFR8qRMwYXK+sqbWN8yIGM0=;
	b=v7bmzDOmndjsbvZIndtVIsfb5R8gSK7Qj4i5AhO5d58YrIHkMX8Qx/GbwLRY6anhZcUG
	 Z3tNfkWwGiHwnnCG/WnqrqrZgQXBnshziEXSY7TIkkYNYj4eJcwIoyYbs5uHPSRyu+BAL
	 /i1Tox0AXSdb1B3UeW0/naTFX4HjNb8/DBj0d/Hh9mm1dGip1ZEmoU/+QYpGzD5LIruBy
	 tnQIiThyGKVH/kgtAMpy6GZgp/Ma1iMO5B1TnBXlPcwWVuxaEwN5sfo/MDgEE+Yh3yAMO
	 SDsz24tuoKUXVjHt73ymo1FFE+LHkYo0kD5Ner9MsZJMq5oKfAnE4LcOtUUXdnIxpCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Krj5goYI;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F8606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F5F8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Krj5goYI
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so62031885e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795882076; x=1796486876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oZV3wNrzoZWupHzsUQKbiFR8qRMwYXK+sqbWN8yIGM0=;
        b=Krj5goYI69/cHfWaxsDnzvQrlnx3wgiWXbRJjmJQYzJM9s7xgbgl6jNtSd3NaL2Bt7
         uNxn7KYB68Do+bfpcBhaseKUKh75lISvtf/YDvDrtcg+WtGjhUipS24ksulyVENlUHYY
         UbrVE3UKo4fkMf1dDKn0VVQxVAeMDZ7CcL5LNQibJaLWBeHorJPu+EfVf1wYrOleKKsi
         VB/iyjbRtE8J2WP21c8Ci0+j0yv7hnf3ukOeLF3+vWwOeoRa6tQ8nWD92j0kDo8jUDYD
         W0Po0ZwEdPiQwf7vPOirDaF1wSKNl1bkYVJ30VpRkAmvhrQY0KEUuNkYzNwCnSgusdAG
         SibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795882076; x=1796486876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oZV3wNrzoZWupHzsUQKbiFR8qRMwYXK+sqbWN8yIGM0=;
        b=aPRU0eezg1f99q+dzmbyD8GJtY3oCAnd/ixOmxlu3v5kuDrHnZC7OMYG92rzCxPuew
         mTp4x/b26Rir0bsbjVN17Ku2DEHk/WJzLjjP7/c+KWIn1lEIE5MGehtTXkxZDY00Si44
         jACrbIn8Zi8oi0GS7F0mQw07MkCAL/QR3wo+Z88VlUzmJOOJAUec1HEcjSprb53uX3Sh
         lArkl1I/uisp5/zeCcgnmad8xMJ/yUx4oWYSg8VPHsjw7HbuqoeBhl6gDg99TJACyzDw
         9FSrZgz8pZr4HLwOvMx05ztoRZxD24CDQVksUtnkNOYH5VlACSu4MSDYYHfFpFwB5S4G
         pYsA==
X-Forwarded-Encrypted: i=1; AL+hErEJ2ZqnLQwZna9YHYNYNuyvbmheOMNHxfMG+k7G9NLfdhPmr9LIhR/1xI9D4DihZaGk8FkbTdGiiNqm7O4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dS/SU1OXL+6jQcl4oK6ANQ5SEPNUeLL8jDr9dSs2+8o7gB5KF
	ufUrEIaDAZKF90xd21vao+aeN/K8CR8Pl7v32r7IOeCiPG+B8whQ6IwM
X-Gm-Gg: AZFdTZeDaPERyQYGoii88s8pauyDsMM2rjFbDqu/p/eyGQMmHhqyzWyZYssxD3cXMcP
	iiyazZ/MM46ruW7RsRToBDNr7G9Rx6Xti7V/FICmzBS4wIJZ2i02g3tP9wh6ecnzubUS56BLftn
	EXbDXuejvdduTIvkPP7s6IHTh2XWge1xlv0mIR5CbgblgJieFMCIgDYWZ4wTsLDeOIAEY9hr+Pg
	0ROMJfGIjsM/zCcIW1BwyeEs15cYi0nYyErfOZxk2MPwQR3mbxaM6hnqCTEh6sPnLQS/7bZJGtX
	bh2DHXXZbgU3OOlmmpywP5manjWcebILI624l+q4ek/xW005whiNHBfLF7yNr3CfsD32Ki74f3s
	O+UHOM8GfICDaDLRrMdjkE6rbd9zQi9CMCi3CJZbll2Xf/KfXKjpDhE4Gwt1ZkwpjMTdT7KYZ3Y
	lV6nHo4wwRTaCixobotzojIE08prhJnpP0BaGrfGeYHc/A3mTk3hsKE1HV0VpPjhXTmCYCYqLV/
	pvLUozlCO5egf6kW5ODS7HeaGCnPZtvPUhTrC8yYaJ1q0VFxSoQ88YzrP5Fxm/fwXyNjjDQVi3c
	beAVIPDUnxRWNBws+08IC04l2vPwmz6VYuv+ZYnP+ayyxob+pCcBOjLCoeKqs0Qw3AUnfyR4SXL
	pPLr+MdvSEyhfBM1ifCQTeD66dtc=
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr583846015e9.3.1795882075610;
        Sat, 28 Nov 2026 08:07:55 -0800 (PST)
Received: from localhost.localdomain (222.red-83-35-88.dynamicip.rima-tde.net. [83.35.88.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm50697222f8f.34.2026.11.28.08.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:07:55 -0800 (PST)
From: Antonio Arias <antonio.arias@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Antonio Arias <antonio.arias@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix trailing statement.
Date: Sat, 28 Nov 2026 16:07:04 +0000
Message-ID: <20261128160716.8753-1-antonio.arias@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Fix checkpatch error "ERROR: trailing statements should be on next line"
in ia_css_anr.host.c:35.

Signed-off-by: Antonio Arias <antonio.arias@gmail.com>
---
Hey, this is my first patch, I appreciate any feedback, thanks!
---
 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index f4dd3ca03d75..e6150881c07f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -32,7 +32,8 @@ void ia_css_anr_encode(struct sh_css_isp_anr_params *to,
 void ia_css_anr_dump(const struct sh_css_isp_anr_params *anr,
 		     unsigned int level)
 {
-	if (!anr) return;
+	if (!anr)
+		return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "anr_threshold", anr->threshold);
-- 
2.47.3

