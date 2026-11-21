Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795222228;
	b=lVnsyNFdc6/2r64Oo3w8FkQIaFhocVwOmzBlLPtJJhncvZgRQ3bMqXJn8dpqsI4X7rqX
	 NYC1eTpNSx9jbeFAKlV+DYbDRRCFjXjQtxVav4PNIGuqTYUHR1ugtT9HuHDeD3zgJP0sd
	 IbggRUVw1IYNCcGtrarA8wwME2GJ+mazOyxm7/YwhpMziQts0nre8mK2625qmeHs3L2bu
	 odT9Up3TsnrEaYpOpXw5wLmrAOJ3nrUPyZwZ51TQ9M75RNWbLlCmJYYfNOTIPy/q0WBeu
	 pPS+T6gTlL5hog8FZjGkt16jOSbm4oxhfvKuhg9G5ZS7b/vbozqQdx4vlHWlKUinPDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iqTE5jp3Bza3ytzjTemgIJyEzZnCoev1iwuFO5Yvh4A=;
	b=j65mpglWfpb5sxhgaraNlokt6i3VQGRl+d1Eq2wBF7/dNZ35yVF2SEQssfsjTKUvPh9S
	 P9mcZyGlSJF3ZB8qM65Fzo4itiV8mv9JW47DVHZa64BMWEQDjO9HDpxqPqLV+Dw7t67eO
	 FTObVyG4ryJ+PFr2+PjOd13v94QjgkgwfOsO8gU0MWfq0vKgZRAXcWy560Aimn4vZMczU
	 ZVNaEESSQh8eQwVs6edga5BBR/ka7VOK9/VRGJhPdwNQwxzZZfPV9GpGqvDD6zNdx971R
	 DSdwONJmKNldTU7DS8pIaZG7Q5gyTdUBoTdLbQMiguZSzYoLl48y5IIoec6r0I0A24Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WTl7g/ki";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E70D60A2600
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E70D60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WTl7g/ki
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso1766805a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795222225; cv=none;
        d=google.com; s=arc-20260327;
        b=WrjuX3z3wbe0SnBuEMtbqBEaZc+1ZbCJ7IXlObaL1Lvd/VTq2MoOXRSU0mFdQio5Tr
         3yBscjrs0ldElmx+aPIstvlHelt9KFaz3qK2+bZu0QCRLeKXg/zI8sxyqShIhOHXo1ev
         6vbzK6I9Bvj7+cmYsMjijQDXeFuyXBRV3M42S9yooYSJefNOwcpZPfzUVviNPct6QLeX
         W6buo5BoDIshFAlPrAD1qbmB0ArKC7At4zzbv2W/JyJhQtSlAn5/xKG7jNAZOjKGPqTY
         8abPUjUCOXisidsM8M70rWbG+8aD4IfcfMnq9WCBSwYNI9n4EeaI98QFeiVyzqCxHUyp
         FG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iqTE5jp3Bza3ytzjTemgIJyEzZnCoev1iwuFO5Yvh4A=;
        fh=jHZ0PczI1bBzgqAuzH79HdQHNI2E0QZYwbstYmEr2Bc=;
        b=YLe/utpe9afIUKrbBOvy+st00HY9alk+bPCpo0risVye19MSOL8grWj/w+rTs/tXQk
         v3IlfQgO7qpdwqSWEzpV2FFpiVyD8M7aeskrqRii3S3ir1SEk5UFvreoXUayo5Qh/Tfh
         fliZPEzQ3NmwGSs/qzgcP16pyxwAqH7KKycVY3Olbirh14H/aV48nzd/aCJoUe+x7SmY
         adKtc/+j9+CQTZnrS1PW3DxjC3nQAvCAbwyQ6hHbjuod1y+0EBKcIVSshOEJYldDulYD
         Ch/O4LL+agYiTAn3k9VsRIn+XbWXnyermil4LpZJWz32wAoVbSurNgpPeozbjrXPeUlu
         1k7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222225; x=1795827025; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqTE5jp3Bza3ytzjTemgIJyEzZnCoev1iwuFO5Yvh4A=;
        b=WTl7g/kiy+SOUYfbzX0gVDtVMdqSpTpX18xebz2fUY8n6zqvVwNnd7y+UhGjMuR86k
         cbBBAl4Rpjn6TgWuytsVnV9y1pfCHcReEcGN0INj+2J34WQawjFxCu+7pI5Xn+OV1RvC
         VZoP/J823WtANbDMRZ+RXWZqYKrIOF4C3keyH5BuCvxJQIQ+EFG+VurP/TTLLDgY+rar
         0ahOXRDeBV7sZDRHVJFPYTnOdOHenegMPKqgT3M6Ya9mpyUXzl9ErfHJJXqFzGPiyq3l
         5d+E5nbD4Ren4Dl8RmVCPJr8TsUHjDofxDm42/ykusSAD2yKZC0iEVr79wou5/0ssowK
         2FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222225; x=1795827025;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iqTE5jp3Bza3ytzjTemgIJyEzZnCoev1iwuFO5Yvh4A=;
        b=qqsq+Iuznoa2FSrRgS6O0LLq8ZGtsrmyNCFV+APKhXo3z375GMTB4FhTBjqS40nLsh
         tNnliuxphBJIV/QPgNmCO9eOn6pwO4AjDr6o4z4Ln4MsHLkCc3tklzgzFam4AxVGeGBh
         KXV7Y9Wd/BKLtdicWRu/cK2VM6gYTDDlkqt9ateqCC9bavJMuDwUNWz2sUfTFhdpPtp3
         U27hepJBxxgSmSOKzdkcRbw/z3o22wS8tuwkbMQCmdVjyIrm+/LpIJC2IBJUpb/bV2um
         y17Q5qBi4JXoCNpPlencyVQB1Xs46OZqGNo7/yr5VVBZ4rJeuZf9yes+4et8vOp+ZZ+y
         FmFQ==
