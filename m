Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947680;
	b=seYM7zAQApSXfVCZPZ+NM+ePYqXsKZQoBTuirBWjQOZ2ozmgZYO3MQY7Y1GCMEu8BA/D
	 kcfIXUKXkHJmdz5FMKSnFvqcPwJkR9xvpbCxYLoJJQHNIF7L8aMdbKsxve8s1/0yqYhak
	 +z6hBj3pMVdkgOz/W3wgwr7Ff7kVRLP07FPt8Pq7gVozrs6lv1G78F6BF7QBHDwUelAi1
	 asfFIRtB4ag4xZU1QxmI+VLuah2rzLXfBZyg0VYfNXWLLxcbt5h1XscUvRPgHcchzGjLL
	 CSpaoTUXDYOmwOY97cnXGqCABf0hf3gUPRgysYsFa+9/uycT3bcqdIJT2BNnzu7itew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=InluYi4FIgRzU7cQ9UjJK2Uan4dDz26pVOyl8nUu1bc=;
	b=yAGuyGDAAwRBkaG0h0YhdnjOybtlZn9fpkgce8w8ezpaiOrzIvsBsB/9RxrfDP7wz8Zc
	 XTCvm/+ys3TEqTszEI2vKnJhOgbVK/f7Tp4Z7B282IOvDOeq8AcvcJo/US1s/gWR8A09k
	 cKUwNDaLZ3ZqQ+75TrTZ9YJo+/DbhQ+PrnA4yS6Gyd1GIK9DK0Nr3G2rdmb/90YrXrk0E
	 zu45pfylce8N8YjQBZ3yMq7xzlrPJ+f/xrWL8nkbff6fYOzr0s3XCyBP7B5aphM+fvKol
	 qhpW/nJUJJYX6hCaViZeuo1j2o1no3EwUmXkt4NyYsVtNeY5RKg4MHXxHWzAZfBNEAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCDt+Ft4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DB5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9DB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCDt+Ft4
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so3364031fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:34:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794947678; cv=none;
        d=google.com; s=arc-20260327;
        b=dpzN2fT7vjqJoSCh9ENwSlzx/ng4XyzPOnwOfDQI7ZAulCS+Low4wtGFGTtYezganu
         ocrLIrxMRwGomE8D2T102bSGbPylpVXVoMtOLEAN4uwphEIlXhnAwRm0UqegnEklWQZ8
         bsVOCsGQtucYN1MiuvdhXfh/57K4I6mNEaryxKCm2ya6rTzvJhmvYnp8sdb2+me6note
         xmTuQK1/ih8q/qoSxch6RZsurSSk7ZRSp8LiAEy+GqmchMfMPuamnRdzvl9iBYMoVXVl
         5+hk9xtBH87w0c5WkNAG2ne7zgXZ5xs1QW+uIiggKW2Q5EVRNK9m9BcKUGVaZiQ6K4Xb
         oH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=InluYi4FIgRzU7cQ9UjJK2Uan4dDz26pVOyl8nUu1bc=;
        fh=IuWhY7lUs8mn5eodWQHdP5czjrMrErk6TQ15b+TtD1w=;
        b=CpapOrhqbO6GQTDW/PZuzYLkactWqOQ/gi2HUxCVnC4fK2Ci0oiLi7DOIAG495n8vs
         Esmzn2rOJkTwY9c1739gw8Dk7tkpZw+sGuiooSbw5zPu67IWKq+IR2i/cqUD+yYeUmdy
         /12OHKqHn1mhQjM1R5XS7cno0ZR0r9H7tsmyvdeguZJ+RYim5xyaf40783XN9uA00hIi
         C02EQ4tiaLsZaEFLHhZCnAQFthQOGbXDXspHVVeqxHSbmLvKdQ5eyK17bg04Kpcz/HHH
         KPA5DhFCGhE/G7Zc+aTp8+/fGcjuiYpILPcqi6JV981R/olE41RyqchoAdcIEf/HLT1A
         MabQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794947678; x=1795552478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=InluYi4FIgRzU7cQ9UjJK2Uan4dDz26pVOyl8nUu1bc=;
        b=jCDt+Ft43PYumkl0Jo43YIQ5Ovi83NneOSKEsqa3xm1cfSWkrlzVU2mThxF3NAcyo4
         DSWZUDs3Tq+VwhXh60mX+QnpUHRVVjkdXUfibbCzMbDJRn/2qe0TKYaFKJxWiwJZ3mi8
         95rmhX2DDLkqInFRzE2CzKyq+c+Nx2+BBnnpeA2f1cyNVuW8qGnOPuRYUGSxw2jJWN7R
         AbOQB8SoH89D7QsvpsED8cIkBzpi7FVJ75Esb6wybzrXdccj409RV90lS4OiZ9YbIBKb
         tRSMDEUeYKqI1v1jWMzl7Dw8VFdsJ/+J+DY54Hc4zQJzBfs9CAKLWjWDLf4qAFMaEa/R
         16kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947678; x=1795552478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InluYi4FIgRzU7cQ9UjJK2Uan4dDz26pVOyl8nUu1bc=;
        b=NAxvt2U2fvGC+zpFhRJw2jZb6RvZldehQTlG2Ri9ZZSeCFDsAXgJfZ5n+9z/GGq75d
         nuQp2KwtJkmK45wey0f/07y4yoIzc9iWGkKMeZ+ecxRDwNbET3i51yxLoie3u1vHiA0r
         a2Cj+Wrmm9zY34aS5DW/fT0Uw0RZcPo+TtcFBNEvL34s6xnZYTVLwdogX4qGm7tdtPKy
         oBBG4dbkVzclftvVyqW3/D1o8mPX3d1+SzJ6Z/3JATXi18/11aM0Q04l4Stzd4T/PqhW
         9myge+DvWMOvMU2Jscf+EZI1L7C24Xk6u4RCQDoNolTUS9EGPiUleSnzBNcJj7vJJZFY
         RefA==
