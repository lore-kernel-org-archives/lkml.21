Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630726;
	b=O3OX0zxw0etKjASgvVx/8dK2p0eWlv1Vs2Ux5ZyZWSqCHjYjg2wzngixFpKwuTJWhfBy
	 y3if3BnlSrqFuJ9WX2sVolZmY2VQPAQZDZaSU9xHrIYxtFAMji1TYfBZ2B2cPmdCCCvLY
	 a0oDSLfWsKRhoGEBQdXc7bZq40h2R76uQ8YHO7n89Gs/itzqkEoqGqjtGxCqapD2u0zzQ
	 ybRR0wsYeL1r379vLnOrFawA2sF3DFIV0MK0jc8tU6yxXS1z3tJlzgaWJDb1tRMyrxLhc
	 bmrpoR+CFdR05BaKpO6KpMg7llNOgpYmw9oukx3dhDnoh0j5PMtkoa6RiWSXqCLfOJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630726;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=x3WSnsP5AxDRxKwOCfFO0nP9LreEdCm3GuzfAMzwUNw=;
	b=uMtjbXI5WuQY50iRgJ9C/f/eFDzXWascF1+vtoCojIUGvphhCDoaazv2GX11TBjgts93
	 7v28S8fsTfXtAcYC7TXPI9NHk19hlW8mzTQNwF5a8Rwb+zyo40Npuav2WI3AhWkUYf19p
	 iQByc3PdV49Je9W9gpWwuMCAZGSvq4WchlMDkUsxo4LILEFGnjSD2WzonpNIh33AJBIc8
	 Z86JuZjQm9arJbNBECRdzJ5W2AihRBJgc+K2eLiv53bmhYAltPAKxKMWI8oraOz48h/UU
	 v89mxFbnDpjkCDThvQhnRgvQrKt/q5sq9HQMBctIs/wNhrHn1rfZ1fh6yj+KuilU+UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JV9dzOBl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="xX/Zq85I";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C6B606A6A6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C6B606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JV9dzOBl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xX/Zq85I
Date: Wed, 25 Nov 2026 18:18:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795630724;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3WSnsP5AxDRxKwOCfFO0nP9LreEdCm3GuzfAMzwUNw=;
	b=JV9dzOBlUX/sDyRUkT+3ZuZUcWemOfRf3nD/mRkLvCSTfOlTMVzaJLbueg+Uxy8dDNZcS/
	aaY54E6e66kN/hh57Ke2VTUPxgoNrergUT3V74tDxqMIOAxF5h2uCKmYX3Q6gOcg/Gmii3
	HDJ9Tw9sLXTiOW3nzgiBjxv69C6YW0M3gjjRFrKfiTBmp/ZPQZd7tl78hJBttOaJMRf517
	cR2+9YolUQXbmUt4a/QKbWnm/FGiD+A/sKAR/JDZY5j4quSE4pSf7Jty4cDr5NdqYRxPBW
	/0FKF855VVEF+FGmPCB77hQBcECm5dcF2V3vPLREvL4VFUlXc0icmesx8ERL5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795630724;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3WSnsP5AxDRxKwOCfFO0nP9LreEdCm3GuzfAMzwUNw=;
	b=xX/Zq85IpAlSEEZpSooQyjtNej5tgk7G8KO/WzwGEJfqPA5aO/WOz6DJbVKh6BHlo+TXlP
	kLKxrwF1LeF09VDQ==
From: "clocksource-bot for Zhiqi Zhang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] clocksource/drivers/exynos_mct:
 Reject malformed local-timers property
Cc: Zhiqi Zhang <zhiqizhangg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
In-Reply-To: <20261125050323.83620-1-zhiqizhangg@gmail.com>
References: <20261125050323.83620-1-zhiqizhangg@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179563072232.92412.14087876588230941825.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     745b13752d86ef3b86f40ed767b00504e1ce21c5
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//745b13752d86ef3b86f40ed767b00504e1ce21c5
Author:        Zhiqi Zhang <zhiqizhangg@gmail.com>
AuthorDate:    Wed, 25 Nov 2026 13:03:23 +08:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Wed, 25 Nov 2026 17:42:14 +01:00

clocksource/drivers/exynos_mct: Reject malformed local-timers property

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

Fixes: 47dbe4eb9822 ("clocksource/drivers/exynos_mct: Support local-timers pr=
operty")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Link: https://patch.msgid.link/20261125050323.83620-1-zhiqizhangg@gmail.com
---
 drivers/clocksource/exynos_mct.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mc=
t.c
index da09f46..aee3d88 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -645,10 +645,13 @@ static int __init mct_init_dt(struct device_node *np, u=
nsigned int int_type)
 	int nr_local;
 	int ret;
=20
-	nr_local =3D of_property_count_u32_elems(np, "samsung,local-timers");
-	if (nr_local =3D=3D 0)
-		return -EINVAL;
-	if (nr_local > 0) {
+	if (of_property_present(np, "samsung,local-timers")) {
+		nr_local =3D of_property_count_u32_elems(np, "samsung,local-timers");
+		if (nr_local < 0)
+			return nr_local;
+		if (!nr_local)
+			return -EINVAL;
+
 		if (nr_local > ARRAY_SIZE(local_idx))
 			return -EINVAL;
=20
