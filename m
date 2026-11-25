Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623320;
	b=3t1bYbCM5/0sJyCOHnYvZg19M/42sz/G0NT4ZyhY5nOhbBQfh2XpirH0SfqavZxXnMva
	 ux4cgfPE1aMCp+QkvK0j80LaR9lA0Jb5N2q6VYMiWwMRwNPrr8D939MyIpCKAFe86Z93P
	 pKA37CxiZWuUEakUo16/2S/Aa5/+bPBDiHHvwOROgNaGl9RkZedtYDvyY1vz+ywfRtfHY
	 VdG3QXsjRnb135fJ7JsKJv7+HcY4jXqWD5Egr99DgqAaAL9Z0mEHWaJMc//YgaO60dzMi
	 Iods9n9rypXbrvbtvub8pqL1ET8jyR5meu3uy8Cs4qXbGA4p4M8nscA5ntwTvp/mwpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623320;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ikIAQDWUd4oIdUiwPTrXqLa3Yct6IL/NQnfK5N4xiCQ=;
	b=FtGScXZe1kpRWEcs5huCiBLaUXLgpJmO9eC8Y6iGUGF5hDYncscmcExCg9zU+h+BC04o
	 wXDUWM8vsThEOjZRNL2pO8nGUMHq0fgF7RxL+K/4HuuvoULyFYDKn/MdjGG6EAw78QDeu
	 SqA8ea9p7+rpOHIC1J33MnNe7RTyWEkF2EKtf1hOm6CAj1W78ucU/728TETyWjie64J0/
	 6yd2L5aXjrdRgPG38QkIFx08yXBXts9nN8737QKD4LSXAvG9zRPQyhwnJ1WnSZ3nkb45X
	 7uzaiJDhVcuGdJ6/rwUxTLqJODNmYiSy3MxsGzEs+AM2UuspLyVta0ua97hIMCjzkFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FAPEfBE5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Oaboe2PV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDA4606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDA4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FAPEfBE5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Oaboe2PV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795623319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikIAQDWUd4oIdUiwPTrXqLa3Yct6IL/NQnfK5N4xiCQ=;
	b=FAPEfBE5vrxdSwaYpRC82yO8rjC30DaL7xpjj/lLmrSJru8mvFJEwzkwp2YsPyRXBe+CHf
	BQbFs+Pxg4J3MYHexcdtZa7PNTJm+FuFchc5BKlqzvbOIvDDBKKJFbNBMVWjdEimgg38uq
	2EG0Sdj3O5YhI9wU7ls590UNLcYFuuo=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-fKLc3WxDNlecdxqbeI47hw-1; Wed, 25 Nov 2026 16:15:13 +0000
X-MC-Unique: fKLc3WxDNlecdxqbeI47hw-1
X-Mimecast-MFC-AGG-ID: fKLc3WxDNlecdxqbeI47hw_1795623308
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4e937c5bd4fso5072261b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:15:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795623308; cv=none;
        d=google.com; s=arc-20260327;
        b=bPqR1RA5xavWEZ1gUaD9AZnT8H1s86n8fFa5dMLfBmKb01RFQxLctAMKj9RdllF6ui
         +qWMIL4FA2sXa2LTBGE/jIuGAjk8zIZD6yO/4sfohc8rnJDXw4StXAw7eOx3AjZQEGQL
         aQf8QXVgyBYIIT9nLMzeadytsQQFGvS4TALeTvvI7ZZ6wZkNpq66EThEXqAkZqjm9KWB
         S4ghC7t+aT5MMeT6s8umuReyTlbPj6PdBk08VjLXk1M02CONZLJQdmGObS18xZtwpmzn
         VpFDrCfi54Oklba16/4bTeH6GGmdS9lxwqZOp34EuPSGKgj1tLntx7EZ7pmCYWVmDDO+
         ttxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ikIAQDWUd4oIdUiwPTrXqLa3Yct6IL/NQnfK5N4xiCQ=;
        fh=BAgAvggVy5O8k4JNquHJx1mk1+GeB74MEzazv69KoVs=;
        b=sANtTER1+bpMFYeMqyKxql4cFyaVatEOBlAMZijfClrarlhXl/yPqucGpjuuq0YkxE
         3Arz6IypKrrH3AVGXYvEsgTYPwkETmIQILjMTeoxKILTp7FFOQlyWa82FrjtDR6nTE+P
         xv3YCM8PwGNu8mzLp4enPd7Ql384YTgyTO46mtUfFXbxO3I/cZp2a6H146rF2nAndWOO
         HRS2FRGM1xzu+w7wiHjCHANd5NZy4Jpa2qAybGDBB+0ND53EwwW0fRTdKeZg9wcwc/S4
         hzdsl3bvSzx6Ixw0xkG/gMxlcT7HBtrGWO7wVLKCjAwva/rsRKpDUq1iQOAiV/FA6GLL
         IIcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795623308; x=1796228108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ikIAQDWUd4oIdUiwPTrXqLa3Yct6IL/NQnfK5N4xiCQ=;
        b=Oaboe2PViWEq0So+RnJIvBpWv2oUca7oKSNLSN5zUE12qFEh9X86SM5/OLsXeOXi+6
         RWkCRzvujLvMNWJImzFyaBBUfHz1maUpS0OWk2uzBZDHGMlpdEYjbxXJ2/ub48Gcp5EN
         woInw3NN9bnwKGBS9YGiETO6kydhsqpStsdrKsuPAIGandvGDLJdMi2WiWkDptm0ykgn
         nQTgHVDIisjPhEXWyy8MXTwdSBHfelPMk+Z0oAPzgzbQCKQbhYIA++VXiZ5yBcE/NYl0
         PGAVVsQAVIC5XVK6XfJv3BPY0hpI6cDWN+S2bBdFA3W9MQ73CncOjT+pWt4x5GVmWR4j
         6P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623308; x=1796228108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikIAQDWUd4oIdUiwPTrXqLa3Yct6IL/NQnfK5N4xiCQ=;
        b=s4ojj+NMmpfLGD65zTgY1nGjmL5A9bubXzB0TgoE9eEJs+vAAmBpSMYmnIKwAglsfx
         WsJjr0ZWOliPzzIO9ZA+ebCdzY/bMuMEg2kkF19eULDk41gOZyfZ0Q7/JuWTJBeOkWCI
         5P4AlSQm4vtf5ivK9CJJDepVtyfEJ7V+1COWclt6tBbaGAlcMekNV46Z+W9TlMYiAaMR
         4wgwQ/qRudYqCGK8fUOYvCLMrVshuFux6d4EICI8uuwAIhiPvSLBiu9fV4PkNJSqtgBo
         QysJCg1MY7hrlHFXp71n9xDi6FanYomQDzuntc/RxpeVrDUO3+O3xEXttZDxWbAwcQhO
         wbng==
