Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571300;
	b=5O3gLTkiH0j6LUmtpws+biHwyz4UWjmLUHTS72EImemW84zu2PmyciI3AzLQEUvDEFUy
	 L6D4xEGz2WW0dGEBNdWkTbVyI9tao0iv9Z8jwU3u3SLs635JXdlAT2G6iRjT96g1Hr6Gk
	 gIfvt3G/Uqo2o5892zsThG82vSJHTJDHExpbsbc0Efymqv1JuBEU3Rb4jUje/89F0G988
	 gHEY9UiOHiAesnh1f5H2wOrSw1Cvvwk2n4UflCaDltwrtRcPQ+nofP8fB0UL9WNbEFrec
	 Z/G00fKdD8T5fTuQUJLGp0Q+NIgKu9dkDBiGQihQhvh31XcIwp85QQPDrFHlLmEFHbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571300;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=iG9LfIx7RZ4N71xVpzMKvesR1EjPHm78IKsGrHVeenQ=;
	b=0uQgb14FTxhRwNVz0MGcrq4qCR69GCMQUgw49jT9mzPetZPZd4hpvwWLt5cEXOYEonOn
	 Di2thZAvM0+rgCb3k3dFq2UmKb3A0faQKWmgQFfbV0ISNiDpOM+kR356OkTlJIDhsZZzs
	 0nJ8gtbqCC37mTwbmDmNHZO9c7gyj0IGt9W7MEfnc729loR+uWsvpI3bie/x4/Km3EXc5
	 uNTftu75jDdmPeGxRvzu3/29k25tb7MvK1y5/7FpV3Z0M8FwjsxuY6M9OkrbmxNnO3KL0
	 ZhvsDZ0dxZyugFoQVLAYIbunl3drAhf4SCeBEsWNz3yvWAWtyOoCJFHnMaPONCUemHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=KsMKOopW;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b="prz/v5j8";
	arc=none smtp.remote-ip=188.121.53.22
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF29606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF29606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=KsMKOopW;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=prz/v5j8
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27AxX8M5; Wed, 25 Nov 2026 01:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571286;
	bh=iG9LfIx7RZ4N71xVpzMKvesR1EjPHm78IKsGrHVeenQ=;
	h=From:To:Cc:Subject:Date;
	b=KsMKOopWlikxDhigQBEuGCdYllbh5/q14J2oo06Y1AjbuV9Oif/ehz9qiF3ikuenD
	 yDgDfdnc+ngXoIBVwlaJOYzpRZkw0HsBrYKSddrcS+aGSm6I2Qzf9Vv7+7YnSG2N52
	 P6yK0242bFw34Lv7vlYy+zpCEDLU+ZSjF+jsPAB0dLlcE9XUyOfPXE9irWDrO950Xf
	 t8kWO51Pi0Z9PcQe4j/aVMfDV0w6CCZynX6jsBKpqFGvWsD8wHUtu6b3kTqtVFf8Hn
	 AbxTXG2DJCilbjPou38X/ir5l/ko4bzZAGW9K+6sQCLXwa13N0GrFnHiJimbxZhDMn
	 TUnRNAqNoMrOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571286;
	bh=iG9LfIx7RZ4N71xVpzMKvesR1EjPHm78IKsGrHVeenQ=;
	h=From:To:Cc:Subject:Date;
	b=prz/v5j8cN1/CHJlI1NlTv/tbbfYqvmd9lq+xZYuJo5hmJRvZHaImkal3aWOYmlLz
	 Bw0rcfr1SSDI5pfn/GCbl1w+yUS/4WTW0GCDnbx5budnAK8MVU8XcbWtIvvfmX2+yn
	 AsuNAxj10/uhWLwljoIPv7n55kv+eajmKkSVHB3JYm0stOzQMaZRsUf7/R2M0S5Yl+
	 fDXGSaf4S0gN27cOJbCOtwgQZ9+t5oqczQgDMkifVp2CFRhpE206H+QIvOdW8GQf3d
	 bkgrd4shIJ/mCWVx/iIe8wJ+XwBneOm3PsyNdq2ycADAdqRPQ88ZGG3CmC1Vguwiaz
	 T0yVeivttDyBw==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e55
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=1KwyjEPoHUs1rspk:21 a=fawebWP89Nc0O0UJM6IA:9
Feedback-ID: 3b6682daf9665707dbf200671834e70b:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 00/23] Squashfs: fix a lot of AI issues and AI style issues
Date: Wed, 25 Nov 2026 01:47:14 +0000
Message-ID: <20261125014737.347231-1-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
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
X-CMAE-Envelope: MS4xfDI/yHibZOu/YalVKMpKfK34Gc3xEDgjogBnwRD8FDK2JG7ytVLgXcRh3FSx3gnk2gXYLEQqTDWjaThl1gFvXmgXyQHlp+wJaNXBm61lb7CkG1KXghZh
 RPPFjqHW+IWS1qmNb2QwaMDRhHgoPAMlg4ipXpRs1qvDPdFIObLf1t2Re3jvizVIBP599CJsZh3BGLTOkheQzatPSb4/l1Kv5xWCnHO+UWN0LvI/GfoX1B4v
 J5VXe3qTHofB4S2M2YBVkOSkCQKZFEjks0IlubshuKdvfBT1oxL3FyeNxly7SpD6

