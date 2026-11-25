Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630722;
	b=0TGNOd55T20cDb7Bs9FkPYEcfCTxvCdsA7ADjCFESthqLWHLYhBSsIdoNKbJew/GYHki
	 D17AKwhhQGwNY+tv7ccOg1fiyIj2lMgcFnUYXYg3+fDZhsQmQwl1lfsQv6j3lNXuw74rN
	 kKQRcxhVvyROXlHdrwrMzUvDTM2XUUNyInmjGC5UHwzKdCeRcwj0E6BB7zbDncnj8A1B/
	 4gPzUXjUIC0DEf+IlwAhZ1eqn4R9lTMYVHy28mtWdQ+wNz5PLUVw02EcsDUJbd7SgWOBH
	 O8yk2CsLasxl3B2ugejPOSeDcjTk3adKNuuo0mukJxH2txAI3zIOWR6Fkyxf3ASRgQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630722;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=fhCnOfWLhFBSQqjP+vSMTWq1XnvoZDpR7hPoqjqO7ns=;
	b=zS3OXDOsz8b6mUXWolaj6dx5mOuYUrRRvYINjG6AAT9vxb5u/uM6G4VkzPUOpmAPhLpN
	 YN5J+IXDJCKGJ03v3ygdYT14+KVhhJ1WesA2C1dFSszPAWO7ShUsFLFHK5XVprUZOa+pP
	 i1DP751W2+aLEsXw5PYXc0uyV04PtMU1wo6Iu0D2FhrDlJ75JubcA7XQ+o0y15uPE0ar4
	 YhbweMNffmA0V96NNhYMK4sNGk5WhedtCgX5NwJUsrIXYnpaneaAUaPF0/OSlEOaxDgFH
	 ZIvKXVQkjD04O9KGf9Pv6WPRpJaj2BSw+npuyDaIgs8Oj3OCisDdpB7qaITPYuMSouQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L3ScmQuE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Hs6+GEZk;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6683606A6A1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6683606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L3ScmQuE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Hs6+GEZk
Date: Wed, 25 Nov 2026 18:18:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795630719;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fhCnOfWLhFBSQqjP+vSMTWq1XnvoZDpR7hPoqjqO7ns=;
	b=L3ScmQuExEc+1oi+7kJJL3LGXzaDs4zrATdoAd/fB6/tNQ0bD3RC3NAxMXJGRMye/vkJ0z
	c+R88APVaOVwunAgx/U4K7tQBLTlLfgKox/WxOMrYwgiD0kkPS5pru+fZ28jVtWTsjeB5e
	QtHMxnDMJF7Xx7Fhth1OhmRhROxwWSx0SPPvC860on6bJxhjWZ/NrfFVzdA8kQdYqYEdR9
	+ayijJOaBBimQGWP0aYJgR79/VnKpsIjEIePXZGEQ8WgP33w+57pzyLhu0Z2f1lhe54cGJ
	vxiX0JTGgCVq/U/ORT4RU5pkit2Rckn3eTkSgskI6CmqjNdF8YPEjnbeJVz6lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795630719;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fhCnOfWLhFBSQqjP+vSMTWq1XnvoZDpR7hPoqjqO7ns=;
	b=Hs6+GEZkMX/1pbjvIKooLIA9ZBrRAxH96paGsKR+RTZxKCErNPvSIwcruOGuI6ZhSRkawQ
	34c+JLgLqpke4xBw==
From: "clocksource-bot for Brian Masney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] clocksource/drivers: Convert to
 subsys_platform_driver() sh_cmt, sh_tmu, sh_mtu2 and em_sti
Cc:
 Brian Masney <bmasney@redhat.com>, Daniel Lezcano <daniel.lezcano@kernel.org>
In-Reply-To: <20261105-clocksource-subsys-v1-1-b0b710681b66@redhat.com>
References: <20261105-clocksource-subsys-v1-1-b0b710681b66@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179563071792.92412.5394284567488605348.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     7422d80ca3b14db74a73f972f918c6adf818f4a0
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//7422d80ca3b14db74a73f972f918c6adf818f4a0
Author:        Brian Masney <bmasney@redhat.com>
AuthorDate:    Thu, 05 Nov 2026 20:32:03 -05:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Wed, 25 Nov 2026 17:54:08 +01:00

