Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011498;
	b=FZ+bwqO7j7ZN0oSOnl6OENUP2cNtczLntSYi59zL1O/aSge+Sxnh1YW9jdfk5XODw/mD
	 F1xvotVaUv1HUHHPsNG7NfhRbVePduUHSyJM2Hlors9FiujWSE6mHyukIQpwSx+/81sRL
	 I1rMkoFSH5RCmNL7DF4KGl78PiF4sW1DQvCzQheNRzxxQEtBHqguQACi6C1ULKMV7D7in
	 jf7HePdzgW2vJ3KT3O64v7rZY65V4ZxZl/DQm7LEPvl7T05uNyJKbY9uXhcT8lEWi51yo
	 OcZWmIT0qoWM5TcdNnPJ+0ZGXDPyvPSN92oDuWI3sGz0k74Vy4UFuroKMN/k7BLS7XA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=E995rutgSzyg1i9LNX9zVJhyluCmPXgjFoQIxd7q954=;
	b=k28oipjaifPv0Qi4nLaaTV8h27vjZrmXOBewSpn5fm/+1G8UT6jwsudcHu8VteqIdlf1
	 3wSnVkllXe7rOxrTE+762NItNkXreOb/SsAK3BQItsW20EV4L9n2ogHuQuX9xytUZZiO9
	 ZzCyUQdA5Hkp/e+2r/BmLU7b4HHuXQl79vP+FOBMw8zsqrrHAVIbddq0YFNwrRpj50NDY
	 oDiKaoH/dmrJecnRiNjJLKMw6gDKF6Ixz6GxudBE6mLOvTYo2gsNA9OIKyouctXeh6fpf
	 GM0GTHA34j/k+eUilo2TkhLgpp1tPXy0vId8ER++PT6uWmYGC8EH6ehwQtDWhWP+x5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=O5UUux+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEE3606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEE3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=O5UUux+N
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67da62357acso1351108d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795011497; cv=none;
        d=google.com; s=arc-20260327;
        b=cfUsT7GqXPUtOeQOjbt5TPRyIyuyzZc7O52PVuCOKIK0eDBeH27VVFL1HE2PV/peNO
         GcHKQXz8bub68DZJ2zrshf8vIWsEt3eVAw0k70USN/w+VNeMr52XuVmvfC13mjNA1aM1
         s8OOknFqTCArZg5hjg51xwfmVNdUZFoFCI1YWOkYlhzM0r2Thqu2Z651v8ClX1vqEo/J
         0gPRhD5CEU7P/HQokRIclCgPw98rGAZiOZ07mT2aNq56IndwgDVEhr7JUZNvZ6My1KxT
         DjUKxydCgNfbUCHkm3vxQuJni6vpDJUx4WT9QL/9cvadl11VTnugvk9GUaq3s5nvJDCN
         3MHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E995rutgSzyg1i9LNX9zVJhyluCmPXgjFoQIxd7q954=;
        fh=rByHKHi6v3jDX/aQ8au2dcJu9ptoYT29fWlGi3NVxJs=;
        b=hdfjrNABSvvOSVhOakxsMD0fudMmCc35uB2lxNdvOwd4bkbL8BI1zJ5j0F9CSoKKhc
         dG/tQCenuBqWKIQsixbLCcIxjSpF2AF2tmNoH6ZXl+8Q/MSwqdt4RnySiJskB1G7HcJE
         Uvhw2rMr+4YjSlclcdUTzLFu0gNhupo0PpX3yaIAUbJvOi86jgHGW1NRdNN5WAPswrnc
         AXpX9lqFXOiRfX2oa/LvYfc38NSPdrqXOSQGGrEB438QzMtTtF1mq4ZetzFRjGptfKkv
         +qwJw2C9cvI7Oz9vQ0OaZY03qqAk4Ykk+cKPVTReLMq3wmMkahBBU8Tufyff8QBfTv3Z
         /fAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795011497; x=1795616297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E995rutgSzyg1i9LNX9zVJhyluCmPXgjFoQIxd7q954=;
        b=O5UUux+NOPIYcIxm9GdkUyn1dV1Z7MVuIgoSdbfmnaP/eK6AC4apGC+HdZG9UQUd5n
         ligrsVZV45YjTrvOJZLEemNjbLd8xzYw8XARmr4IegzICIMy8Qtj8Zcd9r54ZOyNg9QV
         0K5/9jCqmLZ8jT8Yr/ktIJ4SuHZ2Xf+XniwTlDCi+wnVqehrapGaKaV3Ft6+Fjgeky/5
         9FzaJB9fDzcEzVQOgOozc4M+THsf5EMA2FBzgskfPm1me31CP9fN3DTs1nxgb/ESdOm+
         pizrtLkLu+8sdHn9KzmTuCrY9xlouejVYuoBIgBhFNpe6S3RVTYyuX2UXcLTdWeCEvjh
         Ek7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011497; x=1795616297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E995rutgSzyg1i9LNX9zVJhyluCmPXgjFoQIxd7q954=;
        b=HzliVGuXnPUh4y0T4iSJagfBGimSZ7i4Dt1VvOPhlgA6hy+bM5R+mXO/IALHE6F8so
         DGOwvg5Kzyly49Iric6Xrw/511pG6TuSuJ5FFsA9N5vVSUNGMUTTriIhmLBV1Soi9zab
         ayJbOczxScR73FJp1TN4unLpPAEvJ3Kli2E3q5D/c12MqBB9Sb1n8T0iCVhmciMo1q7W
         ldqd2IugPq8G/wdq6UU5OueoY5V01vUpe0630IAcHTlNZOK01W77uP2SRvNp9R3Vgeu8
         JgipzEo2cmTZgYNBdCYadMVb9YUdfQaBQJU7NOMK82DNgcVB0KJW5RnKUGEfBIIrJ7Ta
         FWPw==
