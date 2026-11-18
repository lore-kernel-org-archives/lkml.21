Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795023977;
	b=lv9L/4x2OazxIGHDeDZXT0lwKkcj6/ZJ5R5PrABu7vCD4KoTG5JTy2Uz2vhBxel9RIv+
	 9d9Oi6nthQmv0hL/AQF42sNtogN65d4as3SosoQ5zfn9uyaIig3l3i/FxyHQcSyiaU9+4
	 x5w0m+Y75JMQvNotegPGBARuGQhcn/FDnfXOUaD1cFUZPsFJdbW9bpA5+C0qxQiMCdvJW
	 K6vvQPbhIDAeAylN1wbs+RHXeZjVaq6GLkC0eWk0N681hlnAd/94yIa0zswGafUszHnWR
	 /L73eJBinIejV+HwE+bm4vmqmfZCuwmZw0bJkO0gzgDLQ9fY+rR8Vk/2EN2JdAmka6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SIiWqHkbikiw9/PSo57TK7nq7ydcL7CNJ2g4TYGph1w=;
	b=pOnbVLj1qy8ntOBxUIqG3Qf12UJkhW1gtt8XbAmiUIw3GHmH1VUvEE46HizsH+g30Hie
	 zEfGHLri2/uyoalzEbbWBVCyNcxpdKdwzpWL08AFUypvrP6zXL+lNK7PlEA5rCP5g4Eal
	 8vOAeuebL81e1ezuzk4I8EhkBsity/QYhsO0Nq9sZtaFL5D2rhHS9fNBbw9uegJS8FPuE
	 cs8KDzVHXMwWxMaQcYBLqq7Y5MQKJa4UqO2NIwJXwMJKp/SowvxPl3YLS585gPVYrVuUw
	 d++N0KXq1J+sua/qch7teJ6uHruhPoixeD1j8gV8xrZEGJBkrdeH1Aud4aTisuxxI8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="KSkreA/l";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E185A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E185A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KSkreA/l
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so13790001fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795023975; cv=none;
        d=google.com; s=arc-20260327;
        b=S0gLBxD2lUsF9aQEKUHTlbCi5OYJtWrvs2GU6dUk26yYqaDEBxACbyrNtzRhUMZhzZ
         hlHWsJhRQwLzhN/keIZKN4EuSh/qHqQeItYtsqDm4DTlu1utUGqd9dffWB5urNWAoZZ5
         D1J7kjC1uMnu9GcUlkhlsS10pSxSUdpo7/gO3ShB/vRNEU6GNCzsCos6Db3szEHRRbzr
         nFmWZFYSBm4+HihB6a9lO6FreyT1mz7rnRrx6M43LgTkzrB4PPJzBdQJH/kZVwGsFqQl
         hrT7Bu1kcz+fxVszgsRqoU1qWtDnKHKkmuD09s3FHwxnT8MSqCjR24TvKXwQMGT1EUa+
         jQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SIiWqHkbikiw9/PSo57TK7nq7ydcL7CNJ2g4TYGph1w=;
        fh=EPyEuF5xFtLjpnlqzgbdPtPJNoj9s8J54+HQIBoX+JM=;
        b=JRTPJ9eSASlTeCQaIn80PvgcrDYwBcg/DkHXqvjOOfF/vvCqzlBCe9xhbvqNKM61Dh
         WsKV/toiGIHix3H7XYhS71HUu1KbbYGbvWd1KPz92faGIw3LswFrbBZnnRsMPvrLH3DT
         5pLVMQ8FjqhbAofuCzk7sKYy2nmEoD0Fs9SmaweAmnxmD4EoAjUdvQt01BKT/fWmaZiG
         l6mEW6/jQiToBsoMcXOc83I5IiObB6s6WgnI2XHDXUEZ5fqxhMMflVMbSv1ZqjVwtHSl
         Vl7+sdTMUSCXrJx/5uDwv8kKMym5LXFrPbAdFgPIfOeNjsbG4FVAy00doK1n5L6pi7Sf
         EGSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795023975; x=1795628775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIiWqHkbikiw9/PSo57TK7nq7ydcL7CNJ2g4TYGph1w=;
        b=KSkreA/lv4ezsG6FIG+0z6ugqaPZfz/K227G/b9zqB4WbfNBD3XL8nHiuC3RHSDVop
         r5WQO1yWZkBKMg+zBj6fpTWLOgpJt9bMFVDdhzBzxpnWtkhvlsv4/E5kXo+obO4szmr+
         nFnhBGrEd0bPzAozYpmaEhgJtA45FnEzG5/HZEZEyKNuYbIbPoPWq9RPDZYH3gY4NHNi
         I3IElP7vq/+9MvKb/InmOXdTWMpefUYfbAAhC3j8k1680QGt9U/5fB8JA17w2EOZ287i
         CuVr1tTToajDP4e2jNTAGYhUjIUDF7CvDim1WkQKv5tAZUDy/kdf5WduxQLtE+TgPH5v
         7k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023975; x=1795628775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIiWqHkbikiw9/PSo57TK7nq7ydcL7CNJ2g4TYGph1w=;
        b=tc3Y7GrOEe1wnfMy3RKx6HzgV7VMzekfNIQdJgKyuH3CFerSudJhbF/nZBUrwk/QvH
         r/mOJfm9ZcycfZumpBXvPJFpkgDCS9zHSKChfKAOgccdunIXDBlvABsO5KIu0O49RXit
         ftTHiN9oPgNi7xKEkzLG6tkog1yxN/GaOhX0TjABfSqiNwqp5sEtT9iVjFIKCqCNN3Fh
         RMPW8NdylyugSVbG3nrNBY5FerWdBNeO7X9aqA6odmxUa9CZ3SbQuT30zopY6rOK6BLj
         40Bhj3c+no8na+9519FUIUCOrJbztv777Oi8c2mjaju1meyrvqMy28W8fphMFUTmGsMn
         +LyQ==
