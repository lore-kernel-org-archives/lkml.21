Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707497;
	b=b1Y4nUz3u/yuvgK4UdO29/vuZ2lsfCho9NIzdHI0GxQf/K6Ffk88CYFmDfRfl1zb8ClB
	 zmWS28KwM66zyOCjCW7AQwyDPjON8EwUTYYF/6cKP6jdkqCsBioILTYZq0FssmxHi6pWm
	 EocHEQVlPqrUAU5cJw6sCrA8B3cKTC2IPoLM/hHPO5VG/XRkiGj6Ul80QcXxeVsjh2Lmr
	 PFQOfwHGMzbFfyzXdICkZxF/bz5sFGGUaqdZ48u4nxEY96DBbK2lNiDZxDAQlKYUwGPBg
	 a9avAMCAMOwRZS9/zQzTLBgzkxzKXqKiDyU0hIhzc4TfX3U29Ch7VDQQtXW+K1ON2lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=ym/C3Ht+bTTt+Z+N0oj470aXd1oralQB4+en2eK6C8A=;
	b=rAugs7ecy7HQphqIqT9qpmhLNrGEMPZaO2wheGte/Vtvm6VNDkevdTXDoZlDq12zuwqk
	 3Qd7SVwV9qzztpE4k0yoKxiPFJ7a+3iAkhuSL45LUMHgTNsEHPKwNDM3RV5MzxSvN8RHW
	 zCi3FLz3xBZI+ejkAhfF6fyaQy8fikNn9jopcg2NJjwJy8cx/VApVWCDBuGykQ91/fjt3
	 fVr1hafRXzqX8mq9L+/pnIiHzxOmivK33mW3LKuNWJ60exyVyCw6XlSTZgc2zuij3aiqi
	 0Xjl8qDgKNXzATs4kuVDXpszyO0TJuUQJB3RRMDxhd5W34ud7H22WV5l9cMOldYdE/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b="P9TnR4n/";
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF9B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF9B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=P9TnR4n/
Received: from trampoline.thunk.org (pool-173-48-102-184.bstnma.fios.verizon.net [173.48.102.184])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AQFc9W5017260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 10:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795707491; bh=ym/C3Ht+bTTt+Z+N0oj470aXd1oralQB4+en2eK6C8A=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=P9TnR4n/Shh6j4Lk1772FeM9BVkn50baFanSezSIj0kye6U+DCiqx9PD7EWMmqyD0
	 NZcwCRDsHOPAr+2A2bkwwF9ScjvxvJY8hxahCytCBnosRSrG7SHnVyf/SEtrGESnMw
	 tyfvz2xtekCuFAHjeqts36KGCZkwvnul6PyVl5MhN9eo0sIsnv/FXiWUZaHOe2Gugj
	 KBDv66Edqv5XXJXU2eBTjV3/rbqVt6/4fHj66Otwj/HtIpY1AJISzIB6K9hKaOOq8l
	 e2qcGoGoXVPUxXIey/RR4mx1ciCToHeoyNISTHofz/rQh4Qh5dlKlXxBNe9PSFbovs
	 /zFkeOYlZ78Zg==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 9DB692E00BB; Thu, 26 Nov 2026 10:38:09 -0500 (EST)
Date: Thu, 26 Nov 2026 10:38:09 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Linux Kernel Developers List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] ext4 post-7.4-rc5 merge fixups
Message-ID: <awhRbTWsHzW4U7Lp@mit.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4dce97c6c265544342e716e62fd24bbb232590c5:

  Merge tag 'ext4_for_linus-7.4-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4 (2026-11-24 12:27:37 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git tags/ext4_for-linus-7.4-rc5-postmerge

for you to fetch changes up to aceadbccd428fb8e6593b27a3091d961f80225d1:

  ext4: don't track metadata buffers on an inode during fast commit replay (2026-11-25 22:30:49 -0500)

----------------------------------------------------------------
Fix the KUnit ext4_xattr_test by adding missing stub registration
after the recent merge into mainline.

Also address two teset failures that weren't noticed in my original
pre-PR testing.
  - Fix the ext4_inode_test when CONFIG_USER_NS is enabled
  - Fix generic/311 failure for ext4 with the fast_commit and inline_data
    featires are enabled.

----------------------------------------------------------------
Theodore Ts'o (3):
      ext4: stub ext4_sb_find_get_block_nonatomic() in the inode KUnit tests
      ext4: set s_user_ns in the KUnit tests' fake superblocks
      ext4: don't track metadata buffers on an inode during fast commit replay

 fs/ext4/dir-test.c    |  2 ++
 fs/ext4/ext4_jbd2.c   | 14 +++++++++++++-
 fs/ext4/hash-test.c   |  3 +++
 fs/ext4/inline-test.c |  2 ++
 fs/ext4/inode-test.c  |  2 ++
 fs/ext4/namei-test.c  |  2 ++
 fs/ext4/xattr-test.c  |  3 +++
 7 files changed, 27 insertions(+), 1 deletion(-)
