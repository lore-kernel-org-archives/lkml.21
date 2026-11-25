Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638319;
	b=LQDDO+/LOOYyYa0GAdcWgp/2iQaQ7CoH6aU071PhnfRl3c+DbsSi9EoqoIopmWPpXFt+
	 09HjmQjyf0DU0WGOVRCQn3jPAW9WLi4AXjEUCUE5jiXHHm1EXs1N+jBbRLRB2FR69AkMg
	 SvNjAWsPYYQaPlKTtP9ibBGbsm7ePjAQiV4ocUf8UIeSVyBPWjh/N49Ttp2JA2hEn6Y9S
	 4O8cskGeV2AHiXhP8v3cs3+dKB2IyYkMzhABTXoAXNoyXBpxevF7uE9MfenM9meKVuM96
	 NywyBprvGcYBYtX16DUn9RdJWWiWYBAZZrn/q3TmxYWY8FUwTtR7+rBI1xUi5HmAPxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p9IirqDfAOTVejDkPFAqBuLyzIAHl90Deo3aTCgyC9U=;
	b=qVr/uAYzwRTi2tzRFyqj+ZWuxcdCkX0xH/nJ5LsuOOQ09FCTCvqeJpCacsIdz4VdUb+k
	 6TBn3P+JEWfKw44PNxdt7DcZ9CBgB/MyvtBLLjj1cKwFYSeWdmBz95y6+4TOKJ+q6k1PB
	 vbjmg3xHA1sYIXcj2oCegdzyhGmADysS1/o6Jq4JdVGHia1u4jlgu2Ec2PNkjowL7kkUr
	 sSSId9Y4HZMJIdcXqPpyKhkHJegwhUfuVEdU+XgsfGUwxrYhKjBLkRSr/NozB9I6ETSuA
	 Rq+wg6YW+CrYnYZyeJIs/hBJ3+rj3GbSpo6eahBYm3NKG18kWijRPmerfX5Sxs1dpNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6lQClQE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA41606A697
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEA41606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6lQClQE
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2867909f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:25:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638317; cv=none;
        d=google.com; s=arc-20260327;
        b=i7EW2wELPCdzSCI2P6HVI4SbKsyMEqRombdnkiTe32coxelHUNaIx3XEsn822AO8yY
         vkpPpiIe4DiwTMNE/jrrSarnEMp+nWHxlhY4vRuBhBpA6Ub1mLo2hCwwLmcvVuGt0kj+
         B5QD5Ki/cLtbxP5OLqlC7usSIbWwCmbTBSJQo+QLT+PczP687YkqnsUnYUZJfxf9ptCy
         mb6CF8vPi0U6JIhIfoEjeFNqhs16O2wDN3+qbwlHq4bzCzZdiNmuPaKdeBB6y1RW7MjA
         0FGEaMsaLtYvrlt2MYifmJ4Hoivx5nqJPnbinhkzublLmJD1AXbIuDNnwLrXtDmVht4i
         KPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p9IirqDfAOTVejDkPFAqBuLyzIAHl90Deo3aTCgyC9U=;
        fh=83d6iUAWFH8hK7+pSEM9M9BkAsVLwM2Rg62GT7RnItw=;
        b=pE/tZrAFGKoYPU7tYy4gFFy19Nl//+B7Wnm1MityqTH9bSwuyQUtT1e/1ZM1Jq38En
         FQYrQusWGdWFnDtxLIjzcPB3L6k6cXUP2T4swpaeLgmdZCICEruHXGsufCGX1CtkQ272
         dlKCwWfCG81putHCqf3dXbB+SyLU4C3friO8CfE3ZKmuCvrroVCz9wAnsmRbnQi/O4OE
         bBa/4PtAMoy6gQWJYyWa6awT5fH2Yzv5TouuaapVXohklLRRFnBWUh1+S1GxjT8Cwhlc
         oSljY4P3korBd3wHG+caJZ/AUdzR42OmzeLqPil4fstmU9x06hx18s9Z1tiIQl3SXuOg
         G7gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638317; x=1796243117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p9IirqDfAOTVejDkPFAqBuLyzIAHl90Deo3aTCgyC9U=;
        b=U6lQClQEkTfT/Djs6sxofcxEM+1ml78AKaQozxaTTbHBld31wCjeZ2RWZbrNS7NRIm
         MRtvIXLwQox846me22/6GlRPwDV06kCtFh12S0htXSTxnJDCTM5wBACvb8ZU7Mye6B5N
         3xW7jni7Gle/6Z3mNK0KjkwmcVXDycy36TdUpsvq0nD/tmVcAzXVKlxD4ciOeaJV/lyT
         L+A7FZrhPQm7shYbMWBBLV8jvZWcAd1JXYbOLIbH3cBGuf3uKOhzNvI8x7MsQlNQQ3od
         iNEkO1c2d2SW0CgwDHlO5Z1ahmQU4Mjd38x6pYdmKMZmX8KzB/xm6IEnAM+C3PHxtYTo
         QSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638317; x=1796243117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9IirqDfAOTVejDkPFAqBuLyzIAHl90Deo3aTCgyC9U=;
        b=OsAxG8LCzALYSrRG9IKgp4OtJLOgyt/p3gmobYogKWWAdpjDZouVaYF+IvJfxdQa03
         zx18xG8QyOOHloL6jx3MJ21crOItCfnBA29cLWXQffwcqDv0Qaf0RJfwA8qZCnd0XK/L
         wRve+hwCsM+SjhxhxZlradYcYT3AVe3SX5wLOyHE5uPpjtee4DX/AKtRmncYsnxEuw5h
         Sco2t/+DK9Cbf/Zp8u9LmK0CI0aro6HgmxmmvUfzFm0pyIjvPQvjgnp6soL4mqGUyFB3
         +hYMGJKK6G9mbRZsPIKIsx75nOEnjOi+8Ilzz8jNNt/qp2NkJ3xhBlK8BmXqpBPPlSXY
         uF7Q==