X-Gm-Message-State: APuU4Z926U2C2gKT550lsle1C3+uBK7fbYVIh0lgpBliSQ+6BniHlRmU
	Pnyk1Tk4IVmEs3y9BnMHHaiZ692Efq/V2RYPZnTxZ8BYNknROrYALo9jl7IzhelOKig3OoTFkC7
	VqX5Ys8Ch9WlXEShvg1GOpdklJD3i5Uw=
X-Gm-Gg: AYBFou3lvuuhrfHi6qyhz5/9CjKGyF0lQUk/hlwVrvoiQ/y0+QOqW9kYYw2EmPcDbHc
	Cdz5j44OXUUp4nRy2wiqL/lV9odUGFS2AwXnnb4vmbcHeFy9ZJ54Kvhv65IEvcBWLlc0+tjKK1i
	Cs4YNP9Vf9g0uDz+0N7u0k7o9Y8fpq6gp1zExdlSr+Q+fFpw3igKwGxD2lKOUcN+aTNiX6Z6m9o
	Yb+UvlI+cbUhMZtHvNvNbZaJCujWKuv0+fCktrwDQ7adA6t+I1PFqtHp+G2ZR5Gm0OEUnA22PHq
	ER9IoKmqPmMGBGaJie1ckHQYl0klOZ6Exr6/3/KRW52YIQjR+itX2a+/HKzi2tWIm5uKvcNfypu
	H2ujSaS4BvrsZfGKmiWrr8jUzY6/fS+E6Zg+VBzntvh3PDDi31ya4b/RJy1TU43oJM/PXtG+kCh
	izKT8vLzL21H7rPYm2mZ4N8ek=
X-Received: by 2002:a05:651c:31d9:b0:3ae:6455:68e2 with SMTP id
 38308e7fff4ca-3ae66ebaa22mr1343341fa.0.1794947677421; Tue, 17 Nov 2026
 12:34:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113200904.3010578-1-daeho43@gmail.com> <avynfxEMXTEmCuP2@google.com>
In-Reply-To: <avynfxEMXTEmCuP2@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 17 Nov 2026 12:34:24 -0800
X-Gm-Features: AclHuK_A9Qul4ih4SdVEYaTEMucJ7OBq27Z1uR_7wL6VgbLQ3YLxUI2bYTSyrpE
Message-ID: <CACOAw_zWvD24R77sbKSgoStuXwZQc_5FgDmSVTrF3X+OEZvcsA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: set the block size of zoned
 devices to the logical block size
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:14=E2=80=AFAM Jaegeuk Kim <jaegeuk@kernel.org> w=
rote:
>
> Could you please fix the build error?

Hi Jaegeuk,

The build error is not from "f2fs-tools: set the block size of zoned
devices to the logical block size". These calloc() calls are in dev and
master as well, and gcc 14 or later reports them: dev-test without that
patch fails in the same way with gcc 14 and 15, and builds with gcc 13.

If you want, I can submit a fix to resolve this issue as a separate patch.

Thanks,