X-Forwarded-Encrypted: i=1; AL+hErGZWhc84CCVyiuwUnKa5qgBh7PCzzj/QNFBj3ch6/UxippFAzW1O5Ub3N7Mcr6XaP7RtvwM9dGOUFgmh6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XZ2SwwtyGe4Knq58hvkzA2Qv75u/UWk/wXxJLACSTHdg6fD3Z
	yggHKiTiMqwzHvZC8wSlyKqaiHjAuLrnM0/DjsXfKt7IFslykCZgElP1QdRlitsDa1/n/8BfFBC
	qNl6potXoxpQdLNCwnp5LeR2b01twpZV/hVL/DjuRG0Q=
X-Gm-Gg: AZFdTZdZAVuHA617c5NodlrKXxKNZFrmiDNQNOVjg2ohZmMIzCWskDHbvkQ3lOq1L4p
	Omz+O1LTV59ZIQq20xu0EM+ZxLTtxIcnySb/DlbiZ+TTeAmiK5rV8G3OGW+7XuzDgTiEFJs4Z/t
	Wb32kzQwfnzv8SjMTO2/8XNgfer5ynkP7/ZWm7qwvMbPl2Z4BwGOfdBlrIoe5/127iLqpSR9fWN
	Jb2ZRkoLchHuF2kJ4BQc0AQ7Gt2/5CR9112Ay4UjhTHbHH7b3IgiYTxCoDaa9B8Oc2j0kJq7E93
	OpMHpja13nM1Y9jZVbjonZpz9jz3gVowMZicMDAQokwCaWuojBV1C1la3MSfkqguLrKyvgiPcjS
	SuNxg6habmZLYKdc6o9nLybTR3w0rVD9B9jOBo/BzaFo+VpV0UDEAkwrgC/9munrSc83DNcY=
