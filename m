Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795130849;
	b=hacdftAWYPRGDg+Ujhi1cE74X7zbFxPoz7meDuSxUtlcoUOZA1KkQBSvYBgB2yncihbm
	 U4ga6ibAJdHKE93ODHv7kE0nVMUSxiW5o7UfVBM7tJoyxhAeI+5bMmCuxCeHYB2QtOZDn
	 0SIAQ+/b5ZAk+9dbo2SdHgPEYezkF/gaK9F6cKgVryRzCdLD4tTfi7wtJnT+LCJL+p/YF
	 8KWPCXuuotr6snBDLxiYvmWHZCmLmYvcbvK4JK+JM7C7h8Ic8lmMCfxhfBIHyNTYSzF4A
	 QZxfhIW0TNxiBx1UpSa69oQ91v9B3o8+Kxynany2y84L8rInaIm35oETZpZIBAYdJlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OQjCXUbscPytTNcthMSXFUhQzfR2m/iC2VTnVjvFUQk=;
	b=KwWbcVIKOKdZRDN7K11KNCfLUPbKs3V3QL0kWU8LscbkFrexAaQrrxQ71LjfNNQR6hmr
	 VJrPazBkcAAdIl1QTlV+Dd4RbFUwsCVHo77TmyspHHn+GETZuUtuknkg2i0N3NqqMzqfP
	 kLSTELcoWaNSJTvwFiwFs5y1aoyh03L5dMxwYPsm2iBEUp+tjPf8w0s2fQ3G1j6cbawcv
	 G8kfY4jLAtjH5juKH810wimp/cvMT6l8umhmmtoRXW3ok9Ktg4kS5jK5kJYnbASt52GhA
	 NU4gGcjH1eTOHXZLhXMBlJE+JbWQFu1XsBffbVDyBcZwnNx/R8J7FOkzDx/ZoqEB71w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hjX4t2Xo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F98606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F98606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hjX4t2Xo
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3acd523a802so2185621fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:27:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795130847; cv=none;
        d=google.com; s=arc-20260327;
        b=B6VUcVdM84W9nLbrpeB32Jn7eF4DtffcxXYnw3p6PoBaIEAkNimxWme43gPzUO/gqe
         lNfzjIE0/uJA4RuJod3gCxPtH7JAZn7PlwB6iQeX9JUuPShHtmyYuSOoRnKn2ZWRquD3
         jO7t7mgS1gBac9dF5Q6Uk9RW1v3gSf/kFoUASz1ovY9Vlwx1RB9iWZmyY3esCOFP7e80
         jOISui2jsnv0KcJbe+h3bH/qdmF2MMta0kyudnxSI84nWMHev7LfFVaXK2ZsI07Ze0P/
         yQwHNTdA/qFwe08X6JF80kDpfhCAWTdqUPuIE0usXnHd06YJdCCO4TQx2cdlItt9XIK4
         DdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OQjCXUbscPytTNcthMSXFUhQzfR2m/iC2VTnVjvFUQk=;
        fh=JplDomGwp/pTWuKCWxXmFe5XQlPT+8fSmWw2ho/OhPI=;
        b=M7Nr0zTBlDJm+6xfwxfZzWkiav74eVcJPIcrioIE4Y46QhMJrkENX6qaL8UUUIn8qK
         e+YfnGMBhE5MwI0rqCT5im4aZUCJaE2b7zeyw85kyWJ6vJ+dCfchX3jCh0ahIValtsNX
         nto/Rnh4LdALz+B1AD/HfuXmlU0DZGgXQK7mFEdd8KBZlQ0JyGmJu8O4dX8s+m0tbKLV
         o0bzYrpCIlto4q/cjpRe5t7+f1J94hCrJuDp1uX3QWWfv8b4ZALEOCFRCNoj7So4r6h5
         F+g9JNlkGfqqrNa2KxM0a4IQILGuRS26N9PVq42ISrR1BeCV3/EwDXxavIFBZ0jTLNMz
         6VRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795130847; x=1795735647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OQjCXUbscPytTNcthMSXFUhQzfR2m/iC2VTnVjvFUQk=;
        b=hjX4t2Xo0e4RQY2C7GXTldeqYZukwPJ0G0t0eeIIqIxOs+nv/R5cEOi7krUGHcZauR
         vqzkL8y++jDu/is0RF8VMVltWdEd0lyrR1cIBs4FTu4VVQYMJFKG/s1sz43eyqiCcrTX
         Mbg5Ry98V2BB5rY4noROHUppSerOzFFtKwmae0y2na6LMWfxzuzS7JHUleTuTmaHRiow
         9su2Gf++IX3BLOp0vRmJ0CYQlTuqXctSVrAeuH0kMwAL7Ra/++9cvRom3L2AnQl9FlUD
         fl60SeNXa2k2FkgU8xK8tCvQtyjYi99pa5QdP3Pc/FV7HKF68S1o+Utpk9RB7yjgN3SL
         Wk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795130847; x=1795735647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OQjCXUbscPytTNcthMSXFUhQzfR2m/iC2VTnVjvFUQk=;
        b=NYvFG/YMnbCJN3iiXa3TC07ozHhIBpqd6MOjB93KOXb3EGA4aknNgCLAg8UvAC0rYo
         6lyPkQ+DgerxcGbvvtbdwjBpkw5z1U5l3b64u2H+l5ukAsCrY5FbaxoSVURCJTzzFD9M
         J9b8gcvaW32/aHsxsPu8OXF6+6AKVqlojIqfDt4Z9IKpTalJ0vEdgOzRPdDFGfYy7xkZ
         FWXPjiLOoapzZt2/EnkoCa8KGfddWprfNNtFhahwWS2EdWDJ9wozoXuxoGf7+zVXVQkq
         8qEpLYOUAJa7PDWb91ijd63mBel5UMtNkDu318Ly724CQpS/rXuUtMITCuoK6A1zJ0DB
         5wXg==
