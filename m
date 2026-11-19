Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126191;
	b=sAxsmcU37bD6eShIdDfDDVdDqpPp0cbPc2cUwXdjDNI7P68k5m366cCfIdQAdicoPqPB
	 qDvxmjetluFow7cYQTQ5GzT+6LG3FVyhjzw8qFzgjsmH8VMy7IuOHlo/29S9P7Qt21xNW
	 kYp7da+I5mA1Y0oAdVnHaMhQXfpoUbdqKq2BOON0GWs1DqiZM+uPK4R137AN0PmGdrW/4
	 V+BeZHF5DN6HGMG0pDODsUsWfZc86ADOZpHYxQi3srcEBoQyxLosWyMi8M1XNbk0XnIAB
	 uqDOyhT7E1OfFeMsrFBXcJ8eXacwJArfJiRvkaj8d74pD9keLozAx9hz/cP8hSnEHYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c99oiFB+0aG9pcFd5KmDCTgPzdI/PgGeBz4H+HHEqzs=;
	b=m6x+1pKnOGZ6TQy6oM7ObvPybbTJCyBfbmnPFBV4/tLpkWUlNpAFoq0sUFPHWRXDlcEb
	 cSmh/ywuaJax+tzII3dyIM0xH0IE5ZIsSzmxTvNH8+Zc8a3VEMTwKipqvbOWoo7UETMP/
	 kR1JgUXA9ap2ulIqn3ElJMJKNuJRsI80uhwoqX5PKp1wbEtQqPqDwWtQEYWKQyB0JHQgk
	 qhfZWQEaK76nHYvtSzjDR5WlV9duLdNfirg0alByfkeCOGrkspAIlDlFgLIdNiAZvF2/V
	 MfvwcDEYm2AgJYbRAWdkE3HnoHzas5/bmEYDxjzXroIQdB9/u8k25bOOKLfjHW3UZaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CGYLUo9D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DB560A2614
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93DB560A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CGYLUo9D
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50933bdf4bso45303366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:09:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795126189; cv=none;
        d=google.com; s=arc-20260327;
        b=gZPuX4wKE+XTgPNxCh7YYgIt0wP0rVUUL4Tvbv6Romd50SBEzi/nf42bgwyws23Hdp
         d5IIXBhgKu/FjvdBZqgi3AvCCGaipPPydFwaXQ9VQ2U2CySa06A6vI7RFR4cPximA16f
         Cl9AQacC3xYNtqyRSTxXjL2yeHjY8ur+iwygnGEsNDaoOXe36lsWVUd+rNkz+j3IxeFB
         ZWpAfa5yNi96kOl/liXBo+gZ8xb2BquT+wPWUba+Nul2eG2qtb1qeW0l2PkOM1Q8AgGP
         H2qP32e+XMO5UnmdhzDVfrI+iGzzjC4S0T9TbDM6wxn0BxTKIv9vV/MiHidgfajiJO8p
         cxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c99oiFB+0aG9pcFd5KmDCTgPzdI/PgGeBz4H+HHEqzs=;
        fh=EtumLw41tnSeSe5FGHuaS8WJhfMa8rhWGsc/QY/mNE0=;
        b=dvyObNW4zZXcrYYlQzSDICEcSbW8mFOJkrurG/CmjQE62AW90Xf9OlK3VM1rWwFUEj
         IVu9wz3knJsJd/zqI4olp6t2R3gWj1lu/53mKhOSMHNqF1M8Szpes3EbiU02xFUMseV7
         zxeM6LkhX3UkT3Bih9ROMgf+FlbhFH9yv8Fqq4uL6rRKBr0uz8mew1CgMljpsQOcx/mg
         u8QbeTEB2mSUG/0DSt8v7M/9PCQvnB1u/9+AqDcoDbh3jocUe+iV8ap8yeVbHQhbJkNH
         TiWCYfpN+eYd9eezr9tJ+09gCyUiwIbmJ8f2ktrF2ClI6eaB5IutQlmtGUuLLl3E2BrQ
         e04Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795126189; x=1795730989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c99oiFB+0aG9pcFd5KmDCTgPzdI/PgGeBz4H+HHEqzs=;
        b=CGYLUo9DZDeYmALCEQayCsscdSVef1/dU4OE/3esvvjflQnrsZ+nYjVaBDY+HqskQd
         e6O6+Iv6Z4e8XchMRpjPV0R2wn+0KtB8dufkDxCUjqlkUJjPeC9xb15+J8oThSv/YU3q
         Kt1YUdqMSJ5H3Tx3nXanufMTGbrBTZ4Ycz2iDBZwz1JH3QfIZe+1Nz7RNdiGTbsxkBon
         HNT+g+EPV5XSj/6XmkgEP3ANumYipMGdvp3Q6+0NVZMV9ef/9Jbe5VhacAuScDm9Dkii
         o1vDi09m5dHXSUSZjXMSKBhmljuKoOaF/EjCvAy8KcfPTNcGhxM4wN4ZlxSUn5wfWQPo
         lKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126189; x=1795730989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c99oiFB+0aG9pcFd5KmDCTgPzdI/PgGeBz4H+HHEqzs=;
        b=cWTQ3h0SSWsluTb0waIEn1ZZ7uMiLADVWtNdmb3GD4Fwq6UrYCj6PUuKbNknwZp8I4
         GDeb6RamFyEnglF+MscmoRRAjyuPGTlt6g2WGD4o4JEHfgEWFTORL54abjSqSyUWWB9C
         942Q1bxwk/OtBFGS6ttK9vps0qp5om7vCt/EaEFokHHcImMInjNQZQ3uK8SNMY+PGYcH
         qYJNTP16RmYslk+Z43/JLT2sDGaWH+DM03ihehgTtTk9MvwlC+0bLeQM6gvJWt+0vw16
         RKRC8gcWs4EhOK9P8W+zt3O66HLVeZXdfArTelnP9clsTVeti452B5MaRTSFaJBm1CIA
         pBCQ==