X-Forwarded-Encrypted: i=1; AL+hErGxmK9NpFmi5g65tbsQ0f2S7NCuezZVpdLchbCiDB1xua5COw2hmzQC4mLAXsm7rihIC74QAYCUbWgal3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XdGTyMo1WYYdGxdJCHpCQXNFFGNhL5LM1rT0yl/jAKgrI9AlG
	m8Dys6COsqHSTOc41rMYgiFMBD9ZXVhz/X8UYlccrauvfboEIT4deTVoY7rfMViuvePRBX4/X0q
	aPQJT0NHnRY1W/sQmWtgiOqO4z07UjHmv670pa0tM
X-Gm-Gg: AYBFou32MrsDzz3EMbo4izRx/56O0zlKnnAG8jODnbgOuOImQx29JFDFdvIAbiGIkjY
	CgWOnLNAJ7iwmHSrWvWitcOVDdHOpNmHRlnUwI0IZl8LJur2LgDxrkZAv1JMpcwpQOLhLtGiaOX
	DvAtE4QAuLNJJYOmORMQ54RDo9qozdccM4aq32lGMrG5fjLfvrLti5UsONGWioqNikF4pam1Ucj
	XY/lUm9WV1vqh0XILZHGcyBo3TnEgXVhQ8V4l6PzDeoeWlWt+GmO/BiDaRYYD5mrkufL5f4t/zO
	bUSiVDWWhf5IqiMpEm4Qvyv+YpId0giMtoWpQ92mht57FZ1S52+4rJl8/ymBF/IRF7lZbFMcpS/
	yiUN/kiSnGxnvZPgV4vnUdvNZJLf9+8wXog==
X-Received: by 2002:a05:6512:8346:b0:5c1:ac84:c105 with SMTP id
 2adb3069b0e04-5c1ac84c2a0mr745576e87.57.1795023975125; Wed, 18 Nov 2026
 09:46:15 -0800 (PST)
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
In-Reply-To: <av3bkDnwmjunTleX@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Nov 2026 09:46:02 -0800
X-Gm-Features: Aa3M54rqJXQt69c6byOctTWRaXx3nXcFQskBrnHvxsTyM3qw4EOZDCkVbvK6iJk
Message-ID: <CALCETrXPLeUgxyhjP4XuWS46FKB0TUHF5PcMkdMf+qeEXbyXRA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: josef@toxicpanda.com, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	John Johansen <john.johansen@canonical.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Kees Cook <kees@kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 9:08=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Wed, Nov 18, 2026 at 07:04:21PM +0200, Jarkko Sakkinen wrote:
> > On Wed, Nov 18, 2026 at 08:59:39AM -0800, Andy Lutomirski wrote:
> > > On Tue, Nov 17, 2026 at 3:14=E2=80=AFPM Jarkko Sakkinen <jarkko@kerne=
l.org> wrote:
> > > >
> > > > OVERVIEW
> > > > =3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > A root namespace (rootns) is a kernel object backed by a file descr=
iptor
> > > > that binds together:
> > > >
> > > > 1. A full or partial set of detached namespaces.
> > > > 2. A dedicated PID namespace for spawning processes into, signaling
> > > >    members, and polling or waiting on PID 1 exit.
> > > > 3. An initially empty mount namespace (CLONE_EMPTY_MNTNS) that must=
 be
