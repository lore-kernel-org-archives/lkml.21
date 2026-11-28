Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863314;
	b=oynLJTwq4DaMBH9x1Wv1RO3yUNfmOrjh8uuqa82l/mKp2xoHNw6W25D5V8VRgtN0Ir/3
	 GSe0HTeIjG/S3nkG7YCgEjm8bWhQkvWpKHO6jdbQtqxZYXo8nS+llWjDJrMI2B3pp29RJ
	 LA3lEpCWRrjxXXhQc9EdQrGK+Q/r3eh5BRvvTAxSWKk1QU+zoh+vyvU78TFQDm96quKGE
	 IG45TxhuU2RWJRxT3xATTan7zo/nKq71o9zJxunooIzuU12Al4VvM0toW2QAu7zj+taUS
	 mOE2PxJRV56PQlwCavpMSQX3zjczIixIH6gezS3dXe+g9nwg52AcjlC0/aelmFM0jzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863314;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=xZC23EwdmFto70ebHtdkEH5phOBUP13a/R5oQY9xBM0=;
	b=171fAqQm+5ALMF+a8oz072rrV/RoU1LUya3mHhnNihhQq9PPe7/IVuzPpBVMelHjOyD2
	 aRajTVk9QDv6PDQYLsBQidRyYUDHbsPgKPOBCF6ZgRUR+S9ibptf0tEWjSYg4M3q9FkCl
	 67x0ZdaREq/3GBSh/2eQFtl0cz1mTnBks51Ad6V0FvlNP5tawVKyP7hcZ9wzDBubKfdkd
	 Pw+D6x7TPsWLQRjYi3dxmhC1NeZ32J7fN6oiwc7BPS24WwYcmlITFyqyKLVr60a//qWAB
	 Oo80IRpxh2htg+Sgpur5DNCfTCFfP+wuUDibJ1dX4F/eGhUAyLukHiiD6Zpoyv9uo1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgcJw5Xb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45659606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgcJw5Xb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCCC1F000C1;
	Sat, 28 Nov 2026 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795863313;
	bh=xZC23EwdmFto70ebHtdkEH5phOBUP13a/R5oQY9xBM0=;
	h=Date:From:To:Cc:Subject;
	b=TgcJw5XbFG32pID0CXFz7nYasKxmQ1QQMYiEIf0fwi3ydYFX9a1wBRS+RPim0ENXn
	 tBHazVAdn7PaP0hyAPe3El99IgwpavC2a3y4wdDsFWDO8c0duHpZ4wykf6WDgVBezg
	 lImywpYupH2OsujHqdj+yJrR4Ly3lVStOzl3otfNYdTV87csTs2l7kSx4iJu98qDZr
	 YV1yvfXVbZ5ZKHUl2kyQlSwjieAmNJM9OsdL8erZmt4bsO85nTNcUkeS7O8tbcqHNF
	 pXi1sPSYYCEZFSh2F9gnN3CE8JHw3SoIU34ArrrSHT3tJ7CyioT4WoT4x9TSCST9ua
	 Gkyo5LiKhwP8A==
Date: Sat, 28 Nov 2026 16:25:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Generic phy fixes for 7.4
Message-ID: <awqzCpEEkssITBRQ@parshuram>
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
	protocol="application/pgp-signature"; boundary="YcCimMCa4HLTQpgF"
Content-Disposition: inline


--YcCimMCa4HLTQpgF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull to receive the fixes collected for phy subsystem. Bunch of
error handling/fixes patches and couple of reverts feature in this one.

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-=
fixes-7.4

for you to fetch changes up to e7d2f93a4426ea6b33dbca1ce585a9876e3a7344:

  phy: rockchip: inno-hdmi: Fix potential stale clock provider (2026-11-23 =
20:24:53 +0530)

----------------------------------------------------------------
phy fixes for 7.4

Couple of driver fixes
 - bunch of error handling fixes for ingenic, ti, rockchip etc drivers
 - Revert of skipping phy reset in Qualcomm pcie driver and revert of
   freescale hdmi default rate due to reported regressions

