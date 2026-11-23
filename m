Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445772;
	b=4sDsj3ccLJNfrFMPTRiepmQKhNcS2ch+1HtIhTeNwZ+aPjblFyD5KQ1H+NkN0lWsftQt
	 6y9wbluTJ0+R2Y+Vi1yniD7mpZdL+oPedWG8LKLiH2qDmrNM09JxFzW1ylNZIsua9lDVJ
	 8Ff0BOiTrV/F8RpMzWaLd2FONrSnFlebOhxoPbcnQyjozePwAQsVJe/kcbOr8cCJbANAJ
	 PEQNyLnokk17GJzk6bi1oR51GFvH7DufQenjCvEhV6BXwIOKbe/3WB1vBMhyuQq9Jyhwf
	 6EsMc/fPZtDaX26psQNL7fGutguH/vnx0+WO2UBkSAYllUR8N2WtB+3ny9vC69LHI4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iLBZumrqdFfo+uoEqy5DjzVlLpVK7yMeWhuKRObIsyk=;
	b=uNseE0Zo5ehSdQaa1meYc/clXH4u+sUAwsKkQLroHec0A3lJTZ/3x9v8SdVGw+nb4wdx
	 3/ni3j44S041UkFbBpEMfvoq/G/jMQ017Yg4nix0OrFctNdEYWgIouY0Dk/z2ltYLgs72
	 NmqLfg4hORNa/RofISaUt1Un5DPvPJp8C8StG1P0PIuBWlowHJ6ehO2/zOp6YoPCdVTQe
	 VXiCHS6njvbe9yayT1mLysqfNw6jkNRUV0GSuZRuQWd5rm4501pIlxkcqoziIvSCC+Buv
	 Mihi0XLJuFIZ5bIt36omNttTE3csM7Gq8waXV34Whr89XKPpiVKauS9xoJ7+5Q3Q2cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqeG4UVx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6606A606A33C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6606A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqeG4UVx
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so4438940a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:56:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795445771; cv=none;
        d=google.com; s=arc-20260327;
        b=c8nlY0v5yYGRK85FZCbFwf/skerh0duulSfH6VbtwqV5DEFMO9OwxdbJVm7qoIY3Tg
         4IL0tGXs+5r6H8ybDx7FyW01rERs+Sla+85wTFWwrJgoxMwS2D5CE33pcQO9m3W6cDLR
         0ozQKp3Hq+Tk+TDn1hKajyyHMqxYVJusDruT4e3Z5Hk7QXGyVZVXYplWzC7rDeyYOQlt
         f5P62vcqSeC906+XGPws09LSlDs7UFcGBbAN/7FtTGF0fsg7mZqAQL6GMcTlUnwF8GCr
         82U5G1yHDGMeFsRizga+yrYrW0zFu+vP+7xc+KLNrvTbhOuO53tBtuVV5prjlqRTzj8x
         ltHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLBZumrqdFfo+uoEqy5DjzVlLpVK7yMeWhuKRObIsyk=;
        fh=G4oTYR5gLfgZ/5a2NshEn8uqnfkS8GGO1p1mY/MOvOM=;
        b=YVK9sc9W29fJL5iSWSRxwE1Ia+GJB06dHVPF8V9Z8R6JIHy8qXqEg6+Szky47oqN0M
         sIhfvOjBNq30onqYJX6LDZR4yu7DIMUsTrYvxi43tgjLNZy6787g4Op2K3edexPmGYSt
         5OV3U9f5MMRujDmUxwO5HrxHOF83TnvtgR8lY5RCVKuSuPrFhYZgtwv4Peq2ni6eEOxG
         zlxipswCnr17MvQbjMM2Fbkl90/sYm/X7SSeSjuU14taNGgMKPu1f/jYGQJ9WEmcGUrE
         8uyN8Lsa7C0mc3sD0QwHTaOGpiItevMLrPmpPo7NRJdkVy5vQvPjH943G5L8r6kyG+ZR
         3P8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445771; x=1796050571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLBZumrqdFfo+uoEqy5DjzVlLpVK7yMeWhuKRObIsyk=;
        b=wqeG4UVxEsqawGNw4hgj4cfTFQ6arGqHSUO6imUiUMeXa8Rm1J1TOte1yUPje6cwe+
         TH7GIH833ISdvF+478dTG3g3rLc8GhsHBKY9tqDuuQG6ExZLNhc6wL4HurcYB7XYzYdM
         k1c8ZPl+i2LZWoD5sDSXAeuyZzpwDmF+lV5KF+mNx7I24cADkXDh2iddswNPgtjRQiod
         98Rf1TYJCpfC9KwAJ5lRFDyGvcIpE/pXspm8dgf3k6SDEHnakNvYQAXllHZS4/z97Zhl
         7Cy4Ubz5DFhoeGRxQ9Dvdf2g25hW/qM8ZE/LRkxbNQ4Q7lkYgGaDdPliMsLLJbdE54BG
         tBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445771; x=1796050571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLBZumrqdFfo+uoEqy5DjzVlLpVK7yMeWhuKRObIsyk=;
        b=oEiZw3tW/Nd3Vc8deU0HcIdJRYglsJg9iqpP3iPqegJ5qp1uLZXl48CMOyohI+Dt9Z
         Y1ZreUpraqcQDeAJh8MCxmYxQMDBKMV4flhY/+Mvo8RJlPbp2Jwhy7ZTc8U9huOkbXRf
         2/RO1uT1GGQnbRqLkxwEkDXh2pK1mk5lqYea6K7xJ3hp24dUv4J0mNPb+PSblsbEvskb
         HuI9RttgwXIteSg/aQfIhhWkI/7vjy9mtGLWFcSkNjaONCPKe/1l/EpU724P8Zo3U/0/
         ifc6Of4l9RiSQP+iDd06OxAndwD9E6Culqejmz7s07vnoLw4S6PzWzYyBRQCfPshmLwj
         5bHA==
