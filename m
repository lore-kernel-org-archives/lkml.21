Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695897;
	b=TcvGUcivF6NHd2OJK5RFQxDyAbGMVJ3Q4V8SEZ18mkLWtpW3ygBKZUiJS8iVQmo4yUCJ
	 rjY2xNtdHelSAzTHCPIVYJVCGGkcuP7Jd0HAAbP4iYh1qQ0/KRDgS51c1v2HETgviOxGx
	 OFa4YeYYuIGUDldJe+mbr/QaWzvcwRosEJzNvrc1mohbEJt2amaPHCZ45Pgw+1lqAmLN2
	 kaavti/6mINkILRDn3QJOTRNdAqXnQJ+7+ERYRqbec/zUjvO1p5RZcYfHuV28RLuojSII
	 BOxwglKXVkTNK/cyPnG19QhAeJJLJz2npGZVuQj1Uggihf5coefcJ/727ZEDL7bttBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XZDH8/OlegJAqtRzLs0OhPY77EyHVcKMopXFWjDtKVk=;
	b=qRQSsCoy6WoRdt125EAKT0b8bb6glLC7T22uDcABW2KBKYvtUwQBuWAZ2Xx7k3sw7DU3
	 S9WhfYBBNUHwNT9MYN+Zha6Vo/Yxo4HTxTG8VXqYailOfXeA/z5HzpYFk378wjV9qc3Rr
	 2oBt78aib4ozCe2mbLywERRBP1W5GjacMlWsJuoXyzmyIz6o7FfPH0sMPLGJpZKwKUw8h
	 cBHLwS8IAhiTF4Ed73MoMpQF9SpWfSfMtXYBO4U2SNb+vzRHYmMJfuhgHbzoNbn8o9PwT
	 ktYQmsxms/vS62WnTVaAtBecK6isrAR2UvsP67zKnIU2Ul+VerbI6nV2a+LGyOWlr7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpl3gjDJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CDB606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70CDB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpl3gjDJ
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so9048991a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695896; cv=none;
        d=google.com; s=arc-20260327;
        b=Jcci5oCYq+orrAoK5+gQc6+ZEOt5DEeXLLQpSN2WFpI88Zzwwxr63fwnfrvFWdD1EG
         m/IkpgMCyMoW1O07Boj4sK+Q72d5cpL+NTaJqe91xuPUdLgE7pDqUdKl7p+PoJEZ0Svk
         2zfi/HgqxkrIMHYSq4h4Apg7W/t38XSv+r/2V9jHN/TVC/s2rrVxc6/cB39rxefTP6Uc
         vFGuaEekHw78W6JlgU17dXL468Z0G3/JMl3nR4oupa9anzJGVTb9VJgQOWpP/rHAoYS9
         aE1c0a+Hv7grTgqzp9g3fiA3rXu/BZkeXYCjFZin4Zh7rE0rlFCe7aL3bByYequbeIDC
         b4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XZDH8/OlegJAqtRzLs0OhPY77EyHVcKMopXFWjDtKVk=;
        fh=4kdTGGLio3kql/A6I+Su+GsyuYyQRc6NiL9y8zn5RR8=;
        b=k3cNS9It3G18RPophmSpU1fwbQ0vLYCQE73EjZgxu1N/GvHj87yzuA7H9LpHwaph1o
         2q3pJYP6s5/tFBOn78wOnBH3TVctK1Q0fSpiuKHb3YDK4GmmnBtY/zROVX4vDUEMajQv
         KbOFcuO47bdvagMYE6aK4OEm8pH/ZMyhf0tU9Fj8zyE7kyWr166q/tlA7wjEdtSEQJpN
         qk9uSKFg9a+plD2QXS6TzZGSLdc6VV60n9wGcei7FXxsEF20aDjmpn4CFtHhYFb3fCQH
         t/0LwEy5LyJxsWtiJvMKh/uabZ/dsZvJ0d4ZP8Z8lfsL4sJTn5C7gXzfqWmL182CDFnJ
         4UyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695896; x=1796300696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XZDH8/OlegJAqtRzLs0OhPY77EyHVcKMopXFWjDtKVk=;
        b=wpl3gjDJfZU8pKQkUKCqhZXA3jfTYsxnLaC1vVhvk0sGuWyBPAirVTMYitrrnVT1eW
         ED71uiXeMe3JvDP/sCZ9At97Sc5QQ2AhE7zcGC3lQgNEGnDcuwiLW6/G22L1rO8pn22O
         CmmsEBKiS9J+UBLPgX/Ec+DNqUV+PaN6LJYTVUuQ4S3n9jiJsM+3vKpAGFwSOuJUV2pE
         X0fLxPdWMgd0rLoGz35zGaydFwsLmdlkkHrEGp91U5rYMMdYzOBvXs+1Qhi9Zv/JMoRi
         782319YDAAQMk1coTa2ALFViCg1XYsluiOftKA/vLc/wXWrlWG6rH/tqWUqc39NFnU3o
         mkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695896; x=1796300696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZDH8/OlegJAqtRzLs0OhPY77EyHVcKMopXFWjDtKVk=;
        b=QxK+RlKTXY2IQEoCTEIUseivLxa92ObXOBHWJlAvwQGsZcxvHe6G+hsm/zZyBXa14V
         xFtbrChnIDI/LhGBPi8IHB5Ojdmh9bpjpEK18zga9dkXG8vCxcUZxfTN/wFWIZksgfM2
         8CR/AN4DJXC1AHifMR2NQt2X0zF17GxS4AV70r7oGAA1L83mnpL/FPgG4Ac0N2H0IJPo
         e5YFa5zbnMAG+RRx6HqXzhohyQYXeCYfAR7POpxRj2mWTuo3jvRgOgx3eeEJ3DH+Unzz
         7MyOo/vtx9etHSkuYSa11Y3DVNoGTescR9jbGSu4YMlddBMw1Ijo1BjCpRnViAgK+zH7
         8Vyg==
