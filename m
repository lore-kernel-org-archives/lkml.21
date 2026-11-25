Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.171.160.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583012;
	b=uhw6j82jYiMI81E3HwUU6WngfGVCLOZ0cncOVPvEAT7LHN/P9FUvjgYDPRdAonmj0nrE
	 waAws85kqr+0N0yETwXNTmWOqocU697ASBv7KrHpiPd7gGYcfAVjYKNdAXQgBsyUKTVM9
	 ZMo5MQRs3CBWE5Tsk0zbw+gjNfG21hk6DFxSdaxZCgYcvfRF56UdPEs1waXesi+hU2OVr
	 3sZVX4R+xxjpqQxNV36JpR03WTstySV1XDxgwQCKBvS9/wNSOiVPZCLHOAuXp6C8ZJwI4
	 18br4DY2twuY5CiXOE+BbP+eioj8tRoyms4KwfwY5CiaeBFNWPlKk9ElFnRGVXLFr+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583012;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 User-Agent:MIME-Version:Content-Type;
	bh=APcG/N7SQFWvgSRX1joG4IcuEMwIlVbeH+N5fxhYYDI=;
	b=YnHaaByy2K/W4yfmr+xadSpwMmBubHzDoMG0eRJe4xv+EgbNIYeStmy2CJpiy+Bkf31f
	 jFmUp9lKq2i/SWsRpN+iTAvlyXplES3tSD14+NzyRVaTbkkA8/xB3DTtPdh4e2bInNZ1q
	 ksq1A+/PgkTIjfBA28jWQaKWYar8dam6+3ABqDjYoel3pmoX0Rjr57cyK6Q50btIxKbft
	 7fihZPgc8+H6IBIH1mSmC4cumMbV/231K4GTHRyMjO+LkFYWLVrTXwlM/P/4WHaQzadDP
	 7kiNnWjbpUX4VKhuduqXYQJcRcaRnYfVgyBrQMySb7kNxG62DnK12OEDz1a5luoZoyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.parknet.co.jp;
	spf=pass smtp.mailfrom=parknet.co.jp;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=rsa-sha256 header.s=20250114 header.b=g9Vsapqi;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=ed25519-sha256 header.s=20250114-ed25519 header.b=19fzrGKb;
	arc=none smtp.remote-ip=210.171.160.6
Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FEC606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FEC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=parknet.co.jp header.i=@parknet.co.jp header.a=rsa-sha256 header.s=20250114 header.b=g9Vsapqi;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=ed25519-sha256 header.s=20250114-ed25519 header.b=19fzrGKb
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 23E2820BD280;
	Wed, 25 Nov 2026 14:03:22 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1795583002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=APcG/N7SQFWvgSRX1joG4IcuEMwIlVbeH+N5fxhYYDI=;
	b=g9VsapqiSlNzQ+Uho3xKwX3kfek5JGli3f44ng8dgQBtkjwExMM+IStf1HJ1iP6yDtUnwv
	fLn2/r1qSczYYRWCC77EEvHaedZEvXkOwesNsHkVHNhL/ruJIFDYu1vQlwYOZJNLzURsFJ
	RqmXhwtc6lHwzlXgPzII9fgR+Bb88LvG082msInjyO1LhXZwPmac+3znJHz6urV0boC3np
	oTs03WuEUkTuXSmb/86nCyyAPhAe+9mk7gU9r0j/w14NrMgB16OERIyxTsiVaOWMbEOR5K
	c5CBQZ6I2WYygpIV+GUrUcEyzHCNATG0QFCOsRI+HV+5osCwbHt6iU+25qe9rg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1795583002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=APcG/N7SQFWvgSRX1joG4IcuEMwIlVbeH+N5fxhYYDI=;
	b=19fzrGKbehRv/3ULVS8jX0TS4cjwrzHH9lKDJ8ZrhIlFRNXfYY8IkzCiD6HS5NF/P+DXEh
	wDAw5NTY5HniUPDQ==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id 97C4DE0008D;
	Wed, 25 Nov 2026 14:03:21 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 8761B22001A3; Wed, 25 Nov 2026 14:03:21 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: yanghaoming <yanghaoming@kaihong.com>
