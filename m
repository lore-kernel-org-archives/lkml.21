Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671403;
	b=3c1qfZ+BIoyDzHriZ8Fcrn9vGQ8a1SsvawhZRXxJHgOqBDqqMGDBwOa7dT5nh2PDud0T
	 hGepa/4HjpKZcT2VWr4aJMs/qoyiJpoUp7BJejunJ3+uCbD6/5Hey8J59SrhjVE0ofOhW
	 PJKky4fjViUA7m3ZxkOYBIL8g7hZAen79yR2rhGY0HsWuktpj+OOZR5saeDTs3RqO/VTM
	 KSArJnQK3rPNZURMOeEXDJ4KgAtiRKaXkfRPO7czGv66qFZU4+I2r81Em8kukh6lrsg0G
	 8Ttqu0ge0mQ7Cb/O2a3A5ieIB2bdjk0CGnSv3GCYcIEWXefEPMuMnkhh5yRLzjWxcIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+4wFXj/scRyLRETk+4as5GVEAcw3ae5bD/5VEbfu74=;
	b=zWThrJLzV1lGbFzmjoA7UAHifVVxQgzhnRAId5AmZ8oxv/LdtGEUkJa1pND6nJKt3JoF
	 7y8n6dHrBDoFXKM1xtZGgcgfJDVWWtyEuFNxC33b8OJV/az27IMhWcljUsRGTDX0HjC7p
	 7o9/BVdOmIMj5Hpa6uNlu+mQmc0PWA3SGe7ny97P5XzT31ddEV4/i+n3b4Qxcc+K843fD
	 vjZoCP0c6OON3/lPiEMnN3Z7OK4kk5HDsUywpyk+x62nHSrWzgAuaIbj9Kp8qDVAdH1t4
	 TZV1e4frFdRJH34YhIw57fthL2msYFIBx0Odz9b51tKiMI6C1urrjhlMBcoZUzdg5yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EApHrOKE;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A226F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A226F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EApHrOKE
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so3795656a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795671402; x=1796276202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+4wFXj/scRyLRETk+4as5GVEAcw3ae5bD/5VEbfu74=;
        b=EApHrOKEzIMdhiS7qR3/q0y/NFQKxz59xXy5PqAaSwCYqXSUQlcLANUFQwYZ5v6U1K
         GY5d/sUnJ0RRtqBWIOTpF4uWdaJ4dnd9HiGBCRviupnNLga2TlJMtCPeKAywz5nbcm7w
         MSwvnFglsmunh1pB4e7jJHlVZmhmqX/J6gnu8ExUf9+JY0TZaeV6GNrSYrfcmjrvTymg
         1JQdvIk4tri9r8+YAyvQ/Fqjo62xPwMVdRM8phPh9dAIsHUOZFRl5lESssHhdVa9La7G
         oj6WtQKSUWsUl6kbibVy0SihTw/c+uvOj0/HYVtqCiciMWFhibgjknYl8mdsZeq7fZO2
         CvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671402; x=1796276202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+4wFXj/scRyLRETk+4as5GVEAcw3ae5bD/5VEbfu74=;
        b=eFFemXau/r7N/Ab74rhsUGd04rqYsluQqPqcffkOs3of/b2PIw6/SxYr8rJdhaeSvu
         NcFyWKi35WJ91Xc8sRSv+QeM+T6TiQB7kpvndMKiS+YJ1k3OeMnnhXTGiKJFnr1xvA4k
         +BR5BEnHsE+kef6H74ED6x+PEg0BFWH5KKZQhQgXq67hv8kPnqVIVtxwbG7D7L/Klwx2
         jagxMmT8U+g6sX8HVtw6dkhegOJLfIUCRBSBRDGS+5DWm2LRxTEnE8E/q6i4ubEN4YJD
         KfbXXl7ROFkOdaZJOUmbYg1422bKqzLPeam2fPGQsSywnYqwvSNmhSXcOF5/FPs0kO8Q
         ayoA==
X-Forwarded-Encrypted: i=1; AL+hErE00Ri5GxPswg3BnthsDnA6ornAG2l+2TxtB7Cqy3zFN9xn1bjImYDzBgAf9LuyCiQO0q8ChZrROgUZH0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Ywr5iNskLGXWASu54oO/TgtWoiz2pCdbUpwbZBy+UtSJyCxP
	kIPHDG6kTmunFKRaguaZRvgyJj/zAKxrjeQQFO09IDFe0gVt2EVbMwwVEUfmddFU
X-Gm-Gg: AZFdTZeCIA2n19Zx7Zt84rKr/RKPjxExVwy4AUhIWuFKgroaleLjBeNaG43RQN1F1v+
	IDLaM6kxVOEuHjyv0YgZM4YtBOTLilrpGAbV2tYkubGiW2ELYc4CJw9U4yC0BO+ngLL6cO0luXe
	vSYHSHsdQVtYa4jtPJpipq4rI1yOKhUYd272xKFi/hgV4qP6xpDSLLKvyRQzJ513c2YYWAQWNyz
	nne5lSQvyMM2tWxdTEYRhxS4/3Twt/lu/ITZ3Hmthc0FslOG5IN+62+rK3THIu1SnXdi1RkxW4L
	txzUJDrr1KbFmrefeZN6dHmEPysyaFDZ+xtgE5GyMo8t4JNs7kdXuyOR38lUnSomsPK7OmJwhL2
	aW6bCi2JertyFa/RiIB31VuaoFcc6lS0iqNMGg22K+V5NovMM2DHHRnt1Af1x7/a/MCVdrpgl9N
	rwYv3vpJ4kjmeAflxXeYkBBi7sqbdN28zSrDxsXVkN4Qc2+j+QOuawF6+0ZMkxMFLXpOAep4CtH
	MvRDzj0/1b2Ol9sYmviKCKJmRhhnJsrx8MKzZ8bwCCDd/G0KiAErv1Z52G/KSzoQZqIduCAlAWX
	yHa6pIF5PEG7Lyh05dV4abujq82JA1g/LAozWy2PUmDIAjl/a53U/zCoo3flhcFJYDG1q5s=
X-Received: by 2002:a17:90b:2e4b:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b41c8e0ce5mr12480480a91.10.1795671402029;
        Wed, 25 Nov 2026 21:36:42 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm33096242a91.16.2026.11.25.21.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:36:41 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] sh: mach-se: clean up IRQ table whitespace
Date: Wed, 25 Nov 2026 23:36:26 -0600
Message-ID: <20261126053626.18680-1-artem122novak@gmail.com>
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

Remove trailing whitespace and fix comma spacing in the SH770x IRQ table.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/boards/mach-se/770x/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/boards/mach-se/770x/irq.c b/arch/sh/boards/mach-se/770x/irq.c
index 66e2c8aa0b69..d1978b3a52be 100644
--- a/arch/sh/boards/mach-se/770x/irq.c
+++ b/arch/sh/boards/mach-se/770x/irq.c
@@ -40,7 +40,7 @@ static struct ipr_data ipr_irq_table[] = {
 	{ 2 , 4, 8,  0x0f- 2, }, /* PCIRQ2 */
 	{ 6 , 4, 4,  0x0f- 6, }, /* PCIRQ1 */
 	{ 14, 4, 0,  0x0f-14, }, /* PCIRQ0 */
-	{ 0 , 5, 12, 0x0f   , }, 
+	{ 0, 5, 12, 0x0f, },
 	{ 4 , 5, 4,  0x0f- 4, },
 	{ 8 , 6, 12, 0x0f- 8, },
 	{ 9 , 6, 8,  0x0f- 9, },
-- 
2.56.1

