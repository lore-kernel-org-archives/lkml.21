Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436097;
	b=W2WgnIKJpizRKFg5IO9aYgnlqT4kco+ocg94TrjQD/xel/8eDd7D5bze1nVyoEyzD53F
	 wYOQkyBRxF/5m3ICgR5yrxcU0v3wCh9sc83iqlbRxJD2wNrD2SxgzOGLcrU+CfOpMPCG7
	 72jcGxRvWrThq/E6N9Wzznrg81EXqmqAACzGBp8YEuarBvMot86LRvpeBFeujG1iwqQ2f
	 PgEJLWjsM8ILjLuKotBvY35QVxsT5lDrY8aigvVEY1s4ZK/b4l6dOi6kbSb3oU6jZIS/j
	 i0EtUHt1/pOfg6Z7XEWpvWSHAvbPzcqg05B1uCThtxMt88rbodK/Zidg829DV9KBSyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436097;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FHfB4b13tpFBuJgHG6kRNMJBbppuWmH69oa3I3gZvZI=;
	b=SbIkdS6UO7Zm9z6kCCiGdugScqCa3bK6VjEDujoD7s1CDagnR3KMZSUVDukipUmRUueY
	 x6aN8BxjkG+NTwi8efHBuefLmCFWVrzW824soDvLcQdJvxWwslsvIdZQcFTKlgmOq0ZFb
	 vOuxftmYI0c41tAJ8JfwN7DgEaQ6ykkdOn8PLGBpPQpivdY0/W0/B0wxBWnQHynMP8y/m
	 2QgdC2D+s6asvAFq/QKFojg7fXrOMeN5SlJYOPuKh20x7SBaqYeEr2eGnt5yuHXvhY6EZ
	 ZJ+VgXAoR9oh1gkI4258c6AFr12aYAuyM26dX546OLvltyT7K2bEkqXm+wSbSKRLzRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmu2Hitq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878F8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmu2Hitq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAD11F000C6;
	Mon, 23 Nov 2026 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436096;
	bh=FHfB4b13tpFBuJgHG6kRNMJBbppuWmH69oa3I3gZvZI=;
	h=From:Subject:Date:To:Cc;
	b=nmu2Hitq8MzSF4qnVcpiEsUZgT6jHr27QaUBje66Y2YZDQeayrRw88nOG3EMv9uig
	 +NThDHtPXuVG85f6qysIQYlO18J1FfHnXGJZudMxDwHvhhmkUFpHztugSLoyGDH2jH
	 BzZ5AD67rbSSGjhbKDfDVlCbwCCmUNopWWmKOnsqMBgK4udxGfeWLBVurYL1v0xQ4r
	 EN7IqDCEqFQw7AhiXccqDhBqNIgk0XhIlWWw11YOMMIyyJ6MZU2+tE6JyBdl1KYowo
	 FdHwTYXR1YjAJdO+DpbbuTnEbS8Yfs0c/wc1WPof6xLL2cDrV3Dy4NmLmYKB2a/3PX
	 +fPpf7u9cqMOA==
From: Hannes Reinecke <hare@kernel.org>
Subject: [PATCH v5 0/9] nvme-auth: switch to use the kernel keyring
Date: Mon, 23 Nov 2026 13:14:45 +0100
Message-Id: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADUuBGsC/32NQQqDMBBFryKzbkoSjDVd9R7FhU1GM1gSmRSpi
 Hdv9ABdvgf//Q0yMmGGe7UB40KZUixgLhW40McRBfnCoKVulNJS+FD8LCZcmeIollpIO8hX75R
 vnYGymxkH+p7NZ1c4UP4kXs+LpT7sv9oRFGZo3c1bqxvEx4Qc8X1NPEK37/sPEHPzWbMAAAA=