Cc: linux-kernel@vger.kernel.org,
  syzbot+c1b4f0f31099fb2324e2@syzkaller.appspotmail.com
Subject: Re: [PATCH] fat: hold buffer lock while reading and writing FAT
 table entries
In-Reply-To: <20261125034336.3724504-1-yanghaoming@kaihong.com>
References: <20261125034336.3724504-1-yanghaoming@kaihong.com>
Date: Wed, 25 Nov 2026 14:03:21 +0900
Message-ID: <87mrqxsdt2.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

yanghaoming <yanghaoming@kaihong.com> writes:

> FAT metadata pages are ordinary buffer_heads on the block device
> (often a loop device over shmem or a writable backing file).  When the
> VFS updates the allocation table it goes through
> fatent_operations->ent_put(), which writes directly into bh->b_data.
> In parallel, the block layer writeback path may touch the same
> buffer: __block_write_full_folio() only inspects and copies buffer
> contents while the buffer is under lock_buffer(), then submits I/O.
>
> The failure mode reported by syzkaller (KCSAN) on FAT12 over loop
> typically looks like this on two CPUs:
>
>   [CPU0, process] unlink / truncate / cluster free
>            fat_free_clusters()
>              fat_ent_read() -> fat12_ent_get()
>              fat12_ent_put() stores into ent12_p[] in bhs[0]->b_data
>              (and bhs[1] when needed) without BH_Lock
>
>   [CPU1, kworker] I/O on the block device under the FAT (e.g. loop)
>            blkdev_writepages() -> __block_write_full_folio() uses
>            lock_buffer() before touching b_data; with a loop-backed
>            volume, submitting those pages can reach the backing file
>            write path, where copy_folio_from_iter_atomic() reads the
>            same buffer memory as in the syz report
>
> There was no happens-before relationship between those accesses, so
> KCSAN reported a data race (write in fat12_ent_put vs read in the
> writeback path).  The problem is not specific to FAT12's nibble
> packing; fat16_ent_put and fat32_ent_put had the same pattern for
> their le16/le32 stores.
>
> Historically FAT12 used a global spinlock (fat12_entry_lock) around
> packing high/low nibbles.  That only serialized other ent_put callers
> in process context; it does not synchronize with the block layer, which
> relies on BH_Lock (see buffer.c: writers and writeback must coordinate
> through lock_buffer() on the same buffer_head).  fat_mirror_bhs() and
> several paths in dir.c already lock buffers before touching b_data;
> ent_get/ent_put were the missing piece.
>
> Fix:
>
> - Add fat_lock_entry_bhs() / fat_unlock_entry_bhs(): for each fatent
>   buffer, lock_buffer() in ascending index order and unlock in reverse
>   (FAT12 may use two bhs when an entry spans a sector boundary).
> - Wrap all fat12/fat16/fat32 ent_get() and ent_put() access to
>   bh->b_data with these helpers; leave mmb_mark_buffer_dirty() after
>   unlock, matching existing ent_put and dir.c behaviour.
> - Drop fat12_entry_lock.
>
> After this change, any modification of FAT table contents in memory
> holds BH_Lock for the duration of the read/write, the same lock
> writeback takes before reading b_data for I/O.  The two sides cannot
> access b_data concurrently, so the reported KCSAN race class cannot
> recur on this path.  ent_get/ent_put remain on VFS/FAT process-context
> call chains only; they do not run in interrupt context.
>
> No on-disk format or VFS-visible allocation semantics change; this
> only serializes in-memory access to FAT table buffer_heads with the
> block layer BH_Lock, consistent with blkdev_writepages and dir.c.
>
> Testing: qemu-x86-lab/repro-fat12-kcsan on parent fatent (KCSAN bzImage):
> FAT12, loop over writable backing, 12 writers + sync pressure, 600s.
>
> - Pre-fix: KCSAN STRICT (fat12_ent_put vs copy_folio_from_iter_atomic); syz
>   class; no production corruption case attached to the syz bug id.
> - Pre-fix: host fsck.vfat -n -v on exported loop image: both FAT copies
>   differ; several files show cluster chain longer than inode size; dirty
>   bit set; no cross-link / invalid-FAT structural fsck failures.
> - Post-fix (same repro, 240-600s): check-syz STRICT write+read same report
>   count 0; log stacks omit fat12_ent_put; fsck.vfat -n -v clean on export.

