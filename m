Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795447127;
	b=n8hKll5cpeTSGtM4eSQCTaA2Pn5qE5kqUpHOFLp+5UNYNYy7trpb0pfwhDA5HxLydcy3
	 aFeL9JdDZf96fyNs8Ih0WQCGfXKgliySsZ4MIJ0ojxHBkYNxHhZbfnFU/5fnAhURNWK+6
	 9xpoKjCvv2cAyCJj/Vic6c5U9jymE/y/s+eOxD71wUDtwcFWs+wF8x3E9uwX3ZPvKwgco
	 pToDBi2XLUiFJw5jzltaaVOcEVjcvyEtgNlvKaj9kCksXeuVElmWF69RfNVu3BhWPQ4hR
	 nwR+qzaL3S3PRTlZwN85oypK95U0BjOqe0+ZYBPfZL4SrtAaWN1Iorc7+43toa07gNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FQauslTrJye8WtEKr4/uMYFLXtDrCWIYYsnNnENx50w=;
	b=NpKwZ6luifxwEMRaXzVSb9ZkC90oCsH8FWPfQ79sqS0NU3mQE60r4Wd84x4vumOgn1AK
	 /h9QtGBoaB7p1sRXDt5jN4EO6Fdzl43sIiGPmvs6bwIXWdnAPRW6df5gAOs01oJOKr3Bi
	 7LfHJEEU4Gz6xHshDw+e0j1/BhHpEU2S7Sa3TxmMk2FaqnINcBHP/yT5ImqMHwf6P/18t
	 WfJUCxD34DmwiBsi6P4iAInStHerWp4FENgJkskveGgcWY9CX/3uNPKgQP9Ur1W6vga+j
	 O33SobGq+0GgUlBlvp54bPsqpCwUISDmaEFaefMBWIwk5gNs1MT7oXjwgMioZSXFC0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tnOVRIK8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93566606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93566606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tnOVRIK8
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so4203694a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795447125; cv=none;
        d=google.com; s=arc-20260327;
        b=sVjGtj4Hs5Ttxwo+5HFZqpqfckt+DaD/8yWY8YZPPhjCKBJxtKHLwJceSCauXJ+Xz5
         B4XXipizjNMrtNXiAvfnBxcyjswKzPZzhWNTzqwDZr57VtMOuIpb8zBZHLTSaWtOEOek
         vaJRoToiASqhUigXKR7CZ2U12mVpr7qI1AedIfFzso3Q0ksPeq+ihtbd/uMtNbeFq64X
         mj6O/YnGHctfXShqLEVu0AugvAhsgiKDRdD29GSA2/WLr4glEPxThFyrSpZMmDAGAYG1
         5TD5pTOFFjtYkPLsf6rD+gyPjqfrWwkdeZT5gDHGPbaPQV6qkT6Ek+ELcYArwiQblBmC
         hJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FQauslTrJye8WtEKr4/uMYFLXtDrCWIYYsnNnENx50w=;
        fh=az3XXBjAu3sAMpT2SFus0DuqF1wipMkqVaskgnskb8M=;
        b=X1Ayp+inYpuMT6MFKJ5R/8KNVWfx83D8DS5Nt5bDqTPyDZBT1t/WaIFAwO5S2BKnoV
         keMkhn7CZIWYduOeVwsxR6Gu8XP1g4J+E/LSQXVcXMyzAn4uotbbWaXETgLuBbY5RtCp
         x4aSvOmfP04aNSU7S/e0d+PfXJjN8kkAN9W7nYHSBLPQpORtzDeF0Fb/Qn9YB9haoms6
         bvC+9NEfdm9odzzZpirRCvCew7oSL/NkvQzxxG2LE8hGtdbjdmZspnDoYgvxrWDMegqc
         R/NQnklIV/CIo5c5SSMslJbUMUglDGgHTYKQ5ZyFjGdCeRvDOMTM8vdpgP7XdKePZrep
         lgow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447125; x=1796051925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FQauslTrJye8WtEKr4/uMYFLXtDrCWIYYsnNnENx50w=;
        b=tnOVRIK872Am/h1zBxtrm624YwtnAaM1ODFpUf4BIJQhjvNzDIVKPp0Tc0+kuNgK+T
         P6zbEiDvzhGQMmXVnvEgssD5Os9Kxz71/UfuvuNfnMWhsGjmbEY+8raprIJ9X6wrs9+P
         t+n4QGoPL0En++2BIFCjCTfGW7tcR93V3ClOyWg2gSS8rvl/rQevnj+NbA2pmKoegUTq
         wAOmepamNX26KktT8XanGPaaDNNp/wDvhl8maLDsDH89HC5UHE/TdVVYvF0O7DiHJyEN
         CZVx9d478DNjHDgR4foo1kre37sD3glA5umfoInRNznQIrbXZtcPjA2+5t6yJceHDFpe
         Nzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447125; x=1796051925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQauslTrJye8WtEKr4/uMYFLXtDrCWIYYsnNnENx50w=;
        b=bKK1wNNoauaMplWpWI3ezpByGnGMa8aLTGu7uEw3EtAOlYYKk0A0LIVt2QS1OtOgms
         fpECvdwiizgzCWV41MJKZba56P5apMtRMtbvCRerRznaS/B6mNan4/VETphZlBFInVcN
         bFTLO/cdvh0mSYpDAzYk/ruW4ZWDjnDHkjkKIJsHu5RMLVGxSXlMk6AscBkODmr2hvKY
         ercNalzZWA03fPO5B9aedzscaadN0luV+d7LzeMQP8bRKUngPxDv+BxNo2TMkzXv58KA
         ZA/u+aH7xds7vNM26G8wcs+ok9bhnwGIsPErI3fn+NlQUSMXL0r4xPfPMPGEZ4lw+pz2
         G77w==
