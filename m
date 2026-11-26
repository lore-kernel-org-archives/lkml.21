Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677773;
	b=y+kt0uJch+bvpGxMKJlw8ctUhToEG596lxXAsf3++3xeDvvoQ/q2d+DNCEuHzPqbp/lz
	 A7qaMQ5b6LDl4487ETPvGjGdDKsotgRKpWJWd5HuNt2/DwvXndIir8ysUkjHqfaCG2cIR
	 dE6FFdOmP8dKqRPRdSxAaGeuvhkFw205ry0vir9WkP9LMgfs9DVl0HvoFPjPFISN9fTBd
	 00BVvJzyBj8Fng50QwXoJhmqSMFcYb5EGvExPX8rWRyWdkbhkuQxskLV6l2Vesau0OGuI
	 QD62pw1GNl+GrdBj6LuCNs8q2J5sUSY+sGXTaqqfYyQoJUIN8NyBTVo5NF7j21kowZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tyDcKx9CSg/sf/Q8nvmg2kdcVjW3+Ux75hmWCkkVGgY=;
	b=vYTTEqxK4lx4d64gcACYOji88moHgcgUxqUQAx2Y82EYrp9OaomkBEWDG/yEbVPfqj6O
	 M6NDsn2X75kHuWv0bQgPPVcYdjqMhQ0oeBvwnWAc9ywUPTrhDqgMbHs20AHEomLhIZh4v
	 n3+9zTDVmV6V3pgt/XCDmN13+u+vsl+141Jau/lVPTKvoKd+WFgyHDUFWjqlwtV3LXmpa
	 fZRWL167TWL+laGNhOrT/tPAbyw4Ss3V/DWjGECijpfIbB5UM0V/pVRFSYgnSwHYLIf03
	 NjIEJ2aiQqKuyaVQE8PoFEqgsEKVua88rRTdH862JVpj2YFgC1N/O8KLyCanDBM8wMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFSxe0tK;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABAB606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ABAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFSxe0tK
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3ada81853so7791863c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795677772; x=1796282572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyDcKx9CSg/sf/Q8nvmg2kdcVjW3+Ux75hmWCkkVGgY=;
        b=zFSxe0tKCFqn8MxIMSdTCjZ9UDplsJ4eIz93lwm3oztmDyLdglyn7ek/tGsuMComAb
         VkCPLPWJ4jJrIZXmRUsfOZQOdVEpevIRHfOGCRIYt8hAxadjdH8caxLLbe/o7Bg9ItXD
         dR+1txKolmO5CHnbxPohxEEa/EECJPNnJT6qhxz2TSJsNL2ZZmFg00ouoUbeElwAJ5wB
         QCPe48AYiAf8MnI1K2eN4X2RISOVwuveasiaOURpl4bpABxHGTTYOqtXT37WRyuqFcZa
         Bv7JCo6M5jSZbbkiR1VS/VobJzzG4tPW+y8IoYgqut8R4uumr4FGFglHhvLmwNZbNYSY
         I0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677772; x=1796282572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyDcKx9CSg/sf/Q8nvmg2kdcVjW3+Ux75hmWCkkVGgY=;
        b=WAsQLe279sFc0eQpYvsnO862cMDxkrFHtMHgJvsyRwtldQPnpF0OcLTZJtknrgRTjq
         C5kyICMyXp3CzN3Z9BSoGx7WPfAIXrX4ZpklpTD8pb7puhzgnrCDegJ4SBmCrq+V5r8u
         eEaHQkryEE+mEdRTX0Nt+1fzOr5ITnOJLsc2xPNuZAfNo5/TJenDJYMCZ0qNawqvUcU8
         G7XI08qaPrxl4VXitGVSapjc2mevgQcjq815HOBWv5e3LCLJOxNhbnisI3h/QnmJiERk
         eEjt5JczlDFNhbYSjIJ/5yOfI0MA9o9iEGHa5QEHl4WvU7vtq0NQchpRJ1ctqzhh5WCH
         zLEQ==
X-Gm-Message-State: APuU4Z9/khm8tUItXpslTGXOPt4lOd5JP0S/3Sc/+aqphjLBdY32O5B6
	C53FwmhIC26G2RBVEvrg1anlqeG2mqNwaPpnW1QLUGtLZ82/DPz2hY88
X-Gm-Gg: AZFdTZfYupll/LkOjLxYj24ot/CdTCp+WhcsgUCNweG6S9TZKbTswv2A6K1C173PQ0N
	+5HZgqr6gmrrhdILHIE7genP6PVxpP3HND5O+lCvV+6R6niaidWNrPtzOfDvHPt1tIlQsJuAORU
	M6M0YhTNfqQcCYGYPYPUm9lCVIbaCRtxZ1pYaLeMZlJrj2HR3swFTmUwCADyY+RT3S1W6x0rfMe
	3pBGuCoXBil6wO454ZV6QilqSH5ifcoKOvM6ZNZ76GQQCM52dckE/ifP8489eIUWcxatlFCtNiK
	jmc+o2Oo8+EAZteprfE56an+RJ6TcwMAt9kUx4FQgzb6EYAXHWtt0Q1ICp5eB0wAZomQQkIIhR9
	CRv1WrGpyzqTS/NPu42q4jODLBHbzb/+vvEuIaqvkGtS/koYRWeTvl+xSv1J8QgGoKTBqNCVJGA
	xMQdQlJWJ456SyYjreUDnXUbfizXo9F3exwMBxV9aj5tyjnAUOqsmUydfKpa4EAaQS1T1t+h2xH
	NSQySpu2+DmTagDOC35kXYv8p/uhqJq4oh6kau4n6sVH7CG0J0dTq8zkntUcNc9ZWRjsFyxHxQQ
	4bmxo1KYuuBqkC5euBzRgseT4qYjotAadW8ELF70MkSaQ2eo2XV7uZAH5Ly4Sr9pvGaPoyUM
X-Received: by 2002:a05:693c:8843:b0:386:b429:fe0 with SMTP id 5a478bee46e88-386b429175cmr10099537eec.16.1795677772417;
        Wed, 25 Nov 2026 23:22:52 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm55674215eec.29.2026.11.25.23.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:22:51 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: vmaster: Retry follower initialization on failure
Date: Thu, 26 Nov 2026 07:22:20 +0000
Message-ID: <20261126072220.4496-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Reset the follower count when the initial follower update
fails.

This allows follower initialization to be retried on the
next access.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/vmaster.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index f43144ba2797..d97d7bb33e16 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -102,7 +102,14 @@ static int follower_init(struct link_follower *follower)
 	follower->info.min_val = uinfo->value.integer.min;
 	follower->info.max_val = uinfo->value.integer.max;
 
-	return follower_update(follower);
+	err = follower_update(follower);
+	if (err < 0) {
+		/* allow initialization to be retried */
+		follower->info.count = 0;
+		return err;
+	}
+
+	return 0;
 }
 
 /* initialize master volume */
-- 
2.55.0