What does "exported" mean? If corruption without umount, it is expected
one, and this issue should affect only type of stable pages.

Thanks.

> Performance: FAT32 volume mounted vfat (fat32_ent_get/put path), QEMU/KVM
> on 1 GiB test images (parent fatent.c vs this patch).  Median of 3 guest
> runs on virtio (direct) and loop; loop is the backend relevant to syz.
>
> - dd 512 MiB + sync: ~170 MiB/s; loop -1.2%, virtio -0.8%.
> - 3000x create/unlink: loop total time -1.1%.
> - 512 MiB sequential file grow (1 MiB writes, FAT updates): loop -0.8%.
> - 64x4 MiB files, 4 KiB rewrite (stresses fat_ent_put): loop throughput
>   -0.2% (3 runs); per-4KiB latency +1.5% on loop.
> - Same 4 KiB rewrite, 100 paired before/after boots: loop throughput
>   median +0.02%; paired before-vs-after delta stdev 4.9% (isolated
>   +/-16% swings are run-to-run jitter, not a stable loop regression).
>
> Fixes: 98283bb49c6c ("fat: Fix the race of read/write the FAT12 entry")
> Reported-by: syzbot+c1b4f0f31099fb2324e2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c1b4f0f31099fb2324e2
> Signed-off-by: yanghaoming <yanghaoming@kaihong.com>
> ---
>  fs/fat/fatent.c | 41 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 34 insertions(+), 7 deletions(-)
>
> diff --git a/fs/fat/fatent.c b/fs/fat/fatent.c
> index 2d10a815a579..be2c50ebcd77 100644
> --- a/fs/fat/fatent.c
> +++ b/fs/fat/fatent.c
> @@ -18,7 +18,22 @@ struct fatent_operations {
>  	int (*ent_next)(struct fat_entry *);
>  };
>  
> -static DEFINE_SPINLOCK(fat12_entry_lock);
> +/* Avoid race with blockdev writeback while accessing bh->b_data */
> +static void fat_lock_entry_bhs(struct fat_entry *fatent)
> +{
> +	int i;
> +
> +	for (i = 0; i < fatent->nr_bhs; i++)
> +		lock_buffer(fatent->bhs[i]);
> +}
> +
> +static void fat_unlock_entry_bhs(struct fat_entry *fatent)
> +{
> +	int i;
> +
> +	for (i = fatent->nr_bhs - 1; i >= 0; i--)
> +		unlock_buffer(fatent->bhs[i]);
> +}
>  
>  static void fat12_ent_blocknr(struct super_block *sb, int entry,
>  			      int *offset, sector_t *blocknr)
> @@ -122,12 +137,12 @@ static int fat12_ent_get(struct fat_entry *fatent)
>  	u8 **ent12_p = fatent->u.ent12_p;
>  	int next;
>  
> -	spin_lock(&fat12_entry_lock);
> +	fat_lock_entry_bhs(fatent);
>  	if (fatent->entry & 1)
>  		next = (*ent12_p[0] >> 4) | (*ent12_p[1] << 4);
>  	else
>  		next = (*ent12_p[1] << 8) | *ent12_p[0];
> -	spin_unlock(&fat12_entry_lock);
> +	fat_unlock_entry_bhs(fatent);
>  
>  	next &= 0x0fff;
>  	if (next >= BAD_FAT12)
> @@ -137,8 +152,12 @@ static int fat12_ent_get(struct fat_entry *fatent)
>  
>  static int fat16_ent_get(struct fat_entry *fatent)
>  {
> -	int next = le16_to_cpu(*fatent->u.ent16_p);
> +	int next;
> +
>  	WARN_ON((unsigned long)fatent->u.ent16_p & (2 - 1));
> +	fat_lock_entry_bhs(fatent);
> +	next = le16_to_cpu(*fatent->u.ent16_p);
> +	fat_unlock_entry_bhs(fatent);
>  	if (next >= BAD_FAT16)
>  		next = FAT_ENT_EOF;
>  	return next;
> @@ -146,8 +165,12 @@ static int fat16_ent_get(struct fat_entry *fatent)
>  
>  static int fat32_ent_get(struct fat_entry *fatent)
>  {
> -	int next = le32_to_cpu(*fatent->u.ent32_p) & 0x0fffffff;
> +	int next;
> +
>  	WARN_ON((unsigned long)fatent->u.ent32_p & (4 - 1));
> +	fat_lock_entry_bhs(fatent);
> +	next = le32_to_cpu(*fatent->u.ent32_p) & 0x0fffffff;
> +	fat_unlock_entry_bhs(fatent);
>  	if (next >= BAD_FAT32)
>  		next = FAT_ENT_EOF;
>  	return next;
> @@ -160,7 +183,7 @@ static void fat12_ent_put(struct fat_entry *fatent, int new)
>  	if (new == FAT_ENT_EOF)
>  		new = EOF_FAT12;
>  
> -	spin_lock(&fat12_entry_lock);
> +	fat_lock_entry_bhs(fatent);
>  	if (fatent->entry & 1) {
>  		*ent12_p[0] = (new << 4) | (*ent12_p[0] & 0x0f);
>  		*ent12_p[1] = new >> 4;
> @@ -168,7 +191,7 @@ static void fat12_ent_put(struct fat_entry *fatent, int new)
>  		*ent12_p[0] = new & 0xff;
>  		*ent12_p[1] = (*ent12_p[1] & 0xf0) | (new >> 8);
>  	}
> -	spin_unlock(&fat12_entry_lock);
> +	fat_unlock_entry_bhs(fatent);
>  
>  	mmb_mark_buffer_dirty(fatent->bhs[0],
>  			      &MSDOS_I(fatent->fat_inode)->i_metadata_bhs);
> @@ -182,7 +205,9 @@ static void fat16_ent_put(struct fat_entry *fatent, int new)
>  	if (new == FAT_ENT_EOF)
>  		new = EOF_FAT16;
>  
> +	fat_lock_entry_bhs(fatent);
>  	*fatent->u.ent16_p = cpu_to_le16(new);
> +	fat_unlock_entry_bhs(fatent);
>  	mmb_mark_buffer_dirty(fatent->bhs[0],
>  			      &MSDOS_I(fatent->fat_inode)->i_metadata_bhs);
>  }
> @@ -190,8 +215,10 @@ static void fat16_ent_put(struct fat_entry *fatent, int new)
>  static void fat32_ent_put(struct fat_entry *fatent, int new)
>  {
>  	WARN_ON(new & 0xf0000000);
> +	fat_lock_entry_bhs(fatent);
>  	new |= le32_to_cpu(*fatent->u.ent32_p) & ~0x0fffffff;
>  	*fatent->u.ent32_p = cpu_to_le32(new);
> +	fat_unlock_entry_bhs(fatent);
>  	mmb_mark_buffer_dirty(fatent->bhs[0],
>  			      &MSDOS_I(fatent->fat_inode)->i_metadata_bhs);
>  }

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
