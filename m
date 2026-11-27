Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795787446;
	b=Xa4EVY+xIugbWUQAXSdQFhZjIryjo/+llxpxST8G/J64ep07z07jhtKurCFgTNT1cAHT
	 DMmuR3e1y0ZyPJjnUyYJrBMB3CaWhl3Yh5CTRPkdG+BbakkSc1OJNlzSaMAJ2PIxiJ5cO
	 egBydrzT0PvKYJY6OQM3syY1jjFfmxvWXXBY7omBinB/g86GFH4BIjyWpYF60zgfTW/ck
	 fGsGKFjzdnnXt7FYHWdofjQtbm6VUL3LIRl01M90ZLdVU1+lNU6GCui8zl4pua3usuQ8c
	 lPkPapPHUwP/CxGt3N9CjCXvDz5dmy6c02sb2dZWQc11NumFxTHiEsGjyljYd/M7nkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ysUHtS1JOPVXZFvBA9BI4JkLMtkjsHgwftBio/O1qnk=;
	b=NqC+m2uYa/5VFE+lYxEsOJanZvbEY/ftcRfG7OaBKfjEWhjgIsLCb6rlhJyFfgpeYRyX
	 EU+3v5eC3QXyCLAq5LMxh/2Fc2bWs6srBuH4A+T1WH8jg9M/RhuELSHC3muo5t0/4fEJv
	 Fd5UkiIMtu9DXFVE28gbQG5DtROsM7VnbkJ16fxFDLmGAZZ8U3OaZQ6zXxtWiA1KfV7g7
	 zVIe4IfDWI76Xf0SOYRB5QDi6nwb5mxsGTh7skaWeDK7axQ+cqcrP0p0myEqMLA/p6qk6
	 hr3FM0xcVEudw8YlE2SNjCqf5z8BUYhOGEH3rEpYPAUpW4HD0RDusCBX5zLoyrwMBdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AV0jqjYL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F2606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298F2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AV0jqjYL
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so76660265e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795787444; cv=none;
        d=google.com; s=arc-20260327;
        b=nI1kDY3Q9uJhoxQpgVVfqvMOVQHPUTr4liT7FEFjNxxzSHCtPpACDb2M2MRs/AbTeQ
         3nkY+Xqlj/D/wsjKpntbB3fQaCN2KCe7YYgwAvT9UP/Z1x3uANcyUptW9pltm2a9gSnZ
         0Gzg8p1JRlqDewI9OstJd6vYCExAVjBrZ0j3dzny8rNKdVffO9F/A49xO0NSuxSeJL/X
         ATJHUpSyuft/TMHO8n1TSSdjib9LSjPzrXrQAm6flF0rjnCjV9Pvl2umteQqBOkYYich
         3zdur4IXVzCjqsja33dQRz+hiz1GZMjH7b53eXZeRRMaihzBrLVnPwfj0ZeNi8EVOD2N
         iDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysUHtS1JOPVXZFvBA9BI4JkLMtkjsHgwftBio/O1qnk=;
        fh=0E+lWP68UO1YsF9W3vOjDOgt1bs4Yoo6tNAc8WPhDGc=;
        b=lR4kFN1FZSMamZkw2VuaC/5S9k7N1PCTmba510GV09CakYugi8IROuq0rbur+VKcTw
         kbENiwmX1muQN+M9wapXnRt+n+F970OmAbvW8J7yPs5wbxrwC6c5sthy4X4AhxSBi4+D
         3J9ZylxIoU/CjyjT/CSalx3dSZP8dyugfQIdvzfzstop7nQqSwmBGubdSSPSKNNDwN5+
         saHW54SM30SWbSgPRPN9aHEFtyctKlHsE8Nw0gidR4gmSh9lupDyGJkPuG8S0tOKSFjT
         JjkTuo7C+qNlIg1RdQxa062Mr18QVhY+tAKR0n89+c91kGUKZYFUvEQtcNrUhs9Itb5e
         LmEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787444; x=1796392244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ysUHtS1JOPVXZFvBA9BI4JkLMtkjsHgwftBio/O1qnk=;
        b=AV0jqjYLqeALcIvCfDVGSgvYYooluOh0QXf2TSz0w8YlJrudlc/ZZGb2fTqLouH2jT
         zEqLRO/hYEN/rGwkzzDPlbn00372IuqE+4lj7nKMZh/paZ2LXlLJpRdsgCN3EALMQfLQ
         Gidzt9ospJcs80W7hnCbTTSY1M4gIRLgJmZk5QIrEtBB8GOzTMNgUGWzSCDEdPqq22pH
         gISeRQk/vk0CqUPgcssHrSkasEr7NDhQJzKpdRITakxCFzJKL6jdssPRyejkrj3ZL8iy
         xtYdIaNUTmIOMln7+ilzjUyevyqffL/3lsKvTxPI3gPn3bkScqlHr+QdzMFn6enFhmNL
         7KSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787444; x=1796392244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysUHtS1JOPVXZFvBA9BI4JkLMtkjsHgwftBio/O1qnk=;
        b=GflWuxVPLitqDwGjALAW0jadpO4IEAs6wUEXfq4HXRk9CvLXcPMQ4I5IcHEyvkwwO4
         cyymzU4I3ta96cdd5N2wyUyEQTzNcxPpu8Q1DznoiwBO7AgAz9bSh7ldNXv6fuC1oOu1
         KjXIRD16ofdEsiu4eGz9s9UBFI0E4EvuvCYJdYe+mFNNsRVxvf+QegZsLC/Bg2BSUjXP
         krSUg93Ix8kZgYWy45xHFFAko9LnycAwNjpn/eB9yf3pHgTk8BKYo6GDX5fouHu0peqW
         GSZFbXFOWqTCQgq6sL3sRS+tJiUe7RrOiF9OItQeGFjkKGRme1BaqCOK9wIdlYU08Kvv
         zr7w==
