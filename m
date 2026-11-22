Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389803;
	b=XWQYYLr5JSr0v+2JtVNqJ+6J5OtnquU2fjuc2Cpax7fvhjs8OqlsrU2kQDYw3nxM8XWX
	 WxbMTUeK0BNwc6i2k0Mt6lIY0Q7+vdpSrngutTbt7zFT6Ca8kt+vsEOIN9cn+DR3wXvyI
	 ujt5rE7d1gMD6Q0tMw37En8eL/VCleruUrW8a8CvdB6aGIbb+gejaB8hd2t0pIrAtwqew
	 RavSp5pSs2ZAVH+fDRrsTq0X2+8prUMfn6R65J3CsAS+sd10Aos4gq/4ZA40X5Ash86Xj
	 uaBTaP6Fi+owfF3V9UR1dB/CxbrsHIvdGQ+zQmZ+b7c1ukBAIvfOShlw8qXTPftQioA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389803;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9Ylcl2WCuGnCuk6ZD2VXvByahQ630SKNmfWNZIcDAQs=;
	b=ygEbI7P++LNVjyUx7WYABwBtXFZvRmPMYAyCvLmfLTBdUlqoW9BdPjFMH8kbOD4MvwU6
	 U2W3EovvkKy+EE84pyZPK6LnQyHdMzSCG5Tccio/p5Il6ERv+eBbxZTEEeAUWzCIx2o51
	 P1OgA6DPt1EhunvxkB+tt6lVVEvXqOddzhgXKvfugQgKzRH+mxamIGQPKWhyODqQIoaQk
	 NHDrRMuxnVVXumCvHho/UMADcSk0X1/YZStqDRNWqF1r8zyzOt8zFChg0bjIHr2vKgpZv
	 sWVzLNsxIT5lyH0uSrnfmpx+FPHM14v0ocIZcI10JIRm4VmugBR+b7kpzsqDdQ+R1CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=1pK3OSxt;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A51E606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A51E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=1pK3OSxt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795389798; x=1795648998;
	bh=9Ylcl2WCuGnCuk6ZD2VXvByahQ630SKNmfWNZIcDAQs=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=1pK3OSxtFy7AgF0RhUmsoZtZ2wUtoAbEUIMRBbz4ZFvRqn1HXsLivGB8R9HtdIi4U
	 9g2r+Do2XHkCg4CxghH0JM4Pp1fYkQ0Xx5q1OUbM4QiZMxj0Zq8Wzu2zTyUN/8jI85
	 pWnHQeqJXn4vTBcxJJCemb4Xk3UE2ECuUOFNd5vcDvvHmdGd1uh4sx9mx5PGW52uk0
	 phl92rZS3Fx+TFOG//fOUw1k6yDepD/RjOjUcmvtXwDRe6qK8VhjLUnbrIYD74g7BX
	 +YoTTbXoQnB0sO+4ERI2OUksVMyK+GEhrUMltLaPG6MVPjhX2paJJzlazAu7bBjwl/
	 1XzsW/PfyCUBA==
X-Pm-Submission-Id: 4jXlVs2P2Hz2ScQK
From: Miroslav Cimerman <mc@raidlab.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Qu Wenruo <wqu@suse.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] btrfs: zoned: handle a failed zone finish on one device
Date: Sun, 22 Nov 2026 23:23:07 +0000
Message-ID: <20261122232310.4099580-1-mc@raidlab.org>
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

When ZONE_FINISH fails on one device, btrfs can lose a completed write
or turn read-only, even if the profile tolerates the failed device.

1/3: since 7.3, a failed zone finish fails the ordered extent whose
completion started it. The data is written, but the file keeps the old
data in the range of that extent.

2/3: since 6.18, one failed device of a RAID1 metadata block group turns
the filesystem read-only. The patch tolerates the failure when the zones
are full. A partly written block group still stops at the first error.
Finishing its other zones could make the next mount fail.

3/3: relocation hits a WARN_ON() when a device fails ZONE_FINISH.

Tested in QEMU with KASAN on for-next 65101fe10b30, with two zoned
null_blk devices (1 GiB, 16 MiB zones, zone capacity 12 or 16 MiB). A
test-only module parameter fails the next ZONE_FINISH on one device.
Each RAID1 case ran with a failure on each device:

                            for-next             with the series

  RAID1 or single data, an  last 1 MiB reads     all new data
  O_DIRECT overwrite fills  old data, first
  the block group           read gets EIO

  RAID1 metadata fills      forced read-only     stays writable,
  a block group                                  remount works

  relocation, RAID1 or      WARN_ON()            two warning
  single data                                    messages

The relocated block groups are partly written, so 2/3 does not tolerate
the failure there.

The btrfs self-tests pass. Degraded-mount tests and parallel writers
show the same failures as on for-next. These are the bugs fixed by my
pending series [1], [2] and [3]. fstests was not run.

Found with FuzzyRAID, a fault-injection tester for RAID that is not
public at the moment. It ran the series on an older for-next with my
other pending zoned fixes. Its runs showed no lost write and nothing
new. The analysis, the fixes and the tests were done with the help of
an LLM. I reviewed everything.

[1] https://lore.kernel.org/linux-btrfs/20261121134550.216217-1-mc@raidlab.org/
[2] https://lore.kernel.org/linux-btrfs/20261121205657.1108500-1-mc@raidlab.org/
[3] https://lore.kernel.org/linux-btrfs/20261122034826.2333981-1-mc@raidlab.org/

Miroslav Cimerman (3):
  btrfs: zoned: do not fail an ordered extent on a zone finish error
  btrfs: zoned: tolerate a failed zone finish on a full block group
  btrfs: zoned: do not WARN when zones fail to finish before relocation

 fs/btrfs/relocation.c |  5 +++-
 fs/btrfs/zoned.c      | 59 +++++++++++++++++++++++++++++++++++++------
 2 files changed, 55 insertions(+), 9 deletions(-)


base-commit: 65101fe10b3008186b813b628ee3a611b0e70ce6
-- 
2.53.0