X-Forwarded-Encrypted: i=1; AL+hErFJ8gKrxdtxeVsaUoFHnzIBcaV076yLFVHfyG5KfZ1eU5jgVLLpKIVQBsdT91H+LnYiun4vzQJqq8gEvCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pPbRVGFgumvH/NhmxLaRLSmZGrfTSc1GsgphOzeGaqDgQIMHV
	blQKj/TP6pIbm/FPm1VgZBP4wzN7cV/gPHJpy6zfYmelI4dGh99mz8LZiUkl6quhQOO/Q1noEHd
	tebEWnWK0weH3bnMGGGNXnUo/J8LIhuQ=
X-Gm-Gg: AZFdTZciTZEEN3ldPdr+Lwf6hM+yCxC1TNjO7M9vZb5VnVjASxYjZndDLd8/TJS0Rqn
	z88OQW/F9d2zRfn2ZEBreT5Hc8UwYo2C3tCoHUdDBNhzUntJDrl8N34oaMycEsmhwIyBihp1qqv
	sY3WZvfQ7qWh6kYPU0hyPDft+TrKPiD3yDUo3O44vl5sjkYbRuEesVhc1ml3GkQvd4r03epv5fe
	u2e6dgn5kkaYTIEg63jBGFQnrf845J97hFznbqbQEpOpJqTdFmFPO7Iitn9J8HNr/SkVfOwpqA9
	QWD09Puf12RTdCTQmqsPSfay/wkfYT3XWTOEdidQ03y9jnZ+4P/HQMmLSwo+mnwv2dMkBKeZvmf
	qNfIn0KBeswxoZkYr7Rs5uUILaWDvwwoGCn/L4OV8/+fCkpKUFhy7m3SN+7+voyrIRwgpFeK8W9
	OJlyVyWolzBQFoyvoBM1c=
X-Received: by 2002:a05:600c:1389:b0:4af:83ad:8f70 with SMTP id
 5b1f17b1804b1-4bb88924f66mr382908465e9.35.1795638317113; Wed, 25 Nov 2026
 12:25:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-15-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-15-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:25:05 -0800
X-Gm-Features: Aa3M54o-lsDlv9tHK0FdKSsemQf2iUiz2mvyNbuvwkHzJEpFwnOT1T_ooxy3Pro
Message-ID: <CAEf4BzbdGw4=yWxFqdFuz1U7RBSFqh7baJX=SpBNJJqnaW5P_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/9] kallsyms: Add KALLSYMS_QUERY_BY_ADDR
 ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> Symbolizers such as Perfetto read all of /proc/kallsyms and keep a
> sorted copy in memory to resolve addresses.
>
> Add the KALLSYMS_QUERY_BY_ADDR ioctl. It returns the symbol that covers
> an address, from the same sources and in the same order as %pS. BPF JIT
> symbols are hidden when /proc/kallsyms hides them. query_flags must be
> 0; it is reserved for other modes.
>
> The command uses 'f' 0x31; register 0x31 in ioctl-number.rst.
>
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |  2 +-
>  include/uapi/linux/fs.h                       | 13 ++++
>  kernel/kallsyms.c                             | 60 +++++++++++++++++++
>  3 files changed, 74 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documen=
tation/userspace-api/ioctl/ioctl-number.rst
> index f5dbb597257a..d9b66e7a29b7 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -250,7 +250,7 @@ Code  Seq#    Include File                           =
                  Comments
