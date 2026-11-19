Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795128309;
	b=3AYGRUPpPsOg1KGyfwrvKsK2ZpLfPqVcEig6gNAsqR3b/Z7hWSyXuDk4wLzaOEuuYeBJ
	 odJYA1Rad3Wsp3u0dm/SQrfCxgNDjKeffA0T6GVY1NbfmfsW2uBUEmpfZ2IbFi2LzVlGX
	 vJIrSJp5H0OYtklEzwuCudlMIMBJHZVjZq8BexZ01RTN8xFR/Gsan8yH7LtCzgCgUIvd2
	 NZmw/o6FX9q7miCIYHHNxWAJKVhkFQG6KgF3LvQgnmXizdaMgVre1X+aqnAmCxe0KMohg
	 3Cb8nU5IVfLKI0KG52Tdug1MmQsQ+vgcjq5vnQgCKw9hq2c00B+fB+Hs9Eo27XypF1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=loFCLmyZ5e+oKb4lypNtX85tyQq3Dij1rucPTMpgb8M=;
	b=kYSmXrkBjQ4v0kgNdFGAP0CeTS828cfZhHq8k1cxKRvN0VPotcfPNHYCV3AjqNlQLNm/
	 HqZMwYp2IMUcl5ADepo/jF9g/2cbuOdXmQ//aVvt1210jLsDu92hzKBlVqyxiTb2DGcrj
	 i7hqB39uLnq+a7X3R0rrYOShjHA1qjaJw2I0VSpEzeqV3qQwECn2FmpVh2jQFkZpMV8/q
	 TrbyTYL+qEUTWr85EdLJYtCi1nt3ysNgCHKLdmZ8ynM1OBiWIu2msHxbjAYrjZssyxPo4
	 QciYk8R08zbxnNVw/H8c37CNFbs/FlUx8HupNQ1n1BFPoNUp2l3Lh4qwuwdifiUZwNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=KXOZo9ps;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96D606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE96D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=KXOZo9ps
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6dd8e918218so4517eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:45:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795128308; cv=none;
        d=google.com; s=arc-20260327;
        b=hGz8UvfDu4hc/M69A9v0lEQbuH73Xv5cZ/dCWaxNx9bSvs+r89ZGeTiHDYUSgTb6Nu
         mblz9XcA8ZMqeMsTmOjQdkYV619pm6tlrmhlzStzirn8s+aNlEw8/SvnJQhEgKOhIFTE
         iglvY7f8PEN2oi2cmWVyOenCF0GmCxVaaehQZsas7xwjOHfy/05TiTvSu/EKvxHHLpIY
         YzeZPHf1eFVRzO0ydO0zNmCQ/HhwKLVDqPQwvMsZe1zbGKiAnhz3M1MOq5JsOEWJijU8
         cOaEdjCYajsCR1XMMGcnzOCRxUMTGuYqJIAZ/dG3nBRJbK4HZjWPAG2F208j6yw02czz
         a2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=loFCLmyZ5e+oKb4lypNtX85tyQq3Dij1rucPTMpgb8M=;
        fh=e4OBC0yoU6PcNxvMkp/f300aPn8zi4/brJ+7vu10ISU=;
        b=dxBgIm1MTTRD4qc85V83fy4Aq7rzuDbrh2mWY8VBqEAfR3CkaF2fADqtjTcEsbipyN
         hr0WI2Pe6XKC8PAevQyaiC4XgJG7j11jAmtDxclrIlMJg2VPldkAmB7Nfkm9yG2xJXcp
         7rEUnJkBGj8xqxwFDTDEiAlV1okkxcZV2xeyP0dzz9j3txAvbBSmyzUt0KazKVpzyh8h
         9g/ZiC4b8u6ETRlanicw7tUtZZxXtpEUcVKXbqzO4z0YfhlzymlGxfVXhFPNafbw1t5F
         a+EUAmu+PsIZAVXKEe3UQ3FD9DKW8fOMArfM/xUcZIGs1s9z6InE8jIYtj6E855bhDp4
         FaAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795128308; x=1795733108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=loFCLmyZ5e+oKb4lypNtX85tyQq3Dij1rucPTMpgb8M=;
        b=KXOZo9psIU6r6nzPhsiwozZ9n7/gAyN4ytjOxdjooTyzKsZcy/lZucgv0+wbwtyF9r
         +Kz3w5V1elSsQzc3TFaBiqDX1B1ltUIr+KLi6KV7fMQqvZ5wsMfUwuVMq2xvWwK0Z4PI
         HTyxomcP5+VrDT03sxWLsqzO9hRbrHjZRR/kF0SoF1RdJkQJ89KYlJbqTwTo5q7QRd0Q
         baW5Eai40WVuc8nJnPbf4lQCEeadtXjxLdArnZdETCi76Flqos5jZBnz1sYr/MES8lJ3
         Myxm5KhtjVBtKaQQsmMsGgQjvHq6u3k9siLRw8Wdau+K+ScKxN29sMvQbV+4MgjChFTT
         0wiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795128308; x=1795733108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=loFCLmyZ5e+oKb4lypNtX85tyQq3Dij1rucPTMpgb8M=;
        b=O28G3X5vTrdlGoRr/Yg35JL41w6YXCIDQzeJE8waBYHODmc+oGJFYsQM0tvT8GS4qH
         QWzOBRDCvKBlUjW/346uW/Wy+JV8gzH8UQa2dlMdlssKEQrMRRFDx6+w7z4vmvMh10Gm
         VYuwiNSrtJ34OERdh407O3Vx3+Mfx4MCK07dVUrxeHheDjP4HD7AEDjWgWhft0dp4bW2
         HY+AB6vRB5BqnnPWcxl170eD1fLwUITxR9TATZp1tj35XzuDJGqxAmBLkAHUHEnNvPvq
         DtYq/NzvmnzMVMuXHeKSKM3T4XH01TOoI4EN/He+6lBG80kqw1h21oTS3RbjoE/ABuwC
         /B9A==
