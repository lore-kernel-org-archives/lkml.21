Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443281;
	b=bqKArs1Nwd9IfrHjx7X2EXM4n9tEgj17hmMTc4KcvIshW1MdAFxkcDA4Um36nx1DJ0zt
	 +9Kl1C5oGNHsanxQCPhJWoqSGpoBbUO77nxIAPAlVBvsmeUvn/FSwA1yER0jw5QPwUkkd
	 i6+TTS0Tql6ceAA0nAHNSw+Q4i/QB0tD9edP4bKKZZuVagsK812dYfnSbe25JF2VoVt93
	 wto5gC35RIcSQ2OEbMUbS0tw/hGjVzps3N8zMkRx9DJvT457JZefx45EyNUCXO0yYTyfX
	 PPPPL2vVcxSAABExdazycVj00784036t/BHbIwZ5FR11xnxkZkcdnDqHRcvqg4dVLdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AOY0PbbuOL71oawD6vspI9ahlDMqf1h6fTODPqf8U0Q=;
	b=cyctfn7ffgWU754+DbYFSEMIH3WKipiaqD3jKTG/tBPEhj5Eyrwx7DmUO19m9FunMLhX
	 RC938Vgc82qcVk7PWRqReHwBPTJsZ7mkWVxKfR1rEBo2YviRs7gPCwLk8H4mCHKkgFAp0
	 SeRLPhRPxVcxFjawHnZiJw8ce4kmsqeN9AwC4t6G8fuVV7NPQe4AswgtKD+E8B/tMVarh
	 D+p25g8wO4FV5wXW9ORw3Vt+RrTuCCi3r9p8UDN1OOG93dyebcZ9pwB5UffczChPRjWPK
	 Uz1lqeDoqiolZ0gXa+SPCtGYFcaGVdm9uWNfMBm0leHtt3GTS4naeWmALWlzbAFvSiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oROifbQ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1045606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1045606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oROifbQ3
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so3761876a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443279; cv=none;
        d=google.com; s=arc-20260327;
        b=dCwaKIzAPRzBdIrNXOq1QK4/aBy2gCBLoZD+cw3Ti6G3iyWBKzG+fD50d+XpnbHrX2
         BGLJ6IPLLD2iXslCfUrC5CJMLsEM1Z8YpSpfIo3XKL5lW2IKvaZIXU69wRXxrNYLpHEg
         svYvC9gmbRG445TzMq1JZrMJAidjb6k3eZRbuuqAkiXwGnLiCcZlE8VFUOei3+z4lQHq
         no78fSG42OsHBQhxyBxPrVH0FEcRxSMwnQMC+arnyKIsDmUDi8CrKRY8bY5YmOEmv+EL
         bueTDgaZNjakrdK4GFefyULsMXTnW5KIUbolge66fdKflI9m/jNo4BRLHJFM17fGPoyV
         Ingg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AOY0PbbuOL71oawD6vspI9ahlDMqf1h6fTODPqf8U0Q=;
        fh=WqolennCuut52gnNF6dTjaPlAmJNDX6uTIqjOto/wFs=;
        b=C0qzuUS4DCxhWoJA732cKJ6GiIVH37CibdWDx6ej902F9SsAPyKN3JRhw7HdC1Xbrq
         7ACi3uUuFGIu0sneljJ1T9yk6CvQ70aTpb2YKMfI3DgVJBqFwzYSwmmg6UU14sFDcX7H
         /DmGuNtzH2Z7d4BaDyqYmDt0fzwFyGXNYjFBeqZqkw+O0rJMnxAuvFDo67SWLb5WZFYk
         c0O9TSkafP9xPxCn85dlA+o8gxeCRW5dTzcCdff6Hj3qy8IWbaow71YE2muvZ4A1rLSq
         ETVhJINRfdFa0T8UvajP69QUzaD5BfNXrFTQo3zjBNaFZp3aWyk8kxIBOY8FvhwbXQw1
         DUUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443279; x=1796048079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOY0PbbuOL71oawD6vspI9ahlDMqf1h6fTODPqf8U0Q=;
        b=oROifbQ3ZfFHP08nzs0+lu8sfpgDDivFrSADeoz3+9bTXvesuEy2rwbBPYElBwR/Zk
         p2DFa+x0RSp8ucrwkMJCDfO7Ki0RSaRlkB2G52iH9aWFVWkweQv70nv1VsEHkEQwbRUd
         2YEdMiXyLmew14pnSjgcXldLLk9a8OCHu7//RaUtbKG6L+X3Xrz7aeYMEWRTgtjNihm2
         dxhXwncufRKlY5aFIrVzglnY/4jLvuZ4pYgkpxMTb/fER4OXELal/eEVCMUwiO8d/LG5
         a4F3Tm35MPWkaNr7NVSraYc6Vex2mPYtjvUd1NlbBfa0Tya24bh6j51cEkgB0W4hNz3u
         afqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443279; x=1796048079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOY0PbbuOL71oawD6vspI9ahlDMqf1h6fTODPqf8U0Q=;
        b=e398bcLw+sE0iyrX/N8DQ+ZRUD5BpdoTTYh+MqDzi9stbQOzLmvUlB7Dua2+KxPuQc
         GC7nB5r7S7/HOALUDlcJM/hItrJxb6SxJB56nWqBQsfx4761Jci4n4Ym2WALO/ePoNqY
         Gjuvhj9Y+HtyGX7q8wrZVLdwTtKkbAHqtR9MleyO008RyLQutcnLE7azJpJNtmWYjzGu
         h9ZxuDrgqH/IjoE5Tv84hcXrYgk0TU7gLTB4DJ49o58MB9PcLAYZCglGTh7/AhvtZiMr
         qdXPn2l39e/OU+brmlz+TQ/z72/pcQGnEryVNpSDlngcgqTeQwH5AKRaDTRcCneoaDBw
         CIoA==
