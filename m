Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795597731;
	b=qSLPbsQSdmtJ6Iqr1zIQdHOU7WsD/aNwzn94PjqeVSPBdv/1bC5HEbGmGh8zb2AY7RJ/
	 2AMjiDs8+ARfaqlRR+AcXcJGWXekzd7kwkPVFBhoOIHzWM9uW1wXqsJe+k794MlBCJGuB
	 ulaXIkjktZDpP1UHORv66A9F2Wmnosoz3aUYD7hXV0V67VXycJO2d5v2G5iBvg+EjH6Ez
	 jibcfLue6Y25HeF2s7iFi/XvXb3F+ZhLKjKAxi94w6UsTKNkJyC4FbFwyP/pB9HQRVb0n
	 KqC27ixkO+dFhj5+1Dm6eyumMmraYUgm78rbTr2OhaO435+s3rXzaCvPrL7hx7xQs8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KuvoUDCaIBt8E6V4M3XTLtfXIPJakzIdb85mkQY3hms=;
	b=C5/OL3ESAdygyDm5WKiwp0guC2sVyvfHf54gNSbSqySyp6GkSmSw747zXvGJfNKCAK5O
	 a5M3bCLblI2bo3/tBuzgZU20YQyI2l9YAI39NEpkGqadOM06G+FmVaHqi1Sf8nCYk0MbE
	 U+cylsN2YryCqtQBDvMridBGgiq9cRSYyngMS6SbrEiLWY572wxDXOh84HT8+0wf35UnD
	 YD68FkM6swSfiUAXGkDlam9oiTiQIViViHSKzTeqRMeke/g8R477NZYbl7obLzc7I/QKN
	 9YspW4AnqGDWxsn0TcgULcowKHtvmmycu0TldWzCYMFPDwPrk/7C3FZVtJD0oe4zHyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A64RA4rh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7A4606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA7A4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A64RA4rh
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d65662077cso2713852137.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795597729; cv=none;
        d=google.com; s=arc-20260327;
        b=OHzxew9Zd2TM5pXjJJ+vZn+Hk2EhRudD3AT44P+ImCJ/Rmw1zhuK/GTwMM3msjRq/R
         ybI98Py71KSKh52Mh/hBA9oCpqbGgn0TXzGOnqDvgDLkwuQoVX8LtrDpqZ5ItJPuCB+u
         I4nphUmBV2ChJU38eOwCm0ZVNI8GiQKGvN0U1TC/WdDCOiUo4njS14E6EyV+kqG5mBWG
         rSDnklYts8yt0seGo0RgKyb728d1iv64zg5KfPuiEg6+u2uGnG5rMKr1hTH1/EGQPkyT
         8UW1XPqrN+v0+RSEp1jrpyvJ44txbuqONtOF9c79rNCjnLmPU/+dOp/eTyXUpmD7FJgq
         K6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KuvoUDCaIBt8E6V4M3XTLtfXIPJakzIdb85mkQY3hms=;
        fh=144Uw0WWpgWQTQKNNBi2wRt0P6xzO/Od/pXlqLiCLjo=;
        b=qxt8fS2Qyi+V1IKuljbJfphhYX724XeVomw8xRy6PYsgKqSBYHOaGKNjlwl6tVI7io
         X4jSWITR5jpdNHA0dFKQGoqfk+PKdoAf0IsgQksrjP0IuGCLXHAR/7pc3lA5b/A9qwNn
         r3/R4oy+fhBrVqHQ6k344aPQ3nfxA+nXD24WcqQEILS1VbNQ6QCa8k4fvinWANVKTLBe
         ZjwjwM4pXZOoKK4kjUU3e3008/VlRi+YRc2KV0AevcwJaI0yv7Ug9ucrSHy96WYRIKnU
         GApGBX6ZJbI0Uugo8WAIWY18bT5XYQ8XgLeHYEBx3mzh4ki6RVOyPUhMBnkTr+XzzSIz
         LDPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795597729; x=1796202529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KuvoUDCaIBt8E6V4M3XTLtfXIPJakzIdb85mkQY3hms=;
        b=A64RA4rhLVkaxeL3AK+w6kVNF/j9XejWTJMtEpSG2w8mpUSVnjYKhSIfopUYUPTfUN
         E8up/uiczsdf6+6hVtsWA95M+TfZ1apFye3OZzf+QXC0lM+kCfIA2m1zrgSAsBHzi9nd
         jFo9Tt6X1+8l8yNih+SUNKm6tpJEmA0IqXoM/Vt1PLWUBGNNZ9boleBccA2Akij4eifb
         aStof6OoIoL7Sq5ZRulZ2ibzQ0YSJxEDq79gSDwPuq/uuopDpkGTpWJJvDxOVDe6Comt
         kCc+UOGOHdCrTLpG3kgGZHEM5NZvdEiglSpAwfW3OdwxNyrNUrX2NODB6vkewGK6C2wB
         faFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597729; x=1796202529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuvoUDCaIBt8E6V4M3XTLtfXIPJakzIdb85mkQY3hms=;
        b=VL+PpRvPno/ZLgDmbGOWCQlRMBiewCpsCH9dpdwt3+I9FqSfgklmJfgSoy3zoFHIgt
         QG0ItyiFJ6H7L5LOhS9Rd7Z1ry7RH/BjNNGDHicdXTehZL8mFtyjDT1ydV8upPekclI2
         y7ydNEW2YRKcLYTh2FalczMAZJWvpZlAzk2Gn0WJmsFN9Qmik+ToqrRMpPrg7jWGhUyp
         sHf5u4AXPRaXybgzkQf2roeYTgxlrs/Ma58LPzfoh2M1Ob+o/gkUDfu7bnN/FaeoyykF
         k1CfXz/HOtMfvH5CD7BgvNINDD0zqV9gNrqWwX5FrKipEXC1LcDB/VBTIXHhy56jJMtC
         QKDg==