X-Forwarded-Encrypted: i=1; AL+hErHntKMFbz/GiONzAzdJJGov6YLVYVVb8zZgdY5Zp91KE6Ue5NNeamBm9jaQyy9N1ZKJWLE3lvuIeGaKWHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X8y+flibBDVasQ7/BJ/3yvwaPBqsjQU45l3UueZ9Jql8LvNfP
	UjvPLQMGlJ5QIgCS4emQIHzTZ5ALsfNli3cz8v43clZXaWnua9Qi/Y+v7i7qPgjkBaNDLCKprt5
	kR4zeu0FX2it0h2WLf6vd1eigRzdRsfCvm/lCZi61
X-Gm-Gg: AYBFou0hQAuAQUl4rUYsyYy/ghz5wAMvDTX1qbTHlYguoQ4W4S8ElbFKIJJR7otg5wP
	EdIKOigXAvoHmGv7BxXlG4rYyIepclBswRUQl2QUk2oIB2qPb50ke2tUovMfyW48yvhXh8EGrmL
	zkuSMGqMBJWxTYk/GkRcMRPF23r94SMsNMOo12GBpAnrvHF56tzOGN34bQMvEcYIBDzqG7f3FIT
	7v5m55b3YiPIUvJgRB7qbS0KUcv+SGoLRVAF3Znv+Lue5qcpx6avza5oVa5Oo0YAfFHo6BPzX8L
	NTZagt7v5rc77PEpNJzig/lNm0Ym9Jn3wAVkOOSu80FIzV3MlCbuM4r4oLu+xtduudgKfTOlse5
	dqbp31+yWrJdG21/qA2+YF2JwQsrcRA/IyFrXAexn5F/plUxe06ZPMGzcD8jupXtH
X-Received: by 2002:a17:906:a158:b0:c3e:d0ca:d30a with SMTP id
 a640c23a62f3a-c513a5e6b79mr95025566b.4.1795126188297; Thu, 19 Nov 2026
 14:09:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117103352.1244657-1-david.laight.linux@gmail.com> <20261117103352.1244657-9-david.laight.linux@gmail.com>
