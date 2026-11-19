Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795123188;
	b=r2PUf1Qz81vThTDr98zRzK+i+wbfuuIh3KQ8vtP4V3ZaY4algiLpdko+gqvDVCbX+1Z/
	 fAj3bBGEbR/suS9siueseG1GDZXTz69tBbs+5qW1s2RGr+i/y5tMlDt+Q7YuB6c57iVNR
	 t9cHtRx7dkMbp4eFB6zfhAnsxHW1aN4Tos9bT/NpkcQbgyiG68M51B4r+9HFZk7JiVO/e
	 79HBh1FHg2tlH8bVrInUh68dAHsnkbqFwz3wNFTm7IJvLFiLe8/G1WmcSOlwuiF/rUClO
	 /cA39RdQeC8UTDyP9DmZxMNJzfzI7V5N1dcsBnHC1q17j+ueZbNtvhQ8d5CwIPfT7vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RRAMHZ4S62Yo6hlTBa8X3X3JUkjgdwr/B0EvJfR6wag=;
	b=U5fuL3ITghYjCPevCetPvUzDPYmhSA2mvbxub+x0846A2sA05DEKKcPXSnruyhZI9HCb
	 nennoIeTQjI1lGbI867L31kKwUIOMl1q/uXtA2fPFHai/D0jKgZv2rESuYwHlvZA+GOQe
	 l8gt6CG0frcdsGBDzBsBPFj1PK08V0q4ICLtbw6siR55928//0llo6c1SeXCNz457oSCl
	 MQFP7iLrKkzlV6ZpC9BzYjw0Fr9FWqvMT7fpIIuv9xyrzOzdwwvVnIyTg3zFeEakQpxmE
	 uUYJX7RpIQHf1306cf2Vik+1Y7L5ZmwN5NDSuPffccqwCvIbMBHYfNa8WAEYNqSgBGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laV1PA5+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FCE606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FCE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laV1PA5+
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso294447a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:19:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795123186; cv=none;
        d=google.com; s=arc-20260327;
        b=mj7NR4Za38E3LdcrUs4PBSdfSUdqgiiw0yVGpsoHTS8NhfJpQuZaQ0+t3v58oS3OnW
         pC4ZAKGkAXOpUuDwvToXFfPqwO7T2IJWu0F7DVjJkeACEghp1ghUCSYFjGubEM+Qyjt3
         WosYh7nzX4EoB3OyQz6amHwOlLMi933pxsO4z3db2AkwND/7sMt24OtkeXhowkdnGXIB
         gnRE1nsCx7lQFmoaGfQ6CVEKoCEwaG3DfGszu5J9CPs+NyHQRdpw/C6IKJmtmkcv/yLe
         103XrXe8LHQHoA8WYa5XRHgE/bSPx7mQHO7xYT62ywknmI1CwCs0BoCTpyq5CGipdQpt
         XTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RRAMHZ4S62Yo6hlTBa8X3X3JUkjgdwr/B0EvJfR6wag=;
        fh=gnLb/01MZOgz4OZ/GTx9//7++QhtXdx8DkvgjlfFLFo=;
        b=OnPBQA9QLiVCJ8Er9nG+r/AwKA1AOzDAoIPdaOPvnGw71Y/5dVvKU0jxwEfh/fCCgx
         7N8AMQ8nHdCc3GIJejjdgMvHnEoUp8ymytkvEZq9+H5tRpOcoZXa53Due5WA0PvJQhVZ
         6gjV//S1NFijV/xElZRXm9dydGDNXihWy3F0hpBST3aZEORKX1BuC/UttuiCxKbFbiON
         rzpQHXfq/rVafjwQ7m0QO9BEXu5+FlfJEbsYnP7frROlIQ5SyG+uBmcf8Wgyzpb5d3Tz
         SPL0Byqpk5U8mcgsEqMTp4mCPc7XJ3djzsYG4o4fA7OawEPELu/HunUUDj7gRd9oeyFZ
         jBzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123186; x=1795727986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RRAMHZ4S62Yo6hlTBa8X3X3JUkjgdwr/B0EvJfR6wag=;
        b=laV1PA5+3hmc33X0BGaxCjFqIr5MqJ14e9KVgBgQUD6w5FPHWNELug37pi66yNshOO
         UtoE7UWwEKSpcQzNeUxWJAM3bhT7HkJCAiU7OdWbJ79b6RYYSVd09QkI4F3kjHNd4uIJ
         A0KOX+/nviYNRwIn7i1u3U6DQtbJdNgm4kx11uMbKZBHvDHA07UCEtp+8s8J/3ftTkyD
         0b33uNay84cp3nATACTYqENsjxWmuERBUTYceTcNXmaT6SW5O3j5ZxtuAh/nT+jMUBp5
         kDvnqi6gOWlZGQrvzdF6yRmGtb/ByUm74fSXPlcNdy0Xq9hzQ1JF4+mE/rkIADt6bUc/
         F0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123186; x=1795727986;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRAMHZ4S62Yo6hlTBa8X3X3JUkjgdwr/B0EvJfR6wag=;
        b=YSXkKovMWQv2vdd4RSl3XvJ4sGL63lzX0g7lRnA7gLDkEuqAMonCrszdpAUxy325N8
         F6iqf6eiJMPWxtEgBUOEfCrgD/iYDxAygR53iKVeSpNT9eK8xz7EWslmSJ4GXrX6KxY8
         3bbQ5XtbLvkJZoP9KQjPDKHTzvg8UN8Dtb3TRilcbjAPMZzbdOpIi8rLSugt/GsXJENt
         HpnXgJrfVPueA4sT/1n3I21tfgJP4fBCULViMdUXm3do8kFh5Efz+vKS3X6YOToHTdzv
         vEKg6ZaLllgczXXYYHkULiaitaEyeSCFeBoomwo8XlQmLCgiNZzQzZTxP2IS5VTTE94P
         gdsw==