X-Forwarded-Encrypted: i=1; AL+hErFvXNb9ZbYTHDn1FYU++n/XpCvVxpYm6ckdT4ybcq4KQiks31GgPb8ge7zJIy1f1m+UNQ1TsZDFEoLz014=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VvwIGTWO/A8hmS9RIv4JrxSlwTA2arnCI/My92OHM5PM2QtwH
	r+kLRMB40N+Srff1q+Rgql8pjXLyR0CV+4FRYz5TelijgThuCzXH1RSfxw4HOd9T2C47VVYk/kk
	CdhKQ3Fnv/TvsYJkprqhtBZ9RTpuJFOiNR09W5wvK5Q6MNFRosDcnlxT7
X-Gm-Gg: AZFdTZdTab5TYskszn2QexfCb/edyPLaxL2kKoP6PUGWHo5STuzv20J+kzMZuia9xji
	4mYQ/hRf2lOA0kGq64VkDxA2iBxUG+2L3OocWrNnxXerjzZh7PfmMjGGOLjDHuVTU67SYyMQJoT
	rx7vxkopPKMX7ynE61XsbY8sXp7hfQh9TWpQH16+1tB8m0/gseqeH4B3WU+hRvkzqY9ao94oW1M
	3sj3SD1/rc3WMvoLDxrL5Ppc3Vj+z8FeKkzlQWguhLDRbnpOLKB8+NrbtI7Lsae+k77Cl5dj7XG
	A5ZdCLGvcMhxJ/B2Fmp8m/R2hyXzdLSuZKZywtIzSOeB8vvsn1DGhsPM68Yot+NG7I55E2tfCSk
	FR+xpupCBKLX8GDSE6Dm8kSsgztVpO+QgZmj/VmUo/nqBpp71UVbAskXPNONQsaDIT3M=
X-Received: by 2002:a67:e115:0:b0:7cc:115:ddf4 with SMTP id
 ada2fe7eead31-7d73961ffdfmr7565233137.25.1795597729498; Wed, 25 Nov 2026
 01:08:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124195430.105522-1-alex@amutable.com> <ykuz2hhjgnfhwnh7srst3ev4yqetv5jrs3vn5idwr5jfynszax@zrbrypi5phon>
In-Reply-To: <ykuz2hhjgnfhwnh7srst3ev4yqetv5jrs3vn5idwr5jfynszax@zrbrypi5phon>
From: Alexander Mikhalitsyn <alex@amutable.com>
Date: Wed, 25 Nov 2026 10:08:36 +0100
X-Gm-Features: Aa3M54qn6h9ODGjV2IafKC2EXuw5MUKOakyqBrbUxm2h5WabcIWL6MsV22rl6GI
Message-ID: <CAL65ydQaiFfQtEcFhDUA2HbrUnAUe86m9uGVoWneh7wpLZUZ0w@mail.gmail.com>
Subject: Re: [PATCH] ecryptfs: release inode on error path in ecryptfs_lookup_interpose
To: Jan Kara <jack@suse.cz>
Cc: code@tyhicks.com, brauner@kernel.org, ecryptfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Seth Forshee <sforshee@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:02=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Tue 24-11-26 20:54:29, Alexander Mikhalitsyn wrote:
> > Currently, when ecryptfs_i_size_read() fails we only do make_bad_inode(=
)
> > which only removes the inode from a hash. So it's not getting released
> > and on umount we get "VFS: Busy inodes after unmount of ecryptfs" (see =
below).
> >
> > Let's fix it by using iget_failed() when inode is I_NEW and iput() when=
 it's not.
