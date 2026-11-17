Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794948842;
	b=mbppUKVLVIPcOHBhCvX9jADQqLUyb1zzMxutq153cA3tv82cCP1FaCL4OFZQ7RV2qMco
	 5Hd2e+JNX/9cH49aSWohKNfAFm7YwjOpMEXq3x3Vu3ieqyjZ2RmPi3w1VNbKKTY5+c+bS
	 inAnyhnORDu/9APUuU2CXnYSVfiR9gw5C1me50B2VYZTngzGfeB+WRkHaz+kKlMDeWFtG
	 r5ewT+4yUOzpRHDdJHGROUVt2iHMse/7Wx+Mlz2U/4FUxiMZH+YXSwgDG5Qpyk/P8e4lM
	 pH0xmGy5z6oQ3vvha4EEidrgJar8313fsxQ+jkRBbetDSNLOfaLcyHWYb1WEswXSujQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
	b=sn7on5zpgecxtr45sjhyOJMf7OfPphhkJv7D1tE8mnORnQAo5HVaVdE6Eg9bQIRyJpj9
	 nWWfif8A1Hv1NChCDWv23brUsEsFtFAIdf7dYUqzegQtt58qsWw1DYxN/d27sWX5GypmU
	 Tne54YN7tz+k+pbHCUoP9UK5tBZ0eP3n3xr/jgIPsZypt4ZEf98Hu+PygBtH/eP4kB351
	 AEX+Nb4NiwKP4+MlLxH0V4/Hq24FUytKA3t61ecyNzyKhU0RTnkM+KXFYLAGkauWB0N6o
	 Cfe9EI7KBNEebH9SjnGCjyLetT+NiuP/75E8YoZwh91Pk1w7Zc6yiIaRHnR9S4Z5ROw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LslQjUmg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554A7606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554A7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LslQjUmg
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso134421e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794948840; cv=none;
        d=google.com; s=arc-20260327;
        b=hhDxFz54ccAnrfEWvWEf4i8VvUJrDfj/QZEEla6yGWDNFHrAfyteVezcIknQfeE0Q8
         267BnrlrNq48mjm7amiHaZ1TyaeCPPLX1d6XGYzeDbtsidD+1xBLkch/4MflnPMFHhJz
         1zRNverhuBdxzUsyws5cK02mUOrD84lnIidhJ4pLmf5Uyr5d8L5e1l3kLKQa9pFpq1oz
         rWzPjg8HVaGt3mW2IA0TOiUK5Tw7T8dmKxakiu4tnXJSul2VO7A3JMqra7RooIJvGOTk
         RsNdO0ZaFeKVhqg8aUlW8+Rs1hu83wX1E6fazkZffSdhzbCBZJu0Hwz2uGD6AwJLBTQD
         1WWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
        fh=V1WkVyHOegfJL+7MKl17y3kksHaXKCMQxqqHsIqRgW0=;
        b=ix96hixj59mbCsOmArkWZwYkMJuPF4GMJdwHcwwsnmsCoKHy+hJwsiuyEy979P8Tuw
         Fp5dn8vjahVOJl5OIMByrW0ht/R9Gwe5r2DPHY6HQU/T/pK9QELB7GSeEqmot+xobcas
         dM5z6bDHK+dO3I4DoC4d6HVKrxkecmZN7CAt+lvPm0mBBo4neRbWc/nWO3P/Z3sIQPSc
         7MdkGCsIULno230w9gdPn78YXJKem2LPvrHzh5GXY9Cp9JaLS8QlIDPS161NQAwze2Bz
         KzOEN5QPdqEqEBShT3bFhXIatuVWeI8z8J63iNohGHXM1XW5C+PC6x9iit6fPb3ZVtdD
         lw7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794948840; x=1795553640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
        b=LslQjUmgXp7ppoB5z9C6lIh34ojfvcQ8nzfZ/Bus0FFDGG0DUi+QbKakM0fZFVIykq
         5mE0e/s/CpUqdx5hmSPPf4ZqfdbbG/4eR1cdypM9sQ7xLq3NiWuooniPj3c+oOnP/Gs/
         9eulqTIqNDLgU092uHWrXSQFQOUQ0Ybq8I+KARDSFo99l3A76mmdMOP5EIWjKF4SsU8k
         CLRnBvH95KDC8joQwrmPsfza+TxJts5K4ekF1BkXcERhq9o5i5YAd+8YKoGtExZnN7ex
         +BuNP6j+NU8hBGd6crUPCUF5Rx+iT4Q8fvcxMfppbSleGXT6F0Sca+oO5jRTOaHafzSk
         UZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948840; x=1795553640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
        b=ayM8lsAIO897zvM7EhRYNr+d9Cr1rXx7ASE9MU8yUiPBBdkxnBscC/BLbt1vSDX8e1
         6q5rZqBNkU/jwKxQdW3QwFsfwTl618lPNztfPN8U2FtnNd/jjwcA3VpgDg+OQRFqtpgF
         N9utfONqNTOtyfcwG0qQ9ti2fgEhzZjKcrDtuj58/nZeB+mwJhhoYb1SnVOZHtN/CIL2
         xBDs+ste8HTMQjSVGMLVzd2+IiU7ygrVRr1BYrt5CO6qbT8OfTAaOT7Reme/L8JZ2lKN
         7eGxIAidxZP+T1bSKIVjb2VcHF8F6DipHUpWprBtoAkCzcbXQ33tID9xOG9J/73XViEq
         9nog==