X-Forwarded-Encrypted: i=1; AL+hErFR6oQ8CI54sC84Te9mWA89GR3pWMwGi0HHD1qayxbI0inJt+iJ1P4OTZ0epd6lKRcCfE+D0lkiv2CSaEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sw0kf3yz1dtcF1xABOf46AKzVDRzQP1eru/rwG17X7ZD106Jw
	l6JI9JIFhMX/WZpcZlaTnuFnk1m+lMeHGKi6Sa4anR5yzi2hyNmrpWscGKGsj3OsKctq+aRFVuo
	23PRsweVRpIp6swhLJ0mRq4kcIBGuT6o=
X-Gm-Gg: AZFdTZcaXjBz5OqNUw/WHP21w0Jzvt7UHs2FTPRICP0GzanQr/EUkRd76hTpm0zLCDg
	m136Yx+j6K9hndU+Y/j5w+d2k7jHSLGlLqlPCVxH6SBMF9Ii9vrnO+FMRavC66i+3Jv4sHcpZyM
	9b6N9AW92bRw98mOTF+gm70NkgxmZHZqwgbo3YxPHCuXf1SbhYdCXx5EzAuj3fQDQapVwTiQhBz
	s6gKgb6U8hUuJ0hVXas2oOl3UphL2SNdU4xnhKBDd3gRx1zhQEnshJLH07fGeDjRRjzMV3Gu8nr
	4JCVkZRFExuDkfPR4hn3uz6R51NnxK4QVkfcm3W71cAigcRJmMkjmHmRfDVyF2slHSwXUkC9gwi
	UXxPqh+akgr1tzLQHUt6dRhG/Ax1YS1w8Hf7rU4pd2JL9O2nmqSyyplmnSlI5V7/ntYdGFg==
X-Received: by 2002:a05:6402:5516:b0:6b6:ef7f:600d with SMTP id
 4fb4d7f45d1cf-6ba37e74244mr7852050a12.21.1795445770471; Mon, 23 Nov 2026
 06:56:10 -0800 (PST)
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
 <CAOQ4uxgc6pP+_xvJMbqj6wOdGzS75Vn6x6i_vUfCJDD46DAA_Q@mail.gmail.com>
 <DN2N0BY83OY2.1OV3ZAZFSWCDG@gmail.com> <CAOQ4uxg9O-R_SUPAZ75ESGB99-4Z4EEUKGMkCF2f-sXkGPq1GA@mail.gmail.com>
 <DN2NVGUNO0GA.89JAB2PVI0LA@gmail.com>
In-Reply-To: <DN2NVGUNO0GA.89JAB2PVI0LA@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 15:55:57 +0100
X-Gm-Features: Aa3M54p3kKL3ZKUzvEHZq54IOonM6T5WCFB3q5vIRbaCh5i5swbxajRtrCtjW5o
Message-ID: <CAOQ4uxjuAN0FdxGr_-OccO5qnUuLF5oxOq7L_545tG3+36EKFw@mail.gmail.com>
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

