Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701137;
	b=TAmD9XSrUfUGHLoa9j3XXyu9hIjb0asT/H2b8dDrfS9O1AA86clUTFr6MaM/aws9lEwi
	 1iI28dN6GY4N0BJGilpvw0BWmj75iwIg24jWI5boBgqd0/b6hd6K9sbQv1ShYXThEOK+E
	 8nCEnP59nGTON50Icxe0zBMCAofTO5WIjFZYMOLl0PeChgsG6BsJfwpa6jGzZ3N3JvH4H
	 72ftgz12erArXcOqZArv2jt37qLHSMrvktnhuvtEeBcuYXbZS0feMLmswzkhpNJVaQJMm
	 yHYCoPtCEil/qA8pUT5aMlaSlxYzONID177F6zURaALbOcNURfEjKudDpDTpTDUMgnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701137;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=qmxdQdsYvQsbP6RvRUa+YT9fFm8Eok7knWdEbEHTcbI=;
	b=yirq9ymLMqJ6tUmRhfJ4XVZyo6L5bcOUZf9RHU5bIyN1JE1VFS9XmI+jlvQGK+1dKyHS
	 +xg+gGq2b6heOHcdumokY3/E711nkkTuWbYHehSb10ZVPfhhS4bGuSpY10uPafXH3XTLx
	 Me+foZoYfh7BYacTqavY6RaMDVj/k14RILB8yk+r1qc2mCQRvLr8Uf3SYKayYkbNilogE
	 nu5fkqCUtz3f3C1xBS2dNIzMckRkpe3nKFw+Z/C/KCIP9XhthSM66FOcJEYHe4Tzu3ypS
	 i2D6py44FeKblLHXrzOItXDDSGcyrsbizbjRqaJxrq9yyRJwGxjsvUOpQdZK4qdwG1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=g8AKhFjV;
	arc=none smtp.remote-ip=79.135.106.101
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8611606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8611606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=g8AKhFjV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795701134; x=1795960334;
	bh=qmxdQdsYvQsbP6RvRUa+YT9fFm8Eok7knWdEbEHTcbI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=g8AKhFjVLx5n0flhoNPdBQjEI/6SYzS1dRgak75zH6x8o0E25JXSR2rroR0VKk4l3
	 jpciua5jiCcM1aV9WgkuNhy16l9/NP+6cod+9oVPwEI/BfYySX13B0ZYrOyMndVzfd
	 3Wr0rAWgb/Aq36wUyH94nsMmP+uYV/Ii+hFMl4hfKxdHRcTQ3SUHlfzUihrwbdvhbI
	 8pzE05OlEN6qiagfeI7zPL5azBtLK0Vset80C/37J0HIpacCEDwpU7frUkM4ZNnZ3d
	 aWeR/V1utsiAylTpGjhcIkFdj9Va1selggcP0+CcZddlnXpOf+BYs0tZeiphr0WADn
	 yaWAAcX1GlhcA==
Date: Thu, 26 Nov 2026 13:52:06 +0000
To: Laurence Oberman <loberman@redhat.com>
From: 70sp <70sp@protonmail.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>, Thorsten Leemhuis <regressions@leemhuis.info>, Tobias Laas <tobias.laas@posteo.de>, Damien Le Moal <dlemoal@kernel.org>, Jens Axboe <axboe@kernel.dk>, regressions@lists.linux.dev, linux-block@vger.kernel.org, linux-ide@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Will Deacon <will@kernel.org>, Niklas Cassel <cassel@kernel.org>
Subject: Re: [REGRESSION] DMAR fault by Intel H97 SATA controller since "block: Increase BLK_DEF_MAX_SECTORS_CAP" (6.17-rc1)
Message-ID: <e_efhbm0Vxq0FxO3-QqPkyhGrjzTvBDYmUOsGgmebVSyd0qsXXxYFXwC9sSjRAP06gcpsttHunBLtc0Mmt0cIjEI_0sDXL61lnxHhmuaxWs=@protonmail.com>
In-Reply-To: <f323c3d62265dfe90fa71514028af4d35f6e2420.camel@redhat.com>
References: <5ad27a97aafbc08a8702d5b90d09cd59@posteo.de> <awSs5Cw3hFkf4O4T@ryzen> <ec36d13e-e4c2-4bfb-8b50-69d4a1628839@leemhuis.info> <87b1bbd8-8113-4890-8623-738b19a9cc7b@leemhuis.info> <a0ff3156-add0-4f7d-8373-09f95bd7036b@acm.org> <2adaf0ef9e1a2fa18590f7d8dbf203c0f7de2be7.camel@redhat.com> <uJluFNYGCCrdvnYT3MatN_4Om8UczTJX_dzxumJxyCAC7F-Ubrekb7LPwlRxhCW0J91UBf-TqeRoJQfgYIYBRvMsPmE-Qs1eAg5zbDP0s58=@protonmail.com> <0edb9525-5068-42e6-b6c3-a1dcebcbcea7@acm.org> <f323c3d62265dfe90fa71514028af4d35f6e2420.camel@redhat.com>
Feedback-ID: 144929603:user:proton
X-Pm-Message-ID: cb7dcd4e8530543ae7f0724237de0a0105a4e0b5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> @Simon,
> To be clear, What I tested was the patch Bart suggested. Not your
> original suggestion. We will still need a test from Tobias to make
> sure.
>=20
> Thanks
> Laurence

I know. Mine and Barts patches work on the same basis. I just said my opini=
on in general about this solution. I know we need a test from Tobias to con=
firm whether it's exactly this and not something else related to superpages=
. I just wanted to make sure everyone knows that it was just a patch made t=
o confirm the exact issue, not the one that should be in mainline.

Thank you.

=C5=A0imon Posp=C3=ADchal