Note: this is an intermediary patch-set, and not the final patch-set.
It is intended to see if the issues Sashiko AI reported on the V3 patch-
set have been dealt with in a way that stops the AI from complaining.

If that has been achieved then the next step will be to deal wih
additional issues raised by other AIs, and which could cause Sashiko to
start complaining again.

This is not so much see androids fighting but see androids conflicting
which is much more boring.  Your understanding is appreciated.
  
This large patch-set is inspired by the recent spate of AI generated
code reports.  Four of the patches directly fix AI reported issues, and
the rest have been found manually by a read-through and testing of the
code.

In all cases (except patches 1 - 8, 18 - 20) the patches deal with
over-sights relating to variable overflow, arithmetic overflow, variable
signedness or just lack of sanity checking of data read from disk.
These can cause the code to fail, and which could be used as a potential
exploit.  

Patches 18, 19, and 20 fix potential excessive memory use exploits.  The
code in question was written in the early days when Squashfs filesystems
were small, but with very large filesystems it could try to allocate
memory in excess of 4 MiB, and up to 64 MiB.   

The patches can be broken down as follows:

Patches 1 - 6 are preparatory patches.  They convert old fashioned
#define macros into inline functions.  These being typed make widths and
signedness explicit, and allow additional checking to be added in later
patches.

Patch 7 fixes an incorrect offset value in TRACE statements in
squashfs_read_inode().  This was new to the v2 patch-set.

Patch 8 was new to the v3 patch-set.  The patch is an attempt to stop
Sashiko from getting stuck in logical contradictions when some
sanity checks are introduced later.

Patches 9 - 17 fix various issues relating to variable overflow,
arithmetic overflow and add additional sanity checking to prevent these
issues from occurring.

Patches 18 - 20 remove the excessive allocation of memory by introducing
caches, which limit the maximum usage to 4 pages.

Patches 21 - 22 were new to the v2 patch-set.  They deal with some
issues Sashiko reported in the original patch-set.

Patch 23 was also new to the v2 patch-set.  It adds an additional belts
and braces sanity check.

Patches 9 - 21 have reproducers which show how the existing code faults
can be exploited, in some cases which can allow a Squashfs filesystem
to be tampered with to make files readable by unprivileged users.

 fs/squashfs/block.c            |  20 ++-
 fs/squashfs/cache.c            |   8 +-
 fs/squashfs/dir.c              | 118 ++++++++++----
 fs/squashfs/export.c           | 146 ++++++++++++-----
 fs/squashfs/file.c             | 101 +++++++-----
 fs/squashfs/fragment.c         | 113 ++++++++++---
 fs/squashfs/id.c               |   9 +-
 fs/squashfs/inode.c            |  85 ++++++----
 fs/squashfs/namei.c            | 146 ++++++++++++-----
 fs/squashfs/squashfs.h         |   9 +-
 fs/squashfs/squashfs_fs.h      | 104 +-----------
 fs/squashfs/squashfs_fs_i.h    |   3 +-
 fs/squashfs/squashfs_fs_sb.h   |  25 ++-
 fs/squashfs/squashfs_helpers.h | 362 +++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/super.c            |  96 +++++++----
 fs/squashfs/xattr.c            |  49 ++++--
 fs/squashfs/xattr.h            |  21 ++-
 fs/squashfs/xattr_id.c         | 173 ++++++++++++++------
 18 files changed, 1155 insertions(+), 433 deletions(-)

BTW checkpatch.pl complains about the '#' lines in the BASH script
reproducers. Let me know if that will cause problems.

Phillip
---
Squashfs maintainer and author
