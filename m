Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625739;
	b=yd2aTu2rQwaVDhgc/lMBOYw4FKD5JQeGmrV3PzE94FxMBGsag4feSD7seY5XyblskOql
	 bRj50Wo2App7RxvrlagNm9BhnzmiGWy1GZRJCrDTdKIM0N+VwQ1u56wCHRIFyNLEF3a7j
	 7RJZZDTacbWnOTMVTBeV31VEWnohQCSosQpa/VyhIrlOpqKwq6ndPTdmVVf3T1jQbh+om
	 xh4wnGelv52YfkNIgJeXt2hK6/y2lXX3Y9jk89Fsqm0G7dLES5jFDnw/0uDac0BQYUyMn
	 MVn4bzYiR1EuF8ROyMPawvINO6HCa0ppQuIKvd3sdArdmnCe2tHdc6K9HdhF6IrjcTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TM5M6gaqvv4tGMQjKyJRerOCIFtinYtn8De+ocmceSY=;
	b=rPZLKPb3cab3ToMXR95JSI/qA/C0xf1cz+cI+ytNfIlHGR/FPEYMA2XCvr89Ga7ja4mL
	 9aUEggdcNuwli+gQVr+lNhOY7TOZrtkpoexj43NVSnAzCj0ypdqBrAj4Mr9gmAQjA1Ozj
	 3xfFPaKjCViyjmztYSvnaa6UsrEEml6SnjJOEVU/3mNi1o1iW4ezA1N8vYPXjNOUGrCHA
	 YHPXlYdaJdUskwp7ioJ3tlWuSpgT/TsKdPnujMDF+gWv0CW0Um2CMm2zwjvFDyY4u8m7E
	 kRgC7yLnWNqptqp+joYZrQvt/L+207p3c3WEBaeGMWd0qmNG/NGhO3nfK3z+5vETkNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oo7DUZmr;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAB606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DAAB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oo7DUZmr
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4e04eda5aso45245907b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625738; x=1796230538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TM5M6gaqvv4tGMQjKyJRerOCIFtinYtn8De+ocmceSY=;
        b=Oo7DUZmrV6Gh1U1PVe6ZA99gzvbHJeHwKCE86d/FWdmkRWBDZMWVOlJ9uzUDdF9cF/
         YHwg8ws6yfKm0azgx3grOpR8Igmrh3gbIut2rx1haEzfrOWeYE8f22NObS9dBkzwSHh0
         iOoP8DIqkyPdiPr0LfxQDTKp7cH5TWzTzrZHuAGjsUwgeu+wZA6/8JqUjzT7Pb8ZAnVO
         TpnhJytbsk8o8BP/skDnbP1RczpWwbOXlcc/TyG2miR1pVyefwqRYv1SOCEpD5G6iGUH
         dDNaSQD0jZXglL+kg6qK6k/YIDQQowNc8IQ/vR8vmLqbYamqazGMhbfldIny5Ur1S7Ca
         ZhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625738; x=1796230538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TM5M6gaqvv4tGMQjKyJRerOCIFtinYtn8De+ocmceSY=;
        b=NcdCVf+veO6iIxdzOvznCsNtYMzf/gdYoix1J7oQVmrr6Ge7ghO6D51PULEhkgK/Q7
         UqsYSCEWB2aD/CLUMF7wa78oDPF7EjAyqmLmATzPhNQ/UNLDUplqM4qVOmrBA9/J8rgu
         vswqf2WDvX85u1HjtNdnaVubuffvkKJuW+gKkuFWjjoGBNFDus9L1PXIlBAy/CU+BsJD
         0rPwYwCUTJe4visRtyAGg76Qdl2ea9ahqNiif7YRbIxEu90+yHtKT6x651QX2n3aFaM6
         ORTNOA4WnY6wIZN04T8Z9MisxVsilW62KnFlzv7HLQmKrKj2fwFBHxCKniDBmru3T1iN
         hSSw==
