Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795286490;
	b=nrmPLtEEZkygKiCKwK7iKMgCpiBhZe0WMAKX/Lsp16VTAIeMQruqjumNNPrQrSzf/ZcQ
	 1PKFa3RDWphbZlblSpr0eOVvcUsyssbKkNdYuHamMiRJT6lGEXKR94zA21+j3IteQMTEP
	 xaDHFUbFq/jAbBXvF84NctLDc364rSZHYql96CQqW94LMMEDFB9KE5Ypv58OpXSX9bz5j
	 k2UX3kKzBQBpVeqCGzo7S6wSGLJHV7cUtjxc0WNiNVbaMiY133UttFDly3AU8SNKAo5i0
	 MKYy5wHmaypDsVmnFZoFDGpCZU3JkZJbLiOZMggJT/kjbOUN5YZIDo6UZlpq9yfVx8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286490;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=kSYUHzts+bCt+RIyQSmQsSm4cLVVSyQ+sBrYFWLe0Co=;
	b=QvYPRuUYwjTc438KC3ojlZlpyHJLpPx/nnbd3E3Wz/pXBE1fNXWFnwqptJqLfrQQ2Inj
	 uzkz2aixRacF9gUxbXd0sL3cR2Cm2YpQlWh/BwwX0R29fxBFeuXyFFLvYKJZ467+Brcbn
	 NOWZ7Pe/z25/jNWKI+lUODV2YJi5VI2xgJZva2mNYxDLkenzbQPNNo07QcTzlAWQ8YLKH
	 sya/5lavJ9/gqB5+Vnw7sVeYcg40mFtTe2yHhnJcAHt6f7VR8ke3Y1yMojtmEYMX8PU0M
	 SFPKbncdlLHJ34kG8zk2bSRBEUxfI/wymgmT/Cngc8AUavy9cFjvJWc+RTOCzJ4oqpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="FS/F3z26";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23581606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23581606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=FS/F3z26
Received: from pengutronix.de (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: mkl@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A92D120188D;
	Sat, 21 Nov 2026 19:41:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795286480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=kSYUHzts+bCt+RIyQSmQsSm4cLVVSyQ+sBrYFWLe0Co=;
	b=FS/F3z26i5jMq0GMOaycA2wf4zlfMmHXXviCzPTr/hOLbvujqi5cFzvxbylwssgUJqVWGh
	W2PpgA+PKnyvSv1S1QOjtRAU/ZlYI1RpK5uyTyQwtRuqaFvoHzQWQEvs3lYXPW9el976A/
	kCBmIA+n7mHcTDRZYvHVvwChm06XXAAvvEk384LmOLakLYhxYhURkPklpo9YlVCcP0jxfu
	IENvEuf5t8NFXPT4TKW/KUz6GPNcS3eIxLjWlrJ2/EI3NRUJXncEDAO9JwY9FtRtJQalQh
	88yU4WAwv/lfcBFqPm7aeSsFB/7JrBMriBOQT3aNSAT6lWjzT04Y5jgCKH8K9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795286480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=kSYUHzts+bCt+RIyQSmQsSm4cLVVSyQ+sBrYFWLe0Co=;
	b=MnQRIiWq55WVLq/fnFAkUMmMU1WzT80ekjTb989sSutr6fun1RFSqOIZP0PXdUurL+oJkN
	U50rhz3bdX4b8XES/JsQCRcpoFmlgN7GcaE4FbyutunDq6sjOBY6M4954b9KeATFOfkje6
	56hzxz3SIXUUsP53G7jE+PzfEnnXWPhiFhl9c+rM4Z1slgNVs8t8+5yr203e6I7JnwMYM5
	ZrsN/SUm54Kd58sAjJhrsEbUDpe8WoQX5VWQ3pJ6/upJ6OADBzUIXw3G7B8mHvcs33xlrY
	KtWJPaBT5pVhI8LR+YqxwjqQjVA9PJMnOcpw54y1oqAcD25vzyQUWXh08gJavA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795286480; a=rsa-sha256;
	cv=none;
	b=fq8v1u+XvncXOF7PB3ZmRdt2a/lBa5IkMD1lX7dW5lr2uzTTlAcCZw0mo79eegKSxpvuN8
	2PibT068cWFmwRpSVwCzS43kj7q+yYOerT2OWUXhRdjpx5pkrba1o8riAWDeLLo6U7FInO
	WyicvoBPn+/sh/xvCiRSBwXmQivEmIXOFJYBh9XzN/Ae+aQGEzZtU/OD3nE1YC8oFSNeaI
	mMErMSTKN8Uz+sS4PUxuhXmiLJodWFTOY/W8sWEL0vz/xCMB8TBoROb/7BBOuwwh4aCM9t
	HX7l3v364P77raopjNO96wl1nlSdh2FgAGGnv89pI+sysCfkMuZuwoqWJLjuUQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=mkl@pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Date: Sat, 21 Nov 2026 19:41:20 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: [BUG] topology.c fails to build with clang-24
Message-ID: <20261121-lively-delectable-duck-f7c503-mkl@pengutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sb23j6dmmvzwxdtl"
Content-Disposition: inline


--sb23j6dmmvzwxdtl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [BUG] topology.c fails to build with clang-24
MIME-Version: 1.0

Hello,

current Linus master commit c44104f3642d ("Merge tag
'drm-fixes-2026-11-21' of https://gitlab.freedesktop.org/drm/kernel")
fails to build with Debian's clang-24 from experimental:

| $ clang-24 --version
| Debian clang version 24.0.0 (++20261119065354+16721c9d8e82-1~exp1)
| Target: x86_64-pc-linux-gnu
| Thread model: posix
| InstalledDir: /usr/lib/llvm-24/bin

Standard x86-64 defconfig compilation, with LLVM=3D-24.

| In file included from kernel/sched/build_utility.c:86:
| kernel/sched/topology.c:2008:29: error: unsequenced accesses to volatile =
qualified 'jiffies' [-Werror,-Wunsequenced-volatile]
|  1998 |                 .last_balance           =3D jiffies,
|       |                                           ~~~~~~~
|  1999 |                 .balance_interval       =3D sd_weight,
|  2000 |
|  2001 |                 /* 50% success rate */
|  2002 |                 .newidle_call           =3D 512,
|  2003 |                 .newidle_success        =3D 256,
|  2004 |                 .newidle_ratio          =3D 512,
|  2005 |                 .newidle_stamp          =3D now,
|  2006 |
|  2007 |                 .max_newidle_lb_cost    =3D 0,
|  2008 |                 .last_decay_max_lb_cost =3D jiffies,
|       |                                           ^
| 1 error generated.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--sb23j6dmmvzwxdtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCawHlzQAKCRDMOmT6rpmt
0tFZAQCCzwKFfCy3tlCnFTWKGxOyJFwLKGglzKjrDT9qUs7LpQEA8mElbdsjWzWQ
udm1Hbox0zAGOZCiT09WWeP0PL770wo=
=wwMO
-----END PGP SIGNATURE-----

--sb23j6dmmvzwxdtl--
