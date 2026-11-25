Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630720;
	b=YN9YvIxPeNllxO3+LjwBPbGQMyiICPnN1yKjj1Ngbd0dJVt36/lOX/RJ1wNP3ydHeqHE
	 9j9qKa7FLqAkRxmkn8Kp27XWMCYF+plfdeDpWAaHlPpWqiXEU8YYw8JscKGS4OgccP7Hn
	 OLDF9CivOmyEIR/AES4GOYLLnPPGd4StjlTuefk+WYYLhgGc4XpXoufNU1JJmhNhkLAPX
	 Zqm6m0UBTQqbX+k+d0z5y2MAkWKlPRfxoX2Y0nhg2+ucieqXWnZCt8BoyKAKYgmXDcS+F
	 SNUSksOCJg7H5ypUzCeHLZabqBYcqFqMptWOSCBZ+98cmkvvakZVdmvYN3vUJ9fmWTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630720;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Pz/UF4H9m+spqYGLqTuZe+GBzcOiGq4CiN3vETchrag=;
	b=KyK9a1onJ50XgcO1C5oDbT1dXd81bJkisV4j2ABHxCHUpAYYBOL0RZZGcoxFJ3WHau5T
	 31ZgeqjRtbAIu7dhj6Wvxv0tKcOWBnhbzqELU/Z0GuEjEkEiIIAAP4jNY28yYdn36QRr3
	 spRDBGuXen38ZL08ciU1zPh8vtQurgRyx6ckzBlI4Pn3zvZ1oVnv/+T3jhOyAoilCcaz0
	 A4S0yNDEhlUSziLcm2MA6PP9LpeI+KxqxPagELirXgAPK/ezQwLTC7kRfYzBzlrkbIUAL
	 1FlahwaDkkvXE40j5TI01nTiNb43+JUu3NOnlXaxkqpJ7Js6MKueIXGBA5Qj184DTgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HXW7qHuW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=07VtJfOT;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68541606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68541606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HXW7qHuW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=07VtJfOT
Date: Wed, 25 Nov 2026 18:18:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795630713;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pz/UF4H9m+spqYGLqTuZe+GBzcOiGq4CiN3vETchrag=;
	b=HXW7qHuWie3QoumhIziGyEwmnWxIcu7pKN+44agjxEFm4kvevuE6A+ZI8rOoMp+lSd7FZi
	4XmNkYhTE8818iEx7TcCYAOH+Hsmy26VC6o+N+Gl9kQCrdatBzMN9tnZ89h5RLXccT+IJD
	ddIXcPLqTW/W8pJZFYZ8Js/aB5rx/3fL2+zcJ+Mv3mN+5GiDbPIQbPrrNhTWkKc7zF2mf2
	xYly7IrkKs9SHN67Nx0KGw3xbLSm2VbBA+bfNRUUZnxIi4rdFBlU8jQB+gskJoOWlnuCtw
	xLGwOxE4rZpkTEAbI8zuAjS4K4M3Ndl+E8XzMM9H6/1Mzo9/bcPBOreG8jcC4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795630713;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pz/UF4H9m+spqYGLqTuZe+GBzcOiGq4CiN3vETchrag=;
	b=07VtJfOTPI+JB8L51Lz99lNYy8tBWpGZm3gb8xKPkRhlBREUEF1Kso+emqRUTkYhtaoUVy
	T0xGev6v7RGi2GAg==
From: "clocksource-bot for Alexander A. Klimov" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] clocksource/drivers/clps711x: Fix
 clk refcount leak
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <20260526184105.18962-2-grandmaster@al2klimov.de>
References: <20260526184105.18962-2-grandmaster@al2klimov.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179563071198.92412.15171162484809203767.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     81c90d8c7670d3f66bff49b45f0ef67ab9f10b8c
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//81c90d8c7670d3f66bff49b45f0ef67ab9f10b8c
Author:        Alexander A. Klimov <grandmaster@al2klimov.de>
AuthorDate:    Tue, 26 May 2026 20:40:57 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Wed, 25 Nov 2026 18:41:13 +01:00

clocksource/drivers/clps711x: Fix clk refcount leak

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.

Fixes: f0b7fabec327 ("clocksource: clps711x: Add CLPS711X clocksource driver")
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
Link: https://patch.msgid.link/20260526184105.18962-2-grandmaster@al2klimov.de
---
 drivers/clocksource/clps711x-timer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/clps711x-timer.c b/drivers/clocksource/clps7=
11x-timer.c
index 63ae3a6..2fa7ce0 100644
--- a/drivers/clocksource/clps711x-timer.c
+++ b/drivers/clocksource/clps711x-timer.c
@@ -76,7 +76,7 @@ static int __init _clps711x_clkevt_init(struct clk *clock, =
void __iomem *base,
 static int __init clps711x_timer_init(struct device_node *np)
 {
 	unsigned int irq =3D irq_of_parse_and_map(np, 0);
-	struct clk *clock =3D of_clk_get(np, 0);
+	struct clk *clock;
 	void __iomem *base =3D of_iomap(np, 0);
 	int ret =3D 0;
=20
@@ -86,6 +86,8 @@ static int __init clps711x_timer_init(struct device_node *n=
p)
 		ret =3D -EINVAL;
 		goto unmap_io;
 	}
+
+	clock =3D of_clk_get(np, 0);
 	if (IS_ERR(clock)) {
 		ret =3D PTR_ERR(clock);
 		goto unmap_io;
@@ -103,6 +105,7 @@ static int __init clps711x_timer_init(struct device_node =
*np)
 		break;
 	}
=20
+	clk_put(clock);
 unmap_io:
 	iounmap(base);
 	return ret;
