Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795088247;
	b=njTSLMqLb+n8AJZ0LIte82bw+xG1MHV3MgsInsFUySAiFWeIDveQ1GjYAeGvoON9GB0n
	 1H1loGj9zOZymGm+DnHxEv1E5tWYA6egZu9Ia74rpHv4320aZF1oophJ/oT/Q+cb9FDlK
	 nr87uhGDqcUC7N0MBAAJt0oIVonLwFA1HgPrO7FFhOMirJGxiJgOhIPXW9f0IPEB/TMZK
	 bKK5KiIJGJet3keDFXhGx/Y8jPqU04e4EkNrNNU0Ks3opMR186p5lrL7pJiV/nMPlzX+f
	 NTREGMNCzZy4B8t7ob7v/L9BcWDsz9XlBC9JAaJDJ357frVOv0qA6FAVu/x3wO4tjGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k9oUuiKrf+PjiHstzcSPvv+y0H/jSCQ4selOAFSoGHY=;
	b=x9Xjga1ijdpd3S3TkIobypzr/6zzc2KoYgudX1tIiLReMhrUfPo2gdg36qjWPyblA5Ee
	 fsDpNYcbAItRgpe6R+AtvOLVk7X48yH0t0Mi/hE011mleEwucXiC/ke+e/d7Q0f2t2A+j
	 D7f77cAZ9nPBP5IwV4Yt6bPVeNxadxnzLgayRwX+IZjMMMfpVd/4VBPLOcHvlG6hAwAgW
	 MPYVO7jGM/maE4ZNIXfQpWZFUf+KpqKkC9TN4rK0QGdp48GGQuGVNT2SomdfRGUu1RKw/
	 y+8HYUllrITFkshWTwQOI8tDbR8N7eogRmDwbPFaaWngaS7lvLFhppK5TeoMeb/8BYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBtSeeoR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC369606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC369606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBtSeeoR
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53639b8903bso11392591cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795088245; cv=none;
        d=google.com; s=arc-20260327;
        b=NhPoQx6Zk8TGxZZ+bA7QQwhaLyQA1zDUFk97jggVRK9dqBGVxe0bMLGz2BCxyifmRR
         xXhDzTRo1lmOl0z2rBKuFIbSaKX7WMjN48H+Kk0RnEeWC+A4QDeaccFF+/WX/RXtRtBa
         ob0gpIprMQCPC3KLIkmIWivnIZTxclwG9Nl0K6Op5VkL5lBRnADLwiJq7EWeCQnlkhop
         vtrAyhvd84BHWCqxIT6vM6kRdg4+Ug5ZPiRuG7yDH8ZAp2cNd/L0qYI5CwSdezE3ufVH
         p14F4Gu8oxR+0sBVkAuVRhWEIACmHuiJkC+ymxdlhcr26B3MDWyZMi7I0EJB5cCBQOVR
         HFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k9oUuiKrf+PjiHstzcSPvv+y0H/jSCQ4selOAFSoGHY=;
        fh=BRru3ZZTrezoYlZ1sVowc4Qe1gxrTGMyBCo+5B2H21g=;
        b=HlIWR/6hIawXSgfOzDeCSJuLnu6neK8XK5zRXwwGDS1w4Hrfqq2Wh2q7/fjHdu1IFt
         TJWeHl/IBGdYNM2tdVtRDqQj+V0CaME2iaNURDoQsr9UjnKWIG4c24E0d8eUcKv9sctd
         7sAzvHvNWWdtoN8WMBY6GP8zaVMmQaEPmy3vjcl69rm25yDn2GpaX2f/jhqqkhHdpPm0
         S0d73al0uga4n/s0YQbIYlbOU9MHAauqOvNwYPdpxp/Aaz0qMOVYqxomqG4HN35LfPUi
         4w6QrYCHKbC8oxHMlDzQMGuLMpc/nwSjl/scr0aJn9IDiOhTDPB/RFcGH0khpFupC9QL
         w2lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795088245; x=1795693045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k9oUuiKrf+PjiHstzcSPvv+y0H/jSCQ4selOAFSoGHY=;
        b=ZBtSeeoRO78NrkT4o3JILcK0AnVM/Tj2M6kiIz+8uQUw60PjKRWN+ZzJjP7IwXX6EG
         fB45lRiPd9t+g2jZH0KFXQXYa7MZcYfn4T1wKBDDV/BZQ1sgAYckymJIQBS81YTeE8TQ
         7DlDJCVWFiyzq/ogDIsWPM0U555OAfVcWRx7V2BtY7y7ZosgCLh4pP+cBbPDQGLshcF+
         G5Cgys0D+pJYHfr3U4hiyVQA8q4IU1UTfvVMxDAdzZAnDBFHRQacDlS7ev4jvLfRib6o
         AIcVIohXFJ9fh5h0AuJumUE+TecCc/1GvLiRfRgHTn8+5nNSLBW8JmR+TRRMvJW4XqY9
         RIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088245; x=1795693045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k9oUuiKrf+PjiHstzcSPvv+y0H/jSCQ4selOAFSoGHY=;
        b=2fHXGGiEw5YosShgM1mIneq8NnV/kEnNGYb7jluCQs4oplzRdYAW3SpTxNAflWATSL
         MlSHq+ZVLNjG9KBgRBtgwkxF3Y954jPSExe3MDOb3MC4B4qan4qTAl1FLeLgIWvu+O18
         zjPw56xlqFT1qygeLStqYBeXGXRgqsB6S6Q5WZ+7U8JDumIc38OxxazknX27y6wl0COR
         7o+U634f1d+GH59lc7IPBspZK9EwlNsbdibpkQoUr66yvvezR2qqC2Yru789w7hxeWqC
         Av8BsjTnJwEs0eM0Cp0pSJR+NNu8/Gk76/D5RFjrAw+vyqUlOFzUTDEE5bJb9qlNwIAg
         M0vg==