X-Forwarded-Encrypted: i=1; AL+hErG+3C5LYg0RL5d1p6qcrCnpHA9K2xXb9hjluFo5Y2dd/wZyEE86mrtiJT0LfVtZIqWk1WElq0eT+mVfHD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NXVHbPMlYuQDuYwYri2oNFO0ZJnIQgkNnYKEF2uoy0nW6LYks
	lPU9kCJUq0ZzSUjKzZim9MS7XPdaDw/lw0g/KmtCi5FX+hjW5irm4nq5lcbRlA+kpVkZ3M9xaxy
	VK5uAfg4kebiI5AUZ6XLg8D8K9/CEB3I=
X-Gm-Gg: AZFdTZcgVFdrYilPDpZA2mYA4w496DGGN4aL/lmskZHayydG3hro6kuvUC5wbzwgL+B
	HlB7FwnWDflynjlhZZsXNMavrL8ePuez1Mij1sX0fjrVlOvoXHkIS39kRYoGZsr3lxhYUHPWWs6
	yj0gsFGOuMl8VFSoGD8zLOqGnuS6eJTvxF+x8w2TyCeVNdsHIme3C3TCZQ+AlaM75SiqzvircDb
	1Liq56ge5rnxVcKYsoy6YI8ozEWlffsnfTJEz3zOZMJf+b09f6sm4g6B3KYiagcKg2bgreIvhKM
	2vNe+wSJWNiBfHqctlzd+ul2CUCdRL5EHHrv7mnDC4FCFodzPE1LEfmqMqkaLKSfoPCkgK1bqO6
	wNl7fCAz1IthrFDSSAjHs84sgohWByGVQXo791oVVc2QBrd8mDsb+1kAZAVli8O9C4WXqWA==