X-Forwarded-Encrypted: i=1; AL+hErF6/Id9wFZuP9otYPIc0P51jrNQlr26fh0qnhGduU/Q0e2jkyvfT3iA3drkEsxYOzzN4XYwFpCDwzn9tFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b0izWqlDAfKrGj5TfhjrTOHvx/Mo3UEONotsereqoj8lyBW5F
	32Fjlq6ECFBbXrTg/enoWNzlPoaxX8moSzcIZYgH47GDtEXc9U9xYJdDPvur8lOthUTFbSw9TDn
	rQ2xC0F7a3xpEnkP3gC/gOcHjEeL32rlqISupZdq0
X-Gm-Gg: AYBFou2YAp3i1Syrd2gxUSrDIaC67l8D4zHTt34euJVxI7vGAP2Fi6L0M3Rna35icaI
	vWgyUHqmvcd8IMLg831QQRWTevEu4xpvXGdwxBM3Kx3BpiHQmjBOlPZiwlC9dCM9hewQNO2f4px
	F0f1uJ1EHLRYWTViulAKvE4RlOb6ZOuFbducts3wRbG4jKk2E1ms7l/5o1mU9UNK+g9w3tAkZly
	6JYGMtWeaqdUliqpJB5qSIC+iuOvyDGY02S0LhN5GRr4tPDDyTOmxljdYSIndKax8OjwUfsCrww
	knRc4IFi9RUL7deL5Bk+AbGsH2M8S+2eeZpJDqxxPqlktnqeQQVTGv1MaSzLq2etlPZx/stLdew
	SrxgOjwwYXeFKVXj5rHTQgRUy8J0BytAbYA==
X-Received: by 2002:a05:6512:224e:b0:5bf:b96b:89f4 with SMTP id
 2adb3069b0e04-5c1a0f1b8e2mr1319677e87.19.1794948840370; Tue, 17 Nov 2026
 12:54:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050841.3289652-1-jarkko@kernel.org> <20261117050841.3289652-8-jarkko@kernel.org>
 <CALCETrWtbUFQGDOCHkxAN9O4i29ixfL5KKF1Cqw2-CjxKwC6gQ@mail.gmail.com> <avyzFnKQrNOid25y@kernel.org>
In-Reply-To: <avyzFnKQrNOid25y@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 17 Nov 2026 12:53:48 -0800
X-Gm-Features: Aa3M54qx88-je4c1jdCxPXUBmX_p3qTxglmaltFgKplV78kiTxOHsj4XFF6xQaI
Message-ID: <CALCETrWHxjrQvRC66d1fvkZw1e8_+38BdzmjSYHmqRjXZnD8nw@mail.gmail.com>
Subject: Re: [RFC PATCH 07/13] rootns: Add rootns_enter() system call
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

On Tue, Nov 17, 2026 at 12:03=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org=
> wrote:
>
> On Tue, Nov 17, 2026 at 09:42:26AM -0800, Andy Lutomirski wrote:
> > On Mon, Nov 16, 2026 at 9:09=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.=
org> wrote:
> > >
> > > Multithreaded userspace daemons cannot call setns(CLONE_NEWUSER) or
> > > safely mutate process-wide filesystem state in place before spawning =
a
> > > child into a target namespace set.
> > >
> > > Add the rootns_enter() system call to fork a child process directly i=
nto
> > > a rootns whose root mount has been installed. Transition the rootns f=
rom
> > > ROOTNS_READY through ROOTNS_FORKING to ROOTNS_RUNNING for the first
> > > process so it becomes PID 1, serialize concurrent entrants on waitq
> > > until bootstrap resolves, and admit subsequent callers into the runni=
ng
> > > PID namespace until teardown begins.
> > >
> > > Require CAP_SYS_ADMIN in the target user namespace, forbid credential=
 or
> > > PR_SET_NO_NEW_PRIVS privilege escalation
> >
> > Why are you disallowing this if no_new_privs?
>
> For no any good reason at all apparently: no_new_privs is inherited by
> the child and only restricts privilege gain across execve(), whereas
> user_namespace transitions are allowed under it.
>
> So yeah, it's a spurious check, and thus I'll drop it.
>
> > This isn't necessarily a showstopper, but fork() is really quite slow
> > in many cases.  It would be nice to have a more spawn-like API
> > available.  I assume it's possible to open a file in the target's
> > mountns by some sane API even without entering that mountns, as a side
> > effect of how the fsopen / move_mount mechanism works.
>
>
> If the caller retains the O_PATH fd returned by fsmount() for "/", it is
> able to open files inside the target mount tree via openat2(...,
> RESOLVE_IN_ROOT) w/o entering the mount namespace, and pass the
> resulting fd to execveat().
>
> For avoiding full fork(), there are (at least) two options:
>
> 1. A rootns flag in clone3() (e.g., CLONE_INTO_ROOTNS) and a rootns fd
>    in struct clone_args (disallowing incompatible CLONE_NEW*, CLONE_FS,
>    CLONE_THREAD, ...), and callers can pair it with CLONE_VM | CLONE_VFOR=
K.
> 2. A flags parameter in rootns_enter() (e.g., ROOTNS_ENTER_VFORK), which
>    would map directly to CLONE_VM | CLONE_VFORK.

There's also been some work on using a pidfd-like object to build and
spawn a subprocess.  Supporting that would make sense, but I don't
know to what extent these projects should block each other.

--=20
Andy Lutomirski
AMA Capital Management, LLC