X-Forwarded-Encrypted: i=1; AL+hErFc/Dh64KZf/6gFuT4lPurWaq8FGThhPn1xwFzaf6ZX+x9xZ0j+W58G7YdPz8ZvPGn0pUcaO/gvy59Jvu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2q+b6G7+YUo6K4ivm+X4N9a5ntcIFqpWHBF+MOYVr5rAqAdgt
	2KrhL2AbG4GhSPwDMcM8ULHc2tYZRIDhEXTSsgp30KNDyCpLmNbQ82EeYuw4MjugU9niN6W/9tS
	Ps0SsWo3Bb+YIspZID3GIP6cnVRbMPLM=
X-Gm-Gg: AZFdTZev+rEBVSs5oAFlesQ0hOwAIQvOxYwGyxaj495cqBCK0NpvTUiiFsjvzXR9jMW
	YeSa2sCpqLIIQzi8tGAN8olHou+kKO5GPf1v5fH/JQYonTwawA1v760iqGH8hiADDkUXZpZ7jLv
	g/DpbXAbX6NGo5mFXATqOH3HJCambSEgFA5cotbk6PPDHBYb0QJYYwpyhOjZDDq3IdfYnn81YsI
	kGgoHt+lnMKXgfGx8i9WvrSXUmdcfr8iHXSxlicKsENcYrdlUuvKvLwSKQXdo4N8R++VIby8SA5
	0Dd0AWVgxqqwAAYuNL3iKSdSHB+vET1BBl/QaAUiq1PWHp9jGgOjbQyLTcabcpbEUCsCitfZvFu
	Tuyijs2sAK1SjIqGowAqd/Vudnl3ZjPzjEg6j1qwr77mHtmzXoynS3NmR9HBKqzXnR4z5lQ==
X-Received: by 2002:a05:6402:1e90:b0:6b6:8ed8:765a with SMTP id
 4fb4d7f45d1cf-6ba37eb79cdmr8133267a12.38.1795443278525; Mon, 23 Nov 2026
 06:14:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <20261122000856.536902-4-koray.fra@gmail.com>
 <CAOQ4uxgc6pP+_xvJMbqj6wOdGzS75Vn6x6i_vUfCJDD46DAA_Q@mail.gmail.com> <DN2N0BY83OY2.1OV3ZAZFSWCDG@gmail.com>