X-Forwarded-Encrypted: i=1; AL+hErEaq6RNTisTBOrmSLQmC1RavL1Rs1sZcPIvWBM2WcZgCuIc1W7/TWnJGUamdzflgd8KRs+THhX4b45aYOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z82I3A7EefE+dYA3xcQJyVsrCMcXlcfAt5oPv1lj3ZCtpW/bG56
	vn03gaLSz3qqgNQQg2v7zysKbmniq1wZoTxGcPoa/7/uuS8jCm94rcHEsJWdsmiqKXDNyKVYeCA
	4y7fMmb+0gdvSo88oxIyzDD8GrK8ULq46jXcMUOY=
X-Gm-Gg: AYBFou0Ny2k2QBOH2hZNEJZFSrJMK+EsIg1eLkp6IjAn/FAeyuLVZFLfMssSzPeAgqF
	luORlGiHFsBVcgcZOWThR4JjYfFLUTKh3unFIcNAjhDcUkkMfrlE7jg0oSqgyl3B/xz3ZckayK6
	bsKeJ/YT0wDsjxkBVs8evv5ZbM3/G0BpDCQ9KPZeX84GUk2xoAGuF2XCjW2zkT9oQ4NaMuRp+JY
	V7yGmiyVfF1wQtThdD+Husj5DxxM+TlDyORsXim307oX2WhhLrFJj3V2RLIo6WOP4NQUf29FJHs
	iILurxJ8nHb677oifX/zeDtJctLfmbc/nAyQPUd0O2VhMNVT21e9DUYS+Wo/mQAttusvlNUuCwi
	p9RYGRL9bf3uR7C0GPMmbWlsSbD9mpWkMh22YIT2heyoR+JqsvK+nSgj9mdTeXvfWUCCmrQ==
X-Received: by 2002:a05:6402:4052:20b0:6b5:876c:a98f with SMTP id
 4fb4d7f45d1cf-6ba37ee52e4mr405100a12.34.1795123185728; Thu, 19 Nov 2026
 13:19:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAOQ4uxjHwtZEHu9xMM6zg9niSgNdLXhAu65jA8Ai_SKVg-W2nw@mail.gmail.com>
 <20261119183039.1505892-2-ptikhomirov@virtuozzo.com>