X-Forwarded-Encrypted: i=1; AL+hErFuEY+rtgeBia1Zm/h2lcqff8QGYmx1uUfVvAjukeLtNQkPND+IXvetQQFBDPmULxwXggjGO1LY6PrqULs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h9N2GHBPBeHLiux9O/fFtPfihjxQ1kuQ0JtOqx0mPVKT+r/x3
	r+3saMoYWGhFvLutGSzgCNfB0OdoAoYfEWeAt5z0bhyW8gtuZUQLh6zUbRxsEseXMP7zZCMzl8q
	l9jbpzIUR/xt9b7r1MH4F1dYoin5bNIoRn6E3c1Dk
X-Gm-Gg: AYBFou350GjNsJVUsfSUhNH986KkP5YzWOj+k7hBXCCFM6XvBkPR0QhjWadW1JHjxxH
	DtL/3qxYVwLGjDwJ4OFa3/0h6tPM+c5w0MU1FLrfhDJngvdZgyXHbQEqUu1TJwA/mAkTTvs/g9W
	NmBeLD6XoVVKxQ9VCal8IW/DVRanQTP88m4bN6XYtypOrQOTlKWoYd1scPLQ2gnBxlj1/aeXVuX
	toFFO5LAA0wfIYmx6En9a9uHU2upcm81aGs+UpuQryO2K0tkK8RPs/rXZl3RmtCATCbsvWH5IzC
	Y0RoaMp1DCzzjlSY8L5LFB95eJp1zEhlAjvfwC73zrP1mXVQa9Khfr8uE8mG/q8x/yL26aIN55p
	lqjIUTMzSACB9OmhLAE3UHTuiLhLalNxc1Q==
X-Received: by 2002:a05:6512:1194:b0:5bf:b365:d82c with SMTP id
 2adb3069b0e04-5c1bc89ca7dmr310274e87.57.1795130847409; Thu, 19 Nov 2026
 15:27:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117231352.3816603-1-jarkko@kernel.org> <CALCETrVUkbpoFjwSAejyA4b_9qEauAP_36i=O8Op1ifp8aUkqA@mail.gmail.com>
 <av3akYFOYaeQZauZ@kernel.org> <av3bkDnwmjunTleX@kernel.org>
 <CALCETrXPLeUgxyhjP4XuWS46FKB0TUHF5PcMkdMf+qeEXbyXRA@mail.gmail.com>
 <9463a969d35a7d5ec5a56aeb67644b94.josef@toxicpanda.com> <CALCETrXt-Do28BHDpbrA98kEy-tQuorxD8c2XsW24Tt8Vspdtg@mail.gmail.com>
