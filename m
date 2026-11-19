Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111106;
	b=bUUrL7ItyXQF4FkkzD9UyykXNrEQuLjYX8vRmTncSwfsYEoQC8jsUHYoPrSJRht+fsMf
	 Yh1B1WkTGsQshTI5J1hE8HfmAoMt6bk+axosV0pG/gW2Ot6JYwCXdgiWh8aclpsMcohkB
	 sATkVr1Zu/e9jc+oScFQDGwXb4KrSjISK5K5/AX4YMbMTwi8PhOaLP4KetVkBNNQr3SfB
	 yq/6SRD9NUzAOZOca23hCqxEjrhZCCmwqmnwLhJHK76EwmRtSE9J9uhoENiy2nH5IBvFt
	 Fk5MhzJaQqd6fNnV+qlZcXTjSrXhqSOp/K1mh7wfycDy0ZmVGq+IiX0cPItFWoUyn7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PslAxsc1zc8ecKHENMwh3peIr40sPCuNVTraR5q6Nts=;
	b=fYhw6XMw8EaYdV92KJGY91YXuLonkIaJPg6zTud30XBYoDzSmnTnaNJLa209hve/uTem
	 yGu/ZmCsZU4QJK3d7wqgbg/Hb9oLgeAQHBzKESmW6qXZNcI0wfoJXAcnuhYyU8J3mcimx
	 PL8UJh7Un/NZRtNnr2/RdzzK4XJjoh9zkGhtWwNmmhEW9KdzAz8+HlXxQXxGdQWqwhgQn
	 UxYP8AW+Y+PiVaqbtetGfxcbyqDbULOk1QjK4VYSk1wnxmi+Wm6B1g3H/CNVEXhG4y6uX
	 liAo6Hn8FyWfF8c4FZjgb9oApkfX2eJdoUoIe1FFYs1hQcq9kBsIcfLuIxt30KLbtgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KskaJ4DE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBAC60A5BC5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBAC60A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KskaJ4DE
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1272320f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:58:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795111104; cv=none;
        d=google.com; s=arc-20260327;
        b=Wc7R+lRddAbzZNF8EB/KOzJ9FvLEsLKl11CSsyjCKy/qX3+jNMRz/1t09vVYSoEZAL
         ul/1zrhwdgJhs/Q515Q/VxpGa/gz9bBTt2vINtsQQo7DQmZrV+pOreayrn7WkmEU4mil
         k+yLTE6C7evzmoTC7HG/Gp2WEsHxzIiUf1qRmMzuco2+rX21bqXFBXbvwFtG14vM5HBa
         Cz9nSdbFLbaDKuHkT5FOej8dN+hsa+n7GElYaIZ9AOeOT2yuKTXBZaSDyvqcY111E8Wq
         6usMms4PVYKoj39EWvbRG14HRK0gPCZnm+ypNHRXVYtlILR9ul1LnTqxXzVkDdUMo78M
         L2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PslAxsc1zc8ecKHENMwh3peIr40sPCuNVTraR5q6Nts=;
        fh=vNUgkpUSZpuaBM+D/4Svas5bg1SAuRLHraDQMCX8gic=;
        b=KAs5pibMHoxAwQ08wIa9uudSblcsMUeorF4wvMoy1oKUaF1TsoHvH5zTtoAXa8DXxW
         lwBZ1US6nYK5L/64V3m5zaMsuqjz8qdU8b8spBwjsX2TJxtQwLJTzpgsTIB30JiX3/zO
         dVQJBKf+6p29lUZ+Th73/P4btXq7KgVsTwcQNe8rS2rXD+UrwmcdA1Ze/CKxCMxiEnV5
         h7es+FGWDNIqN28Nz2VNHgZf35D9fBUawd1DHMqUlLYUPnXsuiIabIP4KOD8DZpbwXxl
         eNl6Ch5MBbCWvi8RVuesD6E3Ksi2/0JL4SSwpoH88tnOCSikr47V05R2UnU2RAoZUFBY
         Maqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111104; x=1795715904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PslAxsc1zc8ecKHENMwh3peIr40sPCuNVTraR5q6Nts=;
        b=KskaJ4DE9TbkUaMgwVxD/dbhrstg5KGdGNvSesaol/MYrJhWspuc0LVzoL0MwJEqzY
         g4fOwkWNChJfSfmqPxn4GprZEmgOvbYFS25vXUkx2YkNPADbYswD/0HRkFRcS3jHNJWA
         o+1yod281+t+3gODsKlHjGn4eIG0oemdhiiMxBEpK8LhpLMRA+rS6oE07kIoV8saIWAb
         O11fWDJd3UQpFLK2B4dy8VBZJm3nf5wDBWyvQu78Z34xuWQXazOgCUCDofobObBR9Iqh
         Aa6/b1pJ2Nx8gkVMxmtWMz2esM8nJYipSMzevRUFsN0VBXk1tZHFFxq4/1gEvbQiMdJC
         aCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111104; x=1795715904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PslAxsc1zc8ecKHENMwh3peIr40sPCuNVTraR5q6Nts=;
        b=WCo70EXw4C8RPcPXjqFhqHf54/ybUkJQYNSCahhHPPhGcrP7EQtXQoEdp+2waQnYS4
         WNky/jGDRfgbqsMprudo9l67zfeNyhHAvk4ydBxvQLqvUUFm3jjltAkpB1beTUEAAwHo
         hPezL2gjBfawR/LlgQb80MWUxyL364fjLGHRrbdgQ+DkZSbjrcxqYI7qsiilanNimUrz
         hACDW2riwH7LbTVxUNdEv4lku8OlyLHZGdxdaLSh9cpGZoUX+yksX45X+SYUjSJczagQ
         Na/wbStFgRGnd3ygX9U8euK12iU5bI8KUYSzpBMWaGeemrk9JMMECVdw8JngV5f24UmL
         MMsQ==