X-Received: by 2002:a05:690e:190d:b0:679:a42b:f0dd with SMTP id
 956f58d0204a3-67dd3cf9efcmr1187071d50.14.1795011496626; Wed, 18 Nov 2026
 06:18:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d85ece6e-27f9-4d9f-83af-4101bc76fef6@app.fastmail.com>
 <356db94e-f5d6-4fb2-839a-b97aef72256b@app.fastmail.com> <CAHC9VhR9sjunJRnM9gy-BkBZkapQTrr8a8FtmaK7JkAmUqTrLA@mail.gmail.com>
 <CAEf4BzZKmn6g0SK8OddjKFj_vAmZFvpZv32Hs_S+GHgT7VNfrg@mail.gmail.com>
 <9d6bdc31-e57c-4187-be78-29d82471f710@app.fastmail.com> <9695ec3d-7b81-488d-989f-0bd411d673f2@linux.dev>
In-Reply-To: <9695ec3d-7b81-488d-989f-0bd411d673f2@linux.dev>
From: Daan De Meyer <daan@amutable.com>
Date: Wed, 18 Nov 2026 15:18:05 +0100
X-Gm-Features: AclHuK_kSwvu5Jj3k6C9_kA8WpAYJGoXqqdOwo0daouusPGhJdTvAUCcGkN4sy0
Message-ID: <CAPa8sAh6b5xn4rZzPfM0nZ+_kkywWj22fy8deLq+6qYews0rdQ@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: roblabla <linux@roblab.la>, Andrii Nakryiko <andrii.nakryiko@gmail.com>, 
	Paul Moore <paul@paul-moore.com>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul.mabileau@harfanglab.fr, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note that we've already merged code in systemd that depends on the
current argument order, so I'd really prefer if it didn't change. If
it does, do cc me on the patch so I can fix the issue in systemd.

Cheers,

Daan

