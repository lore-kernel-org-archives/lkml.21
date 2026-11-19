Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082966;
	b=hhSRkud9cHNGTSy18lz3qt+BZXOQSVOhwvuH1ATONv81FX/g2q0ufx9NOtZKtPbHz9Eq
	 iQJOZ0qTU9qKRmm9gqHemY+0auduif6ZzpKpnmpIzRd6JXoE5uy7aREg6UZVmxRrYJ6nE
	 DA2wFmEU123IkmwFnRRMlJtOkKLGrlxbD+4V60sFKbR8RO/GSMynCc28mxenqIOQ7GlC7
	 K9kcGWDd00lTXupkByPCRoJmclj7hfclKuDWRbpFf1g/atA6i/OGQIEYx4ezdsXEl8Y4D
	 MuIe9fJhKdw61mG9eHNI9ZY0jnks4fSA0Qf8LsBF6sWv8hsFf+d5UyZpgfHh+V+ofLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tSisANTIhE4dpBJJKLY3N8wKQ2oTvA7ICY+7hm22yN4=;
	b=rw9dC1lsBB6o5pJ1Nba92RKWIzYELaCBVk0dwXtKbif29tETkzqUjI2y9OD6URFYUS2z
	 QophzY8JUdzzV/ht8RwevFKXAykY1kBuICiN+BvsrMTlLH/j1ZW2QvYBpfxAyqvYqxjQh
	 se4nIBw3uzyhk+lFqhly/sbmdy4KhGZ5ZV9q3Tl95e81Gu02PzURh7irg+6oYCRI96/v3
	 bS571SmF3tppNSnwW30+4gKwJOA7RpOZDZUumrFKsXeGY/q6Q54Zo4kRgJrK6cv3fmmqF
	 38iHNy36Ysc7Nn9QGvJkF5bI+G+zgJbauvrl6KZjq6UinnVIFrf8/bZ1KQf5APl7A3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKJ3klqF;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753FD606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753FD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKJ3klqF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so1782675f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082965; x=1795687765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSisANTIhE4dpBJJKLY3N8wKQ2oTvA7ICY+7hm22yN4=;
        b=dKJ3klqFBxXR9AYtNzRXEcQfyDqSguwpe2VBCPvm7+5+nJukCguQq+nX2XX/gG7yF2
         MCcvA0lRzhEuL7y44LP/X6DDJMn+hucKe2of0qpGGVpGqlmG4qTegShMlsTB4kiBfzB8
         7SidLtkkuHYdfeQr0vIzvf1LF2qQKF3ymDGHKBrNYl4lYEDlJNgf0u7xLVN8ZA1G/JKJ
         50wTmst58zqLCv40/0qSkHtj2lOP41pQF0OHZdH06E2bX8v+tzvh6F/YdkUA2amhDWA4
         JENWaUgXL874gzkLJlLT77+yJGfZSDJ7ETN1mC85VwC+P606j2tKCSnZI21pfYgAgIZg
         Hqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082965; x=1795687765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSisANTIhE4dpBJJKLY3N8wKQ2oTvA7ICY+7hm22yN4=;
        b=NJsRevHC/2mGnjIq96eMfRkLtCerF7szMukgtYbZvViw5sILLn/pz5LDnwuDEGh2zX
         vL1k6w0uWMvdjYoU+x+qdKse7hal5eU+hBowsZyiRjnf0/xA4kt+3Omr3g0SEOul6B+k
         KW3mkKb2tj0AkyjQqGJW3jRj/wsxAKTBocDp+KfKH+3YMq3NspknP7rzIryMjhJbHJKm
         wsHPms4Prj3Tgre3+wKruVcXP/WMHOq16LYLnJCJ1cL/Up43KDmjIcbdr1urlKhY6q1w
         qbHmuAJ7Texj3ve030VFc15MBuv8mRYdvJwciAcyPaTVg2hCXDkU18A+plKZswVW9oWP
         XReQ==