X-Forwarded-Encrypted: i=1; AL+hErFKKAhRbU135p8EhqxANHSAaFCGUudgKSZrjaBgOAprlqX2ILqHVULXQdxIlX5Cb5FhEt6nL/2xzrn2Axs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J1daNMMxRILBftXJxrIKUQQnjC/HfWL2XQaFbawzpbSift/7J
	TiKbuYxb2lg7ktU1r4ewigIy32F533msHvy0wyIfBdAyJjBfjNiVWPM9kbUm7EH9rWYyK41j3Ib
	0zqnXaAk4KKpWr873GkdkDLj0nRGuvfUIf13U
X-Gm-Gg: AZFdTZe9HBLB34kKyixmxF+DC6XK3x9pBcQKIVggVEpxUnEqxxPOhBUz5KdhdzzMTOv
	8ISu2p2vaBdpr817vE9I/OA1SS6V5atiFkvlwAPn+bXVxkv9Zd74UUDVZ898y1iXHUBCR7y9PI4
	KGQh9qWKz6b88FWhwLcGJee2TPt2tYS9nyJsluvVN3ORovkrjpNXByKUm9KnGd8H6qKIMdtB7ON
	55hpqUdOdXxULgR1gC6XaMPQ85HbNRqbIWOiAFvYKAEANmCHSamIbYVb0wBRYrbD7/KxHSJ5Urp
	R7dz8WLP/2YH8Pn1rtGNckLIbRG5HgZGrL/JkaeaTSZb1C/Ww3HWUdTk+FcgGGGeAkG/Y3def0X
	0gYo9ZhBC2GxjD01CPXOM0QBELLBMVyF44kv2+hsLkwY+14Itd9m6RhnP3mMV
X-Received: by 2002:a05:6402:2046:b0:6b7:749:4bff with SMTP id
 4fb4d7f45d1cf-6ba37e81887mr2868207a12.26.1795222225243; Fri, 20 Nov 2026
 16:50:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121003356.290201-1-technoboy85@gmail.com>
In-Reply-To: <20261121003356.290201-1-technoboy85@gmail.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Sat, 21 Nov 2026 01:49:48 +0100
X-Gm-Features: Aa3M54riaCEWFwXTktSbfzqeuT3IodXupdwqKrEwzt88Kf_vZI7TBflZsHqS66s
Message-ID: <CAFnufp2uT0D8-5jw3DLhQzdfpB=eSuzhmGdmDqoB7arExaw9jw@mail.gmail.com>
Subject: Re: [PATCH v2] fs: shorten I/O that would extend past the maximum
 file offset