X-Received: by 2002:a05:6402:4004:b0:6b5:8719:6d51 with SMTP id
 4fb4d7f45d1cf-6ba37e6f76amr16694535a12.32.1795695895250; Thu, 26 Nov 2026
 04:24:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123221410.3328780-1-neilb@ownmail.net> <179550252639.1728055.4014817916838632741@noble.neil.brown.name>
 <CAOQ4uxgF6=QoD9RoAOPmxtvkq1jWf+gG1AsJzR=Kt3ROMA=X0g@mail.gmail.com>
 <aau5z6kck6a2efcjvzrt6gno6ljs4eioncgizeh7vfbc6ipkr3@hjxzdk5pvgmt>
 <CAOQ4uxjXP4Zegb2Vgsv-yBeFmhvc8FT2bDKDcaM_t0=oJ5KpXQ@mail.gmail.com>
 <sc6xnwguimy23dexr3eosbe64xmmewn5ml5gso4m5xozw6fqlt@2hji64vi7eaw>
 <CAOQ4uxisP8YTUaexsXw4-Fxg0vand236cg5eDKirLm=kuDwSQQ@mail.gmail.com> <dy726gpfomckyt3se66pkdfj7qlsvmu4ysr666h3w5hxkay3l3@ibdy5kcibpjn>
In-Reply-To: <dy726gpfomckyt3se66pkdfj7qlsvmu4ysr666h3w5hxkay3l3@ibdy5kcibpjn>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 26 Nov 2026 13:24:42 +0100
X-Gm-Features: Aa3M54rJNPNF5cBOaERtuGAfJFMzxrWdxCFdPfxK5cljHiAESEVQSi6Rq_C-PwY
Message-ID: <CAOQ4uxiZtxa75j8+wSSfYZFrAvwDuo8ZfYh5+07n+mZfSsa2mA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Fix easy bits of the negative dentry problem
To: Jan Kara <jack@suse.cz>
Cc: NeilBrown <neil@brown.name>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Kent <raven@themaw.net>, Jake Edge <jake@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 11:57=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Wed 25-11-26 18:39:20, Amir Goldstein wrote:
> > On Wed, Nov 25, 2026 at 12:34=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Wed 25-11-26 08:46:45, Amir Goldstein wrote:
> > > > On Tue, Nov 24, 2026 at 5:26=E2=80=AFPM Jan Kara <jack@suse.cz> wro=
te:
> > > > >
> > > > > On Tue 24-11-26 14:08:07, Amir Goldstein wrote:
> > > > > > On Tue, Nov 24, 2026 at 7:42=E2=80=AFAM NeilBrown <neilb@ownmai=
l.net> wrote:
> > > > > > >
> > > > > > > On Tue, 24 Nov 2026, NeilBrown wrote:
> > > > > > > > This v6:
> > > > > > > >  - fixes the autofs changes in 1/5
> > > > > > >
> > > > > > > Sashiko says this is racy.  I think it is but the original co=
de was just
> > > > > > > as racy.  Maybe the race isn't relevant.  I haven't properly =
understood
> > > > > > > it yet.
> > > > > > >
> > > > > > > >  - updates d_duplicate() in 1/5
> > > > > > >
> > > > > > > The fix was seriously broken.  Sorry.
> > > > > > >
> > > > > > > >  - uses a new version of 2/5 from Amir
> > > > > > >
> > > > > > > Sashiko has something to say about this
> > > > > > >
> > > > > > >     Can clearing FSNOTIFY_CONN_FLAG_UPDATE_CHILDREN and dropp=
ing conn->lock
> > > > > > >     before fsnotify_set_children_dentry_flags() finishes allo=
w a concurrent
> > > > > > >     watch-adding syscall to return to userspace before the ch=
ildren's
> > > > > > >     DCACHE_FSNOTIFY_PARENT_WATCHED flags have been set?
> > > > > > >
> > > > > > > Thoughts?
> > > > > >
> > > > > > Sashiko is right, but this race is not new.
> > > > > > The same window exists upstream: if another thread's recalc obs=
erves
> > > > > > the 0->watching transition and does the walk, fanotify_mark() c=
an return
> > > > > > to userspace before all children have DCACHE_FSNOTIFY_PARENT_WA=
TCHED set.
> > > > > >
> > > > > > What changes with this series is that the walk is sleepable, so=
 the
> > > > > > window is longer, and in some workloads it could go from rare t=
o
> > > > > > plausible. OTOH, skipping negative dentries may shorten the wal=
k.
> > > > > >
> > > > > > The more important question is whether a child can be left with=
out
> > > > > > PARENT_WATCHED permanently. Upstream it can: the transition can=
 be