X-Forwarded-Encrypted: i=1; AL+hErHb2RgLL+AOW1uzyN9rsbUDvZGqTFFAPgU1cwmbRfF0sesy6IvNY0t1v6hN2NIVD/hCTFuymzZ7eDeXvwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PRDb8Hl0SJSRvHGADY8eH6g4pnF4WsNiJZyYS/QioPE2zHEyQ
	vtmMlLqVTREtm+adoddHU9V6+A9gnU/e0EfCkcaQidSQbFj7IjmVcNcgtPA5lMDCK5RF3SQOWjl
	5SdOVXOjhs3tWJ09TL3tAtutlcgzTCVk=
X-Gm-Gg: AZFdTZeJzjb6rhk0CDtnRwWYj9KZFPUrzyOaBWLW76wr5EdNLdzRkVbdMT/ZOh+ZEie
	4rL8baRKkZ5bhQZYqoCwRqYZYBPsWX/UL+a9CYk5sUgjmRCoce/fAUYqW4ZLeIzkEttcGqqFxCu
	9P+Wg8JtBIvY5Cgn2OQxFMRbpOIuUigiKM7AYreT870iiy9/PhUa5ZNQaEKJAe7df8htx00Q2Tn
	H1FdMfLA7r+ZDy4IaD8ccaQalPlLBbKd92xowVKM8b5moRq16EpAUEjmsoXaFjCmUhLSrONoKLh
	XX4ACVVczJBgBuilFkuBf6IvzjDmL/JfKtViKM0eNAMpdpF3ZT1RCm8vhtxMrUkTgbKnYYrzUdU
	IhcwKKnNesASvDJ6eAYGKFHiLPYR159fMXruS4fbt1W+J6eJnJrIByfPb4vb3pnZJ90V+Ujk=
X-Received: by 2002:a05:6402:23d0:b0:6b1:b97b:744 with SMTP id
 4fb4d7f45d1cf-6ba37ec18e4mr7070716a12.32.1795447124603; Mon, 23 Nov 2026
 07:18:44 -0800 (PST)
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
 <DN2NVGUNO0GA.89JAB2PVI0LA@gmail.com> <CAOQ4uxjuAN0FdxGr_-OccO5qnUuLF5oxOq7L_545tG3+36EKFw@mail.gmail.com>