In-Reply-To: <DN2N0BY83OY2.1OV3ZAZFSWCDG@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 15:14:25 +0100
X-Gm-Features: Aa3M54qAtfdGB0LeRebZKK7K89qIg_MfhE7-Z5I2BzYrqC2uKTrvU0S-v_Coln4
Message-ID: <CAOQ4uxg9O-R_SUPAZ75ESGB99-4Z4EEUKGMkCF2f-sXkGPq1GA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ntfs: switch to the new xflags fileattr API
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Darrick J . Wong" <djwong@kernel.org>, Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:50=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 23, 2026 at 2:00 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> Switch ntfs_fileattr_[gs]et() from the legacy FS_*_FL flags to the
> >> modern xflags (FS_XFLAG_*) fileattr API with masks.
> >>
> >> Introduce FS_XFLAG_COMPR and FS_XFLAG_ENCRYPT and add them to
> >> FS_XFLAG_COMMON (and add FS_COMPR_FL and FS_ENCRYPT_FL to FS_COMMON_FL=
)
> >> to be used in this API switch.
> >>
> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
> >>  fs/file_attr.c           |  8 +++++
> >>  fs/ntfs/file.c           | 63 +++++++++++++++++++--------------------=
-
> >>  include/linux/fileattr.h |  6 ++--
> >>  include/uapi/linux/fs.h  |  2 ++
> >>  4 files changed, 44 insertions(+), 35 deletions(-)
> >>
> > ...
> >
> >> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> >> index 50be49f4c913..fde6fb2fe39c 100644
> >> --- a/fs/ntfs/file.c
> >> +++ b/fs/ntfs/file.c
> >> @@ -155,31 +155,37 @@ int ntfs_file_release(struct inode *vi, struct f=
ile *filp)
> >>   * @dentry: dentry to report the flags of
> >>   * @fa: filled in with the flags of @dentry
> >>   */
> >> +#define NTFS_RO_XFLAGS (FS_XFLAG_COMPR | FS_XFLAG_ENCRYPT | FS_XFLAG_=
CASEFOLD)
> >> +#define NTFS_RW_XFLAGS (FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
> >> +                       FS_XFLAG_NOATIME | FS_XFLAG_NODUMP)
> >
> > Nit: checkpatch may allow 100 chars, but this due formatting is not
> > easy on the eyes
> > pls break to RO line
> It should be 78 and imo it looks fine, but yes, I'll split it in next
> patch.
>
> > and indent the broken lines below (
>
> This should be a diff-only problem, in my working tree the file has them
> correctly indented using 3 tabs (wide 8) and 0 space, probably same
> problem as the PROJID line being unaligned here:

Sorry, pls ignore.

> >>  #define FS_XFLAG_PROJID                0x00100000      /* project ID =
*/
> >> +#define FS_XFLAG_COMPR         0x00200000      /* Compress file */
>
> >
> >> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> >> index 4faa40febf11..219e7c8eb601 100644
> >> --- a/include/linux/fileattr.h
> >> +++ b/include/linux/fileattr.h
> >> @@ -7,12 +7,14 @@
> >>  #define FS_COMMON_FL \
> >>         (FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
> >>          FS_NODUMP_FL | FS_NOATIME_FL | FS_DAX_FL | \
> >> -        FS_PROJINHERIT_FL | FS_VERITY_FL)
> >> +        FS_PROJINHERIT_FL | FS_VERITY_FL | FS_COMPR_FL | \
> >> +        FS_ENCRYPT_FL)
> >>
> >>  #define FS_XFLAG_COMMON \
> >>         (FS_XFLAG_SYNC | FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
> >>          FS_XFLAG_NODUMP | FS_XFLAG_NOATIME | FS_XFLAG_DAX | \
> >> -        FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY)
> >> +        FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY | FS_XFLAG_COMPR | \
> >> +        FS_XFLAG_ENCRYPT)
> >
> >
> > Rule:
> >
> > You cannot add a flag to common without carefully auditing all
> > filesystems that support the legacy flag.
>
> Yeah, sashiko pointed out a problem in f2fs, and I could reproduce it in
> testing, where adding COMPR to COMMON makes f2fs crash, it also needs
> NOCOMP in COMMON.
>

I don't think this is correct, or at least not enough.
My agent said that this breaks or changes things on  f2fs/ext4/ubifs
I didn't bother to check if all of them are true - I doubt it
bottom line - need careful audit and good testing.


> > FS_XFLAG_ENCRYPT can go into common but must also
> > go to FS_XFLAG_RDONLY_MASK because it's read-only for
> > all existing fs.
> >
> > COMPR is rw for some fs and ro for others.
> > As with CASEFOLD, you cannot make it COMMON before
> > converting all casefold fs to new API so that each can say
> > whether it wants RO or RW.
>
> How's CASEFOLD currently handled? in the v2 I'm drafting, I added
> fileattr_mask_to_legacy() and fileattr_legacy_to_mask(), which convert
> between the old format (filtering by FS_XFLAGS_MASK) and the new mask
> format.
>

Good question.
Need to check this.

> > I think there may be a way to deal with this easily since
> > ntfs doesn't need to set either but not sure.
>
> We could export the 2 other helpers I added for v2 (xflags_to_flags and
> flags_to_xflags) and make NTFS use them?
> Though adding the fileattr_ prefix will make the current (v2) vfs code
> maybe too verbose.
>

Honestly, I can't say for sure - you can try
I think you may need a different set of helpers fileattr_prep_ used by the
filesystsems that are converted to xflags_mask, which may be different from
the set of helpers used by the user facing ioctls but I'm not sure.

The thing is - this is all hard to wrap our heads around

You and I have parts of the design in our heads w.r.t backward
compat with legacy API, both UAPI and vfs internal api.

I think you should put it in writing to see that you and I have
not left anything out because this v1 surely does get it wrong
in several places both wrt legacy UAPI breakage and internal
API correctness.

Thanks,
Amir.