X-Forwarded-Encrypted: i=1; AL+hErE1TYfUdxzKYfWMLAk2TIFaGhLDl3j6AR9BMUsQKUxUnwB8W1GdRSvI9li0p577OhsvjABTKTja6p0UrjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z++9VdWq/2cKL82CGgLyeQC5fOYUcFk7e5LKRS1lxnx7g+aBDLw
	6j9DDyH1F306Rfu0vx/jPftT7PVKLPHOdhvvKnvwHI92aW+4y8zR7BNVHtZ9ateaNpzbC7rzfqZ
	tNHQUpeuDqe8ycrVzvrOI1FKnPaBdgMk=
X-Gm-Gg: AZFdTZdHuXuGbCuxPooeHqPbh5aBrCtU4zGSm4JsviLj483nZw88F+xCZV0D4c+rzOK
	0iBXk+zRuTmbN8ad23THtAmswqjZBFQkJ680qhX0oYpcLQxxmLqm+SpTqWAbeu4Mdxf9TfjILgB
	1GBboKnSLG8y3R4ydhWFsfnY8Y2Q0/1W1KQTQaok8AGYpbTzCfdzSNx7ycu8zc7RJ1j/d5I756W
	kkboYa41e7o779DFbXkRZYW1sdBkFcFuxuG/sU5muR9tsQCtWlK7noiuBexc/TtsBJpfqMTi/zq
	Xz4UWh+AbIhm9oMGaitmv/HBD+OxTB7CXwaTlHyLKsXsDtSWy8gf1VGXLnnXhVJUqFyn7dIibsU
	FVUvjh3i26K/n3QHnDEUFKZBR/kg3Yt+DrFypPGzqPekd0yDaHRVV5Wq1rW7e7P9fnaAkd13TNV
	glywPeqKaso7qkiDII984duxk4Y/TpRpdZ+w==
X-Received: by 2002:adf:e010:0:20b0:4a8:647c:f965 with SMTP id
 ffacd0b85a97d-4abb348dae1mr205469f8f.41.1795111104076; Thu, 19 Nov 2026
 09:58:24 -0800 (PST)
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
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 19 Nov 2026 09:58:12 -0800
X-Gm-Features: Aa3M54px5BqoBHIu0T3IW_WGJ1h2ACQTKlGPoaDQlVnbwzNn0EkGy5HFiAACHIU
Message-ID: <CAEf4BzYNo54oz12C+s51KG5yWozDHGsQHYqdqHfqpSJ8=QPmyQ@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: roblabla <linux@roblab.la>, Paul Moore <paul@paul-moore.com>, 
	Daan De Meyer <daan@amutable.com>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul.mabileau@harfanglab.fr, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:52=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
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

it's an interesting idea, we discussed this internally, needs a bit
more iteration and making sure that it will work reliably (e.g.,
accessing program's context through CO-RE relocatable accesses is not
guaranteed to work, and that depends on compiler decisions, so we need
to make sure we can guarantee this works). Ihor is going to
investigate this more thoroughly.

one slightly different take on this idea would be to have
pre-generated structs like bpf_func_args___deny_create in above
example in vmlinux.h by bpftool, so that users don't have to use yet
another magic BPF_PROG_ARGS macro and repeat kernel-side function
argument types and names. Instead all this can be (hopefully) just
provided by vmlinux.h so users just do

int my_prog(struct bpf_func_args___deny_create *ctx) {
    const struct mnt_idmap *idmap =3D NULL;

    if (bpf_core_field_exists(ctx, idmap))
        idmap =3D ctx->idmap;

    /* use ctx->dentry unconditionally */
    ...
}

something to consider as an alternative, perhaps (still there is that
relocatable access to ctx issue that we need to figure out)

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

+1

>
> >
> > Thanks,
> > roblabla
>
