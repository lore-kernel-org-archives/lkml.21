Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676890;
	b=jsck47FNHD9rgJPo/ENpQnIFilE22U/mkpnkoX1PSPloT3AqFF6410vYy37PI/Ue8qPf
	 mzbgdIOdq3oB/lyn2Roo3Ckgc35dKQ0EMmbMBBXRArn2Kz6t3pRZboX0HChyc2/9LIt9R
	 F3Urwt0GWSntUvpvyM6DA2AvfhCA0ZDMLf1n2SxIv0wRemdvmpwtxSrhLAqldiOKSCehl
	 ncKlkAdGO6TkSWtg7TX7R8xHuD9RzBvxl0QuG0aud0TtqKw2X7hEwK7CoaEyXGwXPRwq4
	 R2Gn7G1q3a8Tbr5JJn6+b58Oe1Ghdodq2RxPhUeHo3nBoM+2Pl1UsQ+4hDkNpFUUQvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rxESdAO7AwgZ5leJa2OCecW1ksyeiJeBBKVzhc5NWpo=;
	b=ehV3aaUyKo0u2BhCOHPle7HahuxeDkrvfIq6LAgSf879BD/0jRQP9joKfVKQVWakqxp3
	 F1cC91YyT464/WBvLrsKJXXWRSPLLEawDM8RcZ5jI49Xsqzocw8P1G8gICYmWGxkPmApd
	 3hu4pKvPg9H+zgmYW6je7Kp5VMDZBxEdwZWmdcQKabs5LwHWDczMp+sDQH9+l9ut7dQkL
	 1EI5jTO/92SbuEH/9IWLSm+/3ORIbgRp1rv5X5Xl/bY1T6F3qvRf+Mh4OM3yTvoqXI2bg
	 EooJmlxx5vzGpvt5CuN6ZzpaZ5rphX3yaNBEEKuM7JmJVGOOAtXZeXFok5kz29OOrbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IT9QrEej;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2C5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IT9QrEej
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49412eb1474so4301499f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676889; x=1796281689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxESdAO7AwgZ5leJa2OCecW1ksyeiJeBBKVzhc5NWpo=;
        b=IT9QrEejjihpaYrwOrT+M58jZxQPQrbI9X9mklXsR1CKxLlMMwv1n3s0D31HtyTW8m
         rNq7up/PR4n++Lj0Qy95Ah/tj990tlzFCc8Q8rr5GLLzImDfEVbYZJjFzqOxMtdx1Ins
         sl1Ko28c9cVeCRD/E9YsJMcuVlx6TIFlJhJKfNHj7W3IFTdoqD6ayH4LTsnjO4n8ZPJJ
         ut9rw1DzBVnyW5gjsSAWR3c7dwzJCyUfKbAK34Siqm6zVxr79lklG4c2IBzxIAJhuEdY
         Wi0lhCSBOfJgHTKzZ4MX3MKp1eX6fQtHgL4tzfgzAEJeR5uTafVVfX9priMgNTFOw1Ee
         Imrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676889; x=1796281689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxESdAO7AwgZ5leJa2OCecW1ksyeiJeBBKVzhc5NWpo=;
        b=cHYkNays1bpjoLII7ABjcf2QjNvyfd6kjTEw53nNLOfFnP+wttOcg/tpwOW3u7hcn0
         h6tVzmWd1+JTpQ2idjPP21bkQMCpF3ZrhqRBS9rEKCXhb/yLvNq0KDpzWykm+ISpst4x
         9Uq43mx5cyU4ZsAglKyP9N0Nr9JYFIPz3KerxWPdMIg4gSFCa9TFIayU/J0sEGz73u0c
         046YrAQEjiDVQsH2tpV8OzTjwfcr9qLgxER3u7HBD6WXTTZPoDHMAsDxyFSqHrlvs9T3
         PpS6OD7UcfQZ9/lwAICZvVztb0z/XBJjhGJU97SiveTZfI4bjOQqK5BLq3IwrE16wq7l
         j+Jw==
X-Forwarded-Encrypted: i=1; AL+hErFDAANL9PEvFVIGd0IEA3k4lBv+01q5b6wBl4wauJ5vdKqgxnLDOLrxgn5q/2D/DyxxfuX4ukqObTRGIjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CkLbvjfeXr4iICWB6w5CawBLjgUCDtXzkmhW3dMc+ZIUcZCBY
	1wTYvcpze1xgh+VAq2CcXneQc4I+WdFJbE8xzUB4lIQZliBWbtsIKvNW
