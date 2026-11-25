Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583010;
	b=TscKqLbB3PB3eSZzPllhx3WZZOBxsK0TbOrvwvkbOPksXZ0u/lp7yI5goCy/m+S2Cnis
	 FFsUKyHbSBikhm7j3b97b4qaP3N6YZhe6ypKGz2xQoO9PJI93PiKo/7gdYQi3zC0ZPZbX
	 q2/qbZVQBwnwEVsunaR80D/vG1s2+KXpP5x5sHWtQbJxs7MSbzoca7byJ+0zv/80boIQ/
	 W0/1GgPpzCrxxUIJJsA2an8Pr66GldFIB131xci1OjUYdoKRKmc8mQWS5BSlnjQOP4rFQ
	 OiKqlffWuaQdih/+v6TMjZsoeJLAOeuRfBEOU7ONrIv51hs/rEqOvjETkA1j3M8YirA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mmzsQ8yQcEKYwO9cJ8eT25DvK0anvv/VF+Yi20LWU3s=;
	b=HNkrUJ4fQJMIJ4GplZd7fbCXit0tXQ7WRsw3kwoANAQsw+4ni5DsNTZW71JCfuVJFULA
	 cEpAeiYvgitlFadfbAC/trHrhUutwcHLfV7r8uySqNcZGTec8QqQepmi5l2AYm5GOMP3/
	 hofBU4RAtwcdt1/yV+4momffZJlrqA85tiSWbf7gLGaj4usbmnZMx1hxgrprueLpGG6MJ
	 t3qd6YmCl+mlM0/XEKibxMQP3IvNRqN9m01wfniGZ9cNcJ5Xa6gutgpuGHLOkapKAa7kX
	 S6+YKkh9ROnRezBFMJxuCzUZIJETctaIaNkYaoeUv8Wb+SSKAWFDgW8EVl170ePS/rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBPeSCmQ;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC13C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC13C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBPeSCmQ
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so2752032b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795583009; x=1796187809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmzsQ8yQcEKYwO9cJ8eT25DvK0anvv/VF+Yi20LWU3s=;
        b=cBPeSCmQXaI/3E2+NAPOpz2aK1M7tN1WZemYq0lqZ7Ie76pICCMIJ/0QGCZG7Z7vfU
         sH9BvxwqlkLWMOzauxVMKBx3lhRHCIZm8x+mkgxnbebfciHgw6DduRomlgkg2f6AgWsB
         BcfDl6kbrKAVmcea6mN7sALkcEo9FywPyveYV46+ICCEBMflt4VDTS99potbJZyL2Hrr
         6BSCbMeL3zuPuqshssJSCynpZN/8hmsQ4AaOf0FzBQkTOytY6lUk6cn3v3uQEp0wkCPe
         Pi1h1V1gY0zbsFpNYkAX1TZT6WFScrUcExemyxU569CHovLtlMGJ5fhMTwLsxB/Sk60M
         6F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795583009; x=1796187809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmzsQ8yQcEKYwO9cJ8eT25DvK0anvv/VF+Yi20LWU3s=;
        b=NQBivZ7g6n7vhB8PzoCe7gAQecWdZN0PfzOwHebb/g5uAd1mdqx6LnHRUvaCHa8Ctu
         s8PSDza3BZsq5Tl/fqtm1x95V3fPbeMzEBR76dgWnIny+qE2+VZ5oaxcwoKURaHoipbE
         UFG52yNZRv8vBC7EVU/AWnvQjtC+vc/5u8cVdt6l1YlC4NXLJvriJNXN2MPi6x+P8UD2
         ZsO4MZ9BYK0Ie/SGeVux64v8zaSf0aVrkK/1s7C2nP0SSUc+M7ku0eThXcC7Ve5Mv93h
         GwSc6h5dhfsS+Vvw9NWHWg9C8iPfa/9YEoC87UgX5KKB/msHocz4KRu2EMpDxA+2xVlM
         XY5g==
