Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223570;
	b=Sjqe2CVBOw65/Osnaw33RSVm2gip+G8bORuA+k/nM1r6PNnEz+4tG4BiNunECK7JcB9n
	 40JqpUlnq0Lc1LIC0Oax8/msD0n3dJCnEnbp/QgP1atUkq3hlA1yvvBl+pJfhAfVRIfxL
	 CDL4q1Q0hiL/GP+H3xvYCQcWur6csp4HcWKOj9SGWUIgaFewJsZGeWBonlY3go0DBkUl7
	 wm3VgQpVpoyCnKGBccfQ1iTjF6C8nBz5Z5Mn+QA2rpynISJI1b3l1J0uUcFDMpJHXGOdj
	 W61fjgMMPnDgAyk6BBuv2jVILoA9K8Js2mvcPpp3eWLZ1QJ7zxZk1Q5MVBY54ZMP+BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223570;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/qfupq5+WODm/ujq3fTzSTlW7HQ0A1dmVFFP+PPYkjM=;
	b=CbUSABEKXv8WsTE9qNaByCtP3OHh0ikrdmGAWHa613IxEqXAAocxZoaA3izZGY9M4LJp
	 /MqqVDQ5Pwym5AVRfr0yzAvncBbm1rsD5eUil33wDmPIYuo930sYsxbMv5mNYptG02VAE
	 UhEtnWPb4FpekZBSDo8wiY9ZXEVZyinIfvlnn10kdILe9PK9MS8vkotBfmpKg0LNgHpOc
	 uiDyZwgML66Mqh6Q1VwHxq011mmVT5u8aOIKUqM0vm9M+8BvYQipIeFJZrf2N3s8gcMPb
	 aiNPVk2I+V4aDB5snDrWxmJggpTHecy/aXROueMuPHALMUfBH6u+UsU7zXkESbueTWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=hf9g7yaK;
	arc=none smtp.remote-ip=115.124.30.113
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6428E606A332
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6428E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=hf9g7yaK
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795223565; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/qfupq5+WODm/ujq3fTzSTlW7HQ0A1dmVFFP+PPYkjM=;
	b=hf9g7yaKLbgOqfh9hJk6vnqM2FXGncY+IH0sIK6rGvFbTz1mBSQa0kSs7q+sJV+98ZbfVoy1lgYRsDmETzd1kRy31egE65k0XMgztzg5DvyCHN7W9i07pLXcNYA2vjDXdhVB9HbzdgOTnTvRM2AepWOdOukw7Ot6aWMUR+GJEa8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R911e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XF7UwFX_1795223563;
Received: from 30.180.33.101(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XF7UwFX_1795223563 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 21 Nov 2026 09:12:44 +0800
Message-ID: <c57890bc-6085-461f-9f7c-47b72e104b65@linux.alibaba.com>
Date: Sat, 21 Nov 2026 09:12:42 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v9 0/3] migrate ocfs2 DIO from buffer_head to iomap
To: Heming Zhao <heming.zhao@suse.com>, hch@lst.de,
 Andrew Morton <akpm@linux-foundation.org>
Cc: mark@fasheh.com, jlbec@evilplan.org, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261120060014.12087-1-heming.zhao@suse.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261120060014.12087-1-heming.zhao@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks for this work.
I'll apply this series on top of next-20261119 and run a full test first.

Thanks,
Joseph

