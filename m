Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795560797;
	b=IkLmMoARC0hHds44QzKi5K++Yl9FdyU7jtW83U6NWefExxcIbhiG44sUDzc9fA25ifef
	 s57ZtoGDnf6MIaZuGYBu/8pah85jFFdMuI72lpMEMcz4nhalaK2tBnHajpWjAKCjWFcxk
	 QSbu0s4LL9ydsK9VNTWaZkTXoKd0KhCV4TUoT8Vj09DotGICyyv8AZIyba0PbWMsCRb/E
	 vTrXD4gbItmCjP4rgv8y6K2LmdXtr+50A+FvyMEglG6/k3otwLGfcRIxdcAJhY7ZeI6X3
	 FWzchoweOGyLEEPR5pe1ZumF4c3RZJkAvT4axLOd3oY8OOAzcaF+lqaELDYLHAg8j5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=62HWMZceS0oj2mWZkMmwxpsPh7opOIuDf/S593U+xIc=;
	b=lMK5WDWgFzO07CkxtZVeU0/vcxgdRJnYbKXUmRONDdJ92suFVjYf+wj217B+zaBVnzOR
	 3GkGtCInQZW84F5reNhyIIDwa32+jN9FOVeoo2DHU/g/64/0skcdm+jR4Up0B86c4Qp87
	 287FPT7w+zhsMx336YxfYnMZFP1FB6ftwwamo4bvJf4p6uQebMzti/sSY+BxtG6yhcEjx
	 +6900T+1m5ZnAgoyeRFiUYMh6ehQGAC3yEPT1sV9/4N1nW6p9q2aByyFcSz7akP3LHjE4
	 KbXoLbfXe6mrNdnJsNNCPUtegy7D87/kp/d3Y1CeUT1usvuVbfKEIlVpC5XDhvxFF/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eg/IgmbO";
	arc=fail smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329CA606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eg/IgmbO
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2351576f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:53:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795560795; cv=none;
        d=google.com; s=arc-20260327;
        b=VRsupP38dkbd46GAv5v9qiNHs5VDVCeQJ3csUuZFjRA1lBP/IvfYl6T/rfxmwgZc7y
         RHx25eGgNcjgnHYLyB7iNiQyDxsxGWSq29ZYf3ey4UHmmbwGy1hiX0AQBo4sDVPmYqag
         uqyxpD04vVs/P7g5ache1gINvoOQNIEJn5VO3c7B898aQmC8Ciw8TLHJLhEOBOhDz0E1
         7jYLuHV2MKXQHYGhfvKbF6kzdwoyzITYSnf5IWGvQMURMMEds57Gi6xZKsORSExN/pO3
         42kxWjiGYBTAZ6zeustVyAqa0eA/Ma11LCLSilcrjnqnfsAkyT/X2yl3EKmv0lY6MHTB
         Cz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=62HWMZceS0oj2mWZkMmwxpsPh7opOIuDf/S593U+xIc=;
        fh=EwobYKfU/eMV/OAEvjWSXmqb+omcgZaTOeFW2N2n/g0=;
        b=K+oPY8m4fvJvMfdx7ZKYXBL96384gUw/kbyh1xf8n9rC87bofMrfZaK2rrJnEbOGXC
         qD540QI7FOgWq7Q8iSCFoS3LwFWL9syjKDXCRmqvFJreqcwXXXFOwlYZebmcD9wxOv8o
         AjdBz1e3qOwfjR3Bg+ByHIuu5HT0kxC1WxsPiaBY/a8RdLfN3Hp9dsvPzCmzUTLJ9BX2
         Hy/bl/x4GBA4bhTWYuGGDkZJQVe371IrgY9bJRhGMdJF0jPt2x7xb+GTTfAXLaGMan6v
         dFW02zJDCifsnzqXJRWPTVvSJpg+SWR5ItyyUd7lo4aDDViyvH/Ab8RRO4ZTJ4S6q83C
         5RZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560795; x=1796165595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62HWMZceS0oj2mWZkMmwxpsPh7opOIuDf/S593U+xIc=;
        b=eg/IgmbOUIL5XFulzKaucwNquvnAFFcfhp7IZRMcZKafqJp/N4iOqBDcNsT9awfSh5
         zq8qtXnDuUxTduI+jySzh7O5jdYNXeZIBVqkwsjm2fWuzsVX9vobAUtyGJ+w4b5USJkt
         TAqoppZAsgGdRbwnk+jNh0S0tBCySM55U6uU7FCDXTW3xw9pM1x+/7VaohrXX8sAYOm7
         dRIz7XmWM5I+V0rYPZdpGKZlajpimaX9sOZKOQ2xf7bxnIf5/EhOYN/gCg2lOVswLfQM
         seA6eES0PUy5Jpp72JEsY/2PrmRLI2up+fDvfGqpmsp7rhOxLqOXIdhHm42Vo74TAqgj
         2jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560795; x=1796165595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62HWMZceS0oj2mWZkMmwxpsPh7opOIuDf/S593U+xIc=;
        b=ncT7RYLF2gPoSmtzNKaZMFl3PSAn2h4y8CGP3y1Icu58hqKlbNKFjRp14aSYjoFG72
         /v+JiFFg6NDbPy3HewHkdmysOfcV8FNLHnXGd6GSu/xStgK33FCKJUTUEz20QH4zoh9P
         8+9rcZABBDJwrT2/ZJLQmBLqMh/uCzemHx0Dh5iANa/3Utn12+khSqCmNwIpw+ZD4aJl
         RRKS2M++60n2pkFwCgJRdluhlFxBI7niqjuvwSNvO9TJUg/SvikSov/LUIYXPOSnmvBs
         eKlYgu5gYUBhLch/b58/4/k9e8Qr/j1etcvV3oP1usRme+SjcaI+FNfM3OesYXsV/fmV
         gVbw==
