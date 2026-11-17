Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942849;
	b=Mjw4irW7DCjEUucK/IHVFLJ2hPZLvApz/AzHC/WnE6qQKjHQkNEiyVDHZKgfVqIqnjoT
	 LGmoiZtKw/5hq9PHYZprOyNxytqQ3N1fvZskaWg23OqcGNL8Xolh/ONvjOATCjkJqvJA9
	 Qvja+40td28HSuynD+KJB1Y30T44PD0UU9UTEYenXy03fGf2Ny1SN9YEGcwtOIzjWYu7b
	 aKm3k+CEwlegr/4dhwwO2w8SWzTdyVTjJ0saMFL76fBXB7Nq81AV7p54YMwdPpBld+3H7
	 b7OsXaT5uKIglKEdxnVQRXGAzUFW2eCtlSaGjLjpN/qE7ukBPWaLUOyQ0PJakLK10oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942849;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MjAfknxVEo6EVhQfKp67NUgJ5pBiDPDSPahd3foUmMY=;
	b=xWvy+D9o03t9L6lQfBLjdmTMWA0LQ7mBQxGlCfz+C6jejCU26J+dI7MfYbLG2XtuF6gD
	 oJQOeKQadQc2r1jXi/a7P0Tf9OogcNBA8IKQYQ7x881NWWE8xgOX7RIWPkhqS6sRkBuxI
	 uVSogKrAJPeamPslozOnDElhULEJVZJRDeBFqcquECS7cKsY7BGeR7guZ09mMnPHv39Yr
	 moMQ0IdlqgTtre9XKxqUjHaI9QeBEmiCxIR8SD9dZ769QXBXn5WDqsZN/c/lh7LeakYDW
	 xOM1t/pOphA4SGjoUzs6J9yp2Ph8L7KjXhSlqctGVHPwOFRbaNppOpollLlnamymi+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f7nBHb9e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20306606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f7nBHb9e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02E11F000C4;
	Tue, 17 Nov 2026 19:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794942849;
	bh=MjAfknxVEo6EVhQfKp67NUgJ5pBiDPDSPahd3foUmMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f7nBHb9ecyZDmSxAb5OTR5BUcHwC6S7V/RWmGcfn/fMRBkvm7y9noE6BnrTIjkrXd
	 YKJENXbFFwzSkI5reg4Lsh5TvwNghkgonqk31JFpwA+p60x8YAWHEdINxXmRbRsxNJ
	 q+epnd7TISmZGG3RSbcaGsmfB7c8c63IeGaI5QQ2GUnE6UP9JzK7oZ5anYDNBYaQW/
	 M/wmTe6RuviCFlKyovpUumNqUnAf+uQ6gueaYORCTPDA3jJkOWawG++1D+/wSjLkJP
	 96sjuYvzcozaMSPxvOI3EglSFkVrQXOLrggPL4QEwnYDwaibfdSCYBspHrKymryZzq
	 EHgS+maXsL3pg==
Date: Tue, 17 Nov 2026 19:14:07 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: set the block size of zoned
 devices to the logical block size
Message-ID: <avynfxEMXTEmCuP2@google.com>
References: <20261113200904.3010578-1-daeho43@gmail.com>
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
In-Reply-To: <20261113200904.3010578-1-daeho43@gmail.com>

Could you please fix the build error?

make[2]: Entering directory '/home/runner/work/f2fs-tools/f2fs-tools/lib'
  CC       libf2fs_la-libf2fs.lo
  CC       libf2fs_la-libf2fs_io.lo
  CC       libf2fs_la-libf2fs_zoned.lo
  CC       libf2fs_la-nls_utf8.lo
libf2fs.c: In function 'utf8_to_utf16':
libf2fs.c:127:47: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
  127 |         uint16_t *volume_name = calloc(sizeof(uint16_t), MAX_VOLUME_NAME);
      |                                               ^~~~~~~~
libf2fs.c:127:47: note: earlier argument should specify number of elements, later size of each element
libf2fs.c: In function 'utf16_to_utf8':
libf2fs.c:222:47: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
  222 |         uint16_t *volume_name = calloc(sizeof(uint16_t), MAX_VOLUME_NAME);
      |                                               ^~~~~~~~
