Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313970;
	b=Gh873B0V8M17nGKmkFX3EimIlq6ZhlDrL/eqopVqsc8N1Q1FwJQcZa11zv7ecLWmyrzD
	 L51CBZ2EF1Jg7sq2o1u7gnvSPI8LL1QD/yr0lDiaIY86hA0p2N/FPb6Siq6fkRHukvUlF
	 LKlHrbD/jTWBISHbujuuxmbsfFKKQ6rra0oudfo5vr5Fcr/dXD5osinypIRB4p71hjhwp
	 +goKD4gyDpse33QzfODX7pyr2eePcZ1wRXmgF69Ue0AUnYYjyx7mEJXuQ7wLZLrCfa5/M
	 gP1aU7LPIjsWUIngTuD29P7UX4Q4Ogu42x0R7bY0TJ3S2SC2PzB7lMAKcG3pHHYZxIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313970;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cLGnmizI0rQhqsNKClm0H53LdDa4BKTqazSRRlghGiU=;
	b=sMKz7wZeRiL8gVmDQO62bLlFmgA+XcG9NAzTEgIGCxacm5GCcg330i64oxaImKl0cc1F
	 GezePpVyxb+X5jzexBdMU01cy5ZomezAJeS7EH0zoURJ2SWlrER4W0VIKtouF1gVNIj7T
	 CcJOmHv14ANPopkylRTr7tzGJjOajWbWiA5F/iBfJ9VUaKP8w9ngMF6SM0kCTG06INeWH
	 ERHSblHlgHG6k+bRD58hfgVBDFUh+db9SvG0LKswhfBSiQVOBIneEfPa/ypY9elYmzI3N
	 aj0hOgwv7bm/TXpk2OLonJ5GfkU6Ku+CYx/aeOczpjkKEdN1ia8yYsJT1CA8wzmtIsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fJapHKsX;
	arc=none smtp.remote-ip=91.218.175.192
Received: from mta0.migadu.com (out-192.mta0.migadu.com [91.218.175.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F62F606A69B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F62F606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fJapHKsX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=v/vwC0I5TFCZ5/5X6X4jA8IEXevOgfqLa3VQQEnVcIo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795313967; v=1; x=1795918767;
 b=fJapHKsXlKANd9tk7BcRTqDrpGvMgIlnA/pmBT0obWvZvpITq3PCIl8p1kOv7SHCynpb4c/L
 IpqDQu0u1eTAmG5ZciEsCYNRwfKDKVL55oKfag2mQkr7t5ZiwBnfsn2XZOaKS2oP0OS/ZYruoEX
 bJwQ+md2hD6sSRcuJPwA26GU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd1230439948d28d;
	Sun, 22 Nov 2026 02:19:21 +0000
X-Mizu-Trace-ID: cd1230439948d28d
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schwartz" <matthew.schwartz@linux.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Jonathan LoBue" <jlobue10@gmail.com>,
	"Khamunetri Clark" <khamunetriclark@gmail.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	"Joshua Leivenzon" <hacker1024@users.sourceforge.net>,
	"Nathan Chancellor" <nathan@kernel.org>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	"Ivan Levchenko" <me@livan.pro>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v16 19/19] MAINTAINERS: add maintainer for the ASUS HID driver
Date: Sun, 22 Nov 2026 02:18:48 +0000
Message-ID: <20261122021849.57863-20-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122021849.57863-1-denis.benato@linux.dev>
References: <20261122021849.57863-1-denis.benato@linux.dev>
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

I already maintain the ASUS drivers in platform/x86, know these
devices well, have contributed in reviewing and bugfixing and have a
lot more work pending so I volunteer on helping making this driver
better: give hid-asus.c and its sysfs ABI file a dedicated entry
and list me as its maintainer.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a69da715c58..3dbf491046b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4135,6 +4135,13 @@ L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	drivers/hwmon/asus-ec-sensors.c
 
+ASUS HID DRIVER
+M:	Denis Benato <denis.benato@linux.dev>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-hid-asus
+F:	drivers/hid/hid-asus.c
+
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 M:	Luke D. Jones <luke@ljones.dev>
-- 
2.47.3