> > > > > > observed by a recalc from the mark destroy path, which never wa=
lks.
> > > > > > With FSNOTIFY_CONN_FLAG_UPDATE_CHILDREN that cannot happen.
> > > > > > Every transition sets the flag, and every caller that can add a=
 watch
> > > > > > consumes it,
> > > > > > so a walk that started after the transition always runs and fix=
es the flags.
> > > > > > What remains is the transient window above.
> > > > >
> > > > > I agree this is preexisting issue. Let's not block this series wi=
th it.
> > > >
> > > > preexisting, but sleepable children walks could make an
> > > > improbable race actually observable, because the scans are not
> > > > serialized and could take longer (I don't know how the scheduler
> > > > treats a dying process which has its marks removed).
> > > > Just wanted to make sure that the point is clear.
> > >
> > > Yes, the window can be larger now but it still shouldn't be a practic=
al
> > > problem unless there are several watchers placing marks on insanely l=
arge
> > > dir in parallel. So I think we can live with the race for a while lon=
ger :)
> > >
> > > > > > I think a proper fix for the transient window needs a sequence =
counter
> > > > > > of scans in the connector. Each caller would wait until a scan =
that
> > > > > > started after its transition has completed, no matter which thr=
ead ran it.
> > > > > >
> > > > > > I think we can live with this v6 patch for your series and deal=
 with