X-Gm-Gg: AZFdTZfywvpDlt7WqngrrYa5/pPJTwvTicrBVrzKa/fND1w9775JJiaaMHAfYUJTR8+
	xACsXVS/PC15az+Xop4dBRisJuSNAqs0qrDeBklCCo+De40qU0F/SGsRnQpu/kf9oz6fR/cJkUE
	RjhA5ei+YXiFWceaWRIrAxUsY8seRaJZu6jtQDFrK9r6F7lQjJr4XKoiV829BZ99FKL9cL1LhkT
	qKvf0JBxJybgvvcUumWEM+hbZzOBImaowABlhb3Za3IYzOSYe3Vpu6IFrk4Pedb1n3gjHgBUl8S
	j2cf6C3kxbpNbATBUawFzYzVpsWCqwWvyGWr1EKBPHNT6P1wTYIMRgBJEM6Mh1SbupHJsdHhpPv
	n13ni+C/CkH+iIJogmW2Qa389SKaaqppuHDYAJXYw1zmIb+lthEk59gGc2kIUkDOzUPAQolooml
	fHnhcGkdd0Q28tscs4XvEGb2U5QuSHmOoVDGT8tiwtj6QE3GvCNS9OUeOtMRyY6KhQBLHv70EIQ
	HaCiziJpmB5XVicq9NKL1YHx44uexRcR/Ue5g2qXKJpc3J8RFAWmwccuUZHW6WRVC3MxDn1Qddd
	UH5AbHZox9MNURijAx4OVZrC6ReTOlhKbHlsU+jSS5WZhvnwaQ==
X-Received: by 2002:a05:600c:a0b:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb8882432bmr398668845e9.25.1795676888824;
        Wed, 25 Nov 2026 23:08:08 -0800 (PST)
Received: from DESKTOP-V28CTA4.dbs.corp ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1071077895e9.4.2026.11.25.23.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:08:08 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	yebin10@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] ext4: fix inline data conversion races
Date: Thu, 26 Nov 2026 12:07:44 +0500
Message-ID: <20261126070748.272109-2-arbabhaider649@gmail.com>
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

This series addresses ext4 inline-data conversion races. Patch 1 fixes
the KUnit inode fixture so it passes on the base. Patch 2 fixes the
delayed-allocation handoff to writeback, carries the stable tags, and
can be applied independently. Patch 3 keeps synchronous conversion
state visible and serializes callers that inspect it. Patches 4 and 5
cover boot-loader swap and inode migration, respectively.

Booted each cumulative patch in QEMU x86-64 with KASAN, UBSAN and
lockdep. All five source trees passed all 22 ext4 KUnit suites. The
fixture-only tree also verifies that the two inode test failures on
the original base are fixed independently of the runtime patches.

The complete series also passed 555 ext4 KUnit tests in an arm64 QEMU
guest with lockdep and DEBUG_ATOMIC_SLEEP enabled. LKMM models of the
locked writeback handoff and rollback observation both excluded the
invalid state.
The arm64 guest also passed persistence and truncate checks on a 1 KiB
journaled filesystem and a 4 KiB filesystem without a journal.

The full series passed inline-to-block conversion, remount and data
comparison, and truncate-to-zero checks with delalloc, nodelalloc,
no journal, data journaling, 1 KiB blocks, bigalloc, fast commit and
indirect mappings. The indirect-mapping run also checked sparse reads,
SEEK_DATA/SEEK_HOLE, FIEMAP and direct reads. The boot-loader swap fix
rejected an inline file and completed a swap round trip on a disposable
image.
e2fsck -fn passed on all test images. Sashiko --no-ai passed patch
extraction and application.

Changes since v3:
- Rebase onto 4dce97c6c265 and split the change into five patches.
- Fix the nonatomic buffer lookup stub in the inode KUnit fixture.
- Publish the delayed-allocation handoff under xattr_sem and check it
  under the same write lock used to remove inline data. Return -EIO on
  an incomplete handoff and propagate inline removal and journal errors.
- Finish the delayed-allocation handoff on truncate-to-zero and on a
  failed write at size zero. Extend the inline KUnit coverage.
- Keep MAY_INLINE_DATA set through synchronous conversion and serialize
  callers that inspect inline state, preserving sparse-file readahead.
- Serialize boot-loader swap and inode migration against conversion.

Link: https://lore.kernel.org/linux-ext4/20261123172856.100887-2-arbabhaider649@gmail.com/

Arbab Haider (5):
  ext4: stub the nonatomic buffer lookup in inode KUnit tests
  ext4: fix delayed-allocation inline data conversion races
  ext4: keep EXT4_STATE_MAY_INLINE_DATA set during inline conversion
  ext4: re-check inline data under filemap_invalidate_lock in
    swap_inode_boot_loader
  ext4: serialize inode migration against concurrent inline data
    conversion

 fs/ext4/file.c        |  73 ++++++++++++++++++++------
 fs/ext4/inline-test.c |  17 +++++-
 fs/ext4/inline.c      | 118 +++++++++++++++++++++++++++++++++---------
 fs/ext4/inode-test.c  |   2 +
 fs/ext4/inode.c       |  71 ++++++++++++++++++-------
 fs/ext4/ioctl.c       |   4 ++
 fs/ext4/migrate.c     |  33 ++++++++----
 fs/ext4/readpage.c    |  15 ++++--
 8 files changed, 260 insertions(+), 73 deletions(-)


base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.53.0