In-Reply-To: <20261117103352.1244657-9-david.laight.linux@gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 19 Nov 2026 14:09:35 -0800
X-Gm-Features: AclHuK8wRtC3LEXmfZuaR0HmHzvlHy6ntbJo_CfyWnZuJZ2YExQQDAKded9hxs4
Message-ID: <CAG2Kctqr-tu21s-9p5NFT=gbk0wg9P-BqjC5U-khTGBEmytVTQ@mail.gmail.com>
Subject: Re: [PATCH v4 next 08/13] kallsyms: Optimise symbol name search
To: David Laight <david.laight.linux@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
	Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 2:34=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> Change the alphabetically ordered lookup table (kallsyms_seqs_of_names)
> to one that indexes the table of compressed names rather than the
> array of symbol values.
> This removes all the linear scans during the binary search for the symbol
> name.
> Once the name has been found a second binary search of the 'markers' arra=
y
> followed by a linear scan for the symbols address gives the symbol value.
>
> This linear scan is done once for each address returned, whereas the old
> code did the scan for each of the ~17 comparisons in the binary search
> (and the binary search was done twice for a symbol that appears once).
>
> For normal kernels the index table stays at 24 bits per symbol (now host
> ordered), but a 32 bit table is used if necessary (probably only for
> allyesconfig builds - which needs 26 bits on x86-64).
>
> Use the low bit of the index table value to indicate that the symbol has
> the same name as the previous one.
> Use this to avoid the second lookup to find if the name is unique, speed
> up the search for the first symbol with a given name, and simplify
> kallsyms_on_each_match_symbol().
>
> Speeds up lookup by name by a factor of about 12, and makes a massive
> difference to the time taken to lookup symbols that occur 100s or
> 1000s (or maybe 10000s) of times.
>
> The slowest 'lookup by name' changes being a symbol that is duplicated a =
lot
> to one that is very long.
>
> Build for BE kernels correctly flips the byte order in the index table.
>
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>
> v3:
> - Use a discrimant union for the name table instead of weak symbols.
>   Undefined weak symbols can't be guaranteed to be zero and a build
>   mismatch left both undefined.
> - Patch the kallsyms_off_size_24 static key from an initcall,
>   the first name lookup might not be allowed to sleep.
>   Leave a conditional in the 32bit offset case, it is unlikely
>   to be needed for a real kernel.
> - Merge in the following patch that optimised the scan for duplicates.
>
> v4:
> - Fix build for BE kernels on BE hosts.
> - Use helpers sym_entry_type() and sym_entry_name().
>
>  kernel/kallsyms.c          | 162 ++++++++++++++++++++++++-------------
>  kernel/kallsyms_internal.h |   7 +-
>  scripts/kallsyms.c         |  49 +++++++----
>  3 files changed, 148 insertions(+), 70 deletions(-)
>
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index d18d78e626db..fd42a1a8ed3e 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -177,6 +177,36 @@ static unsigned int get_symbol_offset(unsigned long =
pos)
>         return name - kallsyms_names;
>  }
>
> +/*
> + * Find the value of a symbol given the offset in the compressed stream.
> + */
> +static unsigned long get_name_address(unsigned int name_offset)
> +{
> +       unsigned int low, pos, high;
> +
> +       low =3D 0;
> +       high =3D ((kallsyms_num_syms - 1) >> 8) + 1;
> +
> +       while (high - low > 1) {
> +               pos =3D low + (high - low) / 2;
> +               if (name_offset >=3D kallsyms_markers[pos])
> +                       low =3D pos;
> +               else
> +                       high =3D pos;
> +       }
> +
> +       pos =3D kallsyms_markers[low];
> +       for (low <<=3D 8; pos < name_offset; low++) {
> +               unsigned int len =3D kallsyms_names[pos];
> +               if (len & 0x80)
> +                       len +=3D (kallsyms_names[pos + 1] << 7) - 0x7f;
> +               pos +=3D 1 + len;
> +       }
> +
> +       return kallsyms_sym_address(low);
> +}
> +
> +
>  unsigned long kallsyms_sym_address(int idx)
>  {
>         /* non-relocatable 32-bit kernels just embed the value directly *=
/
> @@ -185,66 +215,87 @@ unsigned long kallsyms_sym_address(int idx)
>         return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
>  }
>
> -static unsigned int get_symbol_seq(int index)
> -{
> -       unsigned int i, seq =3D 0;
> +static DEFINE_STATIC_KEY_FALSE(kallsyms_off_size_24);
>
> -       for (i =3D 0; i < 3; i++)
> -               seq =3D (seq << 8) | kallsyms_seqs_of_names[3 * index + i=
];
> +/*
> + * Get the offset into the compressed list of names for the n'th
> + * symbol in the 'sorted by name' list.
> + * Returns 'offset << 1 | is_duplicate_name'.
> + * To save memory (the array can have 200k+ entries) the values are usua=
lly
> + * 24 bit (host ordered) but will be 32 bit if necessary.
> + */
> +static inline unsigned int get_symbol_name_offset(unsigned long index)
> +{
> +       if (static_branch_likely(&kallsyms_off_size_24) ||
> +           unlikely(kallsyms_offs_of_names.size =3D=3D 24)) {
> +               u8 *off =3D kallsyms_offs_of_names.offs + index * 3;
> +#if !defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
> +               return ((struct {unsigned int v:24 __packed; } __packed *=
)off)->v;
> +#else
> +#if defined(__BIG_ENDIAN)
> +               return (*(u32 *)(off - 1)) & 0xffffff;
> +#else
> +               return (*(u32 *)(off - 1)) >> 8;
> +#endif
> +#endif
> +       }
>
> -       return seq;
> +       return ((u32 *)&kallsyms_offs_of_names.offs)[index];
>  }
>
> -static int kallsyms_lookup_names(const char *name,
> -                                unsigned int *start,
> -                                unsigned int *end)
> +static int kallsyms_set_kallsyms_off_size(void)
>  {
> +       if (kallsyms_offs_of_names.size =3D=3D 24)
> +               static_branch_enable(&kallsyms_off_size_24);
> +
> +       return 0;
> +}
> +early_initcall(kallsyms_set_kallsyms_off_size);
> +
> +static int kallsyms_lookup_names(const char *name, unsigned int *start)
> +{
> +       unsigned int mid, off;
> +       int low, high;
>         int ret;
> -       int low, mid, high;
> -       unsigned int seq, off;
>
>         low =3D 0;
>         high =3D kallsyms_num_syms - 1;
>
> -       while (low <=3D high) {
> +       for (;;) {
> +               if (low > high)
> +                       return -1;
>                 mid =3D low + (high - low) / 2;
> -               seq =3D get_symbol_seq(mid);
> -               off =3D get_symbol_offset(seq);
> -               ret =3D kallsyms_strcmp_symbol(off, name);
> -               if (ret > 0)
> +               off =3D get_symbol_name_offset(mid);
> +               ret =3D kallsyms_strcmp_symbol(off >> 1, name);
> +               if (ret > 0) {
>                         low =3D mid + 1;
> -               else if (ret < 0)
> -                       high =3D mid - 1;
> -               else
> -                       break;
> -       }
> -
> -       if (low > high)
> -               return -ESRCH;
> -
> -       low =3D mid;
> -       while (low) {
> -               seq =3D get_symbol_seq(low - 1);
> -               off =3D get_symbol_offset(seq);
> -               if (kallsyms_strcmp_symbol(off, name) !=3D 0)
> -                       break;
> -               low--;
> -       }
> -       *start =3D low;
> -
> -       if (end) {
> -               high =3D mid;
> -               while (high < kallsyms_num_syms - 1) {
> -                       seq =3D get_symbol_seq(high + 1);
> -                       off =3D get_symbol_offset(seq);
> -                       if (kallsyms_strcmp_symbol(off, name) !=3D 0)
> +                       continue;
> +               }
> +               if (!ret) {
> +                       /*
> +                        * Found a match, but need the first one.
> +                        * Most symbols (and all exported/global ones) on=
ly occur
> +                        * once, most of the others only occur a small nu=
mber of
> +                        * times so it is worth doing a linear scan that =
avoids the
> +                        * kallsyms_strcmp_symbol() call.
> +                        * However some symbols occur a large number of t=
imes
> +                        * (_sub_D_65535_0 is repeated 24610 times in an =
x86-64
> +                        * allyesconfig, __func__.0 442 in a more normal =
kernel).
> +                        * Avoid a long linear scan by returning to the b=
inary
> +                        * search if a short linear search is fruitless.
> +                        */
> +                       unsigned int scan =3D 16;
> +                       while ((off & 1) && scan--)
> +                               off =3D get_symbol_name_offset(--mid);
> +                       if (!(off & 1))
>                                 break;
> -                       high++;
>                 }
> -               *end =3D high;
> +               high =3D mid - 1;
>         }
>
> -       return 0;
> +       *start =3D mid;
> +
> +       return off;
>  }
>
>  /* Lookup the address for this symbol. Returns 0 if not found. */
> @@ -257,9 +308,9 @@ unsigned long kallsyms_lookup_name(const char *name)
>         if (!*name)
>                 return 0;
>
> -       ret =3D kallsyms_lookup_names(name, &i, NULL);
> -       if (!ret)
> -               return kallsyms_sym_address(get_symbol_seq(i));
> +       ret =3D kallsyms_lookup_names(name, &i);
> +       if (ret >=3D 0)
> +               return get_name_address(ret >> 1);
>
>         return module_kallsyms_lookup_name(name);
>  }
> @@ -289,17 +340,20 @@ int kallsyms_on_each_symbol(int (*fn)(void *, const=
 char *, unsigned long),
>  int kallsyms_on_each_match_symbol(int (*fn)(void *, unsigned long),
>                                   const char *name, void *data)
>  {
> -       int ret;
> -       unsigned int i, start, end;
> +       int name_offset, ret;
> +       unsigned int sym_number;
>
> -       ret =3D kallsyms_lookup_names(name, &start, &end);
> -       if (ret)
> +       name_offset =3D kallsyms_lookup_names(name, &sym_number);
> +       if (name_offset < 0)
>                 return 0;
>
> -       for (i =3D start; !ret && i <=3D end; i++) {
> -               ret =3D fn(data, kallsyms_sym_address(get_symbol_seq(i)))=
;
> +       do {
> +               ret =3D fn(data, get_name_address(name_offset >> 1));
> +               if (ret)
> +                       break;
>                 cond_resched();
> -       }
> +               name_offset =3D get_symbol_name_offset(++sym_number);
> +       } while (name_offset & 1);
>
>         return ret;
>  }
> diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
> index 81a867dbe57d..11fb0de92ede 100644
> --- a/kernel/kallsyms_internal.h
> +++ b/kernel/kallsyms_internal.h
> @@ -13,6 +13,11 @@ extern const char kallsyms_token_table[];
>  extern const u16 kallsyms_token_index[];
>
>  extern const unsigned int kallsyms_markers[];
> -extern const u8 kallsyms_seqs_of_names[];
> +
> +/* Although constant, size is volatile for better code generation. */
> +extern struct {
> +       volatile unsigned int size;     /* 24 or 32 */
> +       unsigned char offs[];           /* int:24[] or int:32[] */
> +} kallsyms_offs_of_names;
>
>  #endif // LINUX_KALLSYMS_INTERNAL_H_
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 77a4c964f1b8..39426f736cb7 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -408,7 +408,7 @@ static void sort_symbols_by_name(void)
>
>  static void write_src(void)
>  {
> -       unsigned int i, k, len, off, seq;
> +       unsigned int i, k, len, off, off_size, table_size;
>         unsigned int best_idx[256];
>         unsigned int *markers, markers_cnt;
>         unsigned long bin_offset =3D 0;
> @@ -458,7 +458,7 @@ static void write_src(void)
>                 unsigned char len[2];
>
>                 se =3D table[i];
> -               se->seq =3D i;
> +               se->seq =3D off;
>
>                 /* The length must be less than that of the original symb=
ol. */
>                 if (!se->len || se->len > KSYM_NAME_LEN)
> @@ -490,7 +490,7 @@ static void write_src(void)
>                         if ((i & 0xFF) =3D=3D 0)
>                                 markers[i >> 8] =3D off;
>
> -                       printf("\t.byte\t%u", len[0]);
> +                       printf("\t/* n:%u */\t.byte\t%u", off, len[0]);
>                         if (len_len =3D=3D 2)
>                                 printf(",%u", len[1]);
>
> @@ -505,6 +505,7 @@ static void write_src(void)
>                 memcpy(se->sym, buf, se_len + 1);
>         }
>         write_incbin(&bin_offset, off);
> +       table_size =3D off;
>         printf(".size kallsyms_names, . - kallsyms_names\n");
>         printf("\n");
>
> @@ -563,7 +564,7 @@ static void write_src(void)
>                                out_bin_file ? '\n' : '\t');
>                 }
>                 if (!out_bin_file)
> -                       printf("/* %c %s */\n",
> +                       printf("/* n:%u %c %s */\n", table[i]->seq,
>                                sym_entry_type(table[i]), sym_entry_name(t=
able[i]));
>         }
>         printf(".size kallsyms_offsets, . - kallsyms_offsets\n");
> @@ -574,23 +575,41 @@ static void write_src(void)
>         sort_symbols_by_name();
>         stamp("sort by name");
>
> -       output_label("kallsyms_seqs_of_names");
> -       write_incbin_header("seq_of_names", &bin_offset);
> +       off_size =3D table_size < (1u << 23) ? 24 : 32;
> +       output_label("kallsyms_offs_of_names");
> +       printf("\t.long\t%u\n", off_size);
> +       write_incbin_header("offs_of_names", &bin_offset);
>         for (i =3D 0; i < table_cnt; i++) {
>                 se =3D table[i];
> -               seq =3D se->seq;
> +               off =3D se->seq << 1;
> +               if (i && se->len =3D=3D table[i - 1]->len &&
> +                   !memcmp(sym_entry_name(se), sym_entry_name(table[i - =
1]), se->len - 1))
> +                       /* Mark that this is a duplicate of the previous =
symbol */
> +                       off |=3D 1;
>                 if (out_bin_file) {
> -                       unsigned int seq_be =3D htobe32(seq);
> -                       fwrite((char *)&seq_be + 1, 1, 3, out_bin_file);
> +                       unsigned int off_te =3D big_endian ? htobe32(off =
<< (32 - off_size)): htole32(off);
> +                       fwrite(&off_te, 1, off_size / 8 , out_bin_file);
>                 } else {
> -                       /* The three spaces before the tab line up the co=
mments */
> -                       printf("\t.byte\t%u,%u,%u   \t/* %8d %c %s */\n",
> -                               seq >> 16, (seq >> 8) & 0xff, seq & 0xff,
> -                               seq, sym_entry_type(se), sym_entry_name(s=
e));
> +                       if (off_size =3D=3D 32) {
> +                               printf("\t.long\t%#4x", off);
> +                       } else {
> +                               if (big_endian)
> +                                       off =3D __builtin_bswap32(off) >>=
 8;
> +                               /* The trailing three spaces line up the =
comments */
> +                               printf("\t.byte\t%u,%u,%u   ",
> +                                       off & 0xff, (off >> 8) & 0xff, of=
f >> 16);
> +                       }
> +                       printf("\t/* n:%-8d %c %s */\n",
> +                               se->seq, sym_entry_type(se), sym_entry_na=
me(se));
>                 }
>         }
> -       write_incbin(&bin_offset, table_cnt * 3);
> -       printf(".size kallsyms_seqs_of_names, . - kallsyms_seqs_of_names\=
n");
> +       write_incbin(&bin_offset, table_cnt * (off_size / 8));
> +       /* Add a terminator without the 'duplicate' flag. */
> +       if (off_size =3D=3D 24)
> +               printf("\t.byte\t0,0,0\n");
> +       else
> +               printf("\t.long\t0\n");
> +       printf(".size kallsyms_offs_of_names, . - kallsyms_offs_of_names\=
n");
>
>         stamp("write name index");
>
> --
> 2.39.5
>

Reviewed-by: Samuel Wu <wusamuel@google.com>