In-Reply-To: <20261119183039.1505892-2-ptikhomirov@virtuozzo.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 19 Nov 2026 22:19:34 +0100
X-Gm-Features: Aa3M54qPR6beAzPiPDvVeM7eC1sDIvJDE2oypEtexE164vDya4GKLsVUqI-JH_g
Message-ID: <CAOQ4uxjj9inY=n-WP83_sYpuZBLKumxqiVACpseKuB2hkW-Auw@mail.gmail.com>
Subject: Re: [PATCH] selftests/cachestat: add overlayfs test cases
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Christian Brauner <brauner@kernel.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Ding Feng <dingf3ng@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 7:34=E2=80=AFPM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
> Run cachestat() on overlayfs files in four variants. The file is written
> either to the lower dir of an overlayfs or through its mount, so its
> page cache is in the lower or in the upper dir. Then it is opened
> read-only, so it is not copied up, and checked:
>
> - through the overlayfs mount: the page cache is one stacking level
>   down;
> - through a second overlayfs mount, which has the first one's merged dir
>   as its lower dir: the page cache is two stacking levels down.
>
> Overlayfs does not cache file data in its own inodes, so cachestat()
> sees the pages only if it is forwarded to the real file.
>
> Add a check_cached argument to test_cachestat() to check the pages of a
> file the test did not write itself, and bump NR_TESTS to the actual
> number of tests (it was 9 while ten were already run).
>
> The test rework and the changelog were drafted with the help of an AI
> coding assistant (Claude); the result was reviewed and tested by me.
>
> Link: https://lore.kernel.org/r/20261118123105.1247627-1-amir73il@gmail.c=
om/
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> ---
> v2:
> - Rework of patch 3/3 of v1 on top of Amir's ->f_real() patch; the
>   ->cachestat() file operation from patches 1-2 is replaced by it.
> - Add lower file and nested overlayfs cases, and a check_cached argument
>   to test_cachestat().
> v1: https://lore.kernel.org/r/20260623111533.2285005-1-ptikhomirov@virtuo=
zzo.com/
>
> The nested cases pass only with Amir's ovl_f_real() recursion fix
> (https://lore.kernel.org/r/CAOQ4uxjHwtZEHu9xMM6zg9niSgNdLXhAu65jA8Ai_SKVg=
-W2nw@mail.gmail.com/)
> plus EXPORT_SYMBOL(__file_real) when overlayfs is a module; on Amir's v1
> alone they fail with "Cached: 0".

Posted v2 with your Tested-by:

https://lore.kernel.org/linux-fsdevel/20261119211542.1509119-1-amir73il@gma=
il.com/

Christian,

Please apply Pavel's test along with the file_real() patch.

Thanks,
Amir.