X-Forwarded-Encrypted: i=1; AL+hErFzPiuun576hu4FxpvVmbIA0IZHKwwSI5CJ5a5NkRPKXVdNScailGUpeAjZOkZyxAhMIY5JNVluPmhNCeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/evM3V5sllQLryHMkpIR59tfPk18zkNHtt8mahxOMZFnKvvX9l
	QH+IzRAo4VALf+jQSKnsVjXZQRLEnN815u407g77FJ1FOiFONhyjV8Tjca9BUmmu6wvpb/RMmHj
	AowYGHiBbUEycaQGOb5MvxEQZYO1FjZk=
X-Gm-Gg: AZFdTZd9rTW62Ch4hcQb1JWfiQ+7ZIU0VGt5Nf/l8Eg/0NDxdGq/dWixeEb+7aJ5gg+
	igYHWIFHdwnYJpxbFXzieH9z5TXBRgDBPU28DHybCf79ik+ZLBCuk5rfVP7vfBBsJO6VFO6UfIM
	sK+a/Itvmp4PRwjIwCeuUkz/79VHAxt7S76MNsHrmqplV8B/7o1Brj/bminE4EJEvD326LnXkM6
	aB4MDAEaf575yrUw07VMcJHlgtqV4aGQkcC09Q4GVWmf4w5rvQ2fAGHf0GZPoMqTMa5zAnnKWIo
	qxNd4utgiyC2aS2RFufItN+SPa+AFGfMlfjB8j++1zTWUthG6WT3U+DKHTAaI4MsYB5WzLcjqAj
	f5xjfVeHjRupKEd38S17lLZPAmt2dKr2k49NIPg==
X-Received: by 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id
 5b1f17b1804b1-4bb889238f1mr488095845e9.20.1795787444164; Fri, 27 Nov 2026
 05:50:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127095449.1379289-1-hengyul@cs.unc.edu>