> > > >    populated before going live, without inheriting host mount-tree
> > > >    ancestors.
> > > >
> > > > Work on this feature started in 2025 from David Howells' container =
object
> > > > patch set [1], which I turned into a namespace for namespace roots =
and
> > > > rebuilt around that premise.
> > > >
> > > > While the patch set is manually written, the original motivation ca=
me
> > > > from isolating LLM agents. Running untrusted agent workloads made i=
t
> > > > clear that OCI runtimes need to minimize their live configuration
> > > > surface.
> > > >
> > > > Assembling mounts, credentials, and namespaces inside helper proces=
ses
> > > > with a half-configured container is what I see as the main challeng=
e,
> > > > and the existential debate around namespaces and container objects =
is an
> > > > unfocused discussion topic.
> > >
> > >
> > > I've skimmed some of the series, and I see a bunch of good ideas that
> > > involve using an fd to manage a thing.  But I'm wondering how much of
> > > the value is added by that and how much is added by having a new
> > > *type* of thing: the "rootns".
> > >
> > > How much of the value comes from the rootns vs the new APIs to
> > > configure namespaces without entering them first?
> > >
> > > For that matter, the cells series also seems to contain a (possibly
> > > very similar) variant of the same thing.
> > >
> > > Would it make sense to come up with a patchset that does *just* the
> > > configure-a-namespace-by-fd part?  It seems to me that this should be
> > > an easier thing to agree on, and it's a big part of the complexity of
> > > all of this, and it solves a real problem even without
> > > cells/rootnses/jails/whatever.
> >
> > Is it  more accurately scope the part that is "just the fd-part" and
> > what you consider as "extra cruft"?

I'm not actually trying to say that anything is "extra cruft".  What I
mean is: there seems to be somewhat of a core that is pretty similar
between the two patchsets, and that core seems independently useful.

> >
> > I.e., where do you draw the border?
>
> I'm asking this because I had similar thoughts when I started this back
> in 2025. David had some good ideas but it did more than having a fd
> that does not go live before everything is set up properly.

I don't know that I have a very clear border, but here's an example:

rootns has MOVE_MOUNT_T_ROOTNS_ROOT.

cells has:

+What else goes into the tree is mounted on it before it becomes a
mount namespace.  A
+filesystem for the cell to write to is mapped in the same way:
+
+.. code-block:: c
+
+   fs =3D fsopen("tmpfs", 0);
+   fsconfig(fs, FSCONFIG_SET_STRING, "mode", "1777", 0);
+   fsconfig(fs, FSCONFIG_CMD_CREATE, NULL, NULL, 0);
+   mnt =3D fsmount(fs, 0, MOUNT_ATTR_NOSUID | MOUNT_ATTR_NODEV);
+   mount_setattr(mnt, "", AT_EMPTY_PATH, &attr, sizeof(attr));
+   move_mount(mnt, "", tree, "tmp", MOVE_MOUNT_F_EMPTY_PATH);

(Source: https://lore.kernel.org/all/20261105-b4-cells-v3-2-bc9095937a84@to=
xicpanda.com/)

I feel like you are both *so close* to something that would stand
alone and make perfect sense.  I also feel like, if that's a goal,
then both series are slightly off from the bulls-eye.  (Keep in mind
that I've spend a total of about ten minutes looking at the relevant
parts of the series.)

If I've understood the two series correctly, and if I'm thinking of
these abilities as something that can stand alone, then I see the
following things that I'd improve.

rootns: Why can't I use a *mountns* fd to so the configuration?  Maybe
I'm misunderstanding something.

cells: The dance where I create an anonymous mountns, mount stuff into
it, and then attach it to the cell is cute.  But I think the userns
interaction is wrong: you are making me assemble all the mounts in
*my* userns and then clone the entire tree into a fresh, non-anonymous
mountns bound to the current userns.  And that clone operation is not
free and serves no actual practical purpose.

Why can't there be some variant of these where I can either create an
anonymous mount tree that is genuinely unbound from a userns or that
lives in *the target userns* or that *is already the final mountns*,
using just mount-related APIs?  In pseudocode:

int mountns_control_fd =3D create_mountns(either userns-free or with a
userns_control_fd);
fsopen, move_mount, , open_tree, etc;

Finally:

cells: I find it *incredibly annoying* that one generally cannot put
new mounts into an existing container using most existing container
managers.  I hit this on a surprisingly regular basis.  You seem to be
baking this into the whole cells design.  Why?

both of you: Can we please make it possible to do the parts of this
that oughtn't require privilege without privilege?  If the cap_userns
thing ever lands, cap_userns & CAP_SYS_ADMIN ought to be more than
sufficient to permit creating fresh mounts even without creating a
userns as long as we don't do anything that affects privileges within
our own userns.  Or let us create a userns, *not enter it*, and do all
the mounting without actually having CAP_SYS_ADMIN in the permitted
set.


--=20
Andy Lutomirski
AMA Capital Management, LLC