X-Forwarded-Encrypted: i=1; AL+hErF2q9UPAa73BVwQheDtTEn+vxxPqW+x2kIWH9PJVy9rHPCQhJOmoZENf6DFRVJepe5s0bftM/xojF/DD8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D/YRM7ka4oIdx45nkA5xtl+NcTjmNqk5/DvJTKx1nwbY/NXDm
	Zu2NhNcswhCQeulgrmCmLZUSm4/qHHjCvsS7DqZZKgGloueDA8WcQfNI
X-Gm-Gg: AZFdTZc0WQVwD24Ufv4KuVnI8OB/huVKKy++oLvsQaYo0KWm0buV1i/848nGgj7NCOC
	3bGsh8+SaSo+J/sgtV/q3hZL9+I3JQ7Ry6w0jbSQ9YNacG21KaKY6BhtjtG7uj8VCjzpuNJ+5sP
	82/jQlarJWa5OpzM1NvGD2HDooq/s4RogV9190ELE3mtJ80O86DmVstUfwIfoukL73S4uGpNrgq
	4O8EB3MiZAniymRJGWEZK1OUP670kp5Uej+sbfgczlsGAK2t2JhVht8Q/1JAi9QkkwtxkV8UZd7
	ThUknOELBpwPOWJ+5Ax7xBKev4Gkb7lZHVR6oXxuHctOe+gBIoEXAR7txi2UEYXEDMzjx8q1f/a
	26y668JKlGql5H1OZ5DdbkU85ZasfIKYB2dlS7Yb9r3eyNUCmY/Ej1isV+8A4tYCNLKnO5gdyZw
	dfTyNDDbBRXyAlWeg9IrUtbS59bEHVEV6xoLc5Ad1tySZ4y33kNMML3mmB8J2S+7OjvoZDXaAZX
	lutPzv5qOqPbNqJTGqv0euHIg34lzsvQqC+OoHNdHUTPKvVNgv8O7/yyEhAFMWRTSqK/KnamO16
	kv9x0cT4nosRFyDTrKhEM5Qt313BpOu32LK0JNML5nazepipvxb1JY/lsnWgr4cetRAGhX3Ws8z
	CiDpb+mw7ykvTNUK4b4BHW3HpvmsLk4JLKSMYwrvO
X-Received: by 2002:a05:6a20:7f8e:b0:3e2:9dee:42cd with SMTP id adf61e73a8af0-4014bc4e175mr17405476637.36.1795583008860;
        Tue, 24 Nov 2026 21:03:28 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c14fsm8180394b3a.15.2026.11.24.21.03.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 21:03:28 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] clocksource/drivers/exynos_mct: reject malformed local-timers property
Date: Wed, 25 Nov 2026 13:03:23 +0800
Message-ID: <20261125050323.83620-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The samsung,local-timers property is optional. When it is not present,
mct_init_dt() should keep using the default local timer indices.

of_property_count_u32_elems() returns a negative error both when the
property is absent and when it is present but malformed. The current
code handles any negative value as if the property were absent, so a
bad samsung,local-timers property is silently ignored instead of being
rejected.

Check for the property first. If it is present, propagate the parser
error or reject an empty array before programming the explicit local
timer indices. This preserves the default path for device trees that
omit the optional property.

I found this issue and reviewed the code change that OpenAI Codex
helped draft.

Fixes: 47dbe4eb9822 ("clocksource/drivers/exynos_mct: Support local-timers property")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 drivers/clocksource/exynos_mct.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6..aee3d88ad3 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -645,10 +645,13 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 	int nr_local;
 	int ret;
 
-	nr_local = of_property_count_u32_elems(np, "samsung,local-timers");
-	if (nr_local == 0)
-		return -EINVAL;
-	if (nr_local > 0) {
+	if (of_property_present(np, "samsung,local-timers")) {
+		nr_local = of_property_count_u32_elems(np, "samsung,local-timers");
+		if (nr_local < 0)
+			return nr_local;
+		if (!nr_local)
+			return -EINVAL;
+
 		if (nr_local > ARRAY_SIZE(local_idx))
 			return -EINVAL;
 

base-commit: 7ccb044c27720d48175577080b851f047ddcfd1c
-- 
2.54.0 (Apple Git-157)