clocksource/drivers: Convert to subsys_platform_driver() sh_cmt, sh_tmu, sh_m=
tu2 and em_sti

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Link: https://patch.msgid.link/20261105-clocksource-subsys-v1-1-b0b710681b66@=
redhat.com
---
 drivers/clocksource/em_sti.c  | 13 +------------
 drivers/clocksource/sh_cmt.c  | 13 +------------
 drivers/clocksource/sh_mtu2.c | 13 +------------
 drivers/clocksource/sh_tmu.c  | 13 +------------
 4 files changed, 4 insertions(+), 48 deletions(-)

diff --git a/drivers/clocksource/em_sti.c b/drivers/clocksource/em_sti.c
index 1d62ed6..5cf19d9 100644
--- a/drivers/clocksource/em_sti.c
+++ b/drivers/clocksource/em_sti.c
@@ -346,18 +346,7 @@ static struct platform_driver em_sti_device_driver =3D {
 	}
 };
=20
-static int __init em_sti_init(void)
-{
-	return platform_driver_register(&em_sti_device_driver);
-}
-
-static void __exit em_sti_exit(void)
-{
-	platform_driver_unregister(&em_sti_device_driver);
-}
-
-subsys_initcall(em_sti_init);
-module_exit(em_sti_exit);
+subsys_platform_driver(em_sti_device_driver);
=20
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("Renesas Emma Mobile STI Timer Driver");
diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 7977507..0bca806 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -1168,22 +1168,11 @@ static struct platform_driver sh_cmt_device_driver =
=3D {
 	.id_table	=3D sh_cmt_id_table,
 };
=20
-static int __init sh_cmt_init(void)
-{
-	return platform_driver_register(&sh_cmt_device_driver);
-}
-
-static void __exit sh_cmt_exit(void)
-{
-	platform_driver_unregister(&sh_cmt_device_driver);
-}
+subsys_platform_driver(sh_cmt_device_driver);
=20
 #ifdef CONFIG_SUPERH
 sh_early_platform_init("earlytimer", &sh_cmt_device_driver);
 #endif
=20
-subsys_initcall(sh_cmt_init);
-module_exit(sh_cmt_exit);
-
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("SuperH CMT Timer Driver");
diff --git a/drivers/clocksource/sh_mtu2.c b/drivers/clocksource/sh_mtu2.c
index 3aca86d..a45bf94 100644
--- a/drivers/clocksource/sh_mtu2.c
+++ b/drivers/clocksource/sh_mtu2.c
@@ -505,22 +505,11 @@ static struct platform_driver sh_mtu2_device_driver =3D=
 {
 	.id_table	=3D sh_mtu2_id_table,
 };
=20
-static int __init sh_mtu2_init(void)
-{
-	return platform_driver_register(&sh_mtu2_device_driver);
-}
-
-static void __exit sh_mtu2_exit(void)
-{
-	platform_driver_unregister(&sh_mtu2_device_driver);
-}
+subsys_platform_driver(sh_mtu2_device_driver);
=20
 #ifdef CONFIG_SUPERH
 sh_early_platform_init("earlytimer", &sh_mtu2_device_driver);
 #endif
=20
-subsys_initcall(sh_mtu2_init);
-module_exit(sh_mtu2_exit);
-
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("SuperH MTU2 Timer Driver");
diff --git a/drivers/clocksource/sh_tmu.c b/drivers/clocksource/sh_tmu.c
index 8b3cfa6..38bfbe8 100644
--- a/drivers/clocksource/sh_tmu.c
+++ b/drivers/clocksource/sh_tmu.c
@@ -636,22 +636,11 @@ static struct platform_driver sh_tmu_device_driver =3D {
 	.id_table	=3D sh_tmu_id_table,
 };
=20
-static int __init sh_tmu_init(void)
-{
-	return platform_driver_register(&sh_tmu_device_driver);
-}
-
-static void __exit sh_tmu_exit(void)
-{
-	platform_driver_unregister(&sh_tmu_device_driver);
-}
+subsys_platform_driver(sh_tmu_device_driver);
=20
 #ifdef CONFIG_SUPERH
 sh_early_platform_init("earlytimer", &sh_tmu_device_driver);
 #endif
=20
-subsys_initcall(sh_tmu_init);
-module_exit(sh_tmu_exit);
-
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("SuperH TMU Timer Driver");
