Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937497;
	b=ddAU1S6FMNXIrwt4WHTHFbQzWTPmjnpF7lJcgxqvWGw2jGgCroy4c7Yd0ZH+mWq1qgpX
	 SASV1B2mhRQwC8bF5T+egU1tuXe6peoRKg1bF4bwnAnlFC/sKXGjEmDX9emB7eHbZVL2g
	 rUqjIe4aKxk23iIvbPQZ3HDhp1JM+9JJ9X5pyULRK4zDNgbW8OB2IVg/SkVIAfObU3TJd
	 KlYls9GclOZIyi19gvhH0nHEko+tK5Ua3SiU+FjGu66sysmfMKaJc+kCjD+is3RvcJbTp
	 yHfrNzBKJNxZpZCYl/TEu2fyMqbqvxp5K11kn+yvvp81fOouKA2ukdrwwuLEjBDAcAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
	b=U6gKpdk14+1gDqE4Cp/5geTsUGRVU0DLxbSi7C0y8FDNuflSihphPVX8xg/HYLGx3FtJ
	 eUyQNzkmz4LG1DZJnZKP22ZNIa0R/zG6kHlE/NVdknst6Nshi+dfev9hUuI0I8Z5YC1Pd
	 8VYXLyC2II03A9fCDZS14lH2y9uROAwIWul/gxk5qohYKeYQjn0r7psFe/x/FIucti1V8
	 dkPB36oetAtE+ZiXRgILcX5hmZal6E/64gxng+cC0LSHtm64lhsKbLNgNmkHqzX2gk90g
	 8iEKHEZQkNSHNN/KpfHIa3l0oyV67UuesUMjL7T/rrT3y/8uawbyMEm2WUsroFoGpzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oAFIhfOA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E441606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E441606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oAFIhfOA
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so1603821fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:44:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937495; cv=none;
        d=google.com; s=arc-20260327;
        b=cZT0alu5JRmtZKafYKRCGl519iwRhxE82LlC7/FVDow4D9JW+lswldZzGbaHx2Ouwq
         O3DsUfbBsuC0M33DbC5rtUutQ7hkxydNAXbgUHEdgxSvCq034u/JxV6q3y2NMimpTb5t
         NMOaYIeDlGW3PYrCSyKknA8iYVlG1z9BplksoHPhQdtSx/QE0/KDpqyhGkiZlOReIrl2
         Rp3528+R0F/qTXulM/QVGdtOr5fptHRGdHWymtkA2u9LAH5KTKdTyX9WKpX2PvY97Xbu
         nb49BmLj0+3bU5DWynGDdfuplS+PdO+oD2wA860GdENxYbPvgfJHmheq76eGlPrg3Vz5
         OZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
        fh=iOkPeC9PG0z0a/gd7ma+gFEQjadbYSwbEzGfI85Bbvk=;
        b=J2MbyxQeBU69WCjJmg1ZWBOKvQQDccPkz2+Il+gM68Ruyb0ZylNDRH9LPv7gnFDQff
         QJNGAZsX5VLbODCaxVuYVOYYp/PBNHBWDCw2TPXZBRD1i3cZ0ioeoPwHPnFHimsreoTJ
         wta5/wmEGDI+23IytAoozyYSHKGo+sT7thCs367mEIdnKC1VvZiXN7JU5Hxfe2XeCgF3
         21F+MBS8aDdN+njCUX/JMXQ0ZOOWdjLXLYvgKrfX9KoOHGgGJoobq/19ItNYlYULYyi7
         Jryf+nHhc0Lfv6gCbUah/h/WaTYYLAbRlEyzeE7gq9UwcE2DgX+rh3+95oTyNs6OWR6J
         pA2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794937495; x=1795542295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
        b=oAFIhfOAkcB0Dg4mKVfkuis2uNtcfHHW1ME1slyaFUO4AI5iAHAmrY1Nw3LuN2VQnC
         6IGXyvAYklXrHuXDFIJP+OpIvCKpQXcsR6yhi7y7UMeoYZWd0Rkq8srCeIQr3Ut6yHo9
         s3QMrLw8d+7yQo0fv8lDR6N1UWY7BgFBjya/tZ7WAbd98chUjwhGKhZVz4B8CNKS2JVt
         s01yrFYXNsMtBbhpU0mHCjFVPEb/8RNf03yXDk0jC6t71dtVUAnUQlSNlv3yrv5kFy/Z
         7TcwXV5Nfa08sHn/NIrA4+u1dyH1Y1UL/1CiJgo3Ncba+UeXkhzzSc1rUH+9TFU6YyuR
         ZiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937495; x=1795542295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
        b=yzzMgEd00EbSApp6W3SPYVqjhLOaK2EGIUQy4tDhG3w2vjggqGyhRJFAlHJnJVVG0h
         wgPHNymZBlAzWBHDAR2GxRm/d03fF2p6ee9FE0JlGPnXz5qglhlHgbiIRYwH939IES+m
         sGLIIpiwFjMeS62lAvNOu5dfiimW+sTr1P/mkH1rCdaBrrM7ARfEPuoyWMFS5ycC5lUH
         YiVhfEn9lttWqoz0S2eQ3iN4aVvOYRWLRf43c9jt4X6V/jpCklqhb3moOVynPQs1MXna
         lgkXyjwQNpakqamQaGn+s4QGeGnQgYutzo2HsOwt/R6eb4Ine/vqrco1lHnjsjZDvw/i
         1UFw==