To: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Ding Feng <dingf3ng@gmail.com>, 
	Jens Axboe <axboe@kernel.dk>
Cc: Paul Eggert <eggert@cs.ucla.edu>, LKML <linux-kernel@vger.kernel.org>, 
	io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno sab 21 nov 2026 alle ore 01:34 Matteo Croce
<technoboy85@gmail.com> ha scritto:
>
> rw_verify_area() fails with -EINVAL any read or write where
> pos + count would exceed LLONG_MAX, even when pos itself is valid.
> Such a request should not fail: a read should return the bytes that
> are there up to the maximum offset, or 0 at end of file, and a write
> should write what fits and return a short count.
>
> This breaks ordinary programs that read a file up to an end at or near
> LLONG_MAX, even with ordinary buffer sizes. For example, dd fails on
> the last block, where it should get a short read, and cat fails where
> it should get end of file:
>
>   $ truncate -s $((2**63 - 1)) hugefile
>   $ dd if=hugefile of=/dev/null bs=1M skip=$((2**43 - 2))
>   dd: error reading 'hugefile': Invalid argument
>   1+0 records in
>   1+0 records out
>   1048576 bytes (1,0 MB, 1,0 MiB) copied, 0,103536 s, 10,1 MB/s
>
>   $ (dd bs=1 skip=$((2**63 - 1)) count=0 status=none; cat) < hugefile
>   cat: -: Invalid argument
>
> The same happens on a 100-byte file:
>
>   preadv2(fd, 200 bytes, pos = LLONG_MAX - 50) = -1 EINVAL
>   preadv2(fd,  50 bytes, pos = LLONG_MAX - 50) = 0
>
> With a large count, the range crosses LLONG_MAX even far from it:
> splice() of a 20 MB file with a count of 0x7FFFFFFFFF000000 fails once
> the position reaches 16 MB. sendfile(), aio and io_uring fail in the
> same way as read() and splice().
>
> Files with FOP_UNSIGNED_OFFSET, such as /dev/mem and /proc/pid/mem,
> have the same problem at U64_MAX, their maximum offset: a read or
> write that starts below U64_MAX but would end past it fails with
> -EOVERFLOW.
>
> Add rw_clamp_count(), which shortens the count so that the range ends
> at the maximum offset, LLONG_MAX or U64_MAX for files with
> FOP_UNSIGNED_OFFSET, and call it before rw_verify_area() in the read
> and write paths of the VFS, splice, aio and io_uring. Where the I/O is
> described by an iov_iter, truncate the iterator. This is what
> filemap_read() already does for s_maxbytes. In io_uring, also save the
> iterator state again after truncating it, so that the short read retry
> loop does not restore the full length.
>
> A read that starts at the maximum offset returns 0. A write that starts
> there cannot transfer anything and still fails in rw_verify_area(), as
> do negative positions on files without FOP_UNSIGNED_OFFSET and counts
> above SSIZE_MAX. For files with FOP_UNSIGNED_OFFSET, the file's own
> read and write methods still decide how much of the shortened range
> they can actually transfer.
>
> rw_verify_area() keeps its check, so callers that are not converted
> behave as before. copy_file_range() already clamps the range in
> generic_copy_file_checks() and is not changed.
>
> Reported-by: Ding Feng <dingf3ng@gmail.com>
> Closes: https://lore.kernel.org/linux-fsdevel/20261120051457.47753-1-dingf3ng@gmail.com/
> Suggested-by: Paul Eggert <eggert@cs.ucla.edu>
> Link: https://lists.gnu.org/archive/html/coreutils/2025-12/msg00097.html
> Link: https://lore.kernel.org/linux-fsdevel/20251219125250.65245-1-teknoraver@meta.com/
> Signed-off-by: Matteo Croce <technoboy85@gmail.com>

Forgot to re-run get_maintainer.pl after the io_uring change

Regards,
-- 
per aspera ad upstream