>  'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       c=
onflict!
>  'f'   10-11  linux/fs.h                                                c=
onflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
>  'f'   13-27  linux/fscrypt.h
> -'f'   30     linux/fs.h                                                p=
rocfs kallsyms ioctls (PROCFS_IOCTL_MAGIC)
> +'f'   30-31  linux/fs.h                                                p=
rocfs kallsyms ioctls (PROCFS_IOCTL_MAGIC)
>  'f'   81-8F  linux/fsverity.h
>  'g'   00-0F  linux/usb/gadgetfs.h
>  'g'   20-2F  linux/usb/g_printer.h
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 987569dcdbea..c1a63c8560e2 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -676,6 +676,7 @@ struct procmap_query {
>
>  /* /proc/kallsyms ioctls. -EPERM if the opener cannot see kernel address=
es. */
>  #define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL=
_MAGIC, 48, 0)
> +#define KALLSYMS_QUERY_BY_ADDR _IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL=
_MAGIC, 49, 0)
>
>  enum kallsyms_query_flags {
>         /* Match query_name as a prefix. */
> @@ -717,6 +718,18 @@ struct kallsyms_query_by_name {
>         __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym)=
 */
>  };
>
> +/*
> + * Find the /proc/kallsyms entry that covers query_addr, or return -ENOE=
NT.
> + * ftrace trampolines and kprobe pages are not resolved yet.
> + */
> +struct kallsyms_query_by_addr {
> +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_a=
ddr) */
> +       __u64 query_flags;      /* in - must be 0 */
> +       __u64 query_addr;       /* in - kernel address */
> +       __u64 sym;              /* in - user ptr to struct kallsyms_query=
_sym */
> +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym)=
 */

nit: same as in previous patch, I'd keep "sym_size". But hey,
"sym_len" is even better and follow same naming as with sym's
name/module, no?


> +};
> +
>  /*
>   * Shutdown the filesystem.
>   */
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 29a9da04d8a3..6d7032cd3fd6 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -1223,6 +1223,64 @@ static int do_kallsyms_query_by_name(struct kallsy=
ms_query_by_name __user *uarg)
>                                          &bufs->m);
>  }
>
> +/*
> + * Look up symbol from addr. Copy the module name under RCU, and hide BP=
F JIT
> + * symbols as /proc/kallsyms hides them.
> + */
> +static int kallsyms_find_addr(unsigned long addr, struct kallsyms_sym_ma=
tch *m)
> +{
> +       unsigned long offset;
> +       char *modname;
> +
> +       guard(rcu)();
> +       if (!kallsyms_lookup_buildid(addr, &m->size, &offset, &modname, N=
ULL,
> +                                    m->name))
> +               return -ENOENT;
> +
> +       /* Outside vmlinux, only BPF JIT symbols have no module name. */
> +       if (!modname && !is_ksym_addr(addr)) {
> +               if (!bpf_jit_kallsyms_enabled())
> +                       return -ENOENT;
> +               modname =3D "bpf";
> +       }
> +
> +       m->addr =3D addr - offset;
> +       strscpy(m->modname, modname ?: "", MODULE_NAME_LEN);
> +       return 0;
> +}
> +
> +static int do_kallsyms_query_by_addr(struct kallsyms_query_by_addr __use=
r *uarg)
> +{
> +       struct kallsyms_query_by_addr karg;
> +       struct kallsyms_query_sym ksym;
> +       struct kallsyms_sym_match m;
> +       int err;
> +
> +       err =3D kallsyms_copy_query_from_user(&karg, sizeof(karg),
> +                                           offsetofend(struct kallsyms_q=
uery_by_addr,
> +                                                       sym_struct_size),
> +                                           uarg);
> +       if (err)
> +               return err;
> +
> +       if (karg.query_flags)
> +               return -EINVAL;
> +
> +       err =3D kallsyms_copy_sym_from_user(&ksym, karg.sym, karg.sym_str=
uct_size);
> +       if (err)
> +               return err;
> +
> +       if (karg.query_addr > ULONG_MAX)
> +               return -ENOENT;
> +
> +       err =3D kallsyms_find_addr(karg.query_addr, &m);
> +       if (err)
> +               return err;
> +
> +       return kallsyms_copy_sym_to_user(karg.sym, karg.sym_struct_size, =
&ksym,
> +                                        &m);

nit: if it fits under 100 characters, please try to keep code in
single-line form as much as possible


> +}
> +
>  static long kallsyms_ioctl(struct file *file, unsigned int cmd, unsigned=
 long arg)
>  {
>         struct seq_file *m =3D file->private_data;
> @@ -1232,6 +1290,8 @@ static long kallsyms_ioctl(struct file *file, unsig=
ned int cmd, unsigned long ar
>         switch (cmd) {
>         case KALLSYMS_QUERY_BY_NAME:
>                 return iter->show_value ? do_kallsyms_query_by_name(uarg)=
 : -EPERM;
> +       case KALLSYMS_QUERY_BY_ADDR:
> +               return iter->show_value ? do_kallsyms_query_by_addr(uarg)=
 : -EPERM;
>         default:
>                 return -ENOIOCTLCMD;
>         }
> --
> 2.56.0.679.gc527c65306-goog
>