>
> make[2]: Entering directory '/home/runner/work/f2fs-tools/f2fs-tools/lib'
>   CC       libf2fs_la-libf2fs.lo
>   CC       libf2fs_la-libf2fs_io.lo
>   CC       libf2fs_la-libf2fs_zoned.lo
>   CC       libf2fs_la-nls_utf8.lo
> libf2fs.c: In function 'utf8_to_utf16':
> libf2fs.c:127:47: error: 'calloc' sizes specified with 'sizeof' in the ea=
rlier argument and not in the later argument [-Werror=3Dcalloc-transposed-a=
rgs]
>   127 |         uint16_t *volume_name =3D calloc(sizeof(uint16_t), MAX_VO=
LUME_NAME);
>       |                                               ^~~~~~~~
> libf2fs.c:127:47: note: earlier argument should specify number of element=
s, later size of each element
> libf2fs.c: In function 'utf16_to_utf8':
> libf2fs.c:222:47: error: 'calloc' sizes specified with 'sizeof' in the ea=
rlier argument and not in the later argument [-Werror=3Dcalloc-transposed-a=
rgs]
>   222 |         uint16_t *volume_name =3D calloc(sizeof(uint16_t), MAX_VO=
LUME_NAME);
>       |                                               ^~~~~~~~
> libf2fs.c:222:47: note: earlier argument should specify number of element=
s, later size of each element
> cc1: all warnings being treated as errors
> make[2]: *** [Makefile:456: libf2fs_la-libf2fs.lo] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[2]: Leaving directory '/home/runner/work/f2fs-tools/f2fs-tools/lib'
> make[1]: *** [Makefile:421: all-recursive] Error 1
> make[1]: Leaving directory '/home/runner/work/f2fs-tools/f2fs-tools'
> make: *** [Makefile:353: all] Error 2
>
> On 11/13, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > The kernel caches a block device in units of its soft block size, which
> > is set to the largest power of two that divides the device size, up to
> > PAGE_SIZE. On a 16KB page kernel, it is 16KB even for a 4KB logical
> > block device, so a buffered 4KB write is written back as a whole 16KB
> > unit.
> >
> > On a host-managed zoned device, the first write in a unit then moves th=
e
> > write pointer of the sequential zone beyond the written data, and the
> > next write in the same unit is rejected as an unaligned write, e.g.
> >
> >   Buffer I/O error on dev nvme0n1, logical block 24576, lost async page=
 write
> >   Error: While writing the quota_blk to disk!!!
> >
> > Set the soft block size of zoned devices to their logical block size
> > with BLKBSZSET, so that each write covers whole units. If it cannot be
> > set and the current one is larger, fail right away instead of failing i=
n
> > the middle of the writes. Skip it for dump.f2fs and --dry-run, which do
> > not write to the device, and when the page size is not larger than the
> > logical block size, as the soft block size is not larger then either.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  lib/libf2fs.c | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> > index 93f36ca..b0cdf09 100644
> > --- a/lib/libf2fs.c
> > +++ b/lib/libf2fs.c
> > @@ -922,6 +922,14 @@ void get_kernel_uname_version(__u8 *version)
> >  #define BLKSSZGET    _IO(0x12,104)
> >  #endif
> >
> > +#if defined(__linux__) && defined(_IOR) && !defined(BLKBSZGET)
> > +#define BLKBSZGET    _IOR(0x12,112, size_t)
> > +#endif
> > +
> > +#if defined(__linux__) && defined(_IOW) && !defined(BLKBSZSET)
> > +#define BLKBSZSET    _IOW(0x12,113, size_t)
> > +#endif
> > +
> >  #if defined(__APPLE__)
> >  #include <sys/disk.h>
> >  #define BLKGETSIZE   DKIOCGETBLOCKCOUNT
> > @@ -1047,6 +1055,34 @@ int get_device_info(int i)
> >               else if (dev->sector_size < sector_size)
> >                       dev->sector_size =3D sector_size;
> >  #endif
> > +#if defined(BLKBSZGET) && defined(BLKBSZSET)
> > +             /*
> > +              * The page cache of a block device is managed in units o=
f its
> > +              * soft block size, which can be as large as PAGE_SIZE. A
> > +              * smaller write is then written back as a whole unit, wh=
ich
> > +              * moves the write pointer of a sequential zone beyond th=
e
> > +              * written data, and makes the next write in the same uni=
t
> > +              * fail. Use the logical block size for zoned devices, an=
d do
> > +              * not go on to write to the device if it cannot be set. =
The
> > +              * soft block size is larger than the logical block size =
only
> > +              * when PAGE_SIZE is, so leave it alone otherwise.
> > +              */
> > +             if (dev->zoned_model =3D=3D F2FS_ZONED_HM &&
> > +                             c.func !=3D DUMP && !c.dry_run &&
> > +                             sysconf(_SC_PAGESIZE) > (long)dev->sector=
_size) {
> > +                     int bsz =3D dev->sector_size;
> > +                     int cur_bsz =3D 0;
> > +
> > +                     if (ioctl(fd, BLKBSZSET, &bsz) < 0 &&
> > +                         (ioctl(fd, BLKBSZGET, &cur_bsz) < 0 ||
> > +                          cur_bsz > bsz)) {
> > +                             MSG(0, "\tError: Cannot set the block siz=
e "
> > +                                     "of %s to %d\n", dev->path, bsz);
> > +                             free(stat_buf);
> > +                             return -1;
> > +                     }
> > +             }
> > +#endif
> >  #ifdef BLKGETSIZE64
> >               if (ioctl(fd, BLKGETSIZE64, &dev->total_sectors) < 0) {
> >                       MSG(0, "\tError: Cannot get the device size\n");
> > --
> > 2.56.0.611.g1030f0b940-goog
> >
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