X-Forwarded-Encrypted: i=1; AL+hErHgp56pZuAZFNn4eDkhbV9Z3ysKtSrXZ9VXLRZvB3D37rZEbXq8ESjTFkJA8yYhNNtmiJrowRDuGZajqz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+azqDPEB4s5ZqN4gHtDBnn8bEIcSHTTAwAHcL0KwsfBLuUmcDx
	6p0rppD+mNHyYsArvoCSbxK6z/rgh2wl2vr0j0UaLP2WCk7PX1jXeu35EcaJg9bDAjPa0UC0hdn
	4q7Woj67zcZOpn32AIw572mvOmtVb1Ri5uKmIcCyBs7onVmsTDm6zfQ3ePl59/u4uwv/BddMG70
	NtWkwBOlEyWx+pdClECrc0uOIO9GEKr9KCp+hrI1gF
X-Gm-Gg: AZFdTZfObudhn367KVvgse/iEOXfn8TgOsasd2s2ZLT+W73kKhIcdBOyONCvHoyZzbr
	4b5ENOXxXsQeDK6reUMuu3vA1HlQ529ex/ywJH1m9ykAvkCaEuCJHuChLabkqqJOIfT/YUF2lAY
	qPy9NFYzNYesUAIQCguawztA3dwkIyfTrF1pItgxhWGyyZ2sGwXchqWJSL
X-Received: by 2002:a05:6808:1a10:b0:564:48f3:dfa8 with SMTP id 5614622812f47-57a0a111c93mr20349870b6e.11.1795623307673;
        Wed, 25 Nov 2026 08:15:07 -0800 (PST)
X-Received: by 2002:a05:6808:1a10:b0:564:48f3:dfa8 with SMTP id
 5614622812f47-57a0a111c93mr20349798b6e.11.1795623307221; Wed, 25 Nov 2026
 08:15:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-v2_20230123_tjmercier_google_com-v6-0-dce12fa03ad6@redhat.com>
 <20261124-v2_20230123_tjmercier_google_com-v6-6-dce12fa03ad6@redhat.com> <CAJ2a_DeDF+9pbLKS9pcX4Tot4xZZ-K7HydKnDjW6TWC5bvREzQ@mail.gmail.com>