libf2fs.c:222:47: note: earlier argument should specify number of elements, later size of each element
cc1: all warnings being treated as errors
make[2]: *** [Makefile:456: libf2fs_la-libf2fs.lo] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory '/home/runner/work/f2fs-tools/f2fs-tools/lib'
make[1]: *** [Makefile:421: all-recursive] Error 1
make[1]: Leaving directory '/home/runner/work/f2fs-tools/f2fs-tools'
make: *** [Makefile:353: all] Error 2

On 11/13, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The kernel caches a block device in units of its soft block size, which
> is set to the largest power of two that divides the device size, up to
> PAGE_SIZE. On a 16KB page kernel, it is 16KB even for a 4KB logical
> block device, so a buffered 4KB write is written back as a whole 16KB
> unit.
> 
> On a host-managed zoned device, the first write in a unit then moves the
> write pointer of the sequential zone beyond the written data, and the
> next write in the same unit is rejected as an unaligned write, e.g.
> 
>   Buffer I/O error on dev nvme0n1, logical block 24576, lost async page write
>   Error: While writing the quota_blk to disk!!!
> 
> Set the soft block size of zoned devices to their logical block size
> with BLKBSZSET, so that each write covers whole units. If it cannot be
> set and the current one is larger, fail right away instead of failing in
> the middle of the writes. Skip it for dump.f2fs and --dry-run, which do
> not write to the device, and when the page size is not larger than the
> logical block size, as the soft block size is not larger then either.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  lib/libf2fs.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 93f36ca..b0cdf09 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -922,6 +922,14 @@ void get_kernel_uname_version(__u8 *version)
>  #define BLKSSZGET	_IO(0x12,104)
>  #endif
>  
> +#if defined(__linux__) && defined(_IOR) && !defined(BLKBSZGET)
> +#define BLKBSZGET	_IOR(0x12,112, size_t)
> +#endif
> +
> +#if defined(__linux__) && defined(_IOW) && !defined(BLKBSZSET)
> +#define BLKBSZSET	_IOW(0x12,113, size_t)
> +#endif
> +
>  #if defined(__APPLE__)
>  #include <sys/disk.h>
>  #define BLKGETSIZE	DKIOCGETBLOCKCOUNT
> @@ -1047,6 +1055,34 @@ int get_device_info(int i)
>  		else if (dev->sector_size < sector_size)
>  			dev->sector_size = sector_size;
>  #endif
> +#if defined(BLKBSZGET) && defined(BLKBSZSET)
> +		/*
> +		 * The page cache of a block device is managed in units of its
> +		 * soft block size, which can be as large as PAGE_SIZE. A
> +		 * smaller write is then written back as a whole unit, which
> +		 * moves the write pointer of a sequential zone beyond the
> +		 * written data, and makes the next write in the same unit
> +		 * fail. Use the logical block size for zoned devices, and do
> +		 * not go on to write to the device if it cannot be set. The
> +		 * soft block size is larger than the logical block size only
> +		 * when PAGE_SIZE is, so leave it alone otherwise.
> +		 */
> +		if (dev->zoned_model == F2FS_ZONED_HM &&
> +				c.func != DUMP && !c.dry_run &&
> +				sysconf(_SC_PAGESIZE) > (long)dev->sector_size) {
> +			int bsz = dev->sector_size;
> +			int cur_bsz = 0;
> +
> +			if (ioctl(fd, BLKBSZSET, &bsz) < 0 &&
> +			    (ioctl(fd, BLKBSZGET, &cur_bsz) < 0 ||
> +			     cur_bsz > bsz)) {
> +				MSG(0, "\tError: Cannot set the block size "
> +					"of %s to %d\n", dev->path, bsz);
> +				free(stat_buf);
> +				return -1;
> +			}
> +		}
> +#endif
>  #ifdef BLKGETSIZE64
>  		if (ioctl(fd, BLKGETSIZE64, &dev->total_sectors) < 0) {
>  			MSG(0, "\tError: Cannot get the device size\n");
> -- 
> 2.56.0.611.g1030f0b940-goog
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
