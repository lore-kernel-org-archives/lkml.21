Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307729;
	b=w2uURVqajMiZOFvv4slNmXtpkwinYJOkDkVJkow+YR0CAxuokVk0WozaI62fwj+gB1/t
	 KgnqJk2ElwT9bW/lTU8/+ppJdKfjoUvW+EeN91dUhrULsBry2T8liNkr6B1Tfii8gpH+9
	 S7YNIMYHeoEdWBkZKrIK5AafUi9KZ89Yc9U7ftAnhSuz/mE3QOx28M+bMhXJov4y0luXD
	 5gMUd9A8AOYnoaDOEsjnmCXhoxgZ+aczmzXCYTmMtBIvSA2UQ6sJ/UNfVPYqFzPtfi5bq
	 ZGlxsmKuiyHMExRdp3+dVE5qVVywCoLQefl+wLCYR1BosGErzvBljYLXnNOcyPzvaLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM/cLB4eCrMAsNuNkWJWKaL5gaOt79aLQHiWti0evIY=;
	b=Vj52XP/6WlA2GzpNNFC1weiaTbq4kaytxPVdMRVXV6WNE8mgTwT9KgTuaEHZ644O340z
	 s4H/iGjleDbxX5/J2yuR+irzwV0XNCmhsdoQYfMucxIvTiYltBDaEt2Onxb0UhDQQ7FNO
	 O3W0J+rrsVLV80f3L2MzGigd1fEbhx/l9QhnaJLn0PKr+kH5Wgl0WTEK9QkGwTE/6ImOU
	 O40mTtdLEt0IVme/hv1XvgvUt7G75wB6y74RAvoo0bVsyyTOTC3QmaUL0T2CzBtZS8rkg
	 Q7fZXUy3DZszSoY/GV9OVV1cUV/ktX2b1ZEBh5Wne8fQ7Z3PqwJyuXpOQHYU2iFrbGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k5CYNhra;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120B606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D120B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k5CYNhra
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1193372f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307727; x=1795912527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM/cLB4eCrMAsNuNkWJWKaL5gaOt79aLQHiWti0evIY=;
        b=k5CYNhraKUKLi9HWXDqHXgnEKwTBsZF7ULkOhIDcmGfXN/XCVOku1674JOdezQgrDA
         xvaV/PxPTCI7aNeZ3YzsECnXeAaENvpFXJwE+NOQYWh6MKnlRFIEoQXL2TLRYFkQFeUv
         P5wji9OxeGSIoWBV5BU/7ZJYjnsjqB1DgnA9F82/JqJJrcczXJE62IlaSgI6lgaR7q/Y
         LSInneN0MHl+2vVg0MxAfgJI2qX8q1MIIlyvWNqrJyL71/b5AX5ogzPM7aDcmTbqNzAo
         KmAF7hJK/q5+tgNtUb8AoQmXhNW2OjbuZFwxZHZFEBcKIatSQkgRye1yFvd4d5LZPpIj
         aBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307727; x=1795912527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM/cLB4eCrMAsNuNkWJWKaL5gaOt79aLQHiWti0evIY=;
        b=njGOA8DCrxz42jMMD/y9xJ6ebj7bN+UfNqg2UqP+AaJV8n6qyNS0E0UOADk8gTHicD
         D+NG1u3Homs5BZT6MCz0cEBua4tqfbQRcUoqbVU0aOReNJtgBJph43lRr2WUjG1+09Hx
         BAN6Hxs6Qw2QDl4u87cTg7y/yDOwYED5N9W9QWQDNpT5B9NVXIlFCMCqXn+s3v8HoZcQ
         lkbkq1pFByoH+V6xqBuW/8ECWa1j1qlN/4ppQslozPDyQd8H71iF5Ez9gspWPuPMS2nF
         RNPSblqJOmlLWpF1vvtb2y0zEcj4DxPuqtnB0B7sIfk98/EBBANXeU1QN+/pk7x6+1Po
         XiGA==
