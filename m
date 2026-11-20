Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201492;
	b=maCdbDxYZTmn7aydQcbKeMfeyOrPUBI0QeQmTmqTvY+6GmgPNxwLRdfZsaaRbEiPZ11S
	 iAwjr9FexNfoodwpS0SjsvsbIMv+MKjRkRohwM7IRqaXs1GjfVgNV/eOqo8jjsHtjkwV/
	 Nrf84ooT5XR8uJDT6iGMc1gT6icJ0FrDlLWbOeL1yh2l49IokprDnyfW7iJseCYWDUoF2
	 HhiAnHwaepQOCt333zn/mxhzmxHFAygUCfYVIoDP5J9OoqFlohfTnqGgqbuUcTndJoRgS
	 wpPyn6zqT6Lb7Gxw5uOaw4MExxVIWeSb9zI8YuwoD9cB92E6SJjzgRgMG3e0UmNwjjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=2YJnl7El3slmkshOvr0+1chxjOsuXLroAPhlYunUcz0=;
	b=eIsRCaNBElpXdn5P/LgPHxFzauY6HRJnzIR8NFpNRiYgmtS7xouEs4OPegpj0ug/yEDP
	 JQQdN6yKULEDdHibsicWOWXmnN5+5603eXOpJJVJ6ooeDMI9iikeneSH7jYZbZkYlNdhM
	 Cpzg0KHng2WvSSd5df5iP1eqM0yiZ7/qhtLpw9558Py8g5ICQs2pK+1y7sY196jj8Tffu
	 PvVAaUrpJO6A9ucsYhBVHkP1iy2+Go0CNAF1zFWDymgC0ZbWw0Go3FWtwU2jCGNsurfTt
	 U8whD6Ht5SEmgOKQgNwDvhRnDr0wYOc0mscwYhsoGNkbsPDf932/HJdW2CRphnDBrAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ei0ZW7L3;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C00560A263A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C00560A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ei0ZW7L3
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so1462199c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201488; x=1795806288; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YJnl7El3slmkshOvr0+1chxjOsuXLroAPhlYunUcz0=;
        b=Ei0ZW7L3+bd+OtnvU7uLvHev44mV4stFIr2Sq72Byb6dglfseZY9xplaD6p70HE5Fn
         U61p1RyiWZxOn2//m/UEmXmU6OYH6F4O+JW1sAFfWMTcUs60ECV+77O9z9/OT/jJ+nHS
         w1aSxdMR3jOpkR7ehu1/DFtLNA89+1tAQK0m6PSJ0J0VqNIE30qjOAkasXkXrpwVP2bJ
         r62oU50XsLpCvb13SJfUzKz6y3JN0cR6YJNIpuvJs9j727CCIogLJoDCrEL0zwzCkG14
         fFRGeZdaaHP16T5FSq+BI4IuUQmSraXTEh81zM+4JqCUBcbGuIfi7OcUFpobo7lzMwi4
         hrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201488; x=1795806288;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YJnl7El3slmkshOvr0+1chxjOsuXLroAPhlYunUcz0=;
        b=DRehm67/4LjSxEo9s9mnY+ukomvcjPp+xq59uGe88AqiE56/qt0pqew38xhB6fO2mz
         6WhBHCohyMRwrgQlMhCqONzgx5yw7PoLB7jmNSxVmzCMPzm3tAoQEMElIvx65p7lsWcr
         hkwfxi1zo/RK3sCdqekhOG4SvZaQNKGFfn2CODB2A5NBJ3nAWVEw4stM62qvolgbBWZD
         LCYG2gUyirxHKwY17RuhHe981fHmmlXWpNZa2agr77iHLeS2nNBqcsKPbbzoHcNv7m6I
         JcqYBkB7K+uo4tL6huBzwPQ0MFic3Nkjk1DcYwOqtCRM0mgH9k49iBlEVAQhQqrOHG5Z
         1rsQ==
X-Gm-Message-State: APuU4Z+fP3Au3C4tMfv0Jyfq9jo5Cn8uIUU2BnWXQHgYT3mgFBJi3JGd
	jqfJ2raQpsZfdFPtVeqagzeeU8sGrgAFtaqjOoWU5//h3cuDnPXwtFRHutt2v22F3sfMnHc2+JU
	r/Q==
X-Received: from dleb16-n2.prod.google.com ([2002:a05:701b:4250:20b0:1ac:2245:a27b])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f18:b0:1b3:9b4d:85f3
 with SMTP id a92af1059eb24-1b5568a28a5mr4184379c88.19.1795201487874; Fri, 20
 Nov 2026 11:04:47 -0800 (PST)
Date: Fri, 20 Nov 2026 19:04:42 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120190442.2851983-1-elkin@google.com>
Subject: [PATCH] regmap: guard DEFINE_FREE(regmap_field) against ERR_PTR values
From: Elkin Cruz <elkin@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

regmap_field_alloc() returns ERR_PTR() on allocation failure, never NULL.
DEFINE_FREE(regmap_field, ...) currently checks only if (_T), which is
true for ERR_PTR() values and causes __free(regmap_field) variables on
error paths to pass an error pointer into regmap_field_free() -> kfree().

Guard the cleanup macro with !IS_ERR_OR_NULL(_T).

Fixes: 37983fad7f3e ("regmap: define cleanup helper for regmap_field")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 include/linux/regmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 8f3034881f8a..572dd6f0083d 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1484,7 +1484,7 @@ struct regmap_field *regmap_field_alloc(struct regmap *regmap,
 		struct reg_field reg_field);
 void regmap_field_free(struct regmap_field *field);
 
-DEFINE_FREE(regmap_field, struct regmap_field *, if (_T) regmap_field_free(_T))
+DEFINE_FREE(regmap_field, struct regmap_field *, if (!IS_ERR_OR_NULL(_T)) regmap_field_free(_T))
 
 struct regmap_field *devm_regmap_field_alloc(struct device *dev,
 		struct regmap *regmap, struct reg_field reg_field);
-- 
2.56.1.750.gf70dc682cf-goog

