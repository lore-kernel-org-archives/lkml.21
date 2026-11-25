Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623018;
	b=2tDkEtny7QLtFaXncuIRdxIZg6rgmeYSyLxguNlw9mKAkjLjdb5NpV+pWaFGckClh1ug
	 OQBbyRMqo0PKjABRCRxpqtX+hnTJN1Pi7u4ssmW13hyY54XoI93n/IxZvmd6v51thX/jv
	 /b/ZvoU60UacoqnYm5FeoWJqVyzxGEPkDHTi9BFHJgiBIUu2L1LaQIWJrTr27Vu5LG2vm
	 1OZ3JJ8NVh8vnbZ9wGtivQn66gt9ZzaUhYhcsQHXzDaBvRVCy0/YCeIkdLfkBbnvkiy0f
	 9mq532zuyBOrJO07iZVu2sjlrGQSQOU0xpQyOVE/LCzBqz6DwtC+xOnYwkG+ozvg+Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x5yHdiGlrkU/Nuu/+FJFLSXIV1EPwrfgxxUc0g5c+fk=;
	b=3tJ+JpVsrn5pd7+jhSksaAYhX+U+rS77N6+9HiSGTww4ZfbOlb8cYjU5FEwivyivWkWn
	 l4pmLiAo2xh3Z1rLQYpaC9KuVHmxgDeZnXqnhhkyM2ZztgS12agqdfjIFK8YUutsusSxR
	 18/FcUAxzKGlrdFUlJgYzZtnYyoMlSuFfPgckADNNRTuFhIGQoqUL9jZ5+DkvDjLiALbb
	 Vq8fywLSy8t252+Ie1Dkn5vePl/lxK8MiU9EIleW3j5FB4i7uj8OgQFf4RnrU/4IcGZWm
	 BQjQ/4tVOaL6EZDFh8/R/XBqpoU186Dgt0vkYn2n4YNo+HsE34vZDgqbSWj7AHlWPNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4s3woIP;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E890606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E890606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4s3woIP
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67df3b1ca06so6716565d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795623017; x=1796227817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5yHdiGlrkU/Nuu/+FJFLSXIV1EPwrfgxxUc0g5c+fk=;
        b=o4s3woIPIOuKQcTwwjUjRAxAm/KEkHXcpll84LVxQb9xyBondXgN6L85wLH8XTjQCZ
         dqzAumOjdgq7uPwhGpZqCRpy7qEULCHGsIn6tK83Fj7gjXTUOQ+q0oWlZujw+k3CGs5u
         VKTqYt5dNQOb6BHHSB3XDhZOhh+3fN2k7H+rZkhX5MCfszMA8n/HGoDIUW3fcwuJ7ZQb
         AVA1JSHny1y2YJN/lmE/Sg5i0YrMwa19EIYqJ7HPwbLTzP2EagluFt81mq+jupnfQVXO
         nNebUvlaYg1bfNQ+ufxW0NVQqbaku5mnH0INCfwbr83beOMS8ehLDhJuI7/EEgv2jU5r
         ok1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623017; x=1796227817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5yHdiGlrkU/Nuu/+FJFLSXIV1EPwrfgxxUc0g5c+fk=;
        b=EU0zUj5Bkg1xTJItGZ0TfCRC6mnniFcgtKCk5dT6iKFyDLNydClsL+xJ3NM7FRhmV8
         m+KfWR78kLUk4QkgAO75IMZVHIcpM3Q3DMadj8zcCvpk0reMJq/anidMtF2dYMGR8bNn
         k5Vmwe8aW/8Z60f2kz7CyNSSQPep8A4gfjZhzKPsY6nLf7RBBzIrgV5gVu8Pq2FZiy/M
         qUYuVBrnVJzicJUmwVNf977tBAxu8ZuLXfV+z6ZEeBYhwkKl2/9g2FrjT6GuODCBOm//
         D5imiqbbNXSq1J9TqRFAZ3iN7YjNrhvzTUaSSPYKYx/up3G8zUVReqT4tNMP5AdMTBlc
         XvJQ==
X-Forwarded-Encrypted: i=1; AL+hErEtoxv/zffjz0vys0HyOQGFrWdG1K4RFCs5ruFe7Yv8Qa9QB/704+pUZQ3uWfWNIq9LxG8gwlR3SGjSjOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7Wq0oSUAOf4nsKr7f4EVInhVpRyAkOvUir+3bVGY9HWITOn2Y
	e1390d8hiaKLUsl4aWXFFrG+dDdcNNRj/Z5QUpHQvHK/qr2Pl8DgkopzT4h0Ao4=
X-Gm-Gg: AZFdTZeDc4eAQk5Fc1rRmiNQknSD34moJ0UwR/5ok7q+92FHYNzk3B4fa3XezE9pO6p
	0QAV1i3y01JJoEoM/yRuNWfnKGpAvmcyGVP3F6dFA3H3c9Thps5+01Lgx5L80DWSKay2j/JUala
	lZyElUrtMkc6ae4KA0nIeHmPqhTYuQLz5WmRq/IvSw6XcrGNHZLCMFQYbgJCgxcnekd64qz3x63
	ugBwppvG3iiQdK6JI76LkUfCop+QztcXthlmkFIz6SjVy76zg6LcBjgX05O77CbTi/2T37heWu5
	EGxHT9WDdzhCWimdK6nhuo305aWM4s2ALvsYyF1fcfgOjVxwCvAeeDhzrT1TrH0thnd2OEFvt/n
	DxQt7dZd/YXCK7qR+IcRSpWKf1Vjlft6pv6s4tRyDDxnXvmaaQy9D4Pl25C24e2xqIpGFEgqHuL
	PX2S6BgPSVsn0b5iDE1+N5jPYQClAyxN9UFffluN1+P2nfduV4uf3DpIq/xv8DfxLa5vEFOBcPP
	io0P2GH3a/IeizoLTnWf8u7Pl2lUiFo5L3GuM17+tVU9Di5yrQYalh2yemsx2eEIpcr0FbLmRWn
	YWwgIia15F+pZA==
X-Received: by 2002:a05:690e:1916:b0:67d:bbf9:11f1 with SMTP id 956f58d0204a3-67df440ed3bmr7211709d50.47.1795623017463;
        Wed, 25 Nov 2026 08:10:17 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df3354415sm8960040d50.11.2026.11.25.08.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:10:17 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH 1/2] MAINTAINERS: Add list and ABI file to Intel WMI SBL entry
Date: Wed, 25 Nov 2026 10:10:15 -0600
Message-ID: <20261125161016.781273-1-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The entry for the Intel WMI SBL firmware update driver has no mailing
list, so get_maintainer.pl does not route patches to
platform-driver-x86. It also does not cover the sysfs ABI documentation
for the driver.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 742c4e6b291ff..18c0428913b2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13887,8 +13887,10 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/pci/intel/ivsc/
 
 INTEL WMI SLIM BOOTLOADER (SBL) FIRMWARE UPDATE DRIVER
+L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
 W:	https://slimbootloader.github.io/security/firmware-update.html
+F:	Documentation/ABI/testing/sysfs-platform-intel-wmi-sbl-fw-update
 F:	drivers/platform/x86/intel/wmi/sbl-fw-update.c
 
 INTEL WMI THUNDERBOLT FORCE POWER DRIVER
-- 
2.47.3

