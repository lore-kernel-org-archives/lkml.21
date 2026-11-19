Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047000;
	b=P4xfZv3FSAr6hGNOA4qvwtmP0tzvQlPrI8MXG0D/6H3bH/shUhN1V5Jsh2SKM4I14AQ+
	 3UPygkQyzBS7nBqKw/ZLq4l+E/XddUcE/zZ0H07zXtOzdmsprOTdEUvFAsFUOy7dNSy3o
	 VTGDe/+ITyU7T/Yi7I4i5fyHTuD5wuPQUlrWaaLD0ctVBaM3yPC0uztKwi5kNZirrIhcD
	 k2pq6lMiqXB+mTYFHsFcK9jIaHSTHbHbfPewqj4UYLxDs6rCyh5HZFw1WKHxse9twTQEy
	 OK3SMq83CR5xYL8/6J8qLKDqJA+NE8Y79xlmsLURHn2oNmW9oskBn6TI4yKQH1IFz3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
	b=rOcwic4C9F0DhX0UW/fwFoaMeZh/G0Cy8Lzx0kaithIMOKKMx0EvKOvnrNC8h4MZiN2d
	 KKU3YFTTJSQ/OUDoQ4FCZ7UikSo78ClCUFbs0wA07AsqPJeDw/jOCtOu+2liQWiT73UEr
	 FJ9mruYmebUckbftE9BTGADrB9SvtzB0kerDNyd9LbhvqjG8/9JnZmSFQ7KlpCgcHcJNT
	 vXENXK5chqNgbbRAjfTiscVELOe6C1yVyNxyIs8/djqLsL1UwRv01VynbMs8goaxNMxQi
	 Pzf3w98LQ5HzS8L1nPzVKw/uz8sWIO3p44vXjLZ7xcPUDYzLXK5Vwk9QTnX94VQnkbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZAuzRk/b";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67535606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67535606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAuzRk/b
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0dba37a7fso15346837b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046998; x=1795651798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=ZAuzRk/bH1C4XHaHJdlF0uXoYYurW2uwPPgfvYAThPdAbsuhTmt1wlr7vnOoallGgd
         Am8JwCShq150uXr2awS7XyI4TvG/bUNdQW0zqh0XUnDvJJEFpegQSMpCzdxWNA4WYGQ5
         sd0h7CMjf6EktPMHEFp7I7zjGcexZD5AKtbqHnOUgOciVzg+4r0A0sC9tz0Jefm1DKAw
         8sX/w5yYU7VfLNmSnaM4Iw7nsADPQvBlVKb5KfS6Z67dStOeq6DQ+VGFdcuWd4Xcjia2
         lY2OvjuZf7D0edokHbv//lmLbSBi+reqa6oXUzaClNqXpCKCdsvUHIcT3vQ7ip5SEE+H
         c/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046998; x=1795651798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=EWwiwAGTnm6TF23l6u0Or6LER943FIUguHwLqv5Yz1x590oluqpb3+kS2g9pZkpn4e
         2CInGeEduVLcRzd/BG3w9oI9kdPHsscwu5VRRtWhlK1ICdeR5fAlVG7V5y5lqyVc4K7l
         XGsAIA9L9X8WTkuZcmrrGzOEu0j3KmfRkcnvu8xbT9SrCevjIiYOrXWuJk1hV5z6U+C3
         GSfm78mKBYLk803jDNqVhDP66NcG3dBSThaxsZjn4XW2BmeUOsprHZMJYCmPwdGY9ype
         jgSkIDAGzB9nd6NwwYrr2VLeatKngTfHajtUe+DGqxNLj1fIm69vWXwozKNUg4GOjK+P
         YufQ==
X-Forwarded-Encrypted: i=1; AL+hErFC+ZAmGrcB8OvvjPdZGsvwiPs/Ac+tXwjYrjVMPYCo99VSJ9Yn55ymABvBZOoocnXNL+VLw7pXhxfrcQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F9iaRENacibBV1YXo12CnOuvOAC4vc0oOhzu2bsqODXacp3i8
	enVqN2twcxA2hiOQkM5qo3DItFZO9fOKvuQPY/zmzHVAIZurOZ3aW2MW
X-Gm-Gg: AZFdTZcQBwx/fE327w1WbVvXyB1E/NyI7PwL3uGmVuXrBJfYA5ljefohPH6FQp+EaGV
	lf5jZn3apI5IS39k26yKTjFS0p+rasGI3RvK4bIXY/3Gyht2sEskaVSA1ACKG6nbFl6/0whDP5B
	73HRUAyO7VHb0Dr4A20a+9x8qHXV1piBbMobmMowAq47E9C7sitEyEqTZS+AxSC8XBKtYV2I4A7
	9/2bo7s/GcOmvTcWEH0I4shHeH+02cQUc8qtxPG45YaWzOj1BWD/9juN5OMMeD6xK7RM5o91v+a
	A4/2P19qcvuitX6RzfZ5BGfPy/zseEmzbpDFX3er4SqlpsiUB1XCbOwyPuuVFzSCCm5IQQ49Iev
	YU7g7cNHEs9FN43Lz1Uvkq8/C9l3MDi+Hy6kU+bKN+gch1Imjn56FjFAZBCkKLddOiUxfZaLwkE
	MQIOTT23fNQ9FGkRCnjMEMSKstmA5Stvew3l/6Zsj+YQ7BNyTT/isU2VKYV5Nm/08qfTAI9PuPI
	Yi5Ls4aI3gtzSdKYDFHtIcFa1zIcL7Hsg6rl8rDBTM67woJxno8INu2ul4qP3tWyukm4KaD6cln
	uIj3MQ7K0bD+4cLry4+4vR4f7mvXyRQiV0TUNkFHmlpMxpIhkoe8n8iHboGVVCgAB2Bkf2hwSQ5
	xJbQNvO1M9KdolaGNWBlhev6Fwj0b1SbVTicXaq6hLfRs/MtwASvBaOjZyensdqv2RaqYGqJzWl
	kfWY3pCqHDOEycrc4uBw==
X-Received: by 2002:a05:690c:9a05:b0:8b4:e2dc:3f20 with SMTP id 00721157ae682-8b4febf1d10mr16920757b3.3.1795046998443;
        Wed, 18 Nov 2026 16:09:58 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe10d935sm25708467b3.41.2026.11.18.16.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:50 -0500
Subject: [PATCH v4 5/7] alpha: marvel: register a platform device for the
 environmental sensors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-marvel-env-v4-5-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=eCxTz6/wFgOEYqUhWdz1P8hGqwqPQw6s+J+8BeCiWlI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XkprM/7qq30VG5m4Kxye17zp8biqRvsPTcJbq+qu
 hD/dJtax0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFwz4ynDLybDw7+5jL
 4/ThWsO5z3fdmFfX2dBxK8fIQubMw46v+g/A9Qhe5V0Yny98/pxd3OXu4/VW6TkNCW77PPBi7hi
 1O9J76SFwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index bd918028b410..d2e1e45cdf1e 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1142,3 +1143,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
 	return status;
 }
 EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
+
+static int __init marvel_env_init(void)
+{
+	if (alpha_mv.init_arch != marvel_init_arch || !alpha_using_srm)
+		return 0;
+
+	return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_env",
+							       -1, NULL, 0));
+}
+device_initcall(marvel_env_init);

-- 
2.56.1