----------------------------------------------------------------
Felix Gu (1):
      phy: ingenic: fix unbalanced regulator disable in exit

Francesco Dolcini (1):
      phy: Revert "phy: freescale: fsl-samsung-hdmi: initialize default rat=
e"

Geert Uytterhoeven (1):
      phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE

Guangshuo Li (1):
      phy: rockchip: inno-hdmi: Fix potential stale clock provider

Hongling Zeng (4):
      phy: ti-pipe3: Fix ignored clock enable return value in init
      phy: ti: pipe3: Fix clock resource leak on probe errors
      phy: ti-pipe3: Fix EPROBE_DEFER handling for clock resources
      phy: ti-pipe3: Fix clock leaks in init/exit error paths

Hyunjung Ko (1):
      phy: phy-bcm-ns2-usbdrd: cancel extcon work on unbind to avoid use-af=
ter-free

Michael Burch (1):
      Revert "phy: qcom: qmp-pcie: Skip PHY reset if already up"

Oliver F. Brown (1):
      phy: freescale: phy-fsl-imx8-mipi-dphy: Fix hs_zero underflow

Selvarasu Ganesan (1):
      phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent OOB access

Shawn Lin (2):
      phy: rockchip: naneng-combphy: Fix overwritten PLL SSC control bit
      phy: rockchip: snps-pcie3: Raise the SRAM init timeout

=C5=A0t=C4=9Bp=C3=A1n Daleck=C3=BD (1):
      phy: marvell: a3700-comphy: Guard missing polarity argument

 drivers/phy/Kconfig                                |  1 +
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c          |  5 +-
 drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c     |  5 +-
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c       | 59 ++++++------------=
--
 drivers/phy/ingenic/phy-ingenic-usb.c              |  1 -
 drivers/phy/marvell/phy-mvebu-a3700-comphy.c       |  4 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 31 ++++-------
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      |  8 +--
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c |  3 +-
 drivers/phy/rockchip/phy-rockchip-snps-pcie3.c     |  9 ++--
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 17 +++++-
 drivers/phy/ti/phy-ti-pipe3.c                      | 63 ++++++++++++++++--=
----
 12 files changed, 105 insertions(+), 101 deletions(-)

--=20
~Vinod

--YcCimMCa4HLTQpgF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmsKswoACgkQfBQHDyUj
g0dqOg/9FdfS7K5mhu2VIfHkG1BRNVSvivrxrQf8DY+TedhgBeTE1j0nTmudhFJk
SY7TuQ8gpicyYie8YrHtfe42cQKYBLMHlEEK7tya7ILlrf6gsZeUMoc+Ai4AqB0K
zePuGHBmcelt/Op3uBiajlb41dnW9HyGbAq4SiEcyiJ4T50Rz7PJ4YbHYhbeA0jw
fG3yTxBJjvm+Gfct1bYPvkzAQxSYbeySIN3CuogdP5OfWL0ljR9sGN0LqkYV+lxx
3s8pqJXXOn8pXOqN4jIqQe8sd+/sbzqjlvQIGdKMBTVd3DM6UqPBm/TWOKMtzOCS
IluCxkWjc7QDsU7orguqW5HyQPGxn+jPSM0aOLb4ZX/p0RIHSRzgpB0a4OK4wtpL
0B76tcnDlNfArws9Cofbgq8i7+ryGQBrvheMZ619orOfFhu9+Ad8YAgmCH/AqYFQ
CRFbplBbXuZ8QhKPQVGyxR1UyZoy5VVBSMxrmBGK1QrEYU+PxGhxn6Rni3HfuDsv
4N40cNcKzkY29nM4oNnNMRKPMe8wrqv4jxHLyEt4mbN50+UIChvMrlhVSiAzc3sY
N9+kzL0YE6odWHksvG6ljchG+DA8hGXTWL5U8Jqd0dUrtBbk8kgzjzs2L2nw7bwc
d4mc3sNgkjpRD5AJy3uwVXJ4kStne2C9gXVE3RkDD65Nb8Xr8nM=
=4GTw
-----END PGP SIGNATURE-----

--YcCimMCa4HLTQpgF--