On 11/20/26 2:00 PM, Heming Zhao wrote:
> This patch set migrates ocfs2 Direct I/O (DIO) from buffer_head mode
> to iomap mode. It is based on commit aebb72744764 (v7.4-rc3), and
> also incorporates Joseph's code and ideas from [1]:
> 
> V9 changelog:
> 
> Address sashiko's review comments [3] (all changes are in patch [3/3]):
> 
> ocfs2_file_write_to_iter():
> - switch pr lock to ex when DIO falls back to buffered IO
> - Fall back to buffered I/O for a direct write when block size is smaller
>   than the page size and the write does not cover whole pages
> - clear orphan when rw_lock is still held
> 
> ocfs2_dio_wr_map_blocks may use a value beyand u32 to call
> ocfs2_clusters_to_blocks()
> 
> initialize oi->ip_dio_orphan_pid and oi->ip_dio_orphan_end in
> ocfs2_inode_init_once()
> 
> --------------
> # test report
> 
> This patch set has been tested on 7.4-rc3 kernel
> 
> ## ltp
> 
> runltp -f dio -d /mnt/ocfs2/
> 
> results: passed
> 
> ## xfstests
> 
> ./check -g quick -T -b -s ocfs2 -e generic/081 \
> -e generic/266 -e generic/272 -e generic/281 \
> -e generic/338 -e generic/347 -e generic/361 \
> -e generic/628 -e generic/629 -e generic/648 -e generic/650 
> 
> OCFS2_MKFS_LOCAL_OPT="-b 2K -C 4K --fs-features=local --fs-feature-level=max-features"
> Failures: generic/003 generic/056 generic/091 generic/094 generic/177
> generic/211 generic/225 generic/263 generic/321 generic/322 generic/329
> generic/331 generic/370 generic/376 generic/424 generic/448 generic/467
> generic/477 generic/481 generic/498 generic/510 generic/512 generic/513
> generic/534 generic/537 generic/552 generic/557 generic/563 generic/578
> generic/588 generic/607 generic/620 generic/630 generic/755 generic/760
> generic/771 generic/777 generic/779 generic/784
> Failed 39 of 632 tests
> 
> OCFS2_MKFS_LOCAL_OPT="-b 4K -C 4K --fs-features=local --fs-feature-level=max-features"
> Failures: generic/003 generic/056 generic/070 generic/091 generic/094
> generic/177 generic/211 generic/225 generic/263 generic/321 generic/322
> generic/329 generic/331 generic/370 generic/376 generic/424 generic/448
> generic/467 generic/477 generic/481 generic/498 generic/510 generic/512
> generic/513 generic/534 generic/537 generic/552 generic/557 generic/563
> generic/578 generic/588 generic/607 generic/620 generic/630 generic/755
> generic/760 generic/771 generic/777 generic/779 generic/784
> Failed 40 of 632 tests
> 
> OCFS2_MKFS_LOCAL_OPT="-b 2K -C 8K --fs-features=local --fs-feature-level=max-features"
> Failures: generic/003 generic/056 generic/075 generic/091 generic/094
> generic/112 generic/177 generic/211 generic/225 generic/263 generic/321
> generic/322 generic/329 generic/331 generic/370 generic/376 generic/424
> generic/448 generic/467 generic/477 generic/481 generic/498 generic/510
> generic/512 generic/513 generic/534 generic/537 generic/552 generic/557
> generic/563 generic/564 generic/578 generic/588 generic/607 generic/620
> generic/630 generic/755 generic/759 generic/760 generic/771 generic/777
> generic/779 generic/784 ocfs2/001
> Failed 44 of 632 tests
> 
> ## fio
> 
> (4k blocksize 4k clustersize, local mount)
> 
> fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=1g \
> --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> before patch: write: IOPS=32.2k, BW=4028MiB/s
> after  patch: write: IOPS=38.6k, BW=4824MiB/s
> 
> fio --direct=1 --iodepth=32 --rw=read --ioengine=libaio --bs=128k --size=1g \
> --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> before patch: read: IOPS=49.1k, BW=6132MiB/s
> after  patch: read: IOPS=50.9k, BW=6360MiB/s
> 
> fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k \
> --size=1g --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> before patch: write: IOPS=14.4k, BW=56.4MiB/s
> after  patch: write: IOPS=14.4k, BW=56.1MiB/s
> 
> fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k \
> --size=1g --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> before patch: read: IOPS=382k, BW=1492MiB/s
> after  patch: read: IOPS=419k, BW=1637MiB/s
> 
> ------
> [1]:
> https://gitee.com/anolis/storage-cloud-kernel/commit/ea3fe75e2060118ba093e90b1cd34fa382914b29
> 
> [2]:
> https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com
> 
> [3]:
> v1 patch set:
> https://lore.kernel.org/ocfs2-devel/20260724052559.15409-1-heming.zhao@suse.com/
> v2 patch set:
> https://lore.kernel.org/ocfs2-devel/20260727061802.18485-1-heming.zhao@suse.com/
> v3 patch set:
> https://lore.kernel.org/ocfs2-devel/20261018143319.22329-1-heming.zhao@suse.com/
> v3 sashiko review:
> https://sashiko.dev/#/patchset/20261018143319.22329-1-heming.zhao%40suse.com
> v4 patch set:
> https://lore.kernel.org/ocfs2-devel/20261103135605.22943-1-heming.zhao@suse.com/
> v4 sashiko review:
> https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com
> v5 patch set:
> https://lore.kernel.org/ocfs2-devel/20261105071930.16399-1-heming.zhao@suse.com/
> v5 sashiko review:
> https://sashiko.dev/#/patchset/20261105071930.16399-1-heming.zhao%40suse.com
> v6 patch set:
> https://lore.kernel.org/ocfs2-devel/20261115154013.9379-1-heming.zhao@suse.com/
> v6 sashiko review:
> https://sashiko.dev/#/patchset/20261115154013.9379-1-heming.zhao%40suse.com
> v7 patch set:
> https://lore.kernel.org/ocfs2-devel/20261118002050.9019-1-heming.zhao@suse.com/
> v7 sashiko review:
> - https://sashiko.dev/#/patchset/20261117150053.18417-1-heming.zhao%40suse.com
> - https://sashiko.dev/#/patchset/20261118002050.9019-1-heming.zhao%40suse.com
> v8 patch set:
> https://lore.kernel.org/ocfs2-devel/20261119064029.11910-1-heming.zhao@suse.com/
> v8 sashiko review:
> https://sashiko.dev/#/patchset/20261119064029.11910-1-heming.zhao%40suse.com
> 
> -----------------------
> 
> Heming Zhao (3):
>   ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
>   ocfs2: switch DIO read path from buffer_head to iomap
>   ocfs2: switch dio write path from buffer_head to iomap
> 
>  fs/ocfs2/Kconfig      |    2 +-
>  fs/ocfs2/aops.c       | 1685 ++++++++++++++++++++++++++++++++---------
>  fs/ocfs2/aops.h       |   43 +-
>  fs/ocfs2/extent_map.c |   34 +-
>  fs/ocfs2/extent_map.h |    3 +
>  fs/ocfs2/file.c       |  314 +++++++-
>  fs/ocfs2/inode.h      |    9 +
>  fs/ocfs2/mmap.c       |    2 +-
>  fs/ocfs2/ocfs2.h      |   25 +-
>  fs/ocfs2/super.c      |    3 +
>  10 files changed, 1690 insertions(+), 430 deletions(-)
> 