X-Forwarded-Encrypted: i=1; AL+hErHzPvobcv6a2rAj367zWc8oYjt4bC4N4RFBdpd+ywpfBBjZQ6JM3snmn3LsDMTYV2qaAPeCNolz5O5nHIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tfw646bS5OfJu+12MHjWUSDFiI2cLTip9GmPm73xHkvfSW4GR
	CopCmDmCvlLiogfBRbjn9oPz6QGOmubKFPOiJPhJQ0O8Q22Ngeraf1FlIbUAUvggcXte/xvWYqG
	natkjX1z58JmjIJ4Q64wLS/wdTDor7fs=
X-Gm-Gg: AZFdTZc63/NEi5HiLhXEX5Y3U5PMUl7EjpyEmksFPlex+tenPiEY/1JO4O3dkOI0UT+
	fA5P+1JOQPnE6a9YFHmF+7gWY4L7+0++tqnYICI48VaC398saO0r3XjdvKQpVTnE8Tqt1GU9HzC
	6RyX/wNNCdDvtiYjdTok5RnFqz3buHned6vN5pWnZw9CAhzRPVquFosges0Zvxd7mdzfl0FbtSK
	I7+wPIpGxZTUGcsaoTTcZnvw9Q2Gu5dyQmXx01WbeUDvPyzs+j4qFtUUUR3nS8wPfNGbTH/8GL6
	MSboW3xUFuljxtJ9Kh9aupdIwQLVYfxeDun3iJGo2Qllvg9HohKDbVUSx4aUAiW6zlZiEqZ9HeE
	aFii7r3UtDQn2g9dwr7trIYl+4DvoWV9UNMWkhaqRiGyZjVIXKGItyAlmGaYGfpxRnNbOqOo+Uk
	RK/wiojSyboPdk488Xz3HGaA3nAjAyZfaCbSodzkg=
X-Received: by 2002:a05:6000:491b:b0:490:9fe2:6a2d with SMTP id
 ffacd0b85a97d-4abb0a710c2mr29944554f8f.26.1795560795520; Tue, 24 Nov 2026
 14:53:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124224811.16134-1-ihor.solodrai@linux.dev>
 <20261124224811.16134-2-ihor.solodrai@linux.dev> <10ad779b-708b-4b0b-b6af-54f3d7414f82@linux.dev>
