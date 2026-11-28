Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863202;
	b=e7T3+thqhmJzc96u1rSyutR36wdsjTPPQJeO1eK+H75Ek36Ozv9zfWpOdpq//BZ/Flss
	 uSd4HFqOBvJSIpAKKVX+WBvIH8xBjK2Zg9c5ejWzWehJ6mR7UzHu6XPBH3FL1wsQcnVVt
	 HuE8D2a0dTiyrgyA4+EayEU2vokUTX7F0nzXk6iprGf7zNCdugvIwF/H+NGi/5ZtVo0XQ
	 f8efxJVYnfWN7CCR3yG+IfZpmz73n4IwTlT69jCXzW7gf7/deTxv+bMuABgvvqmIbrRfE
	 YiFJG1JnA8EXsrA8cfEGCly0PePZ3gPTTk2HzQ5gzbi9hGs3IvexsIW3ZHlDNOT4SxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863202;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=I+W5pq2zEyPF+Kki2L6wnw7jury0+PummLni9fMdtPw=;
	b=dCzXX9vzbgPCAooEgmK0cJzYTamCeU20xZz7vbbdNovwNlC5SqjN6zPclCGXIFdZOl9p
	 WAQW4Xew+XYoETf2+Ygk+n+kBT9D3F2tjJEv01QsgB1gN/2iXKZkNK+Cu9aJfxt4xt6GF
	 SuWI5g8LOjTcUyVptDMXI04eeuJ8/VVql8wfdhbYhmDX1cfVOJOQwyX1yNYV1r8P8oa3J
	 q7j8NppJKQFMLCFYHa0OCadPdeaW5ed9BBGSuDF8lZ4wupRpq9wGRwBYP+oW70deLsIvb
	 T2kwtUyTk95sqjhgVOmx0uDKSiwmMyNdRp8lAmXncFFUEwhgztizg3NcEayALTsTP/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z714TFqB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9B4606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z714TFqB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6281F00893;
	Sat, 28 Nov 2026 10:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795863201;
	bh=I+W5pq2zEyPF+Kki2L6wnw7jury0+PummLni9fMdtPw=;
	h=Date:From:To:Cc:Subject;
	b=Z714TFqBLKHhIEooTiFGHmpFiU1lkgdiDiSGQRosPGevrWw8Idf4aPbroYfunSKSl
	 V2a+bgC2OW9Fna6I9bK/TI/9rDgP2+Tr+T4UP6dnTFR7gvBVSRKGDOiueKetSdons5
	 Sm4014qx80is7shA0MSMWFddLjfYuswrHXE0bJQqZrduNo1OJ+JFc2dIZuBOLMENNK
	 ir6Brq9hyoGgplBX+jg9y6PeQBwexGm26uRPMcaD3WzUmDQ/sE+4IeclmzvAB1cpof
	 RItEKd17qg5zxNOT+AJIdWK0IJBeOAe3VilkCwUt8B159MjgR1K3vXLN84DybChfH9
	 dYKqD0fIbJirg==
Date: Sat, 28 Nov 2026 16:23:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Soundwire fixes for v7.4
Message-ID: <awqymSy1eNN5UMNH@parshuram>
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
	protocol="application/pgp-signature"; boundary="pcbj2yN2i5fPwZDG"
Content-Disposition: inline


--pcbj2yN2i5fPwZDG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Linus,

Please pull to receive single soundwire subsystem fix for 7.4.

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-7.4-fixes

for you to fetch changes up to 6c067677192f054bbfa815caf04f536bb8dcdee2:

  soundwire: qcom: disable the interrupt before gating the clock (2026-11-0=
2 12:37:12 +0530)

----------------------------------------------------------------
soundwire fixes for 7.4

 - single qualcomm driver fix for disable the interrupt before clock
   gating

----------------------------------------------------------------
Oleg Keri (1):
      soundwire: qcom: disable the interrupt before gating the clock

 drivers/soundwire/qcom.c | 2 ++
 1 file changed, 2 insertions(+)
--=20
~Vinod

--pcbj2yN2i5fPwZDG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmsKspkACgkQfBQHDyUj
g0erQw//b0PaJHIzq/ea/+Vr/VmtIwBgLkX9gR8IDjpwKm1vxPH9D+2t/SfMLcA3
VkSuGRusJOebGTKk80DV708DXKLu+PL1vsJMMgtU125iil/Ya0ETJOnU9TliE++r
xs2ihoMoASfpbN3pCkHSK9l3ec2tiyfMOI4RC/BA0qBTl7nS6cBGIwjYPbh9TWvz
DalmKoJe+al3TWechYhhD63dFCsF6ouvPXjIWr7YpLDMvBxTz+OPXj4LGrC8ak14
BS/sCm5cMVetZT87DpU7Luqx0cXvgXgeZFEdM6w/0eICQncOJDUOSiGKmnsAegqL
4zmFsqS+Xcqoi3dXgKPao6sRb7PXziRYwQeRfsxqbAId1IBs+xGM4DhxWZKjkwtc
eSIgjOpxL102aQIxY4koxA5H0grmav1sue6DDq+r9CUjRGNUFCPpoEMcfF4o5eni
3LRyqB7XopZMpBFUrXE4PgYLk+va7Jg1yC+DxW2kCz9qgMsHpln/l03TRmJSalzA
dzNSGwOLXm9toBsvR2Wm/jvOvrX6ihKbKMAxJllx4mRYTIdIdyIdwB5qO+WYoRu6
C+ZWhjxuFSOdM+Jd7G2FAO+K8zkOpo0gbkAgYno61crxyHls2m95SIBVLEWTLgJy
r6DRFqu1FIhwCRmgNJk3a0RVLzO2wEM6TyhlYvoCH+NsyzYlMgQ=
=1bOW
-----END PGP SIGNATURE-----

--pcbj2yN2i5fPwZDG--
