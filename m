Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440349;
	b=l/iw/wpCFNBi8D5OCH45LwbV5QrGgtxikO3UgnDLyK6BNJv2tbsCZMZk62OeADfX6a5J
	 CF9o20VXt3TXvIYcBWvHkBCqLjMa/SwfD5EFepuUzpIdxgps4JKcbxjFQ7N1LGDB3tt+u
	 mBXtkKQ5/NfbNThsFCVRt10ULfYGYZCKX2xpOridRaxgnaFF3mpgb4z68m3yI1x6yO9Q0
	 JgDxKIMFD8x3Qk4dcdQeNGq+hMVRVUZEsAOc49JSrzW5RADpHXOCG4C+02Z31PI0aeMCS
	 JBCe8kCsx95BoQPnAw6QUzRFyV3tVvHRQWkKnJY8otzPojgU8trr4taQqE5uI82dKXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440349;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=T8O+IMwq73DKWaCETyOUwPWWKedm3WPb1gOuS1Bq/z8=;
	b=IkCxrAJOZSf+yKo7iwPW1SuUByZS75Q9wYNKe/PUxtQKhgkQVfqsWLk1nUoMZaIAvPEs
	 AAOOrXSInx8qQ91d/orkRGOxDoCJjB86NgdPoAwcS0iKYXZL5AYp2TMmLAjgQA8gSMfJE
	 0LqE10SdTVD2vBtdGXS21rH1Qg+HB55VB4xZKhHkTIVw4+qotj0NHb3r3taIwGO3L44Kj
	 Cw+Twg/qgjxdS9kn8usQLydsD2+SU5vdoAjNffracF7FnY4pGPa2OaBZ1nnP4DXVcQRdH
	 0xR5F6y3V1ijeAV3+YxNYN44TBN68DGXm4/bmE3tdl3XuZlfvofDfXfvBWyu2D/uxog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FGTtzTx3;
	arc=none smtp.remote-ip=95.215.58.93
Received: from mta1.migadu.com (out-93.mta1.migadu.com [95.215.58.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFD6606A6AF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AFD6606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FGTtzTx3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tbk+drw3u/7c7rBBUEyK6aW4QMPAthoqFlpaZ0IfUX0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795440346; v=1; x=1796045146;
 b=FGTtzTx3q4OFAVR/gAWAxcgk3jOxgvIE+1fQNhh9qU7QPRmJSAXE6TLBk7Dv/fcxuz0DT5tk
 Dsm/CheLo0lLn6204WzAQ6axIZ7takzksnZjCEYD6/oUkB8ZDzM9kF2ulyKCbZ+DLCdfjvni9Qv
 rQ2HqxJTcxyPkh/nv5G21iSY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 30c0ddf016deec71;
	Mon, 23 Nov 2026 13:25:39 +0000
X-Mizu-Trace-ID: 30c0ddf016deec71
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 14:25:35 +0100
From: "Pankaj Raghav (Samsung)" <pankaj.raghav@linux.dev>
To: Breno Leitao <leitao@debian.org>
Cc: Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Hannes Reinecke <hare@suse.de>, Pankaj Raghav <p.raghav@samsung.com>, 
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] iomap: don't update i_size of block devices on
 buffered write
Message-ID: <awQ-uwPzYYEVJxjz@quentin>
References: <20261120-iomap-bdev-isize-v2-1-f25cc668fbc1@debian.org>
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
In-Reply-To: <20261120-iomap-bdev-isize-v2-1-f25cc668fbc1@debian.org>

On Fri, Nov 20, 2026 at 12:24:39PM -0800, Breno Leitao wrote:
> We are seeing this warning on an arm64 linux-next host while the ublk
> selftests run (stress_01 deletes the ublk disks under fio buffered
> writes):
> 
>   WARNING: mm/truncate.c:902 at pagecache_isize_extended+0x37c/0x490, CPU#40: iou-wrk-3496756/3497370
>   Call trace:
>    pagecache_isize_extended+0x37c/0x490 (P)
>    iomap_file_buffered_write+0x38c/0x5d0
>    blkdev_buffered_write+0xcc/0x138
>    blkdev_write_iter+0x32c/0x4e0
>    io_write+0x77c/0xff8
> 
> The theory is that the disk shrank under the write. del_gendisk() sets
> the capacity to 0, which writes the bdev inode's i_size under
> bd_size_lock only. A writer whose mapping predates that reads
> old_size == 0 in iomap_write_iter(), sets i_size to pos + written and
> calls pagecache_isize_extended(inode, 0, pos). blkdev_buffered_write()
> holds i_rwsem shared, so a writer at a lower offset can store a smaller
> i_size in between, and WARN_ON(to > inode->i_size) fires. Even without
> the warning, the write path regrows the size of a dead disk. The block
> layer owns that size (bdev_set_nr_sectors()), and blkdev_write_end()
> never touched it before the switch to iomap.
> 
> A reproducer on linux-next supports the theory: 128 threads doing 64K
> buffered writes to a loop device, while another thread flips its
> capacity between 1M and 1G with LOOP_SET_STATUS64, hit the warning 6
> to 18 times per 30 second run (4 runs). With this patch it never fires,
> and data written through the page cache still reads back intact.
> 
> Skip the size update and pagecache_isize_extended() for block devices.
> 
> Fixes: 487c607df790 ("block: use iomap for writes to block devices")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Looks good,
Reviewed-by: Pankaj Raghav (Samsung) <pankaj.raghav@linux.dev>

--
Pankaj