X-Forwarded-Encrypted: i=1; AL+hErFjZkruguKuvhuBFFUu2P5kwcBHhCxEJhdwjj1AYQoQbwKyySqVqFJwSFgzRLQ4nXMUHD5An0uv6Uv6lX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uklrr6NUmRd3zM6KR4WDsm0UmE/ObH0KdcacYH1cmn6LGQcPf
	Kq0AjUi3l+hCQXDnAQoq5cdT7zCwOfDw8d+zJTL8rDxofjADrX/W/0OX
X-Gm-Gg: AZFdTZc7+bDFkEPSMPL2LvNONGfFz/1TGoddQfIyuaEyB9Akqph9M8WKJ9nv+0td8XY
	x5ocNfQLPacbqY4QCHbEgPXd63XG7zY87KT1ahXlQH6fY+n8Yr3DLgggLla+9cZpjCnvSArO+KH
	po97JtG1Luh3AnZwiKB5Z42ZvpTBypuKmCPHG2cpKi2Mh/Zx38PpRr8R//FUvI0AssE87QfRCvi
	MCCaghh0TGCx1Od5IcOv2f8gLRgbgdiGVW5lUyUp5HBPc7wUfL+Gd+Bp/6Pv0wDO/RvqpGdou38
	8SX+Zh3EYb/vtZch0sFS62UpCYR0LX2KZXpTxA0uYUxK64zZt1QsOfbu6Ai+C8bYBWvKL8IVzTC
	BjjA4aWCxCIOiA6L03lhJOp4iECSV7uRYlqI+pL7f+Z4DCyP3nLTCkotDn0YSS0eF+H/tg7luAN
	TIsYXhMa0JE+TnPPLvch3GoWZQ5ei9gmwek8HJ2TL3QVAo2hJJtTB5h6jIqkjY81Vmn3zTsO52O
	XquPKevvL1iRxHD0si7Idr5w4kB/2UPnHZXX4BtxIeW1Sb68d/OLrYGkQRXoLbvBWwxsChycd4j
	3tiuyNgBQraCuIk54BH/NRc9drm2c7Zx1ZzXDuD5Q6eFvq+ndkkIOmbi8BNfcBaynAA1Zf7/tQd
	rWml1Qk4euTZGu4ufKJwhTSoPgYn+rSjezVZSwqBeCkldOn7ktBr+DGejy3nyAaaJJ4rv3oj7YN
	iNM4wcp0SH0bmUjGmpBF+1WjLYnJ3ErGBRxYgsChlNfkTy5UyzQF8nCKnuEnZkwECxuOBg4zwAx
	A1KuudiNyIFCFBMR9q/SPFDtz8uXKve17cCMIw=
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr153159635e9.35.1795307727094;
        Sat, 21 Nov 2026 16:35:27 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-2025-a95f-1d53-595d.rev.sfr.net. [2a02:8434:fda5:4201:2025:a95f:1d53:595d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm74017825e9.5.2026.11.21.16.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:35:26 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] tools/bootconfig: Preserve all-f tracing CPU masks on export
Date: Sun, 22 Nov 2026 01:34:59 +0100
Message-ID: <80d300fad70b4168e2355e8aef73baaef68e49a5.1795307698.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795307698.git.edumucelli@gmail.com>
References: <cover.1795307698.git.edumucelli@gmail.com>
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

ftrace2bconf.sh skips tracing_cpumask values consisting only of f
digits. For example, on a four-CPU system this drops the mask f. If the
mask is subsequently narrowed to 3, replaying the export cannot restore
tracing on all four CPUs because the configuration has no cpumask entry.

Always emit the observed mask as one quoted bootconfig value so a replay
can restore it.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
 tools/bootconfig/scripts/ftrace2bconf.sh | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index c23e7cc8a..6d7a1bd68 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -278,9 +278,7 @@ instance_options() { # [instance-name]
 		emit_kv $PREFIX.alloc_snapshot
 	fi
 	val=`cat $INSTANCE/tracing_cpumask`
-	if [ `echo $val | sed -e s/f//g`x != x ]; then
-		emit_kv $PREFIX.cpumask = "\"$val\""
-	fi
+	emit_kv $PREFIX.cpumask = "\"$val\""
 	val=`cat $INSTANCE/tracing_on`
 	if [ "$val" = "0" ]; then
 		emit_kv $PREFIX.tracing_on = 0
-- 
2.53.0