On Mon, Nov 23, 2026 at 3:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 23, 2026 at 3:14 PM CET, Amir Goldstein wrote:
> > On Mon, Nov 23, 2026 at 2:50=E2=80=AFPM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> On Mon Nov 23, 2026 at 2:00 PM CET, Amir Goldstein wrote:
> >> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.=
com> wrote:
> >> >>
> [...]
> >> > Rule:
> >> >
> >> > You cannot add a flag to common without carefully auditing all
> >> > filesystems that support the legacy flag.
> >>
> >> Yeah, sashiko pointed out a problem in f2fs, and I could reproduce it =
in
> >> testing, where adding COMPR to COMMON makes f2fs crash, it also needs
> >> NOCOMP in COMMON.
> >>
> >
> > I don't think this is correct, or at least not enough.
> > My agent said that this breaks or changes things on  f2fs/ext4/ubifs
> > I didn't bother to check if all of them are true - I doubt it
> > bottom line - need careful audit and good testing.
>
> Yes, definitely.
>
> >
> >> > FS_XFLAG_ENCRYPT can go into common but must also
> >> > go to FS_XFLAG_RDONLY_MASK because it's read-only for
> >> > all existing fs.
> >> >
> >> > COMPR is rw for some fs and ro for others.
> >> > As with CASEFOLD, you cannot make it COMMON before
> >> > converting all casefold fs to new API so that each can say
> >> > whether it wants RO or RW.
> >>
> >> How's CASEFOLD currently handled? in the v2 I'm drafting, I added
> >> fileattr_mask_to_legacy() and fileattr_legacy_to_mask(), which convert
> >> between the old format (filtering by FS_XFLAGS_MASK) and the new mask
> >> format.
> >>
> >
> > Good question.
> > Need to check this.
>
> Can you do that? If not, I'll check tonight, no problem.
>

CASEFOLD is set in FS_XFLAG_RDONLY_MASK and NOT set
in COMMON

Therefore, doing set with the old xflags API for the common flags always
preserves the old CASEFOLD.

This is kind of ugly and works but its hard to see the design there
so hopefully all the new helpers and masks will sort this and make it
more explicit.

IOW, ENCRYPT can use the VERITY RDONLY and COMMON
precedent because it is read-only across all fs (via this API).

COMPR (for the purpose of ntfs patch) can follow the precedent
of CASEFOLD of RDONLY and ~COMMON, which somehow works.

Note that for fs that were converted to the xflags_mask API,
COMMON should be irrelevant.

COMMON is only used in SET to do GET and preserve the ~COMMON
bits of the "other" API flavor.

With the xflags_mask API, unless we adopt the "verify" feature
there needs to be no internal GET with user SET and then COMMON
is not used at all relevant at all for those fs (e.g. ntfs) only the
_fill_ converters are important.

> >> > I think there may be a way to deal with this easily since
> >> > ntfs doesn't need to set either but not sure.
> >>
> >> We could export the 2 other helpers I added for v2 (xflags_to_flags an=
d
> >> flags_to_xflags) and make NTFS use them?
> >> Though adding the fileattr_ prefix will make the current (v2) vfs code
> >> maybe too verbose.
> >>
> >
> > Honestly, I can't say for sure - you can try
> >
> > I think you may need a different set of helpers fileattr_prep_ used by =
the
> > filesystsems that are converted to xflags_mask, which may be different =
from
> > the set of helpers used by the user facing ioctls but I'm not sure.
> >
>
> I guess I'll think about it when I move NTFS's impl to the updated vfs
> code.
>
> > The thing is - this is all hard to wrap our heads around
> Yes.
> > You and I have parts of the design in our heads w.r.t backward
> > compat with legacy API, both UAPI and vfs internal api.
> >
> > I think you should put it in writing to see that you and I have
> > not left anything out because this v1 surely does get it wrong
> > in several places both wrt legacy UAPI breakage and internal
> > API correctness.
>
> I agree, now the version in my head is not finalized yet, so I'll do
> that in the v2 patch/cover letter.
>
> TLDR is "use the legacy to/from mask converters whenever needed, so:
> - user legacy -> fs legacy: keep as the old code did
> - user legacy -> fs mask: fileattr_legacy_to_mask()
> - user mask -> fs legacy: fileattr_mask_to_legacy()
> - user mask -> fs mask: pass it through
>
> (before finalizing the GET path I want to finish the SET path).
>

Maybe for me if I don't see the full picture, full get-set cycle
it's hard for me to judge.

Thanks,
Amir.
