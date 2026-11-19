Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124425;
	b=HCtFVDcwo5DrAHiF/ncsIUsiNz8MhHfICNTVMZG8EJ1sxsts/YeagGUKyDTTldi4K0Pe
	 Wa04DGtUaTgKpItjaG2FN92VjfiD9djtSeJC43cqI72QxCjENzn+3dzpfla1Fp1tL3lic
	 pbEtgPe02QedtSzu8QwAo1KaIzZgVmsr8PLdcQPeoptdvlJRXALWLY4isQ7ivTQGIgbA8
	 6JFPyd6RcQaKjyEVxlyb+YUCVlYGWGFYZhL9/9W2NgSy+XPA+IR0/GbVQmqa6mVTReKFv
	 JNI6w22ySYlXsvEZ6iwFzaJKs+3psq8tdogdejr9pMtspiF6pj6HDB1gIH5eakXioNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124425;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dMjBC1xbXo1FCDcAgRb4+j+iJgtyMUxznsdpgD9opw8=;
	b=Ac6bisV/P8WpG10yo7aXBRvBZ4hmiPi3qfw/uFALfC5dM8PbrGy2+1MY+t7rjrqVQEQo
	 6N18O7X81nlwO8pIS15Zrk7lFdhn2i0agA6YrG76LMI0bdv55mRJE5erV0jnrVfzAKfrl
	 zOHBEejOWAeXMcumMPG76HkXS3juavMAZwQsr1zJAk27ygbztIoWKu2molIPfAyuNAJPR
	 oD905SRKZ0FXZjMO/rEmY7Z4F9PjYfCxED0c745Zt+7Z268SyTgdN+RG8vBd0aeEpipX0
	 V+Xbdq4jCO5OHn87SC7FM0qyolallYBpjkg6yu6bAOwvJwyQM7Ky796/nrxxDibZyEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b="X4/tNZZJ";
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845A606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A845A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=X4/tNZZJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795124422; x=1795383622;
	bh=dMjBC1xbXo1FCDcAgRb4+j+iJgtyMUxznsdpgD9opw8=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=X4/tNZZJyOUVaoJj1LXQ4e1hv/WNjKwhLOoJppruC738cDZpr3PEimR80UwcvLjaI
	 NVy6eDqgVZQXjUokUoGe+z8D4MbvKQOwNvKxxUKNLHH2W3VsIQrIyZ30b4ue5uf2og
	 GST1vGK+h1q19gNY0UtHvv32pi+2APiPXDbLZd3vgsdcWpMQ/dZYwyCs0rCjMES3u5
	 kTkG4DJM1JovS4TQNKhxgTYgYF3jTIJQdgiPVS0VPwQlRGcM3eB5pC5B+WYe7N9LAd
	 oIoNp56phI4aQXRp5YAR4qHN1t7tFIC/xyM9mafHO99WnGf3kDzLerj5oc3Yqg2yT6
	 urBvcSBbCr03g==
X-Pm-Submission-Id: 4jVsMR5zl8z1DDXR
From: Miroslav Cimerman <mc@raidlab.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] btrfs: zoned: RAID1 block groups with missing or stale stripes
Date: Thu, 19 Nov 2026 21:38:31 +0000
Message-ID: <20261119213835.103131-1-mc@raidlab.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btrfs_load_block_group_raid1() compares the active state and the write
pointer of each present stripe with stripe 0's, and takes the zone
capacity from stripes 0 and 1. But stripe 0 can be missing, and on a
degraded mount any stripe can be behind the others.

1/4 compares the active state with the first present stripe, as with
stripe 0 missing such block groups were left off the active list and
could hang writes. 2/4 allocates from the highest write pointer on
degraded mounts, as stripe 0's can be behind and new extents then went
over committed ones, and lets a regular mount load a block group whose
stripe 0 is on an offline or read-only zone. 3/4 takes the zone capacity
from the other stripes when stripes 0 and 1 are missing, as RAID1C3 and
RAID1C4 block groups failed to load then. 4/4 adds self-test cases.

Miroslav Cimerman (4):
  btrfs: zoned: take the RAID1 active state from the first present
    stripe
  btrfs: zoned: use the highest RAID1 write pointer on degraded mounts
  btrfs: zoned: take the RAID1 zone capacity from a present stripe
  btrfs: tests: zoned: add degraded RAID1 cases

 fs/btrfs/tests/zoned-tests.c | 82 +++++++++++++++++++++++++++++++++++-
 fs/btrfs/zoned.c             | 50 +++++++++++++++++-----
 2 files changed, 120 insertions(+), 12 deletions(-)


base-commit: 04c9eb073c7c02bf041948ca35b3d8b3ef582974
-- 
2.53.0