> ---
>  .../selftests/cachestat/test_cachestat.c      | 172 +++++++++++++++++-
>  1 file changed, 163 insertions(+), 9 deletions(-)
>
> diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/t=
esting/selftests/cachestat/test_cachestat.c
> index 542cd09cb4434..af8fa21c90ca1 100644
> --- a/tools/testing/selftests/cachestat/test_cachestat.c
> +++ b/tools/testing/selftests/cachestat/test_cachestat.c
> @@ -4,27 +4,42 @@
>
>  #include <stdio.h>
>  #include <stdbool.h>
> +#include <stdlib.h>
>  #include <linux/kernel.h>
>  #include <linux/magic.h>
>  #include <linux/mman.h>
>  #include <sys/mman.h>
> +#include <sys/mount.h>
>  #include <sys/shm.h>
> +#include <sys/stat.h>
>  #include <sys/syscall.h>
>  #include <sys/vfs.h>
>  #include <unistd.h>
>  #include <string.h>
>  #include <fcntl.h>
>  #include <errno.h>
> +#include <limits.h>
>
>  #include "kselftest.h"
>
> -#define NR_TESTS       9
> +#define NR_TESTS       14
>
>  static const char * const dev_files[] =3D {
>         "/dev/zero", "/dev/null", "/dev/urandom",
>         "/proc/version", "/proc"
>  };
>
> +static const struct {
> +       bool lower;
> +       bool nested;
> +       const char *desc;
> +} ovl_tests[] =3D {
> +       { false, false, "an overlayfs file" },
> +       { false, true, "a nested overlayfs file" },
> +       { true, false, "an overlayfs lower file" },
> +       { true, true, "a nested overlayfs lower file" },
> +};
> +
>  void print_cachestat(struct cachestat *cs)
>  {
>         ksft_print_msg(
> @@ -117,10 +132,14 @@ static bool is_on_tmpfs(int fd)
>   * Open/create the file at filename, (optionally) write random data to i=
t
>   * (exactly num_pages), then test the cachestat syscall on this file.
>   *
> + * If write_random =3D=3D true or check_cached =3D=3D true, check that a=
ll num_pages
> + * pages of the file are cached or evicted.
> + *
>   * If test_fsync =3D=3D true, fsync the file, then check the number of d=
irty
>   * pages.
>   */
> -static int test_cachestat(const char *filename, bool write_random, bool =
create,
> +static int test_cachestat(const char *filename, bool write_random,
> +                         bool check_cached, bool create,
>                           bool test_fsync, unsigned long num_pages,
>                           int open_flags, mode_t open_mode)
>  {
> @@ -161,7 +180,7 @@ static int test_cachestat(const char *filename, bool =
write_random, bool create,
>         } else {
>                 print_cachestat(&cs);
>
> -               if (write_random) {
> +               if (write_random || check_cached) {
>                         if (cs.nr_cache + cs.nr_evicted !=3D num_pages) {
>                                 ksft_print_msg(
>                                         "Total number of cached and evict=
ed pages is off.\n");
> @@ -294,6 +313,122 @@ bool run_cachestat_test(enum file_type type)
>         return ret;
>  }
>
> +static int mount_overlayfs(const char *lowerdir, const char *upperdir,
> +                          const char *workdir, const char *merged)
> +{
> +       char opts[4 * PATH_MAX];
> +
> +       snprintf(opts, sizeof(opts), "lowerdir=3D%s,upperdir=3D%s,workdir=
=3D%s",
> +                lowerdir, upperdir, workdir);
> +       if (mount("overlay", merged, "overlay", 0, opts)) {
> +               ksft_print_msg("Unable to mount overlayfs (need root?): %=
s\n",
> +                              strerror(errno));
> +               return KSFT_SKIP;
> +       }
> +
> +       return KSFT_PASS;
> +}
> +
> +/*
> + * Write a file to an overlayfs, either directly to its lower dir (if lo=
wer)
> + * or through the overlayfs mount, so that its page cache is in the lowe=
r or
> + * upper dir. Then open the file read-only, so it is not copied up, thro=
ugh the
> + * overlayfs mount or, if nested, through a second overlayfs mount on to=
p of it
> + * (using the first one's merged dir as its lower dir), and run cachesta=
t on
> + * it. Overlayfs does not cache file data in its own inodes, so cachesta=
t sees
> + * the pages only if it is forwarded one (or two, if nested) stacking le=
vels
> + * down, to the page cache belonging to the real file.
> + */
> +static int run_cachestat_overlayfs_test(bool lower, bool nested)
> +{
> +       char tmpl[] =3D "/tmp/cachestat_ovl.XXXXXX";
> +       char lowerdir[PATH_MAX];
> +       char upper1[PATH_MAX], work1[PATH_MAX], merged1[PATH_MAX];
> +       char upper2[PATH_MAX], work2[PATH_MAX], merged2[PATH_MAX];
> +       char cmd[PATH_MAX + 16], file[PATH_MAX + 16];
> +       const char *write_path, *read_path;
> +       char *base;
> +       int ret;
> +
> +       base =3D mkdtemp(tmpl);
> +       if (!base) {
> +               ksft_print_msg("Unable to create overlayfs base dir: %s\n=
",
> +                              strerror(errno));
> +               return KSFT_FAIL;
> +       }
> +
> +       snprintf(lowerdir, sizeof(lowerdir), "%s/lower", base);
> +       snprintf(upper1, sizeof(upper1), "%s/upper1", base);
> +       snprintf(work1, sizeof(work1), "%s/work1", base);
> +       snprintf(merged1, sizeof(merged1), "%s/merged1", base);
> +       snprintf(upper2, sizeof(upper2), "%s/upper2", base);
> +       snprintf(work2, sizeof(work2), "%s/work2", base);
> +       snprintf(merged2, sizeof(merged2), "%s/merged2", base);
> +
> +       if (mkdir(lowerdir, 0755) || mkdir(upper1, 0755) ||
> +           mkdir(work1, 0755) || mkdir(merged1, 0755) ||
> +           mkdir(upper2, 0755) || mkdir(work2, 0755) ||
> +           mkdir(merged2, 0755)) {
> +               ksft_print_msg("Unable to create overlayfs dirs: %s\n",
> +                              strerror(errno));
> +               ret =3D KSFT_FAIL;
> +               goto cleanup;
> +       }
> +
> +       if (lower)
> +               write_path =3D lowerdir;
> +       else
> +               write_path =3D merged1;
> +
> +       if (nested)
> +               read_path =3D merged2;
> +       else
> +               read_path =3D merged1;
> +
> +       snprintf(file, sizeof(file), "%s/cachestat", write_path);
> +
> +       /* Write the lower file before mounting overlayfs over it */
> +       if (lower) {
> +               ret =3D test_cachestat(file, true, false, false, false, 4=
,
> +                                    O_CREAT | O_RDWR, 0600);
> +               if (ret !=3D KSFT_PASS)
> +                       goto cleanup;
> +       }
> +
> +       ret =3D mount_overlayfs(lowerdir, upper1, work1, merged1);
> +       if (ret !=3D KSFT_PASS)
> +               goto cleanup;
> +
> +       if (!lower) {
> +               ret =3D test_cachestat(file, true, false, false, false, 4=
,
> +                                    O_CREAT | O_RDWR, 0600);
> +               if (ret !=3D KSFT_PASS)
> +                       goto umount;
> +       }
> +
> +       if (nested) {
> +               ret =3D mount_overlayfs(merged1, upper2, work2, merged2);
> +               if (ret !=3D KSFT_PASS)
> +                       goto umount;
> +       }
> +
> +       snprintf(file, sizeof(file), "%s/cachestat", read_path);
> +       /* Look at that page cache through the overlayfs layer(s) */
> +       ret =3D test_cachestat(file, false, true, false, false, 4,
> +                            O_RDONLY, 0);
> +
> +       if (nested)
> +               umount(merged2);
> +umount:
> +       umount(merged1);
> +cleanup:
> +       /* Best-effort recursive cleanup of the temporary tree. */
> +       snprintf(cmd, sizeof(cmd), "rm -rf %s", base);
> +       if (system(cmd))
> +               ksft_print_msg("Unable to clean up %s\n", base);
> +       return ret;
> +}
> +
>  int main(void)
>  {
>         int ret;
> @@ -317,8 +452,8 @@ int main(void)
>         for (int i =3D 0; i < 5; i++) {
>                 const char *dev_filename =3D dev_files[i];
>
> -               if (test_cachestat(dev_filename, false, false, false,
> -                       4, O_RDONLY, 0400) =3D=3D KSFT_PASS)
> +               if (test_cachestat(dev_filename, false, false, false, fal=
se,
> +                                  4, O_RDONLY, 0400) =3D=3D KSFT_PASS)
>                         ksft_test_result_pass("cachestat works with %s\n"=
, dev_filename);
>                 else {
>                         ksft_test_result_fail("cachestat fails with %s\n"=
, dev_filename);
> @@ -326,16 +461,16 @@ int main(void)
>                 }
>         }
>
> -       if (test_cachestat("tmpfilecachestat", true, true,
> -               false, 4, O_CREAT | O_RDWR, 0600) =3D=3D KSFT_PASS)
> +       if (test_cachestat("tmpfilecachestat", true, false, true,
> +                          false, 4, O_CREAT | O_RDWR, 0600) =3D=3D KSFT_=
PASS)
>                 ksft_test_result_pass("cachestat works with a normal file=
\n");
>         else {
>                 ksft_test_result_fail("cachestat fails with normal file\n=
");
>                 ret =3D 1;
>         }
>
> -       switch (test_cachestat("tmpfilecachestat", true, true,
> -               true, 4, O_CREAT | O_RDWR, 0600)) {
> +       switch (test_cachestat("tmpfilecachestat", true, false, true,
> +                              true, 4, O_CREAT | O_RDWR, 0600)) {
>         case KSFT_FAIL:
>                 ksft_test_result_fail("cachestat fsync fails with normal =
file\n");
>                 ret =3D KSFT_FAIL;
> @@ -361,5 +496,24 @@ int main(void)
>                 ksft_test_result_fail("cachestat fails with a mmap file\n=
");
>                 ret =3D 1;
>         }
> +
> +       for (int i =3D 0; i < ARRAY_SIZE(ovl_tests); i++) {
> +               const char *desc =3D ovl_tests[i].desc;
> +
> +               switch (run_cachestat_overlayfs_test(ovl_tests[i].lower,
> +                                                    ovl_tests[i].nested)=
) {
> +               case KSFT_FAIL:
> +                       ksft_test_result_fail("cachestat fails with %s\n"=
, desc);
> +                       ret =3D 1;
> +                       break;
> +               case KSFT_PASS:
> +                       ksft_test_result_pass("cachestat works with %s\n"=
, desc);
> +                       break;
> +               case KSFT_SKIP:
> +                       ksft_test_result_skip("overlayfs not available fo=
r %s\n",
> +                                             desc);
> +                       break;
> +               }
> +       }
>         return ret;
>  }
> --
> 2.56.0
>