In-Reply-To: <CAJ2a_DeDF+9pbLKS9pcX4Tot4xZZ-K7HydKnDjW6TWC5bvREzQ@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 25 Nov 2026 17:14:55 +0100
X-Gm-Features: Aa3M54qg8B1tVY9MI_hj21-3fP47U-BOsj1Lrj8qIxJDIaifgpgCHqLTs9bOP0k
Message-ID: <CADSE00JMSXm4Vi5aH=k3VgLL__EsdEZgg_PqkSkK0LQumj1SUQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] selinux: Restrict cross-cgroup memcg charging
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, airlied@gmail.com, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	echanude@redhat.com, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:50=E2=80=AFPM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> On Tue, 24 Nov 2026 at 14:05, Albert Esteve <aesteve@redhat.com> wrote:
> >
> > The security_current_memcg_charge_task() and
> > security_current_memcg_charge_cgroup() hooks allow security modules to
> > control which processes may charge or transfer memcg memory to another
> > process's cgroup, named by a pidfd, or to an arbitrary cgroup named by
> > a cgroupfd, both passed in charge_fd. Without a policy implementation,
> > either hook is a no-op and the restriction is not enforced.
> >
> > On SELinux-managed systems the only limit is CAP_SYS_RESOURCE. A
> > domain that holds both dma-heap access (today's only exporter that
> > opts-in) and that capability, can charge memory to any cgroup outside
> > its own subtree. Since the capability is all-or-nothing, SELinux
> > policy cannot express which targets such a domain may charge to.
> >
> > Implement both selinux_memcg_charge_task() and
> > selinux_memcg_charge_cgroup() using avc_has_perm() with a new cgroup
> > object class and a new charge_to permission. Both charge_fd flavours
> > ultimately charge a cgroup, so one permission covers them and the
> > target type keeps the distinction: for the pidfd path the target is
> > the referred task's SID, as there is no cgroup object to take a label
> > from; for the cgroupfd path it is the cgroup directory's inode SID,
> > which comes from the genfscon entry for cgroupfs unless the directory
> > is relabeled.
> >
> > The checks run when the charge target is resolved, before the
> > CAP_SYS_RESOURCE baseline is evaluated, and apply to every explicit
> > charge_fd target, including the caller's own subtree, so policy needs
> > a rule even for self-charging. Policy authors can then grant
> > cross-cgroup charging selectively, for example:
> >
> >   allow allocator_app_t client_app_t:cgroup charge_to;
> >   allow allocator_app_t cgroup_t:cgroup charge_to;
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  security/selinux/hooks.c            | 19 +++++++++++++++++++
> >  security/selinux/include/classmap.h |  1 +
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > index 6c4c64d6e904..76a714107ae4 100644
> > --- a/security/selinux/hooks.c
> > +++ b/security/selinux/hooks.c
> > @@ -2204,6 +2204,23 @@ static int selinux_capable(const struct cred *cr=
ed, struct user_namespace *ns,
> >         return cred_has_capability(cred, cap, opts, ns =3D=3D &init_use=
r_ns);
> >  }
> >
> > +static int selinux_memcg_charge_task(const struct cred *to)
> > +{
> > +       const struct cred *cred =3D current_cred();
> > +
> > +       return avc_has_perm(cred_sid(cred), cred_sid(to),
>
> Small nit:
> `cred_sid(current_cred())` could be simplified using `current_sid()`

Nice, thanks! I will apply that for the next version.

>
> > +                           SECCLASS_CGROUP, CGROUP__CHARGE_TO, NULL);
> > +}
> > +
> > +static int selinux_memcg_charge_cgroup(const struct file *file)
> > +{
> > +       const struct cred *cred =3D current_cred();
> > +       struct inode_security_struct *isec =3D inode_security(file_inod=
e(file));
> > +
> > +       return avc_has_perm(cred_sid(cred), isec->sid, SECCLASS_CGROUP,
> > +                           CGROUP__CHARGE_TO, NULL);
> > +}
> > +
> >  static int selinux_quotactl(int cmds, int type, int id, const struct s=
uper_block *sb)
> >  {
> >         const struct cred *cred =3D current_cred();
> > @@ -7683,6 +7700,8 @@ static struct security_hook_list selinux_hooks[] =
__ro_after_init =3D {
> >         LSM_HOOK_INIT(capget, selinux_capget),
> >         LSM_HOOK_INIT(capset, selinux_capset),
> >         LSM_HOOK_INIT(capable, selinux_capable),
> > +       LSM_HOOK_INIT(memcg_charge_task, selinux_memcg_charge_task),
> > +       LSM_HOOK_INIT(memcg_charge_cgroup, selinux_memcg_charge_cgroup)=
,
> >         LSM_HOOK_INIT(quotactl, selinux_quotactl),
> >         LSM_HOOK_INIT(quota_on, selinux_quota_on),
> >         LSM_HOOK_INIT(syslog, selinux_syslog),
> > diff --git a/security/selinux/include/classmap.h b/security/selinux/inc=
lude/classmap.h
> > index 90cb61b16425..1f1f2fc4d35d 100644
> > --- a/security/selinux/include/classmap.h
> > +++ b/security/selinux/include/classmap.h
> > @@ -181,6 +181,7 @@ const struct security_class_mapping secclass_map[] =
=3D {
> >         { "user_namespace", { "create", NULL } },
> >         { "memfd_file",
> >           { COMMON_FILE_PERMS, "execute_no_trans", "entrypoint", NULL }=
 },
> > +       { "cgroup", { "charge_to", NULL } },
> >         /* last one */ { NULL, {} }
> >  };
> >
> >
> > --
> > 2.55.0
> >
> >
>