X-Forwarded-Encrypted: i=1; AL+hErH6EZy3VyBi7EZBG+ZUPRub/DCazrkm26M2lEW84rPlD3RtsCpa5cKR2/HjNBpcz0hvNL6Kfv4ddAaJrvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h+IKbhKLdqVKmjcLvtrB++0h0VKOYQ1xRl39oL6Sov7eSJyYS
	K2XV/EHtFahU2SSq4UIp+9n+/l1dVGhB7ntlx6AGDnZ8XEsuPLy/iulqsaOH9Irg
X-Gm-Gg: AZFdTZeRpvxLChX8mveVnhL/sG1qXpl5kciFrhLnkuEcXdcvsJqOTI6RG+25ltsBONo
	rjmwxoNThHHlZi9j3CQ9mEkrhBzoOhmCr81Vz6ylXVpBSpgCS/P6Kz8Uv5v+oCVbTB3/zZCbbSL
	yo4IzZokRNlsDjuWu6pk0iRulVa2HbLAY/AYpH+lBmj4ulLBAgqCWLIDfkL/tNX6DipL6kM9OGO
	vINXoUzGi6teu7mNcZMlb36KIUehFNkwPrGFnL6nNYY1apXEx5m3Y417544whK2Vnif9RYjVbEB
	0uCgoQ8kNkqk/+WSeAUoSP5LEH0jNVVsuNUsei54W+39aY5UrMOnbQK/B7Rqnfzax5jGIhSJ5zs
	Bfvzk/cpegQ3LxT+iuM6QNOT/2XSZQpanSCOGwC+mNJhYkXiXsSBteoKmkEaZwuqnOlvy7D+JIu
	ReWKxqc7A5Dc/qGVDQj+zzyl8e+XXocxVHVFcp4DqmDB1YFKIEcFKcfVn47LOyS07531fyJWJk/
	fmZ9DOkE5Wr1JopGiKqHD0g4i207qTSPvqa0nuHASNZAWE6OApRRnLYadznOF/1/ZjhMNLOMvkT
	8mrAYVXuh9xFSlCM3V8lA4qZ7AjVw1x5wJjlQeo=
X-Received: by 2002:a05:6000:4201:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-4a63a1e0266mr12948878f8f.11.1795082964502;
        Thu, 19 Nov 2026 02:09:24 -0800 (PST)
Received: from dev.Default ([2a0c:5a86:4d09:3a00:3c0f:a5ff:fe86:2946])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65683d5a2sm10097076f8f.43.2026.11.19.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:09:23 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Thu, 19 Nov 2026 11:09:22 +0100
Message-Id: <20261119100922.2722103-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
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

l2x0_of_init() looks the L2 cache node up by compatible and enables the
cache whatever its status property says, so a device tree cannot keep
the L2 cache off.

On the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3) a PCIe read on one
CPU deadlocks against an L2C-310 line operation by physical address or a
Cache Sync on the other CPU, and the board hangs within seconds of WiFi
traffic.  Running with the L2 cache off avoids the deadlock, so a board
needs a way to say so.

Honour the status property, as the newer cache controller drivers
already do (drivers/cache/ax45mp_cache.c, starfive_starlink_cache.c):
leave a disabled node alone.  The firmware is responsible for leaving
the cache disabled in that case; the kernel does not check.  No in-tree
L2 cache node is disabled, so nothing changes for existing device trees.

Tested on the ZTE ZXHN H3600: with the node disabled the cache stays
off and the system runs normally; with it enabled the cache comes up as
before.

Assisted-by: LLM
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Navid Ghahremani <ghahramani.navid@gmail.com>
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
Changes in v3:
- drop the binding note, a disabled node is not touched anyway (Rob)
- of_node_put() the node on the disabled path
- add Navid's Tested-by
v2: https://lore.kernel.org/r/20261112072953.989664-1-isasmendi.agus@gmail.com

 arch/arm/mm/cache-l2x0.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..44eb61481693 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1772,6 +1772,12 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 	if (!np)
 		return -ENODEV;
 
+	if (!of_device_is_available(np)) {
+		pr_info("L2C: disabled by the device tree\n");
+		of_node_put(np);
+		return -ENODEV;
+	}
+
 	if (of_address_to_resource(np, 0, &res))
 		return -ENODEV;
 

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.30.2

