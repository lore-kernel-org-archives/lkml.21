Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863532;
	b=DKFKaTr1618PSPdCffsFhkowSMrr8LXJXtOrH9wSBsUWCuMDHG8Q8paBHi0z35oTglOu
	 /kVaW2mIEtCSiRSa0IxnJDqyjV2fdIodLX1QH8jNwRxOwjgmlJ1m58U3yDjhmO2jBRuom
	 mYBW7pxjY9K46/yMEVIN/HpFEE7JHq3BrICmOpcSeqS3bOGlIEBssjHw3Lg9hw0uIGcmT
	 DAApfJ64N4Tgl6BnirVIRGVWbwGZlYmfJkiaf5RJ9OO/uL+nfQhzOXvCIk756p4R259xu
	 qUnLmnWu+urGp5dglRhza0gHeRIBYM2BSQIAsHQ/g6EHX2TYNFKF8PYHAn5cSIwsu8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863532;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=aIRN3rmQRN3cfjfhS5UIdpeEGTdjTTAzE2HQtnTjeps=;
	b=haNM69x+m7jpTaNr6DY1tWcBnKKe8yhB7dbiv3M1gND4h3yADJustqDNzad6YToxQq8R
	 Ej2UKlmRaeBBYgxtLtwlm5XKgbqtcyZ1brB1l337PGuKIh2LcjqQYHMcS7IMGhyKF6b+k
	 STXXpe40sEHEWRgQBQ/YYMzL83IQoUppoaQ27dSvSQs5DZit6f1HbV4uHk4TCFyY/zaN2
	 M/31j4Nr/adm9hyUVsHevv7rL8WIBfo9HPl74zTGLVllB4rGsimMVWYSsK7rMqkpEqNue
	 hKzDuloBBELs5KA14RGw7Y1+wJqOUPYmAwGQhFRdR+R5CviMO7iXlEsMvKqLstaYfqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJ3IrHBd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9EE606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJ3IrHBd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739F61F000C1;
	Sat, 28 Nov 2026 10:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795863532;
	bh=aIRN3rmQRN3cfjfhS5UIdpeEGTdjTTAzE2HQtnTjeps=;
	h=Date:From:To:Cc:Subject;
	b=TJ3IrHBdjATwLNLtKUJPEGSU9zSDIg5RnfBUUTd3aAbtchpm+Q40OJRBQmPIjldqs
	 qhrpw9If1jlSrlO+RFTPTSDz2GWhOgpaoh/42z6iFPcR1og3YRQR2Aj7I3BnkxUB+T
	 CjuEL31eHbAFgrRw7zgNxgxTN3hDKsKeseMm+dchpTrVFQjNy9byCvrF5BngA0ZOh4
	 Y+4pmkJWY/HIGmMJQRQEx5zFQa9o7Twl2f0anRxwUZvxlWhaTIGITStQiP337HJmoN
	 3B6T5WnfjgJ966Mp56CW+jihBRIDvOahezXoIFk2pK3sCqvaDRIPB93kuRQUh3bDXb
	 hbhGHrhtD0rZw==
Date: Sat, 28 Nov 2026 16:28:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Dmaengine fixes for v7.4
Message-ID: <awqz49YYREhvWn0p@parshuram>
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
	protocol="application/pgp-signature"; boundary="lCi38ALNEZSu0yCc"
Content-Disposition: inline


--lCi38ALNEZSu0yCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please consider pull to receive the fixes for dmaengine susbsytem.
Error handling, idxd minor number and abi version fixes feature in this.

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dm=
aengine-fix-7.4

for you to fetch changes up to d460a02aa0ac6ba9e5d87f8462f75d78be83146e:

  dmaengine: rcar-dmac: Remove redundant dev_err()/dev_err_probe() (2026-11=
-20 15:06:38 +0530)

----------------------------------------------------------------
dmaengine fixes for v7.4

Bunch of driver fixes for:
 - Bunch of error handling leak fixes in stm, rcar drivers
 - Minor number handling fix in idxd driver
 - ABI version fix in documentation for idxd

----------------------------------------------------------------
Karl Mehltretter (1):
      Documentation: ABI: sysfs-driver-dma-idxd: Fix the kernel version 6.2=
0.0

Koichiro Den (1):
      dmaengine: rcar-dmac: Add missing dma_descriptor_unmap()

Pan Chuang (1):
      dmaengine: rcar-dmac: Remove redundant dev_err()/dev_err_probe()

SeungUk Nam (1):
      dmaengine: idxd: Free the minor number when cdev setup fails

Xiangwu Lai (1):
      dmaengine: stm32-mdma: Fix runtime PM reference leak in pm_suspend

Zhang Shurong (1):
      dmaengine: rcar-dmac: Fix PM usage counter imbalance

 Documentation/ABI/stable/sysfs-driver-dma-idxd | 2 +-
 drivers/dma/idxd/cdev.c                        | 1 +
 drivers/dma/sh/rcar-dmac.c                     | 9 ++++-----
 drivers/dma/stm32/stm32-mdma.c                 | 1 +
 4 files changed, 7 insertions(+), 6 deletions(-)

--=20
~Vinod

--lCi38ALNEZSu0yCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmsKs+MACgkQfBQHDyUj
g0cNow/8D2UAaFLG0wGEURAhoY9Dv9N+qQfPk2m11urAKZNc1OvgHc8a4q7LSxGF
3D8kU/kpoAucwCrFYaATahwBVQUxPFFGAsu8vr3Br153ul+eOe4JOx9IVQpeXa9i
9bDgYMjEjqy2j13jgQxFM0gqkRI6s/U1smv5YAbkL3Hn1ylkv1HdTBjFz9M1P1PI
EiMrGf1BAnW9sOt2HBbU/D0gw0Y2O+nUSzG9Dyps9qqwiWggKdolILXNcEw58IBd
qpH81RSNp83Cnz+aJXuGpKV76ao9p/2glEsfxKVxZ4mpS1fbZ4Jbi9Mxz+xufKxj
rvYESU/XIEXnfWZvm5ThAWy2n78J73TTPcOossTKqC/sAnmmOTUzzr8kNJnM44Qn
2iQgjJ+kr+5XiC/3GzHsBM2nObEbO6vistOWKJHAvt3ph1iZeMqi+D5bh1Ir1jYH
gwKPZ+gLNep0RUvt0jDW4ZJ5aW6H5eofk6ugE5XKxW0R1Lsgqc0ry4SjmnK0ZvSu
QqpYtNUJ0GtcghHcNeRO/yxeMYu0yDyBG03DxAjgCJNRPnBOmal2WHjM42XKm93o
hci4noObWVT2dvvnjelR0CEDHjpcWhb6uHfhGXriMdLU5mvkPpJ0psxi6WI9iNbR
RTwbPe77VrMNB0/j0fmbQHxRQevPxSjH9DDmQZAww+zkT2iNrdY=
=pO7p
-----END PGP SIGNATURE-----

--lCi38ALNEZSu0yCc--