X-Forwarded-Encrypted: i=1; AL+hErFLzvmz/3oFzEkyl67Gh6oQmmV2+Yr20+3uRj6fWvDUnULTiq0f88+I4zGTK32U4S20Su2o+o6KjA2juzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z90vwQR2MLuYwbdpFAKWQyzyKDPYAljHJoKiL2iyui/9qrC+JBj
	1Q9Yg1V+ugSTHIPK776Onq//MkNqz52Ts07SQJWlksnkDDIHZRoCwUH15/1wKeoX7GpuIgty17V
	L0SAGD0gUFhfONPfi5imiChvO/EwwV1WZOTGNMBzNKA==
X-Gm-Gg: AYBFou2d5yk7yYeIGoZELXTWV1ZPNYbb7d6WWxQAHGH2VHkeGFKu3cmYg0KPOXYqX/K
	WslPkMpYVSAl2lK+U22IRE+04bExOgUJ7QSiZCod5xkYnY4fMIOKpSnADlqFGl7ZFanhO1rkc3M
	MofiEK8O1cCAPK4uBFFh1Fct0WbjJv2yejc3F+L954n8Pr3pSQzpbic9ewlPlO21ZHreEPjQkv2
	IPKo6Jgm1Bqk0he5cRROlrNMTIR7ux5V91G4Ky8lVw2OFwBzrzxo/Z+C8GxK3/jue1l2JDjBxOY
	RlDdJRNwhiL/sNJo3OkrqEdJ6XKTK2/TVSRl4kzCNwlyF/yl/YtTkXBsJipXQ7qTXc8cFdRnZQc
	sLr8y4gWnRp0pl0LOGTvEw7olbYYjTB7T6XQ=
X-Received: by 2002:a05:622a:4899:b0:55d:2e33:a614 with SMTP id
 d75a77b69052e-55d6fc00ecamr10516701cf.3.1795088245640; Thu, 19 Nov 2026
 03:37:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6ad2359d.0083e9c2.97e0f.79de@mx.google.com> <20261109171601.75996-1-haoranwangsec@gmail.com>
 <8dd16c29-ed2a-418a-bd9a-4a9949cd53f1@kernel.org>
In-Reply-To: <8dd16c29-ed2a-418a-bd9a-4a9949cd53f1@kernel.org>
From: Wang Haoran <haoranwangsec@gmail.com>
Date: Thu, 19 Nov 2026 19:37:21 +0800
X-Gm-Features: Aa3M54qF-P6mr18EFGNJItvT-hvaMEUpY6FxaMrJvGkyPhbWyoOqjNZ3sPUDBT4
Message-ID: <CANZ3JQSUYabaty9QhpwcPoWwcCKQPC5tFqHZq4rvsPGH3KOwBQ@mail.gmail.com>
Subject: Re: [PATCH v2] f2fs: verify inode data-block ownership at mount
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, yi1.lai@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, thanks for the review.

I tested whether fsck.f2fs already catches this corruption, and it does.
On a locally built image (mkfs.f2fs, two regular files, then rewriting one
inode's i_addr so its direct pointers alias the other file's data blocks),
fsck.f2fs 1.16.0 reports:

    [ASSERT] (is_valid_ssa_data_blk: 326)  --> Invalid data seg summary
    [ASSERT] (fsck_chk_data_blk:1869)  --> summary data block is not
valid. [0x4]
    [ASSERT] (fsck_chk_inode_blk:1042)  --> ino: 0x4 has wrong ext:
[pgofs:0, blk:6674, len:18]
    [ASSERT] (fsck_chk_inode_blk:1049)  --> ino: 0x4 has i_blocks:
00000013, but has 3 blocks
    [FSCK] SIT valid block bitmap checking                [Fail]
    [FSCK] valid_block_count matching with CP             [Fail]
    [FSCK] other corrupted bugs                           [Fail]

So the detection itself is already covered in userspace.

The one gap is that fsck.f2fs is an explicit, userspace step: it runs from
the initramfs/fstab path or by hand, and is not invoked for loop-mounted
images or auto-mounted removable media. A forged image that is mounted
directly therefore passes mount without any check.

Would it make sense to add a mount option (e.g. -o check_ownership) that
runs the same NAT-driven ownership scan, but only when requested? That
keeps the default boot path unchanged, while allowing the check to be
written into mount policy for untrusted or removable media. If that
sounds reasonable I'm happy to rework the patch in that direction.

Thanks,
Haoran

Chao Yu <chao@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8811=E6=97=A5=E5=
=91=A8=E4=B8=89 15:14=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Haoran,
>
> Thanks for the contribution.
>
> On 11/9/26 17:16, Haoran Wang wrote:
> > At mount time, walk the NAT to enumerate live inode blocks and claim th=
e
> > direct data blocks referenced by each regular inode's i_addr region in =
a
> > bitmap.  If two inodes claim the same data block, fail the mount with
> > -EFSCORRUPTED, since at least one of them is forged or corrupted.
>
> It seems quite heavy to load all valid nodes for verification whenever mo=
unt(),
> it may slow down bootup time of filesystem significantly.
>
> If storage device in special environment is not reliable, what do you thi=
nk of
> running fsck.f2fs to do a full check before mount()?
>
> Thanks,
>