> > > > > > the remaining race later if we want to, but I am not sure and w=
ould
> > > > > > like to hear what Jan thinks.
> > > > > >
> > > > > > If you want, I can implement the sequence counter for v7.
> > > > >
> > > > > No sure what exactly you have in mind but a sequence counter per =
inode
> > > > > looks like an overkill for this. A global one can get contended a=
nd
> > > > > a bit hairy to manage but let's see...
> > > >
> > > > I had a patch with another conn flag _CHILDREN_WATCHED
> > > > set at the end of the walk, which covers the Sashiko race, but
> > > > leaves some other corner cases (see below).
> > >
> > > Yes, I was also concerned about those races when thinking about that
> > > yesterday. Let's discuss below.
> > >
> > > > Are you concerned over the size of the mark connector?
> > > > I think that connectors should be rare and scarce.
> > >
> > > Yes, I was concerned about the size of the connector. On a second tho=
ught
> > > I tend to agree it wouldn't be a huge deal if we need it.
> > >
> > > > With workloads that frequently add/remove watch,
> > > > Sleepable children walks could cause a situation where
> > > > scan that started a few add/remove cycles ago complete out
> > > > or order with the most recent walk.
> > >
> > > Well, let's discuss the behavior of the walks and the flags. I imagin=
e we
> > > could have two bits like _UPDATE_CHILDREN and _UPDATE_CHIDREN_RUNNING=
.
> > > When children flags need update we set _UPDATE_CHILDREN. When we see
> > > _UPDATE_CHILDREN set, we call fsnotify_conn_set_children_dentry_flags=
().
> > > That function checks _UPDATE_CHIDREN_RUNNING. If already set, it wait=
s for
> > > it to get cleared and returns. If not set, it sets _UPDATE_CHIDREN_RU=
NNING,
> > > does the walk and clears both _UPDATE_CHILDREN and _UPDATE_CHIDREN_RU=
NNING.
> > >
> >
> > Yeh, I think that mostly works, with a minor variation.
> >
> > If the RUNNING flag is already set, the function waits for it to get
> > cleared and then checks the UPDATE flag again.
> > If the UPDATE flag is set, it clears the UPDATE flag, sets RUNNING
> > and starts the walk. At the end of the walk it clears only RUNNING,
> > so every time UPDATE is set, a walk starts after it.
> >
> > Anyway, serializing the walks per inode is a positive outcome
> > and better for our mental model.
>
> I agree. The only thing to watch out is that if the user could fast enoug=
h
> switch the inode between "children watched" and "no children watched" dur=
ing
> the walk, he could hold people waiting on RUNNING practically indefinitel=
y.
> And indeed with the example you mentioned below - one group with mark wit=
h
> FS_EVENT_ON_CHILD | FS_CREATE, another group with mark with FS_OPEN - wou=
ld
> create a situation where no single mark is watching children but together
> they create a mask which results in watching children. And by constantly
> adding and removing these marks userspace can stall other waiters on
> RUNNING flag without any bound (it depends only whether the victim task g=
ets
> scheduled and rechecks RUNNING flag before malicious task wakes up, clear=
s
> UPDATE, and sets RUNNING again).
>
> So I guess we'll have to use the sequence counter in the end and we'll ne=
ed
> to be careful. Something like:
>
>         spin_lock(&conn->lock);
>         gen =3D conn->scan_seqcount;
>         update_children =3D conn->flags & FSNOTIFY_CONN_FLAG_UPDATE_CHILD=
REN;
>         /* Scan in progress? */
>         if (gen & 1) {
>                 /*
>                  * We need to wait for scan to complete even if
>                  * UPDATE_CHILDREN is not set as somebody might have
>                  * started a scan for us.
>                  */
>                 gen++;
>                 wait_var_event_spinlock(&conn->scan_seqcount,
>                                         conn->scan_seqcount >=3D gen,
>                                         &conn->lock);
>                 /*
>                  * Somebody started the scan we need while we waited? Jus=
t
>                  * wait for it to complete.
>                  */
>                 if (conn->scan_seqcount =3D=3D gen + 1) {
>                         update_children =3D false;
>                         wait_var_event_spinlock(&conn->scan_seqcount,
>                                                 conn->scan_seqcount >=3D =
gen + 2,
>                                                 &conn->lock);
>                 }
>         }
>         /* Scan we needed is guaranteed to be complete */
>         if (!update_children || conn->scan_seqcount >=3D gen + 2) {
>                 spin_unlock(&conn->lock);
>                 return;
>         }
>         /* We will do the scan */
>         conn->scan_seqcount++;
>         conn->flags &=3D ~FSNOTIFY_CONN_FLAG_UPDATE_CHILDREN;
>         spin_unlock(&conn->lock);
>
>         fsnotify_set_children_dentry_flags(fsnotify_conn_inode(conn));
>
>         spin_lock(&conn->lock);
>         conn->scan_seqcount++;
>         wake_up_var_locked(&conn->scan_seqcount, &conn->lock);
>         spin_unlock(&conn->lock);
>
> > > > Only the completion of the most recent walk can guarantee
> > > > that all the children dentries are watched.
> > >
> > > So I don't think that's an issue. Look, if someone places a mark whic=
h
> > > watches children of an inode, we either end up updating the children =
flags
> > > or we wait for _UPDATE_CHIDREN_RUNNING to clear. So any mark update f=
rom
> > > userspace blocks, until the children walk is done and then they all r=
eturn.
> > > We hold the group lock during the wait so the mark that makes the par=
ent
> > > watch children is guaranteed to stay attached to the inode and subseq=
uent
> > > mask updates on the inode all result in the conclusion that children =
are
> > > watched (so fsnotify_parent() doesn't clear the children flags while =
we are
> > > still walking).
> > >
> > > One catch in the above argument are oneshot marks for inotify & dnoti=
fy.
> > > Inotify is actually fine since it grabs group lock when removing mark=
 after
> > > the event was sent (so the above argument holds). Dnotify doesn't gra=
b group
> > > lock when removing oneshot mark and so breaks the argument. I think w=
e
> > > should just make dnotify grab that lock to make our life simpler.
> > >
> > > Thoughts? Counter examples?
> > >
> >
> > My thought is that this makes my head explode..
> > I rather have a simpler mental model if possible, which is less
> > dependent on all the callers and other locks.
>
> I understand. Not sure if the above satisfies your wishes but I couldn't
> make it simpler...

It satisfies my concerns in that the logic is local and easy to follow.

Maybe it will be easier to read with a helper target variable and aim for
conn->scan_seqcount >=3D target, because the gen+2 arithmetics is a bit har=
d
to follow for all the cases, but not sure if the end result will be better.

Anyway, this is fine as far as I am concerned.
I assume that you will send a patch following Neil's patches.

Thanks,
Amir.