In-Reply-To: <10ad779b-708b-4b0b-b6af-54f3d7414f82@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 24 Nov 2026 14:53:03 -0800
X-Gm-Features: Aa3M54rYfCcMSZKLBapkSyA5aPNL8Tahfm5y46F16UVYrsj2TNZk7O-pDyWMN8o
Message-ID: <CAEf4Bzbn5Wk6q3MWpryLSZtFaPq3tGh+kfuWQGTSv8joE996vQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/6] libbpf: Separate interfaces shared with
 in-tree tools
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Song Liu <song@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:50=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 2026-11-24 3:48 p.m., Ihor Solodrai wrote:
> > resolve_btfids and bpftool link libbpf statically and use some of its
> > internal helpers from libbpf_internal.h. That header also defines
> > logging macros and poisons kernel integer typedefs, so resolve_btfids
> > wraps the SHA-256 helper in a separate source file.
> >
> > Move the declarations these tools use to libbpf_tools.h and include it
> > instead of libbpf_internal.h. The header is for in-tree tools and stays
> > uninstalled. No shared-library symbols change.
> >
> > No functional change.
>
> I posted v3 with the refactoring as described in my comment [1].
>
> However now I'm thinking it might be an overkill. With the re-design
> vs v1, resolve_btfids now only needs btf_kfunc_proto_match(), if it
> includes relo_core.h, so the new libbpf_tools.h is not as appealing.
>
> Speaking of "API levels", libbpf_internal.h has already been
> functioning as the "in-tree users only", and there is another special
> user among those: the selftests (see paste below). So if v3 is landed
> as posted, we now have two "levels" of in-tree users.
>
> It's... fine, but not exciting. Adding libbpf_tools.h doesn't help
> that much, and dropping it doesn't hurt. It's all bikeshedding, not
> directly relevant to the series, ultimately caused by name collisions
> between resolve_btfids and libbpf (u32 poisoning and pr_* macros).
>
> Quentin, Andrii, Eduard, please let me know if anyone has a strong
> preference here, I'm happy to respin. Thanks!
>

heh, we raced to the minute. I don't like libbpf_tools.h approach, if
GCC poison is a problem I'd rather guard that.

don't respin just yet, let Eduard do a pass at least


> [1]
> https://lore.kernel.org/bpf/faecfef3-ac9f-41be-8bc3-83a66572066a@linux.de=
v/
>
> $ grep -rl --include=3D"*.[ch]" 'include.*libbpf_internal.h'
> tools/testing/selftests/bpf
> tools/testing/selftests/bpf/prog_tests/bpf_obj_pinning.c
> tools/testing/selftests/bpf/prog_tests/btf_field_iter.c
> tools/testing/selftests/bpf/prog_tests/btf_sanitize.c
> tools/testing/selftests/bpf/prog_tests/core_reloc_raw.c
> tools/testing/selftests/bpf/prog_tests/cpu_mask.c
> tools/testing/selftests/bpf/prog_tests/fill_link_info.c
> tools/testing/selftests/bpf/prog_tests/get_smp_processor_id.c
> tools/testing/selftests/bpf/prog_tests/global_data_init.c
> tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
> tools/testing/selftests/bpf/prog_tests/kprobe_multi_testmod_test.c
> tools/testing/selftests/bpf/prog_tests/module_fentry_shadow.c
> tools/testing/selftests/bpf/prog_tests/perf_branches.c
> tools/testing/selftests/bpf/prog_tests/perf_buffer.c
> tools/testing/selftests/bpf/prog_tests/raw_tp_test_run.c
> tools/testing/selftests/bpf/prog_tests/recursive_attach.c
> tools/testing/selftests/bpf/prog_tests/sha256.c
> tools/testing/selftests/bpf/prog_tests/test_global_funcs.c
> tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c
> tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> tools/testing/selftests/bpf/prog_tests/signed_loader.c
> tools/testing/selftests/bpf/prog_tests/tracing_multi.c
> tools/testing/selftests/bpf/urandom_read.c
> tools/testing/selftests/bpf/urandom_read_lib1.c
> tools/testing/selftests/bpf/trace_helpers.c
>
>
> >
> > Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> > ---
> >   tools/bpf/bpftool/Makefile            |   6 +-
> >   tools/bpf/bpftool/common.c            |   2 +-
> >   tools/bpf/bpftool/gen.c               |   3 +-
> >   tools/bpf/bpftool/prog.c              |   2 +-
> >   tools/bpf/bpftool/xlated_dumper.c     |   2 +-
> >   tools/bpf/resolve_btfids/btf_colors.c |  15 +--
> >   tools/bpf/resolve_btfids/btf_colors.h |   4 -
> >   tools/bpf/resolve_btfids/main.c       |   5 +-
> >   tools/lib/bpf/libbpf_internal.h       | 162 +----------------------
> >   tools/lib/bpf/libbpf_tools.h          | 184 +++++++++++++++++++++++++=
+
> >   10 files changed, 199 insertions(+), 186 deletions(-)
> >   create mode 100644 tools/lib/bpf/libbpf_tools.h
> >
> > [...]