X-Forwarded-Encrypted: i=1; AL+hErFfcaI8wNTYADZM+gN42p5D6tZ1+XNAzI/SVQ6Q3gc1xIn1Z4USIDagPg7RtCDT8F0jUo/H51LduYv0YzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JK8yhucPCe47WD/8XHrks9IOJ4hC3JgYbOSEelppg5fUP/UM6
	H5JRa+32gbl/XBENeVZ8hc6bikZqTCoxQnoaxa1b27ePP3Q8sXZHEQT+1845dBE0pKFhBr0/Lpk
	yl2Jsrz1Lo6fPE8ZDb0Glyi96X0mULpmqk6M5fKMIvQ==
X-Gm-Gg: AYBFou3Cr/+CnRF2v946ZSQ/h7uW7vsYCHqVWVfWCX3YYgdNngB/Rr2fptpvblSdAHe
	W48Ymv1PVl3ZOFh44vCmSu13cVUrQFazzIA88TDHyk/ze1hFjYQCKC6pZJF6V/t8GZz+saSFpUL
	lmptOvmw9mZxuFmBcH6+MMkah5Se/YssNE1L80ZAVvLBbLeCJ5bLnIr4kfM6qC2iweDnCFdJTsN
	nn1D8/3tn7gYgMzPC+FcDvRJeisGTjHH41dbARQMI2nvWDCS6OsVrzl++NwFg062XuqIpSTAM0S
	mXYTEEN4L2QG46A53x4E//R/C6Mc0KBYFVTuQqMiFR6R+P6fwdtTSkIMIcrAQtfmGxZIn1IkWnk
	s7ezTqCB/JyDbCIW7PkAmCmvkWPRbx0gdSaJ9