In-Reply-To: <CAOQ4uxjuAN0FdxGr_-OccO5qnUuLF5oxOq7L_545tG3+36EKFw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 16:18:32 +0100
X-Gm-Features: Aa3M54oObGzmT9EyX7FArFQpCHBYwqipULgBnYau0_-PZcRo8HGalO_VEERbt3I
Message-ID: <CAOQ4uxgyKcB8GjE5_S9fgMv9oC_dKKaypDWEf-eXEkFeo5e89g@mail.gmail.com>
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

On Mon, Nov 23, 2026 at 3:55=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Mon, Nov 23, 2026 at 3:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
> >
> > On Mon Nov 23, 2026 at 3:14 PM CET, Amir Goldstein wrote:
> > > On Mon, Nov 23, 2026 at 2:50=E2=80=AFPM koraynilay <koray.fra@gmail.c=
om> wrote:
> > >>
> > >> On Mon Nov 23, 2026 at 2:00 PM CET, Amir Goldstein wrote:
> > >> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmai=
l.com> wrote:
> > >> >>
> > [...]
> > >> > Rule:
> > >> >
> > >> > You cannot add a flag to common without carefully auditing all
> > >> > filesystems that support the legacy flag.
> > >>
> > >> Yeah, sashiko pointed out a problem in f2fs, and I could reproduce i=
t in
> > >> testing, where adding COMPR to COMMON makes f2fs crash, it also need=
s
> > >> NOCOMP in COMMON.
> > >>
> > >
> > > I don't think this is correct, or at least not enough.
> > > My agent said that this breaks or changes things on  f2fs/ext4/ubifs
> > > I didn't bother to check if all of them are true - I doubt it
> > > bottom line - need careful audit and good testing.
> >
> > Yes, definitely.
> >
> > >
> > >> > FS_XFLAG_ENCRYPT can go into common but must also
> > >> > go to FS_XFLAG_RDONLY_MASK because it's read-only for
> > >> > all existing fs.
> > >> >
> > >> > COMPR is rw for some fs and ro for others.
> > >> > As with CASEFOLD, you cannot make it COMMON before
> > >> > converting all casefold fs to new API so that each can say
> > >> > whether it wants RO or RW.
> > >>
> > >> How's CASEFOLD currently handled? in the v2 I'm drafting, I added
> > >> fileattr_mask_to_legacy() and fileattr_legacy_to_mask(), which conve=
rt
> > >> between the old format (filtering by FS_XFLAGS_MASK) and the new mas=
k
> > >> format.
> > >>
> > >
> > > Good question.
> > > Need to check this.
> >
> > Can you do that? If not, I'll check tonight, no problem.
> >
>
> CASEFOLD is set in FS_XFLAG_RDONLY_MASK and NOT set
> in COMMON
>
> Therefore, doing set with the old xflags API for the common flags always
> preserves the old CASEFOLD.
>
> This is kind of ugly and works but its hard to see the design there
> so hopefully all the new helpers and masks will sort this and make it
> more explicit.
>
> IOW, ENCRYPT can use the VERITY RDONLY and COMMON
> precedent because it is read-only across all fs (via this API).
>
> COMPR (for the purpose of ntfs patch) can follow the precedent
> of CASEFOLD of RDONLY and ~COMMON, which somehow works.
>
> Note that for fs that were converted to the xflags_mask API,
> COMMON should be irrelevant.
>
> COMMON is only used in SET to do GET and preserve the ~COMMON
> bits of the "other" API flavor.
>
> With the xflags_mask API, unless we adopt the "verify" feature
> there needs to be no internal GET with user SET and then COMMON
> is not used at all relevant at all for those fs (e.g. ntfs) only the
> _fill_ converters are important.
>

The statement above came out too strong

The internal GET is still needed for the permission checks (immutable, etc)=
,
and for converted fs COMMON still matters for the legacy ioctls, but it is
not used when the new xflags_masks API is used.

I would love it if we could get rid of the internal GET, by moving the
IMMUTABLE|APPEND checks to the fs fileattr_prep_ helpers.
But this can wait, you should not be distracted by this now.


Thanks,
Amir.