In-Reply-To: <20261127095449.1379289-1-hengyul@cs.unc.edu>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 27 Nov 2026 22:50:26 +0900
X-Gm-Features: Aa3M54pzs9UePC4SrMtsV10dVkoP4V5gXL-8LG1IckG_dODnuERBCn5YN3An1fY
Message-ID: <CAKFNMo=7jdKJ=yZ5PMUfDk3GPW=KFD2GrmgqZJzN9z7q4p+sRg@mail.gmail.com>
Subject: Re: [PATCH v2] nilfs2: count new blocks that a short copy leaves dirty
To: Viacheslav Dubeyko <slava@dubeyko.com>, Hengyu Liang <hengyul@cs.unc.edu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 6:54=E2=80=AFPM Hengyu Liang wrote:
>
> nilfs_write_end() adds only the clean buffers of the copied range to
> the count of dirty blocks.  After a short copy, however,
> block_write_end() also zero-fills and dirties the newly allocated
> buffers of the part that was not copied, which is the whole range when
> the folio is not uptodate.  The write is then retried, finds these
> buffers dirty, and does not count them either.  This skews the free
> space calculation: nilfs_near_disk_full() does not stop the writer in
> time, and the reserved segments are consumed.
>
> This has been the case since nilfs2 was merged, but it used to take an
> unusual short copy, for example from a source buffer that runs into an
> unreadable page.  Commit 665575cff098 ("filemap: move prefaulting out
> of hot write path") made it much easier to hit: generic_perform_write()
> now faults in the source buffer only after a copy into the page cache
> has made no progress, so a write from memory that is not present yet
> first calls ->write_end() with copied =3D=3D 0 for each page.  As of now,=
 a
> write from a fresh anonymous mapping is accepted far beyond the free
> space, fsync() fails with ENOSPC, and the file is gone after a remount,
> together with the other changes made since the last log was written.
> On a volume shared with another user, that user's fsync() fails with
> ENOSPC too, and the files and directories that user created after the
> write are lost the same way.
>
> The issue can be reproduced on a 160 MiB disk with this program:
>
>     #include <errno.h>
>     #include <fcntl.h>
>     #include <stdio.h>
>     #include <stdlib.h>
>     #include <string.h>
>     #include <sys/mman.h>
>     #include <unistd.h>
>
>     int main(int argc, char *argv[])
>     {
>             size_t len =3D atol(argv[2]) << 20;
>             /* fresh anonymous memory: none of its pages is present yet *=
/
>             char *buf =3D mmap(NULL, len, PROT_READ,
>                              MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>             int fd =3D open(argv[1], O_WRONLY | O_CREAT | O_TRUNC, 0644);
>
>             printf("write: %zd\n", write(fd, buf, len));
>             printf("fsync: %s\n", fsync(fd) ? strerror(errno) : "ok");
>             return 0;
>     }
>
> and these commands:
>
>     mkfs.nilfs2 -q /dev/vda
>     mount -t nilfs2 /dev/vda /mnt
>     ./cold /mnt/f 256
>     umount /mnt
>     mount -t nilfs2 /dev/vda /mnt
>     wc -c /mnt/f
>
> Before commit 665575cff098 ("filemap: move prefaulting out of hot write
> path"), the result is:
>
>     write: 67518464
>     fsync: ok
>     67518464 /mnt/f
>
> After that commit, the result is:
>
>     write: 268435456
>     fsync: No space left on device
>     wc: /mnt/f: No such file or directory
>
> With this change, the result is:
>
>     write: 70217728
>     fsync: ok
>     70217728 /mnt/f
>
> Count the buffers that block_write_end() is going to dirty, including
> the zero-filled new ones, before calling generic_write_end().
>
> Fixes: 05fe58fdc10d ("nilfs2: inode operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
> ---
> I found this while comparing the behavior of different kernel versions.
> I used an LLM to analyze the problem and to draft the patch and this
> message, and I analyzed the result myself.
>
> v2: as Ryusuke asked, the Fixes tag now names the original
> implementation, the stable Cc has no version, and the message says the
> bug is old and 665575cff098 made it easier to hit. No code change.
> v1: https://lore.kernel.org/linux-nilfs/20261122130247.2069007-1-hengyul@=
cs.unc.edu/
>
> Tested on nilfs2 for-next with KASAN and lockdep, also with the short
> copy from Ryusuke's reply (1 KiB blocks, source running into a
> PROT_NONE page): the dirty block count is right, and a nearly full
> volume returns ENOSPC instead of accepting more than the free space.

Hi Viacheslav,

This v2 patch looks good to me.  Could you please apply it directly to
your tree?

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi

>
>  fs/nilfs2/inode.c |  3 +--
>  fs/nilfs2/page.c  | 41 +++++++++++++++++++++++++++++++++++++++++
>  fs/nilfs2/page.h  |  4 ++++
>  3 files changed, 46 insertions(+), 2 deletions(-)
>
> diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> index b217eee57c36..dd0bed24972a 100644
> --- a/fs/nilfs2/inode.c
> +++ b/fs/nilfs2/inode.c
> @@ -249,8 +249,7 @@ static int nilfs_write_end(const struct kiocb *iocb,
>         unsigned int nr_dirty;
>         int err;
>
> -       nr_dirty =3D nilfs_page_count_clean_buffers(folio, start,
> -                                                 start + copied);
> +       nr_dirty =3D nilfs_page_count_buffers_to_dirty(folio, start, len,=
 copied);
>         copied =3D generic_write_end(iocb, mapping, pos, len, copied, fol=
io,
>                                    fsdata);
>         nilfs_set_file_dirty(inode, nr_dirty);
> diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
> index 857926da9f21..0dec7b5b27c4 100644
> --- a/fs/nilfs2/page.c
> +++ b/fs/nilfs2/page.c
> @@ -481,6 +481,47 @@ unsigned int nilfs_page_count_clean_buffers(struct f=
olio *folio,
>         return nc;
>  }
>
> +/**
> + * nilfs_page_count_buffers_to_dirty - count buffers a write will dirty
> + * @folio:  folio being written to
> + * @from:   offset of the write in @folio
> + * @len:    number of bytes to be written
> + * @copied: number of bytes copied into @folio
> + *
> + * Count the clean buffers of @folio that block_write_end() is going to =
mark
> + * dirty: those overlapping the copied range and, after a short copy, th=
e
> + * newly allocated ones in the rest of the range, which it zero-fills.  =
As
> + * there, a short copy into a folio that is not uptodate counts as a
> + * zero-length write.
> + *
> + * Return: Number of buffers that the write changes from clean to dirty.
> + */
> +unsigned int nilfs_page_count_buffers_to_dirty(struct folio *folio,
> +                                              unsigned int from,
> +                                              unsigned int len,
> +                                              unsigned int copied)
> +{
> +       unsigned int to =3D from + len, end =3D from + copied;
> +       unsigned int block_start, block_end;
> +       struct buffer_head *bh, *head;
> +       unsigned int nc =3D 0;
> +
> +       if (copied < len && !folio_test_uptodate(folio))
> +               end =3D from;
> +
> +       for (bh =3D head =3D folio_buffers(folio), block_start =3D 0;
> +            bh !=3D head || !block_start;
> +            block_start =3D block_end, bh =3D bh->b_this_page) {
> +               block_end =3D block_start + bh->b_size;
> +               if (buffer_dirty(bh))
> +                       continue;
> +               if ((block_end > from && block_start < end) ||
> +                   (buffer_new(bh) && block_end > end && block_start < t=
o))
> +                       nc++;
> +       }
> +       return nc;
> +}
> +
>  /*
>   * NILFS2 needs clear_page_dirty() in the following two cases:
>   *
> diff --git a/fs/nilfs2/page.h b/fs/nilfs2/page.h
> index c3ba3468af5c..4ccd740966ec 100644
> --- a/fs/nilfs2/page.h
> +++ b/fs/nilfs2/page.h
> @@ -45,6 +45,10 @@ void nilfs_clear_folio_dirty(struct folio *folio, bool=
 force);
>  void nilfs_clear_dirty_pages(struct address_space *mapping, bool force);
>  unsigned int nilfs_page_count_clean_buffers(struct folio *folio,
>                 unsigned int from, unsigned int to);
> +unsigned int nilfs_page_count_buffers_to_dirty(struct folio *folio,
> +                                              unsigned int from,
> +                                              unsigned int len,
> +                                              unsigned int copied);
>  unsigned long nilfs_find_uncommitted_extent(struct inode *inode,
>                                             sector_t start_blk,
>                                             sector_t *blkoff);
>
> base-commit: 8fef1a9dec7bf58a29bc8a7ee6909ab629401cd3
> --
> 2.53.0
>