> >
> > This was accidentally found while working on SB_I_PSEUDO fix.
> >
> > ------------[ cut here ]------------
> > VFS: Busy inodes after unmount of ecryptfs (ecryptfs)
> > WARNING: fs/super.c:731 at generic_shutdown_super+0x117/0x1a0, CPU#11: =
umount/402
> > Modules linked in:
> > CPU: 11 UID: 0 PID: 402 Comm: umount Not tainted 7.4.0-rc1-virtme #9 PR=
EEMPT(lazy)
> > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debi=
an-1.16.3-2 04/01/2014
> > RIP: 0010:generic_shutdown_super+0x125/0x1a0
> > Code: 5d 5d c3 cc cc cc cc e8 19 d0 f3 ff 48 8b bb 18 01 00 00 eb d7 48=
 8d 3d a9 93 d1 01 48 8b 43 50 48 8d b3 d8 03 00 00 48 8b 10 <67> 48 0f b9 =
3a 4c 8d ab 40 05 00 00 4c 89 ef e8 17 6c b0 00 48 8b
> > RSP: 0018:ffffccc0406bbcf8 EFLAGS: 00010283
> > RAX: ffffffff87d54a20 RBX: ffff8a7bc2358800 RCX: 00000000000000b5
> > RDX: ffffffff873e7853 RSI: ffff8a7bc2358bd8 RDI: ffffffff87e52550
> > RBP: ffffccc0406bbd10 R08: ffff8a7bc235d408 R09: fffff12a00000000
> > R10: ffffccc0406bbcf0 R11: ffffffff87d209d8 R12: ffff8a7bc2358d48
> > R13: ffff8a7bc2388824 R14: 0000000000000000 R15: 0000000000000000
> > FS:  00007fd846e02840(0000) GS:ffff8a7c76af9000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007fd84716e8e0 CR3: 00000000037d8000 CR4: 0000000000350eb0
> > Call Trace:
> >  <TASK>
> >  kill_anon_super+0x1c/0x80
> >  ecryptfs_kill_block_super+0x1a/0x50
> >  deactivate_locked_super+0x39/0xc0
> >  deactivate_super+0x47/0x60
> >  cleanup_mnt+0x3b/0x80
> >  __cleanup_mnt+0x16/0x20
> >  task_work_run+0x64/0x90
> >  exit_to_user_mode_loop+0x177/0x570
> >  do_syscall_64+0x352/0x410
> >  ? up_read+0x1f/0xe0
> >  ? schedule+0x27/0xb0
> >  ? schedule+0x27/0xb0
> >  ? schedule+0x27/0xb0
> >  ? trace_preempt_on+0x28/0x80
> >  ? schedule+0x38/0xb0
> >  ? preempt_count_sub+0x4d/0x70
> >  ? irqentry_exit+0x2e1/0x700
> >  ? exc_page_fault+0x8d/0x170
> >  ? do_syscall_64+0x33/0x410
> >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > RIP: 0033:0x7fd84705c1d7
> > Code: 0d 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 31 f6 e9=
 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 =
ff ff 77 01 c3 48 8b 15 09 3c 0d 00 f7 d8 64 89 02 b8
> > RSP: 002b:00007ffd3839fae8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
> > RAX: 0000000000000000 RBX: 000055b7f819dbf8 RCX: 00007fd84705c1d7
> > RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055b7f819df30
> > RBP: 0000000000000000 R08: 00007ffd3839e8d0 R09: 00000000ffffffff
> > R10: 0000000000000103 R11: 0000000000000246 R12: 00007fd8471ba26c
> > R13: 000055b7f819df30 R14: 0000000000000000 R15: 000055b7f819daf0
> >  </TASK>
> > ---[ end trace 0000000000000000 ]---
> >
> > Fixes: 3b06b3ebf441 ("eCryptfs: Fix new inode race condition")
> > Signed-off-by: Alexander Mikhalitsyn <alex@amutable.com>

Dear Jan,

>
> I can see this fix already in vfs.git as b793b0bfa631 ("ecryptfs: don't
> leak the inode when a lookup can't open the lower file").

Ugh, my bad. I've checked a next branch for ecryptfs and quickly
looked on the mailing list and didn't find it.

Sorry for the noise.

Kind regards,
Alex

>
>                                                                 Honza
>
> > ---
> >  fs/ecryptfs/inode.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> > index 48e520960d66..3a966348a578 100644
> > --- a/fs/ecryptfs/inode.c
> > +++ b/fs/ecryptfs/inode.c
> > @@ -362,7 +362,10 @@ static struct dentry *ecryptfs_lookup_interpose(st=
ruct dentry *dentry,
> >       if (S_ISREG(inode->i_mode)) {
> >               rc =3D ecryptfs_i_size_read(dentry, inode);
> >               if (rc) {
> > -                     make_bad_inode(inode);
> > +                     if (inode_state_read_once(inode) & I_NEW)
> > +                             iget_failed(inode);
> > +                     else
> > +                             iput(inode);
> >                       return ERR_PTR(rc);
> >               }
> >       }
> > --
> > 2.47.3
> >
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
