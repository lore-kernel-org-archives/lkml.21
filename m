Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453814;
	b=z7MqR0iTatYJCw0d7qJ1puAZMwmWv3AevD3bn6twZkjplEv26SylXlMSjpFFSM52uMaI
	 PR8efW7RZUrDNMZWrAJA75UgHkNBz3PZnHievagGZSkNAowekMW+ntnLudgSWLCV5/TPz
	 MAaY+AYUW9UCq2sUXlCXwAj/o2f5Xms2VBZVe2dh1wG4h8xdm2ReDRuU81kx8QUN2Rwip
	 yf2Cw+PN6menpHTJ3dVDIs5N7VkQ2gPOkF2X+i/11ckFZbIIjew9ey00/dgEuWsNessL1
	 BcmQj1Y6VjxPNwT5S+5UZrITsFJaTFoQY4C6Nopxz672eXppSmpFAgYJAFHw5K+zsng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453814;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=c3TaoASfd8PzD5S4tgYOpeLOWlNif+silHEuUYg9+28=;
	b=xFU07Io74XatOVffcaH8i/FCBrzq3aZa7T6abgrIM95IPwkeuGUYK1sNsyYR2vT4LKUe
	 Qhz155D6EzcTH+vStJQWlensQx3KmA2wR7AUovZ04AJaBl+1+VTxbNdCsySMiNqAzE1IM
	 y97QuPblHKbtMMvH3ACVErqg7/B/m629IjrsAQmoDOeodPyPS36lrcc80OV9/72NvxZCa
	 5osM4I7gIvT1L691VP4yJqry/4iYGu+pDxxWeE0nKPmYY07gptXrVPBeq3EUCth1gvvB5
	 6FUkLOl1h94+MUxN8CoqS6AWPxd6q2PXdNZZaMtfeN83LtBEtAHqQ6VoozebphdzqvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0Wp1NYD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B08C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0Wp1NYD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA391F000C4;
	Mon, 23 Nov 2026 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795453813;
	bh=c3TaoASfd8PzD5S4tgYOpeLOWlNif+silHEuUYg9+28=;
	h=From:Subject:Date:To:Cc;
	b=P0Wp1NYDxrcIM/ovxNdDS2GML5fETI33+s23IQyeMMUOPdCBGzc1Q2IuS70wSxsdn
	 kfeKfNwsLon8IYx2XhR3BYX/rg7HTYhxh5urAl8B98fMBHm4LMROASzcf5pYxWXwK5
	 WwcQR3tQNr7iHFXyK+l75GFY0EHBNr2gDfEgKeB+Y8Wqlgj4nfswpHABgZjtSkW+W+
	 tVu4XPQSlFObSZv2rvXSU3kF05Td+gpdkWMXfsStWCyJfA9FTqIhMltrMAbX2WTJsN
	 qKaQcDEu0YztWLoyzfj51efHqw1+YvExLTu6dlhiFH2/Pjh07FULonFb/pvbVy2oIY
	 LYYZj/IKlwTYQ==
From: Hannes Reinecke <hare@kernel.org>
Subject: [PATCH v6 0/9] nvme-auth: switch to use the kernel keyring
Date: Mon, 23 Nov 2026 18:10:00 +0100
Message-Id: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAGhzBGsC/33NTQrCMBCG4avIrI0kMemPK+8hLtpk0g6VtCQSL
 KV3N+1KQVy+H8wzC0QMhBEuhwUCJoo0+hzF8QCmb3yHjGxukFwWQkjObJ/3iQ04B/IdS4rx2vG
 2McJWRkO+mwI6eu3m7Z67p/gcw7y/SGpb/2kbyLSrTGnrWhaI1wGDx8dpDB1sXNKfxPkXoTNRC
 UTXKsNLqb6IdV3fM7+1HvYAAAA=
X-Change-ID: 20261120-dhchap-keyring-v4-09f0bac1d8c5
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795453811; l=3667;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=V+0LlW5boOKjqhOSfCsSFocUMOFEm9YF8ORqXxyW5FU=;
 b=87eeiZDT71LjnfENvAOJN84m+RtQNL7gTyHnReEVG5tGhUAkF29Wg60BDRpFCmW3GRDT7YXvI
 TnpyvyQchRBDIFKGTGepHpTq5BUc778P/I8fU+Jrgo1zkN/HFaECwAu
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
branch dhchap-keyring.v6

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
Changes in v6:
- Fixup next round of issues from sashiko
- Fixup kbuild robot issues
- Link to v5: https://lore.kernel.org/r/20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org

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

 Documentation/ABI/stable/sysfs-nvme |  10 ++
 drivers/nvme/common/Kconfig         |   2 +
 drivers/nvme/common/auth.c          | 216 +++++++++++--------------
 drivers/nvme/common/keyring.c       | 315 ++++++++++++++++++++++++++++++++++++
 drivers/nvme/host/Kconfig           |   1 -
 drivers/nvme/host/auth.c            | 173 ++++++++++++++------
 drivers/nvme/host/fabrics.c         | 131 +++++++++++----
 drivers/nvme/host/fabrics.h         |  12 +-
 drivers/nvme/host/nvme.h            |   6 +-
 drivers/nvme/host/sysfs.c           | 246 ++++++++++++++++++++++------
 drivers/nvme/target/Kconfig         |   1 -
 drivers/nvme/target/auth.c          | 204 ++++++++++++++---------
 drivers/nvme/target/configfs.c      | 150 +++++++++++++++--
 drivers/nvme/target/nvmet.h         |  16 +-
 include/linux/nvme-auth.h           |  17 +-
 include/linux/nvme-keyring.h        |  26 ++-
 16 files changed, 1140 insertions(+), 386 deletions(-)
---
base-commit: 68099cf27253a8c89d703a282d3d811446d9453b
change-id: 20261120-dhchap-keyring-v4-09f0bac1d8c5

Best regards,
-- 
Hannes Reinecke <hare@kernel.org>

