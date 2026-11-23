Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451831;
	b=s0bvvZ1xDfRjcnbwOghQkbPWE2Ip+4NKeM3QFyes8hJSdtmCc6kxdnFFc4lhKlvB8Tql
	 kPRm7QFSFButpGVpnDV1alVcsyevFBeVAHuQZrNLq9FwDxuJYUtrneuC8jIpwbqfMQ9Ud
	 fZFFZKi2VEN0vBvk4TvcHpRdx17ZBj/o5da3uzQPVbJlPGE5pDVhnoyjeRLeNzY9jdUDs
	 7jxU1Gu9afjdpPFB5SPN0TwFDGDKBQ0gJNzQ6EWNaSDO3FJH8ufjb4W9/HylYHZmSKASK
	 pmcv2sfObO3hePFeg7A/RMya6Kxyfyszw3+DymywN0mtar0j9UDTQ11jwVy7QNPhGoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451831;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=15VJKiwk2jeEgdaWn6BsC4rhPTrCLdQwZkJQeS6QumA=;
	b=PtYP5r8VFwdfR5PD/lkkxgKg2zMgs3i+8/6Ec+oh5ff3s6pFKdk8OYySX4b9AfBXzVZg
	 61lfyRgiSl1EZHhQ1UqG1pTlEE3II4bI+OzOg7C5d6Y1jWRGFFtPsbBNCVGVH6SpLY4/j
	 fLCeZsZDhTY93p717I1OJOGjl2gVqdW9ZIDjo7lARuQD9vkOZHwH2FKd+9rVv3CC+bHTp
	 /YpUxdS6CTB1GVaArdY7CJt8OOswq5NpkFs1tXWISHQLGzA3Ww2/8T/MmBhICCNwb0pcb
	 wF6uevYmpcVH4ihEZUOElIAQ2S6jnGxnOQN00RjDLWXBVnEiLJ+Jax7RuBqfIn7cGgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=none smtp.mailfrom=master.debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.master header.b=mti1M8cY;
	arc=none smtp.remote-ip=82.195.75.110
Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC523606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC523606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.master header.b=mti1M8cY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description;
	bh=15VJKiwk2jeEgdaWn6BsC4rhPTrCLdQwZkJQeS6QumA=; b=mti1M8cYqzayYd2nLTzipH9r0v
	u/BJwlpjCZ3RrxMRJWyj7y/a2uy1hdxSn2Bi0B5G5znuFPYRuafKZT+43Ix3St8cUFGM6iYBTTWpH
	YBZz++fPOd056/F5JxgHOf3WgjPwan7v/7g8YrDpjg2iN/lLVwcArNT6k55p4bewoouQKW8JWK1oH
	ORQtdzh/lc/wypvuVJUyFF5ljV5LWiCdESkLt3p/xpvmLKzk29Ir3tjnWVQciIjBwH8Vrd8yzWJF6
	d0omWcg6fNAh/8iT8ONzPWesRJCqIhtjTUqaRTfGkAwto0dpOr9meQ8Dw5lqxISK22XIaYpXCiNJ5
	klO07oJw==;
Received: from ukleinek by master.debian.org with local (Exim 4.96)
	(envelope-from <ukleinek@master.debian.org>)
	id 1xVX1n-009iOp-18;
	Mon, 23 Nov 2026 16:36:27 +0000
Date: Mon, 23 Nov 2026 17:36:26 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Li Chen <me@linux.beauty>, Dave Airlie <airlied@redhat.com>
Cc: Marek Vasut <marex@nabladev.com>, dri-devel@lists.freedesktop.org, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Ole Carlsen <ole.carlsen@tutamail.com>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 1146033@bugs.debian.org
Subject: Re: [PATCH] Revert "nouveau: pci: quiesce GPU on shutdown"
Message-ID: <awRoqijawLNEkKEE@monoceros>
References: <20261025213027.842978-1-marex@nabladev.com>
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
	protocol="application/pgp-signature"; boundary="y7gnwzapgxhtolu3"
Content-Disposition: inline
In-Reply-To: <20261025213027.842978-1-marex@nabladev.com>


--y7gnwzapgxhtolu3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "nouveau: pci: quiesce GPU on shutdown"
MIME-Version: 1.0

Control: forwarded 1146033 https://lore.kernel.org/20261025213027.842978-1-=
marex@nabladev.com

#regzbot ^introduced: 310326bb7df4bba094a3fc60364c641c547fd923

Hello,

On Sun, Oct 25, 2026 at 10:30:06PM +0100, Marek Vasut wrote:
> This reverts commit 310326bb7df4bba094a3fc60364c641c547fd923.
>=20
> This breaks shutdown on ThinkPad W510, without the offending commit
> the system normally powers off, with the offending commit the system
> ends up spinning indefinitely and the CPU fan goes full throttle on
> shutdown.
>=20
> The behavior was already reported in debian bugtracker multiple times
> for various other computers too, and git bisect lands as this commit.
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1141969
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1146033
>=20
> I tested the revert with Linux 7.2.12 from debian unstable, not next
> or drm trees, mainly because it was easier with debian test-patches
> script on that machine.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Quoting the documentation:

Try to fix regressions quickly once the culprit has been identified;
fixes for most regressions should be merged within two weeks.

In the meantime this report is more than 4 weeks old with no signal that
someone looks into it. :-\

Can someone with the problem test the following patch please?:

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouvea=
u/nouveau_drm.c
index 30311688618c..fd3518d4407e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1111,19 +1111,6 @@ nouveau_drm_shutdown(struct pci_dev *pdev)
 	ret =3D nouveau_do_suspend(drm, false);
 	if (ret)
 		NV_ERROR(drm, "shutdown suspend failed with: %d\n", ret);
-
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, PCI_D3hot);
-	/*
-	 *  This is just to give the pci power transition time to settle
-	 *  before an immediate kexec jump. it=E2=80=99s mirroring the existing
-	 *  nouveau_pmops_suspend() behavior, which already does
-	 *  udelay(200) right after pci_set_power_state(..., pci_d3hot). In
-	 *  ->shutdown() we=E2=80=99re allowed to sleep, so I used usleep_range()
-	 *  instead of a busy-wait udelay().
-	 */
-	usleep_range(200, 400);
 }
=20
 static int

Bonus points to bisect further in that function (that is, readd lines if
the above patch fixes the issue or remove further lines from the end if
it doesn't).

Best regards
Uwe

--y7gnwzapgxhtolu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEa4cACgkQj4D7WH0S
/k6trggAjnMHkPrw6gikL+ajKxikytRp0RXIk3zAeYPXrTBcoAtW6gN+DcylS2Em
ZWH9/jLuNQcumkx8iTT1h7X9uibAOWmx0HjUmo1RZWPM6oxfS/L4jyABzWzvL2TT
dGV/uHk5NYjwkEFXA1XGsQSQqwi97thm8V6QPhWmBzdCDJnhhMSEi11mlqQgaduU
XsOUTgaflgq+Jce72o1t1HPA8sjiN7VNntiCYqVZAJE9pW0N6a37jxtc2jUpfy5T
MtZxtCrL/6X6fDosClmW+Xw0olY3xed/FfTiR6Mxh/v74VMmSnYqEyiiYvp3kywx
f+SPUJeIBdp5tcdoXlu1lMkKiwE3fQ==
=7OZK
-----END PGP SIGNATURE-----

--y7gnwzapgxhtolu3--