In-Reply-To: <CALCETrXt-Do28BHDpbrA98kEy-tQuorxD8c2XsW24Tt8Vspdtg@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 19 Nov 2026 15:27:15 -0800
X-Gm-Features: Aa3M54pRPzoZRQLZtE8vOKLAtvSp1jFKDAaRmJQa_mjsSLqBguq4HCe2_2_ku5M
Message-ID: <CALCETrUbe8rBoxrC+Q66AMsrJ8Fow7xt5KJKRAmobtXBvHWdqg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Jan Kara <jack@suse.cz>, 
	Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 2:50=E2=80=AFPM Andy Lutomirski <luto@amacapital.ne=
t> wrote:
>
> On Thu, Nov 19, 2026 at 9:30=E2=80=AFAM Josef Bacik <josef@toxicpanda.com=
> wrote:
> >
> > On Wed, Nov 18, 2026 at 9:46 AM Andy Lutomirski <luto@amacapital.net> w=
rote:
> > > cells: The dance where I create an anonymous mountns, mount stuff int=
o
> > > it, and then attach it to the cell is cute.  But I think the userns
> > > interaction is wrong: you are making me assemble all the mounts in
> > > *my* userns and then clone the entire tree into a fresh, non-anonymou=
s
> > > mountns bound to the current userns.  And that clone operation is not
> > > free and serves no actual practical purpose.
> >
> > The copy buys us nothing, agreed.  That's just what the mount API gives
> > me to work with today, it's not something cells wants.  If I could make
> > an empty mount namespace and fill it by fd I'd use that, the "root" slo=
t
> > takes a mount namespace fd already.  Extending the API for that makes
> > sense to me on its own.
> >
> > The mount namespace staying with the builder's userns is on purpose
> > though, that's what keeps the cell from mounting anything no matter wha=
t
> > capabilities it was given.  The builder sets the tree up and hands it
> > over, so the cell only ever has what it was given, and the mount code
> > isn't something it can attack from the inside.
>
> I don't get it.
>
> Using the builder's user namespace means that the contained processes
> can't be ns_capable on mntns->userns.  But this solves very few
> problems unless you also deny the contained processes the ability to
> unshare userns and make a new mountns, and if you can do that, surely
> you can also deny the ability to modify the mount namespace.
>
> As just one example, a mount namespace could have a little flag to say
> that it's *in* one userns but its owner is a different userns.
>
> >
> > > cells: I find it *incredibly annoying* that one generally cannot put
> > > new mounts into an existing container using most existing container
> > > managers.  I hit this on a surprisingly regular basis.  You seem to b=
e
> > > baking this into the whole cells design.  Why?
> >
> > By design.  Allowing changes to a running container is what causes the
> > problems.  If you need another mount, tear it down and build it again.
>
> What problems?

I'll add:

On a non-container Linux system, you can hot-add a removable drive.
On a Linux-hosted VM, you can hot-add all kinds of devices, with or
without the help of the hypervisor.  (The hypervisor can hot-add a
device, and the guest can mount network devices or newly added USB
devices on a port that was already assigned, etc.)

For some reason, on Docker and its sort-of-clones, approximately the
best you can do is rbind in a directory and then mount things into
that directory from outside.  This is sad.

I get that there are plenty of workloads for which this limitation is
reasonable, and there are more workloads for which this limitation is
silly and people have learned to live with it because everyone
imitates Docker and Docker is limited.  But there are also workloads
that I hit on a surprisingly regular basis for which this limitation
is genuinely annoying.

If you want to write a container manager that shares the same
limitation, fine.  But please don't make it into the kernel without a
compelling reason.

(I personally think that Docker has a *lot* of weird properties that
make little sense.  This is just one of them.)