On Wed, Nov 18, 2026 at 1:52=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 11/9/26 8:07 AM, roblabla wrote:
> > Hi,
> >
> > Thanks for the replies!
> >
> >> [...]
> >
> > So what would be really nice is a way to make eBPF code robust against
> > kernel changes such that it either works, or fails to load, but doesn't
> > do the halfway "loads but silently misbehaves". Here are two ideas that
> > have been in the back of my mind that could help solve this issue (thou=
gh
> > I understand that they may be rather large changes, I'm putting them ou=
t
> > there mostly as a conversation starter):
> >
> > 1. Could libbpf/the kernel have a mismatch check on hook arguments? I
> >    understand that libbpf and the verifier don't know the types a
> >    program expects, since BPF_PROG() only casts u64s. But the macro
> >    does know the types at compile time. Could it (or an opt-in variant)
> >    record the expected prototype in the program's BTF, so that libbpf
> >    can compare it against the LSM hook's prototype in vmlinux BTF and
> >    refuse to load on a mismatch?
> >
> > 2. Since kernel BTF has parameter names for the bpf_lsm_* functions,
> >    could we maybe have CO-RE-style relocation to resolve "the argument
> >    named dentry" to the argument index at load time? This way, adding a
> >    new argument could happen anywhere in the argument list without
> >    breaking eBPFs, and removing an argument will (correctly) cause our
> >    eBPF to stop loading. It does mean the eBPF programs must provide th=
e
> >    same argument names, but maybe that's an acceptable tradeoff?
>
> Hi everyone.
>
> roblabla's comments got me curious, and I spent some time with my
> helpful assistants poking at the problem.
>
> There is another workaround in addition to what Andrii suggested.
> A program can already make itself fail to load on a signature
> mismatch:
>
>         union security_list_options___mine {
>                 int (*inode_create)(struct inode *dir,
>                                     struct dentry *dentry, umode_t mode);
>         };
>
>         extern void lsm_proto_mismatch__inode_create(void) __ksym __weak;
>
>         SEC("lsm/inode_create")
>         int BPF_PROG(deny_create, struct inode *dir, struct dentry *dentr=
y)
>         {
>                 if (!bpf_core_type_matches(union security_list_options___=
mine))
>                         lsm_proto_mismatch__inode_create();
>                 ...
>         }
>
> bpf_core_type_matches() checks the expected prototype against the
> hook's member of union security_list_options in kernel BTF.
> On a mismatch the call to the unresolved weak kfunc stays reachable,
> so the verifier rejects the program, and libbpf reports:
>
>   kfunc 'lsm_proto_mismatch__inode_create' is referenced but wasn't resol=
ved
>
> It's positional and needs the exact argument count, but it turns
> silent misbehavior into a load failure. The same should work for
> tp_btf with the btf_trace_<tp> typedefs.
>
> But of course it's just a workaround..
>
> A bit more generally, expanding on roblabla's second idea, I think libbpf
> could resolve hook arguments by name with the existing CO-RE machinery,
> without kernel, verifier or LSM changes.
>
> The BPF side could look like this:
>
>         SEC("lsm/inode_create")
>         int BPF_PROG_ARGS(deny_create, struct inode *, dir,
>                           struct dentry *, dentry)
>         { ... }
>
> BPF_PROG_ARGS() (name TBD) takes (type, name) pairs like BPF_PROG2(),
> but instead of casting ctx[0], ctx[1], ... it reads each argument
> through a local preserve_access_index-marked struct, so every argument
> access is a regular CO-RE field relocation:
>
>         struct bpf_func_args___deny_create {
>                 const struct mnt_idmap *idmap;  /* 7.4+ */
>                 struct inode *dir;
>                 struct dentry *dentry;
>         } __attribute__((preserve_access_index));
>
>         SEC("lsm/inode_create")
>         int deny_create(u64 *ctx)
>         {
>                 struct bpf_func_args___deny_create *args =3D (void *)ctx;
>
>                 if (bpf_core_field_exists(args->idmap))
>                         /* use args->idmap */;
>
>                 return check(args->dir, args->dentry);
>         }
>
> Nothing changes on the loader side:
>
>         skel =3D deny_create__open_and_load();
>         if (!skel)      /* mismatch: load fails, libbpf logs why */
>                 return -errno;
>         err =3D deny_create__attach(skel);
>
> To achieve this libbpf would need to do the following at load time:
>
>   - treat bpf_func_args___* as a reserved type in CO-RE relocations;
>   - find the program's attach target in kernel (or module) BTF:
>     bpf_lsm_<hook>, the fentry/fexit target, or the tracepoint stub for
>     tp_btf;
>   - build a struct from the target's prototype: one member per
>     parameter, named after it, at the parameter's ctx offset, plus 'ret'
>     for fexit, fmod_ret and LSM;
>   - resolve the relocations against it by name, with a strict type check
>     (pointee types must match, qualifiers ignored), since CO-RE normally
>     treats any two pointers as compatible.
>
> A missing argument or a type mismatch is a normal CO-RE relocation
> failure: the program fails to load with an error naming the argument,
> unless the access is guarded by bpf_core_field_exists().
>
> And this is not LSM specific, fentry/fexit/fmod_ret and tp_btf would
> work the same way.
>
> It doesn't help if a hook keeps its signature but changes semantics,
> or if the attach point goes away (that already fails to attach).
>
> Here is a vibe-coded prototype of the above:
> https://github.com/kernel-patches/bpf/compare/bpf-next_base...theihor:bpf=
:bpf-named-args
>
> It's an entirely new libbpf feature though.
>
> Andrii, what do you think of it?
>
> ---
>
> And just my 2c re argument ordering:
>
> Paul, with all due respect, prioritizing code style and personal
> preferences over backwards compatibility is unreasonable even for
> unimportant applications. And here we are talking about apps
> implementing security policies, which many organizations (not just
> companies) in the world rely on. Given the recent flood of
> cybersecurity issues (in Linux and beyond), I don't see why would we,
> as in kernel devs, intentionally make the defenders' job harder.
>
>
> >
> > Thanks,
> > roblabla
>
