Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173258;
	b=TInFiaRrK8QTnHuD1tT4p7v90ox8dSVZ0GgsLkZTD6W1cfeSvZvR6ch4tCHcvpDb9BNg
	 ZNOsgG/LYxi3CUbtZUJglCyNLWCaDG8A4iXbeKo8QUCIDAFjE6brV9m09icZJc0CjFcwx
	 wBGTwuM/Jo87uDCKdJ8QnSVzTSEzIT68D7Qte2ufXIMqYPu8IHXNKE3e2HMHaxk9bA2vc
	 FetiuM637ZUD3aA9kmh+yltWcQf+H0aHkzXjgOaHyFJ9CqwuGZcfXbW2lfEeLkTTzU2A/
	 madxdb+fKPMxBGWSc6imaM4JajwCIsuxhC1SO/h/UWLk8H0ZPCo4n9WAdTCyZC+6xzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173258;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TvxyiNCGdB3dVoMPcMs9gnDui3F/bIpkJgmIVmY1Oow=;
	b=TUB66fvqxPFph1WWqIVp2c4V97Aie5t9KGtTojMwP/gihv4hZ8NTiZw9t8mcKm50CJ85
	 sXi15erVcKM9HNs5oSTyaY4yEkdMf8IcQP6muFiCr7KHYG7epizy2bVqyk8JuSNJqSa7k
	 y0haBtsxXSU801KwzCL2CVrsfNd8CRrHWi5Q+JtdM247AFCzHIy+d3i0fuj9aQwOQH6zn
	 rGwnftvWUPaq97/1CthFxjeOEWQ1PxUco8HTUdWAapqdkiJ+7PtQEhYMdMkrT6W876kky
	 0hRrfxQuS//OR47Ywb32hWSPRLgI6lXCYRhAE1BCA/ZfVbiEnwUhkLmbyad9gxBX3tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exk20NVe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A04B606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exk20NVe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FBE1F000CA;
	Fri, 20 Nov 2026 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173257;
	bh=TvxyiNCGdB3dVoMPcMs9gnDui3F/bIpkJgmIVmY1Oow=;
	h=From:Subject:Date:To:Cc;
	b=exk20NVeXLvRvazj99ZD3gNOV8A4lKFAVjr16sLBJtaJWZIncyBlhdTIpoQvbJaS9
	 kY6Bka8in1DYWhyAzS4eGa/fCHsLt5JX+mu2P1ZCMu1wY7H9TCV6u/82cmUWXfFUa7
	 Sv1DaapVW0CL4EaMXSbOTuEhMfjLEHRRSKph3nlBWwpR10vCbRLeZe8S7rcOVeTm4J
	 LrxMHV5lRZIQnYRkpRG/5gGsgulz8Wq25xgESd1kN7hfGFLm9vokkZaAdQRTxjaoCs
	 ZMq3D8eymcRi5GoJjMiljimScfVBWt59XUhxDERE1FXKQM+QYw+UMCt8Jspqa4nTnl
	 fcz5AuQasfzSg==
From: Hannes Reinecke <hare@kernel.org>
Subject: [PATCH v4 0/9] nvme-auth: switch to use the kernel keyring
Date: Fri, 20 Nov 2026 12:13:59 +0100
Message-Id: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAHgrAGsC/x2MQQqAIBAAvyJ7bkHFovpKdDDdaglMFKKQ/p50n
 IGZApkSU4ZRFEh0ceYzVDCNALfbsBGyrwxa6k4pLdHv1Uc86EkcNrwMymGVi3XK966F2sVEK9/
 /c5rf9wPsil5MYwAAAA==
X-Change-ID: 20261120-dhchap-keyring-v4-09f0bac1d8c5
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173255; l=3227;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=JMQrTDzvVUh645kB4vsxAScpfmUl0DvgGW9gAwgUvWg=;
 b=rzzq6JnUGWOWwrcssrS7Qu8spR/KSjEnKkTYYw+Nc45H7nAbjUHJBeViPtSo+K/HwUoD0uhW4
 8xRIuZElh3+DGvNQkcO1Fg/RWcPi6GG1vsOGO1MKc1Xyfb35J1rapM8
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
 drivers/nvme/common/auth.c     | 213 ++++++++++++----------------
 drivers/nvme/common/keyring.c  | 314 +++++++++++++++++++++++++++++++++++++++++
 drivers/nvme/host/Kconfig      |   1 -
 drivers/nvme/host/auth.c       | 171 +++++++++++++++-------
 drivers/nvme/host/fabrics.c    | 121 +++++++++++-----
 drivers/nvme/host/fabrics.h    |  12 +-
 drivers/nvme/host/nvme.h       |   6 +-
 drivers/nvme/host/sysfs.c      | 212 +++++++++++++++++++++-------
 drivers/nvme/target/Kconfig    |   1 -
 drivers/nvme/target/auth.c     | 229 +++++++++++++++++++-----------
 drivers/nvme/target/configfs.c | 144 ++++++++++++++++---
 drivers/nvme/target/nvmet.h    |  16 +--
 include/linux/nvme-auth.h      |  11 +-
 include/linux/nvme-keyring.h   |  26 +++-
 15 files changed, 1092 insertions(+), 386 deletions(-)
---
base-commit: 68099cf27253a8c89d703a282d3d811446d9453b
change-id: 20261120-dhchap-keyring-v4-09f0bac1d8c5

Best regards,
-- 
Hannes Reinecke <hare@kernel.org>