X-Received: by 2002:a05:6820:3504:20b0:71a:fbe0:a6d4 with SMTP id
 006d021491bc7-71b39325f06mr1304500eaf.1.1795128307460; Thu, 19 Nov 2026
 14:45:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118154053.13218-1-zakaria.belkadi@inria.fr>
In-Reply-To: <20261118154053.13218-1-zakaria.belkadi@inria.fr>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 19 Nov 2026 14:44:55 -0800
X-Gm-Features: AclHuK-20fKaJbwldjq_qAX_xBJaBiJ2DaYwt5DufQcV7VQJOK-PRVYssNvtcQE
Message-ID: <CADUfDZqgU8Hc934Oe8MTanj57W97AmoQ+VzNK2MSLC0pato0EQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] block: pin user PI pages for writing when ref tags
 are remapped
To: Zakaria Belkadi <zakaria.belkadi@inria.fr>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kanchan Joshi <joshi.k@samsung.com>, 
	Anuj Gupta <anuj20.g@samsung.com>, florence.schadle@ssi.gouv.fr, 
	frederic.tronel@centralesupelec.fr, louis.rilling@irisa.fr, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 7:42=E2=80=AFAM Zakaria Belkadi
<zakaria.belkadi@inria.fr> wrote:
>
> For an O_DIRECT write that carries a user protection-information buffer
> (io_uring PI attribute), the PI pages are pinned as a data source,
> without FOLL_WRITE: io_prep_rw_pi() imports the buffer as ITER_SOURCE,
> and bio_integrity_map_user() pins the pages and normally uses them
> directly. It copies them to a kernel buffer only if they are misaligned
> or in too many segments.
>
> If the integrity profile of the device has BLK_INTEGRITY_REF_TAG,
> blk_mq_start_request() -> blk_integrity_prepare() then remaps the
> reference tags in place in those pages. So the kernel stores into
> whatever page backs the buffer, including a page the caller can only
> read.
>
> Write access to one such device is therefore enough to make the kernel
> write into any page the user can map for reading, wherever that page
> comes from. Two examples, both tested: the page cache page of a file
> the user can only read, and the shared zero page.
>
> Pin the pages for writing when the request is a write and the profile
> has a reference tag. A read-only buffer is then refused, and a
> never-written anonymous buffer gets its own page.
>
> Fixes: 3d8b5a22d404 ("block: add support to pass user meta buffer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zakaria Belkadi <zakaria.belkadi@inria.fr>

Yeah, this looks serious. It's pretty much an arbitrary overwrite
primitive for pages that should be read-only to the process: userspace
can choose the starting address of the metadata buffer so the bytes it
wants to update are part of a PI tuple ref tag field, it can choose
the seed to determine what ref tag value to match, and it can choose
the block device offset to determine what value to write in its place.
It does require userspace to have write access to a metadata-enabled
block device. (Though on kernels with ublk enabled and
UBLK_F_INTEGRITY support, a CAP_SYS_ADMIN process could use ublk to
create such a device...)

> ---
> Resend: my first attempt today went out with an HTML part and was
> rejected by the lists. Sorry for the noise to those who got it
> directly.
>
> Found by a source review assisted by an LLM. I first sent this
> privately to Jens and security@kernel.org on 16 November, because I had
> missed that Documentation/process/security-bugs.rst asks to treat such
> a finding as public. So I resend it here as a normal patch; sorry for
> the duplicate. The patch in the private mail was truncated, please use
> this one.
>
> I reproduced it myself. A reproducer is available on request.
>
> Affected version: mainline v7.4-rc3 (aebb72744764); both cases below
> were observed on it. The path exists since the commit in Fixes, v6.14.
>
> Path (line numbers at v7.4-rc3):
>   io_uring/rw.c:220, io_prep_rw_pi(): for a write, the PI buffer is
>     imported as ITER_SOURCE.
>   block/bio-integrity.c:368, bio_integrity_map_user(): the pages are
>     pinned without FOLL_WRITE (lib/iov_iter.c:1784) and normally used
>     directly.
>   block/blk-mq.c:1377, blk_mq_start_request() -> blk_integrity_prepare()
>     -> blk_set_t10_map_ref() (block/t10-pi.c:483) stores into them:
>         if (ref =3D=3D virt && ref !=3D ref_tag)
>                 put_unaligned_be32(ref_tag, &pi->ref_tag);
>
> Setup: QEMU guest, emulated NVMe namespace with T10-DIF type 1. Root
> gives one unprivileged user (uid 1000, no supplementary groups, no
> capabilities) ownership of the device node of that namespace, and
> nothing else. That user does one io_uring O_DIRECT write to it.
>
> 1. PI buffer =3D read-only mapping of a file. The file is on another disk
>    and belongs to root (mode 0444); the user can write neither. The
>    write changed the reference tag stored in the file, as seen through
>    the mapping, through pread() and by root. After dropping the page
>    cache the old content was back: the cached page was changed, not
>    marked dirty.
>
> 2. PI buffer =3D never-written anonymous memory (shared zero page). On
>    v7.4-rc3 the zero page is read-only, and the kernel oopses with a
>    write fault in blk_integrity_remap(). Up to v7.1 the x86-64 zero
>    page is writable, so the store lands: on stable 6.18.58 the write
>    succeeded, and a new, independent anonymous mapping then read the
>    reference tag where there should be zeros.
>
> These two pages are only examples. The device is the one thing the user
> was given, and it does not limit where the store lands: that depends
> only on what the user maps as the PI buffer.
>
> Conditions: a device whose integrity profile has a reference tag (NVMe
> PI type 1/2; SCSI DIF type 1/2 by the source, not tested), opened for
> writing with O_DIRECT. What is stored is the 4-byte reference tag of
> the device, at the tag positions, not data the caller chooses freely.
>
> Fix tested on v7.4-rc3, same user: both buffers above are refused (the
> write fails with EIO), with no fault and no change to the file or to
> the zero page; a never-written writable buffer gets its own page; a
> normal writable buffer works as before. Not tested: v6.14 to v7.1 with
> the fix, stacked devices.
>
> The patch makes such writes refuse a read-only PI buffer. If those must
> keep working, the PI buffer could be bounced instead, always or only
> when pinning for writing fails. I can test another fix.

CoW pages should get copied to a writable page in
iov_iter_extract_pages(), so that leaves only memory explicitly mapped
read-only into the process. Seems pretty unlikely that any users would
intentionally do that (they would have had to initialize the metadata
while it was writable and then mprotect(PROT_READ) it before issuing
the write I/O). So this approach seems fine to me. Might have made
more sense to disable ref tag remapping for IORING_RW_ATTR_FLAG_PI
I/Os from the start, but would be a UAPI-breaking change to do that
now.

>
>  block/bio-integrity.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/block/bio-integrity.c b/block/bio-integrity.c
> index d3df726e0..3ee2d49d8 100644
> --- a/block/bio-integrity.c
> +++ b/block/bio-integrity.c
> @@ -487,6 +487,14 @@ int bio_integrity_map_iter(struct bio *bio, struct u=
io_meta *meta)
>                 return -EINVAL;
>
>         it.count =3D integrity_bytes;
> +
> +       /*
> +        * blk_integrity_prepare() remaps the reference tags of a write i=
n
> +        * place, so the PI pages are written. Pin them for writing.
> +        */
> +       if (bio_op(bio) =3D=3D REQ_OP_WRITE && (bi->flags & BLK_INTEGRITY=
_REF_TAG))
> +               it.data_source =3D ITER_DEST;

Could probably drop the bio_op(bio) =3D=3D REQ_OP_WRITE check; reads will
also write to the metadata buffer in blk_reftag_remap_complete()
(though they will already have data_source =3D ITER_DEST).

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

> +
>         ret =3D bio_integrity_map_user(bio, &it);
>         if (!ret) {
>                 bio_uio_meta_to_bip(bio, meta);
>
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> --
> 2.39.5
>
>