X-Gm-Message-State: APuU4Z/fgU30UsWGLWJq+89HjiPlfXqTpJADezQuxawHqLj5CzSvmgJz
	3lunx0cq0Drh/mbd2XrfvZhMfWu2lV+OwkOI5dieJ2B58y+/y1g7JFieAkcBudE=
X-Gm-Gg: AZFdTZfboYW9S2QuYHdT1LFYLObTfCXkiOMtRdyATkCit3aj7u0rUaNKrX5wdgJX9+U
	cMlFz5ZMQGY1L9vGVgaYhCrzxbKqshUTLKwaICCXwubaRR11hBamIrfLlaEHsSWe/dgLRzRh6SP
	Ts8Dx8XvecyzccuqPg3H75PGsiYv29hEjfZDc+V1BOdGHA8yhCVioj5CQPdEKNmmEDL/5xoMONY
	B3mbEFLJeFFA2lBpTtUm8umctWZOf/O1S0CsvONiEA0V6BxEvaWxj3eJgpw6j09WuapAoq0Vrih
	8EuNU6/7ZZzffbFFntRV/rT1f+KPOaI1dUrhNC6LTrQdCh8QoOOBAEdmxyDVVdJGrmzucTubxE1
	IysAfHtfwxRpgSstIDEVbu44EI2BFeGNoD3fqWFl5LNawEITXvtMXvkneUSrXdBlf9Di90K5mrE
	5/T8bmTAZBwTN/WLW52fhd5tLcI9qYUFP6mwTaqPBUfvrMwW/0p5GD5ks+57JlrZDCREU3BSXk4
	A7NtyfGmwtaRw1JhQE4ILmDJou6ctFQSPyxPGtgZ4JGxBKwp9Bs+/CavLx7JElMBKHYE3v7D5aX
	2/yjuCRZkjs6AA==
X-Received: by 2002:a05:690c:a40f:20b0:8b5:635b:4ec7 with SMTP id 00721157ae682-8b5635b4f9amr22314197b3.44.1795625738536;
        Wed, 25 Nov 2026 08:55:38 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm74766167b3.21.2026.11.25.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:55:38 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] MAINTAINERS: Move SENARYTECH AUDIO CODEC DRIVER entry to sorted position
Date: Wed, 25 Nov 2026 10:55:30 -0600
Message-ID: <20261125165536.792563-4-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125165536.792563-1-svav2021@gmail.com>
References: <20261125165536.792563-1-svav2021@gmail.com>
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

The SENARYTECH AUDIO CODEC DRIVER entry is out of alphabetical order.
Move it between SELINUX SECURITY MODULE and SENSABLE PHANTOM.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 137297afddfb2..d8576ec2cdcf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25519,6 +25519,15 @@ F:	include/uapi/linux/selinux_netlink.h
 F:	scripts/selinux/
 F:	security/selinux/
 
+SENARYTECH AUDIO CODEC DRIVER
+M:	bo liu <bo.liu@senarytech.com>
+M:	qianghua.wang <qianghua.wang@senarytech.com>
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
+F:	sound/hda/codecs/senarytech.c
+F:	sound/soc/codecs/sn624x*
+F:	sound/soc/sdw_utils/soc_sdw_senary*
+
 SENSABLE PHANTOM
 M:	Jiri Slaby <jirislaby@kernel.org>
 S:	Maintained
@@ -31011,15 +31020,6 @@ F:	include/linux/zswap.h
 F:	mm/zswap.c
 F:	tools/testing/selftests/cgroup/test_zswap.c
 
-SENARYTECH AUDIO CODEC DRIVER
-M:	bo liu <bo.liu@senarytech.com>
-M:	qianghua.wang <qianghua.wang@senarytech.com>
-S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
-F:	sound/hda/codecs/senarytech.c
-F:	sound/soc/codecs/sn624x*
-F:	sound/soc/sdw_utils/soc_sdw_senary*
-
 ZTE DINGHAI ETHERNET DRIVER
 M:	Junyang Han <han.junyang@zte.com.cn>
 L:	netdev@vger.kernel.org
-- 
2.47.3

