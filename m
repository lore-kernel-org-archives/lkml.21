Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099685;
	b=RfB5QPWWGnxx2bHT7myZmDtwnQN5yYnW3NjrZGeFXVXZT0Ij93eVfjm47nYrULCLBpFp
	 aNoqZbnj562LZ/bYpBOZcsEq1//JGvfOCupeWFO6bJBKKviLauFC0e3O6FTmJJ3qR/3JT
	 V4JYTwIMdu2qzYxijr9ySnlKn31EOO9qLziIeajt0CdljGRrH5F7LMoPGoDKiNl4fH0ro
	 ejTW82ZqviFN4i+vrEbYIQGQQPIvVCP9WmWO6cTznLgTYdW0ieBQRyD/mp9vHWinU43sT
	 /gT609TjO5bTawz9pEhxyU0hNn8stC0aEoktxFQNSPbRU2YSkNWb9Ye+hwLC/g8nXPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=M5K/tJPXmyJaUUYyH2fmddvlz+57j12jPWxyjZyaUnM=;
	b=lI12cIihlil0AiTfilZh6KPZINKSRZ5LdiH9yG4b2sRuz+s5eDvENURuzKZvTf6eF+JH
	 yvTt0mG9ijsjJvme2p5ue0iJR9cCoDrSGHIuGlZWpejwHntQsGSSRekhTB8Wd5rhy+j6S
	 yu65axUHElEX+IKW6HbNOmzSTjcAwLnH7PbhSEOVcZ7egyZ0BKdW0EQl64VA3bf1HzY2n
	 E3kCQRR1BxLcflSlI/EblJTdtgxoa3rQjBEY1X4G+YB7ovhV5n0B4u6pvNCQO6qSQOD6z
	 ex5GxGl0Pbr0Zl55/r0OSwcFnHp/v2yQdsIsMddGTNkc8DtSSm6DnmATu5h5DtpBqTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=F9+HBP78;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C07860A3836
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C07860A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=F9+HBP78
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElftL018141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099663; bh=M5K/tJPXmyJaUUYyH2fmddvlz+57j12jPWxyjZyaUnM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=F9+HBP78nainxjSXCXUUrBgCBB528PY+OUqNb3CrAJDlunonyHckrl3r9/dtxSOXl
	 v54HzNoaqtXW3gr0ig58s8G+Ji7YfcQA+4HUX4kC1Wq3quxWnghTZBShI3TqxnGeM0
	 i3glcsiiInxQvkACwtHHiOa5QTOj3Aw6DpIFNBeYYPagZYsvjUDASYquynOLg9TYfs
	 5DdLdMQJ42lfkiEzS8CGxYsna+qU1eNm+morHGQUkgXpwRb5zJAAlMb3XvDvHaXdjA
	 UsCKyXIfQQ7C2ZeJ3ZTwtmVEHu17Z+gu8/GClKj+HIEtWxD1YKz/yAq4L7pz1BdYHL
	 tCGwcSFi/C40g==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 40C332E018C; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Baokun Li <libaokun@linux.alibaba.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, adilger.kernel@dilger.ca, jack@suse.cz,
        yi.zhang@huawei.com, ojaswin@linux.ibm.com, ritesh.list@gmail.com,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] ext4: skip eof zeroing when the zero range covers the eof block
Date: Thu, 19 Nov 2026 09:47:09 -0500
Message-ID: <179509948714.1938961.6080612648602152942.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022122625.1744363-1-libaokun@linux.alibaba.com>
References: <20261022122625.1744363-1-libaokun@linux.alibaba.com>
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
Content-Transfer-Encoding: 8bit


On Thu, 22 Oct 2026 20:26:25 +0800, Baokun Li wrote:
> ext4_zero_range() drops the page cache of the range before allocating,
> to avoid exposing stale cached data.  However, the dropped page can be
> read back by the eof zeroing:
> 
>   fallocate(fd, FALLOC_FL_ZERO_RANGE, 0, 4096)
>     ext4_zero_range()
>       ext4_truncate_page_cache_block_range(0, 4096)
>         truncate_pagecache_range(0, 4095)
>           truncate_inode_pages_range()
>             delete_from_page_cache_batch()  # drops the page
>       ext4_alloc_file_blocks(..., 4096)
>         ext4_block_zero_eof(512, LLONG_MAX) # not block aligned
>           ext4_load_tail_bh()
>              __filemap_get_folio(FGP_WRITEBEGIN | FGP_ACCESSED)
>              # FGP_CREAT reads the dropped page back
>              # zeroes [512,1024), marks the buffer dirty
>         ext4_map_blocks(...)  # converts the extent to unwritten
>         ext4_update_inode_size(4096)
> 
> [...]

Applied, thanks!

[1/1] ext4: skip eof zeroing when the zero range covers the eof block
      commit: 3c498dda252e1729e831c48300f17d1e6a7abb71

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
