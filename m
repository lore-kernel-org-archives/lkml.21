Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965320;
	b=JGlB68l0ukBf93qQgR1dv8+uaocLuzx9J3kz19tWgpEDqusLMq3RjHMypcEO9du8BPCB
	 UbLt5jW7pB9z6ULRYcZ26YuPQwueygCOzIlTSCX2VAkk0zLgDIMMz19X+bg9ov4T5WRuc
	 FxLUgTvNbHLY0Uz9Jlzd2AlbCZzpdCVyUgPyPBzDxMRbhfsY9BVlAusRTHXISdSYB3sEl
	 JzOnEtYoNE2IrtFEJP7lcRDOI+ooK0gQ9+KQzWjSx5u7hhJnfSCO/IQroLAl6oWBJFiCy
	 u2dvPS75tUpMNKYyjTkRXOSDSfdJZIndVzp599veD1oowa4TYpd7bFk9oC91twcYMVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+z7+v9HUS37K0OtITVwcXI81+jSuSCmpbWR0bmORME4=;
	b=JAzNdkCvF2ueiu6jS5uasZlEBc0ZSib0c8nHqKg4mL7PYBSNL7rQHTLGR4lCbd8b7uQA
	 zp467CudWWM0BNnWHbxtd+CMUGkqHDh5H+33ahZsFJIOv7lW3I0jU+1Mg7BWpiOUgxqSo
	 usvjCbCBFVd3RiwhC7+KzMK+qFfID11jqcdgwA2//Uak5YxiF2rLHqEixGJylQIYZYc2T
	 6Rm3zNSnKTWUYMoyb02tOfFPUIHKm9PSF0DYCkI/CEJ/bJsyBC/v2x8d/JHjHDSSJH1K8
	 qe+zYGvrS4NlnBc2TjxJ4ysfdRMq/aBtJFCGnpqv+B6noUwFKdi5V+OaY9t2X7PhrvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xR5/hu0f";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8353E606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8353E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xR5/hu0f
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso216961a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794965319; x=1795570119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+z7+v9HUS37K0OtITVwcXI81+jSuSCmpbWR0bmORME4=;
        b=xR5/hu0f8IWoVKyhoJtKWBeQF2k86+H/Ayqe/rlSZ/m/MS6AxVfSqK464wVf7pogt9
         CmV3D0TG8oo0iCz6J51v/c0jloOnBJJ+GoK4tySwzuDGJbfPHqBOrFjKPN4H2vG5vSAz
         FEPlOmMNeA+So3ZNSaEX09+fyRXdO7ctFuORzXg/lHYe4wV41Ay5ldkU5K1nkWwYmRer
         PKp9xj9z/O/PPBZDKn7jQhKmgFwiaoFj7ZUxcYwBdi6+nY3VzxQFxnPlbeIMbJ1CiReT
         anUmh5DrinIMRV7cr8piNXIiKJGp6uZt/IPzHBSo62/63K6bWRsQrDyg+lhLLgF0L8uB
         ZjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965319; x=1795570119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+z7+v9HUS37K0OtITVwcXI81+jSuSCmpbWR0bmORME4=;
        b=tDJxY7K6W6+p9bCc0qW0IPCh4gkfc6CVAMPuzd8unKYbYDWvA9ce2E9y8XvqDG1fD3
         xMSeD5kBvkIDW//3cfGLCAYLH0Qbo7amBVqd/ItrhUPe3nQG7CAKXtqFqni44B6TLqi0
         vAMh06Wa7uIUsu6/BvgMOwXZ2BBmDO3kE6a/s1n7B44uq9kLr+roOxOku3efrLA4MLu+
         9PcaLreyn0N4JL/Hg32w+YMa2S0qTxdBrczgboOV7S5PsaGZNPvw2NkqPhSklOmlTHI+
         8Z98W5evpkqK0nxP9milHaquQMiW7M6i8RPn0x6XaS51FrAP43b0MAkUnAOgRKeIUxcK
         8kRA==
X-Forwarded-Encrypted: i=1; AL+hErELQ+wwTpvgOP8w7PlkUSv9N4UtU71FqRUJX9xbaKicsfAuPsKW/l33lVpIZoNYTHaDwTGuN488PhSzgWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z871D8wnvUEFSbyzwPf5GDoSk6Fb6ZECYrg8M9wuXzSd0HMm93q
	eWbPpW+9HY8BRpDW2C+dVkFmqOlg/Qe5OSG+W4QMnjZarUQrYkxrXHbA
X-Gm-Gg: AZFdTZf/FWT7/i5IMFQGTUz9TOhdv2hgO1ClioSQ8d5gWSVUw9nnIhvBIZGhwjRS4/2
	K3OCll9VmIhk9vbKllMjmxhtY5b4Fqop4BZp4g2EadULIdoHgp6+d4ry64FOxqiRF5GMWDVmu/p
	lOdnUEVsIhNgbSlJsvINMol/IlHsTUCp3qjuJQDlHbFiFGwN0x9w+LrqHkT9uFjtCVJKd5Ls3dI
	LtEvEuOTxnm2GIIlut0kT5TqXAn2gWgnAikVxpdjrr6Nn0wT+Vffz5jzzHAf6Dw/yRysUVo2bIy
	qPGz3q54OCo3T3UfuMFjqhdseHv9M6I7W7HB3OULl6yq7sDDiqa/9s+OHsxqT9aQZ6XKdFRBMft
	9X43zzIAwITV1oc+rIFQOPTfclCRQtrdoxsSQ5FY3tqKzHxcfR6+yUyilHcl7j/r0VN5U4tUHTg
	WeFqDK+mE92Gpaovhqt2yWvlT0FeOuRwGOOSb7geHaGe5h1Q8Q5um5m+1Fwrw8Mq8K82MrsMZoA
	NJBfbFrr2ke2BjU0xJYLiuKa21q2rJ8L+x4ucTA9FQ/UFx1jW1TtGEyD9OZoPGt3qWLtOARRAle
	unNv0fU0EWVxvMXmTI/1ZqMW+KrvyKsyos+JC3bzJKSEBNbtxekGoOIEzOXVHTC04KesjtAmqeK
	C9P58Xctawx83BEwHG1KL76qb9WVr5nxmEqFUaC/5
X-Received: by 2002:a17:90b:5605:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3b3d07d472dmr793547a91.48.1794965318556;
        Tue, 17 Nov 2026 17:28:38 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56ab352sm281808a91.2.2026.11.17.17.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:28:37 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] MAINTAINERS: Add myself as a reviewer for the virtual PCM test driver
Date: Wed, 18 Nov 2026 10:28:30 +0900
Message-ID: <20261118012830.3117724-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

I added the control fault injection to pcmtest and several checks to
its selftest. Add myself as a reviewer so that I see changes to the
driver and the test.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
I asked Ivan by mail on 2026-11-13 and have not heard back. He is on Cc.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fee9d090b280..e3d1e140373c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29131,6 +29131,7 @@ F:	fs/vboxsf/*
 
 VIRTUAL PCM TEST DRIVER
 M:	Ivan Orlov <ivan.orlov0322@gmail.com>
+R:	HyeongJun An <sammiee5311@gmail.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/sound/cards/pcmtest.rst
-- 
2.43.0

