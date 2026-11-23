Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405421;
	b=vZtifqSv8QcH3NxDWSRhSolKO1hsFfgBQcqE7I1TzksaP+1i5v3F/yRbRTUXTqWaDC/k
	 DGj+nG9UpYU9jA6HpfI+XE1TEpj9mPgLC2XG+gcsNhMDf2jQO9rFTrsaWXnxqVkdZ9nlD
	 G4tKKNLTt21SnzYaHNR30DVO6ps1oAz9TP+35pnqe2v+qKBf06e97UxhDRMEsuvxUY863
	 apTEzA9qCYhlkFqdocwd8abGhBtwYwGNQJ8l3Cbt61/MXFSMzir17oS7fw9YiSvzFGwgO
	 QQcwVJTw+Y0PzXeC1EfPRTUnTGVSlwe3ednOofXp4CFN6kBV+2CM2hc3ljLLP86WiSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405421;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=tQsWGsrdylhfbIovzYYPzApT8twvdpT+bFKB3zTrmE0=;
	b=I8FjTGPKTtkDL/OIpj704mU/rghcG5xr+Aqnw44v0Eb2cbyWJm/FmTlQpFU3y3FUDrBM
	 X/At1I1JhYTlSXf8dTCSpQHRInRIBQN4Rfn0z65fBYZYJb2LtJ+h6cEurWQNNgspr1XBf
	 lSMK+w+montuEo/x0FLUK9IjXqPPkUBB2iEA0Wn5L/uphZNAkmYGWLz14lukmopSkYtW2
	 HKtjOBN+rzs4R3sfiZgQDQvchHuYckFsPiO9nT3SzjpSDfZ1iAr0C9ZFNPmxdMT2DBZ4Y
	 JfByOpMLcISMsjHkaWscPIvUFthcv09icPLcBxg0h1IaT5u575hTDdNKNBr+FC3kqUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=FLkRT4yP;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b="gr/YQIok";
	arc=none smtp.remote-ip=188.121.53.37
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD94E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD94E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=FLkRT4yP;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=gr/YQIok
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKxhxiqPh; Mon, 23 Nov 2026 03:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405407;
	bh=tQsWGsrdylhfbIovzYYPzApT8twvdpT+bFKB3zTrmE0=;
	h=From:To:Cc:Subject:Date;
	b=FLkRT4yP3x7S06g0vWaAfpx9UZ9Ud4m5FJICQsKP90ff6hrF2ZJ9OQ3N9GeHdzkEw
	 QjKPocvQc3kDhNh3lCjptwyz57Vcnl/JU+buV84rjihYVcdrWbFjhcsdv8WvkMchez
	 3YqBkitZOTWu3NlOHubaol91iIJEBncCIlpduDT/SxZDd19mrZ+ukbZVgfiNz63lqe
	 fA6JNAjMjlmekvg0WXkza6BTOmRYqZ9iuZzQ5uXDn/1/aT6jO+XB/zQ6QKZNp9GotF
	 CSP4YxP8pJDZgEPfer+6ukof25Hqe1Dyl7ySMs/5an/ySlOb8ByhjzGc05iS2JPW9r
	 3Fl5nuex+eMZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405407;
	bh=tQsWGsrdylhfbIovzYYPzApT8twvdpT+bFKB3zTrmE0=;
	h=From:To:Cc:Subject:Date;
	b=gr/YQIok9HM4QLxACZ2PUI7EBIlAicO6U4dqYGExu18nls20kd5gBsAznyWU8hZX+
	 YlRxiziEPGon/+gqz4ETwTR4HjCVHuGeAYb/rQLpReWiwYw3SBOF77MHuHt5WYaQ3Y
	 ADnwXw71Jjl9G2q5chYv9vQ/3LaJ+ATlqxayT5S48pfO+mA5r4H9tGugX/jyHNzj6s
	 7EKVIzsu9wqLjoNNItLHN/6YVTjVsWGJBwYiv3d5GNgTYcuVk/adfafhJLcMwOdwim
	 nLiixypAtSBtJp7jyexFEmPz37D0DAdATfecugpJat0eXSs18J/xn2zBppds7/b7R8
	 hJfWQZS9FbyaA==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b65e
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=1KwyjEPoHUs1rspk:21 a=fawebWP89Nc0O0UJM6IA:9
Feedback-ID: 8032107b193a5c25f81d045e0ed6f983:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 00/23] Squashfs: fix a lot of AI issues and AI style issues
Date: Mon, 23 Nov 2026 03:42:41 +0000
Message-ID: <20261123034304.261742-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfI6pBnRa2XqnDGWbAOtAfRGerKU9v2YTGG1sBcwiPQxH+2nHAoh30un8cvQPLH8/dEQJK/j9jqUhr4P32Bu3/bq/u36QwxbPVJIqbPQWCzbMESleSRsc
 R1sPEaUowdDio/ul9G2DgJFNQSVgvY11D6r2NFy4HB7tbL4D5v2Mc14CrwD/G1H1TqxIFCeLg3IelTpcnRLjSLvS40+umqRZ/tdcw77AAKKug5fnmTJ0Etx9
 Ye7f97vUR67UEd6nZJPkVu5volf/A+3jkt2fnHmZD9BLLW+MaH9dJBCESGyi1bgZ

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

Patch 8 is new to this v3 patch-set.  The patch is an attempt to stop
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

BTW checkpatch.pl complains about the '#' lines in the BASH script
reproducers. Let me know if that will cause problems.

 fs/squashfs/block.c            |  20 ++-
 fs/squashfs/cache.c            |   8 +-
 fs/squashfs/dir.c              | 114 +++++++++----
 fs/squashfs/export.c           | 146 ++++++++++++-----
 fs/squashfs/file.c             |  93 +++++++----
 fs/squashfs/fragment.c         | 113 ++++++++++---
 fs/squashfs/id.c               |   9 +-
 fs/squashfs/inode.c            |  77 +++++----
 fs/squashfs/namei.c            | 137 +++++++++++-----
 fs/squashfs/squashfs.h         |   9 +-
 fs/squashfs/squashfs_fs.h      | 101 ------------
 fs/squashfs/squashfs_fs_i.h    |   2 +-
 fs/squashfs/squashfs_fs_sb.h   |  25 ++-
 fs/squashfs/squashfs_helpers.h | 362 +++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/super.c            |  96 +++++++----
 fs/squashfs/xattr.c            |  49 ++++--
 fs/squashfs/xattr.h            |  21 ++-
 fs/squashfs/xattr_id.c         | 173 ++++++++++++++------
 18 files changed, 1133 insertions(+), 422 deletions(-)

Phillip
---
Squashfs maintainer and author