X-Change-ID: 20261120-dhchap-keyring-v4-09f0bac1d8c5
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795436094; l=3378;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=IFrc+m9kk11Z/sGNV+kj67e/sA2wXW5SbtFXLe93GEA=;
 b=+M9cVibTzVUkMZBusg/TzgpMp0/oARwrFiklMHwEQW9d0HO7hcgCHA1I3nS+0K9E1r5GCh8JO
 y4yL1qSXoHKDsmkyGQyw/OXmN1vgMvu7B0990nhyy2ZQRtyOlUM8nOK
X-Developer-Key: i=hare@kernel.org; a=ed25519;
 pk=iekPF4ZZFva3sutm7d1ryPNR1G/WFfUgHaDB423JXho=

Hey all,

the current NVMe authentication code is using a hand-crafted key
structure; idea was to have the initial implementation with a minimal
set of dependencies.
(And me not having a good grasp on how to use the kernel keyring :-)
That had the drawback that keys always had to be specified on the
nvme-cli commandline, which is far from ideal from a security standpoint.

So this patchset switches the authentication code over to use the
kernel keyring. User-facing interface (namely argument to 'nvme
connect') remain the same, but the key data is converted into keys
which are stored as a new key type 'dhchap' with a random UUID as
description in the kernel keyring.

With this I have updated the dhchap arguments to 'nvme connect' and
the configfs interface to either be the keydata (ie the original
interface) _or_ a key description referring to a pre-populated dhchap
key in the kernel keyring. This allows for easier provisioning of keys
and avoids the security risk from having to specify the key data on
the kernel commandline.

The entire patchset can be found at
git://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git
branch dhchap-keyring.v4

As usual, comments and reviews are welcome.

Changes to v3:
- Update to 7.4
- Add patch to set keyring for nvmet

Changes to v2:
- Update to v7.1
- Include reviews fromn Sagi
- Clarify decoded PSK length
- Add more function descriptions

Changes to the original submission:
- Dropped patches merged with upstream
- Modified the interface to refer to keys via the description
  and not the serial number

Signed-off-by: Hannes Reinecke <hare@kernel.org>
---
Changes in v5:
- Fixup issues found by sashiko
- Link to v4: https://lore.kernel.org/r/20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org

---
Hannes Reinecke (9):
      nvme-auth: modify nvme_auth_transform_key() to return status
      nvme-keyring: add 'dhchap' key type
      nvme-auth: switch to use 'struct key'
      nvme: parse dhchap keys during option parsing
      nvmet-auth: parse dhchap key from configfs attribute
      nvme: allow to pass in key description as dhchap secret
      nvme-auth: wait for authentication to finish when changing keys
      nvme-fabrics: allow to pass in keyring by name
      nvmet: add configfs attribute 'dhchap_keyring'

 drivers/nvme/common/Kconfig    |   1 +
 drivers/nvme/common/auth.c     | 214 ++++++++++++--------------
 drivers/nvme/common/keyring.c  | 333 +++++++++++++++++++++++++++++++++++++++++
 drivers/nvme/host/Kconfig      |   1 -
 drivers/nvme/host/auth.c       | 179 +++++++++++++++-------
 drivers/nvme/host/fabrics.c    | 143 +++++++++++++-----
 drivers/nvme/host/fabrics.h    |  12 +-
 drivers/nvme/host/nvme.h       |   6 +-
 drivers/nvme/host/sysfs.c      | 236 ++++++++++++++++++++++-------
 drivers/nvme/target/Kconfig    |   1 -
 drivers/nvme/target/auth.c     | 231 ++++++++++++++++++----------
 drivers/nvme/target/configfs.c | 146 ++++++++++++++++--
 drivers/nvme/target/nvmet.h    |  16 +-
 include/linux/nvme-auth.h      |  17 +--
 include/linux/nvme-keyring.h   |  26 +++-
 15 files changed, 1170 insertions(+), 392 deletions(-)
---
base-commit: 68099cf27253a8c89d703a282d3d811446d9453b
change-id: 20261120-dhchap-keyring-v4-09f0bac1d8c5

Best regards,
-- 
Hannes Reinecke <hare@kernel.org>

