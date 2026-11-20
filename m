Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162372;
	b=jvT7dd6Xp4SJdiiE5XX3DxdNjSgAJwW+2buUHdUlKfsxebnqqIaeLUIuI+hscTDp1NvM
	 rxkUZwVs/xEO2fSMgrlkLH+8YCWNNWl7/sD1Q/2QP9gPDSGRYy0epjWg5kP0405h+MMNh
	 RrJ1QtpwIOI/Q5F0d7JUyg2LJLWO41mkGJcpqPG4BUnUCNuHVpr8dA0ykqlE2uevRIo4l
	 J+kUlLwHO7g1JEhf0yOux0Lv3FnXnlsi96cQ4zpcNU369ceKxu1n5FgZq+krhfdAITxWL
	 CdiuVa6WSECg136wiXE4JXBz6oGdlyWxLDQxAcPiVHLMBKleqAZLRwh8Bj+Vfxbw61Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162372;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:
	 Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=7g7MZ9fUWqOrUAe8bi9LBUnozX0Zp8XzJ0El3O60aHc=;
	b=GpUgfP2hwwqE3aKlkKSn0n+cGZuSKJb3GypqmDmi24YTGwW70SNSCbnkiRp+gNBqgBWc
	 jPLEBOakSNK3ANT938hHTq7TksRI2HaxwadmTxeKR93FvnFp1AViVj2KiYBrCRer9YFE1
	 xoi4rU5dPaU6hR8E6bX3deE4CfoCmL6aluPhInqqre1Zk71USLNPbawjui7jk4Dh/Nx0y
	 Pq5uuPmuvn4eUTL+FwlCt85/p9IF8HDdbFTDbr84rdog9iTNcCxXwiygUbm3ILVYbnpNb
	 WXhoaahwQMHbIkhslxEPPYNrSQiupajoN8WLUiF60LEPOR8HXWmZSH1FHpZA3FrLBjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wo7DzeTQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 8359C60A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wo7DzeTQ
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AB0B81F000C4;
	Fri, 20 Nov 2026 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162372;
	bh=7g7MZ9fUWqOrUAe8bi9LBUnozX0Zp8XzJ0El3O60aHc=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=Wo7DzeTQdrC7jOg9xJDJc5M5lNViAt87D+bA2JUQcxvW8+Tu3P7l0mXskDOjfq7Fg
	 cflVVfv+oXaH0tVYXMJP8SMVPwLf4ycKUHbJggKe9hf73czav2j1PSBU7n65yq7xO2
	 Lci6vsjCp+BWZxdTq+ZA8fND3vhs9V1aohjXITAFh/0GZwFAYmx0iZBq6JN0SYwsZS
	 E1+YpktAVbuJ8ZVx6EmVEnn5YrTEp6k8+Ob3Vj0cIVbzl8/lNzuY2aVu5Rl5OwiRU5
	 dJ1iTsGntW+1NuVpSaABpo2UUofuzifpWU/fyr2f0bV2XB5b6fJ8AvcYiM5+6di7XS
	 BEtwQHI6N8nwQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7f00468c0cc5da30f873745f70a967b80a05dcc6b5d5d22947fb6fbcabd1;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 20 Nov 2026 09:12:41 +0100
Message-Id: <DMZVY45HFRM3.2GTCZ9BV3YJL8@kernel.org>
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: fix use-after-free on unbind with
 open handles
From: "Michael Walle" <mwalle@kernel.org>
To: "NG, TZE YEE" <tze.yee.ng@altera.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20261022035352.52129-1-tze.yee.ng@altera.com>
 <SJ0PR03MB5950FE5D82CA5E77AAE0AC9CA17A2@SJ0PR03MB5950.namprd03.prod.outlook.com> <DMY8H2AUQ3LV.VQ3MVOE3YV41@kernel.org> <381b16ea-cc02-4504-bbe0-83762886b46b@altera.com>
In-Reply-To: <381b16ea-cc02-4504-bbe0-83762886b46b@altera.com>

--7f00468c0cc5da30f873745f70a967b80a05dcc6b5d5d22947fb6fbcabd1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Nov 20, 2026 at 3:21 AM CET, TZE YEE NG wrote:
> I would prefer to keep this series as a spi-nor-only fix, since it=20
> solves the problem for spi-nor today. James Hilliard's raw NAND series=20
> [1] adds a generic opt-in lifetime to the core (mtd_set_release()). I=20
> would be happy to look at moving spi-nor onto it if it lands, but maybe=
=20
> in another series. Are you okay with keeping this series as is?

No, not really. Sorry. Esp. given how cluttered it is and just
solves the problem for one user of the MTD subsystem.

-michael

--7f00468c0cc5da30f873745f70a967b80a05dcc6b5d5d22947fb6fbcabd1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawAA+hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gkIAF/fh5e2uIwEPRaHgWLwwjxJkSCZdD6mRJP
UdMlUv6168kien+EQKt6rwlXBkooVPDUAYDpDLhw/SfXapyqcMK3gqohUnjMnjhx
1GIFNuA3LBmUyfsLENlX0keNJXiXjrKTC3w=
=Ba9O
-----END PGP SIGNATURE-----

--7f00468c0cc5da30f873745f70a967b80a05dcc6b5d5d22947fb6fbcabd1--