X-Forwarded-Encrypted: i=1; AL+hErEl6WX70KnV06Rg+gSwr6//IdfiyNF6Z8NHLG3XKnzV5RKBppYygj9UTUmlQAWTiXpTllaLs9U6HrrrD94=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eyfrNOJIsO6MHjQ1sAiV05sPUzLgEUqaU/5GTiiGr0rLu9uK1
	ltmovJHvtjCgOLa1qR5+DAUQoT33TOpd1FaOTvLteEqTEtOvPMq6naAeKqJF9/7MfnTBkcMsno9
	hcQYh/kpl5wF8g75uCu5Xfe25bvsGKBgR2QU0TOY1
X-Gm-Gg: AYBFou0qjmJYdSCp6K7+oOeS24hH3LbMmXgo//5bwDry5Yl4vMGQ1J9vQ8fEWzk2aEK
	KhKyzjPeihDNL2beNAy12o5/dSV8pw5f+xpFxjGXHCwtke2g6QFUaanp+h3NpMubl96R+A02lUa
	lG2hcbMXY+wWz7Jnt9MwaDnRB38wzriJYcOWxFcRN5ZJORUNclQyaLtPwB4ZtsDcmjPSCNyIhtb
	Wuu7hetHIERhYxOhlwA48zuY1LSwgSsIpydNewuuDvbunIdS+MmN+IeSvtDe7v5I0sD+/m2MvIY
	UrmyTe/Gk6kzfvpTtfA5CA64T3h7BARbDMYPMDOryZS+5LUp905dk/UkEPTeTxXt4H23cr7OHfU
	HCSbBlU+1D3f/pktQLyyKiP+Bi44+OrtyGHJe85WlZWOZTCYTQBSgSfk=
X-Received: by 2002:ac2:51c6:0:b0:5bf:b945:4334 with SMTP id
 2adb3069b0e04-5c170a15b78mr6210350e87.67.1794937495491; Tue, 17 Nov 2026
 09:44:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050841.3289652-1-jarkko@kernel.org>
In-Reply-To: <20261117050841.3289652-1-jarkko@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 17 Nov 2026 09:44:43 -0800
X-Gm-Features: Aa3M54pzaE332pTi53D1YpA5VO7WahNUrZvzEHccu8lFNhASVJD5SKW-Zdzq05g
Message-ID: <CALCETrUBUnJVhiMkft6hTZZMe8nTpMBRTGY2v=9x5ETBSvmPZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Namespace for namespace roots
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	Juri Lelli <juri.lelli@redhat.com>, Kees Cook <kees@kernel.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:08=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> OVERVIEW
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> The problem that root namespaces try to resolve is starting a container
> from a root mount tree that is pre-populated before any process is allowe=
d
> to run, without inheriting any host mount-tree ancestors.
>
> Work on this feature started originally in 2025 from David Howells'
> container object patch set [1], but I turned container objects into a
> namespace of namespace roots and built a new implementation around this
> premise.
>
> In early 2026, the patch set was left to gather dust in my kernel tree
> [2]. Then, the other day I saw [3] as was shocked by its over the top
> complexity and thus, here we are.
>
> Not doubling the number of container frameworks inside Linux kernel is at
> least a benefit over container object based solutions. Parallel plumbing =
is
> an inherent flaw of container objects, and it directly affects on
> development and maintenance cost of container runtimes.
>
> Also, thanks to better scoped implementation surface, verifying rootns
> correctness is factors easier than with container objects, and even my
> early kselftest is meaningful. We know what and where we are testing,
> which is always great.
>
> Finally, it is more compatible with pre-existing container tooling
> whereas container objects would have much higher cost.
>
> [1] https://lore.kernel.org/all/155059610368.17079.2220554006494174417.st=
git@warthog.procyon.org.uk/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.gi=
t/log/?h=3Drootns
> [3] https://lore.kernel.org/linux-fsdevel/20261105-b4-cells-v3-0-bc909593=
7a84@toxicpanda.com/
>
> IMPLEMENTATION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> rootns_create() allocates a rootns object backed by a pollable anonymous
> inode fd, pinning dedicated empty mount (CLONE_EMPTY_MNTNS) and PID
> namespaces along with any optional namespaces selected in flags.
>
> Before entry, a manager prepares the mount tree through the control fd:
> FSCONFIG_SET_ROOTNS binds a newly opened fs_context to the target rootns,
> and move_mount(..., MOVE_MOUNT_T_ROOTNS_ROOT) installs "/" onto the nullf=
s
> root once and attaches relative submounts beneath it.
>
> rootns_enter() forks a child directly into the rootns credentials,
> nsproxy, and root path without mutating the caller in place. The first
> entrant becomes PID 1; once it exits and zap_pid_ns_processes() reaps all
> members, poll() reports EPOLLHUP and rootns_wait() returns init's status
> and rusage. rootns_kill() walks pid_ns->idr under RCU to signal member
> thread groups.

Can you clarify what this new API actually does?  I've read this three
times, and the best understanding I've come up with is that you've
designed a way to create a group of namespaces identified by an fd and
you're adding an API to configure and enter them cleanly.  Which
sounds very sensible.  But I'm completely confused as to why a
namespace needs to be owned by a "rootns" or why that ownership
affects even newly created sub-namespaces.

--Andy
--=20
Andy Lutomirski
AMA Capital Management, LLC
