Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939222;
	b=vTRAi6qExrSKI7PXhy9NAipIhtiFmlzCSO532+ZT9i/ctjPa4ROcAKFkf5NC9WyBMyu7
	 9E5a0n+vKoAIKXuL/xy4D8rZ/vUHlA9tTMOSDKKyEd5s/rtJin2GdgEaH5UdVY7Uxr6+l
	 LRDHrsdcjHzNfBzysksIM4CIhRuL6wQgLiOO0lutxv58iZWddjR16/e68Xy9CIVtrZhoB
	 VGwjDAJ4KNzjxbi0U0mmTLi85lim0vOvmSd9bRxihrqvBXeRMZUsaYqY8Bl/caAWq2bfx
	 tDolUMKUAWNaFNeDfiDvklFZs3GPHP2JDwL9htunQvS6aoHeotEqMIwtxfTf1nx1/nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
	b=dw9wH++b3W7VtDOezIqzdsKTwPGCJG1mVWdE2nIHwUa5ldhxO1wjTsBftGZuRRJqf9uS
	 2gAEFbNL29OPrGk9JaT5vRYgl7/oCXUd82veIwB0ZGhIU336RFW+fQ865kCpm85LvgKTW
	 TYX+4aU+/+BlAzrviG+YxSqC1qtWlgzD8oDNv9MmDymB8WQQLQ3YCU07nLRInXOX0uPAK
	 Xvwe41A4NrCN9OvtagCpxJYeVMHEFPwzqBwAP20PEBMmthVfdD0NfbW0C8SmusVgFbkLL
	 gR2ueXURpJZlLxpqHkqB5FbK7qyj4aopMxcN7MppE5bkfn7UGuq3J+6SHmu1hcPe81Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+eNLKGi;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF9606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2AF9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+eNLKGi
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67583c777abso1694675d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939221; x=1795544021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=O+eNLKGizaKvCjcBFEPklrUdI6prwcylupkEF35VptnltgWqNEux7MOuHb+SDkx5jB
         O2YBkx70K56s4/CYCkiUSvGtyup8Lsx6SgYv0nnjy/nYnX15phR4QjgUy+4HIpn192gF
         kJ/5qnLgAvCPteGUvEgMXDzynLfgCneUUtyhyqT9ItC5tbMECcJW5nViiMWWqg5htRsK
         RdPzqrR+FATHhPikVmvkp08iBo2mqzvqGqqnkDbzguZ9r3QlGPxRnttdluSffAKHHH0u
         uvOVPqUyQmHk1gGbq9ONEY4DjkvDKZytgBIF7ddU81D5WDv3kwYq3MVRRANuE4pFuWOG
         FVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939221; x=1795544021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=t/V0ACftJFgqqMDEqsF3fj+ulVS5MJYPE1lH5w1K5yoKJAeS9mmEIzXbyHnfe3torY
         ZYoHJAw8kzG7EyyNYfyTzTiYieLtKARYcpGLxNp+CsNf7gUodLxkf45lHizlyF3j5dYa
         mgXFqAuhjEp43hg0O23iOc+HmbmZw46GCI84MPWB3ZF4wx0SWvyR8YkBN6zjnOLvfpcU
         aCKsbEJqz/a77ygsd414YGlHtYqRU/8SuSxAgajaXB3/7HS2iQHP5tMLK+D0wPc+Aead
         D1YK2wlGX4og0gDYGDvQeMbX29bafefpYqpxQBpuBjQXS9EVdq2hcTZunodGJ6U0EP0j
         pleg==
X-Forwarded-Encrypted: i=1; AL+hErGcopFmXMFkIxCxlHROn5x2B1AYa4LIOkXZNBkRgjGhk3KyY5+J/nZWIvvA/dTMlQgM3yy0o/46AZ/oUKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SKF9ez2ncfXzcbujyAWR/cnLUVJ8rYOVLVQ5nPY6oGi7IiioI
	nOy3uQD2/f9y0YafkRtOEOzRtkxLIw9cd/ly7IHeUqUSVR5Q4Q8kLLFB
X-Gm-Gg: AZFdTZccW++FdX3IzfpweKWZKT8If9j+nOT7Coq951XXtvFcInjLuv4pM++utW9f39m
	IOC/WGnd3v2SYun9rmH4lbOiVZA6xnhN3etf54EpeJJ2B+VwWGjubBQiqcUl6VmkoOyu8s5omaF
	EIZWsmloXbGZTjgsCt3j9kw+N+U2nzDmXeNGYBhYuQKB5MRVi4aL7PU1TX9gkdvbzghU5kURvr8
	f4eX6rfVXzYc1vXbZ4LPYPMeG9ZVIfgq9hL3K/vuoszADWP6YqW+6DUMJwwVZN7Tt+ygFe8rViM
	ZBX9qvpDPb1TaC+IMyK1U92VX3/108jpWFOczOKMTydlGKD9BIaf6xHmoHLSD8na1aETB4XSBFu
	EqpGI1RaQJmGT/4LhJ6+88l6RpeTHTwr+YTli8vfxh7XY/2CwLfwh/VZfk3hXxtB2qP4CXlfGa/
	n3suClLrxt8+uGHE97iz+LDb8VceB90+4GsskY5N7YQe5LUXsocjnC0E2Q4vByQtWkNELs1rJOd
	8hAr2qJnwnnncfMb/nCJwmhhqL+6jAq7l9pFKthGkOXNxVigVS5dJ43QkB6tSlQWLLiHM6mULxM
	vQa5ZTKvUpd432MLhmoC1FCk1miHjDr7zNAwP3OvTV2amZAPAbBOb9COBdJiQsXHHcUoKTjDGl3
	n8vPWxP8pkPajcxa7ibUapBt3lFFvihsJgmgynk6uIFusP9SnBTVNmbwbCwwE+xvBFeCnaFcQie
	pehfvcHCmTcIS2HvvDTbfX7mBWNGRvlD/ql8eEego=
X-Received: by 2002:a05:690e:4894:10b0:677:c90f:46bf with SMTP id 956f58d0204a3-67dc7869e78mr1202178d50.17.1794939220704;
        Tue, 17 Nov 2026 10:13:40 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3f284bdsm291489d50.3.2026.11.17.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:39 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:32 -0500
Subject: [PATCH v3 5/7] alpha: marvel: register a platform device for the
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
Message-Id: <20261117-marvel-env-v3-5-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=eCxTz6/wFgOEYqUhWdz1P8hGqwqPQw6s+J+8BeCiWlI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPTY//i0pq3747akHGmzgvRFG/gWHTaQnx15YdojP
 tlTJjL/Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaQGGGv9Iqi2oDCr
 /0brrgzSkd4LnS+st1+S2qf2cssukOjV95lI3hn9bcpUq5DX4xr3g3SE4tuD9z+bQP/CHXdu4uT
 itTuZdVywAA
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

