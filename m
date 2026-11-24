Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555783;
	b=A6on7+PKLoL4SUsAFcephPPYDQskrcQnzD2zLnHFjcSMAyHbrVbW7dMSOSuX3ibnPPs1
	 P+HvL1NSYBboz1LzCwyqWp5XMrCVro3vucJ1h8q6XYSg7nffoDQBA3DaLxp5Uw1YLUFjR
	 zf8IOeAZGra4xOgTOCjQhK4wfpRC5A6eYPvbGZGU3H0y0O9d58ZX+BmdMghvtTfUkV27i
	 Wr7q9dV0J6Gq3gilXlf0ECqvkJFAs8xHYYQtvNeZYECvn/wbLn7d1e9a4/Ai7ZtNzH+7r
	 eooC8jI0eArElqMMJAuZAAr3sk8IhvQrwQzn+G4W3eC/yreyDTUA/wxBwylcowq/5qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sLqKQwqU70K4uqrptByEo8Nwpl734HDILHTVZM1D/eA=;
	b=tkDjWENxC9x9n+xL4j3zgJfedrBXeN4kudH+UaUhfG9rMZZu3swz4rfSxg/NQnnFAl+M
	 fZbtb1jujCRReCFi25S+aZOlpQtbhQknDmcAX25AdJSocZ2GH3p8p4tN/+Zzq9ZS2fWtm
	 03NdiSpFQNt960s7XtagH4KDWEng3HMxhxLYpMIh1DECuA70q5QSV8qxS2Tgql0sdeQY6
	 jfGd4vkWw2Ti4384jzwVqultHNvkTA1+NDaxJ5ZOurFI5p6wK/Zah3pEzcccX6UHyrJNh
	 6U8lVSm+WSyeji/OyDSjssHWY46glRId15qYvq+yBqpOysQiIID5AKQtDf0w/ZAs2sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=csdtwl6y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F70606A69B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21F70606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=csdtwl6y
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55be673e029so957661cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:29:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555773; cv=none;
        d=google.com; s=arc-20260327;
        b=H/3bqZ6MjvR12B3aaDds7bY+gL6XuQGKxpUQn+r6mBWhGvB0m35/QKxCw8D7IUDS15
         q1bpH1i0lLYZRSeaU0hzwicNDIaZBvXVUsZtxF+7+NbAmXglZrdZ3yaRsBQoeMQBCobg
         EazjKCjuDzGpn1c19puzj0mkjses827wDZf1NpdkUjD1mqj24AScVyKNB3UIIB5r52/T
         8hmB0gQfxAEFjDbchagx2Ezj1yIRGWFcUvAXeDEaRQrwgqLCUc9lTHnmYUJoc084R4Cf
         F9wt5nYWGLCHOwAWqU8Kb+OOwruu7tZ+9njjbG+1mPdJTcwuoB8Z3tjQM5cSrGwgNVXt
         ezYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sLqKQwqU70K4uqrptByEo8Nwpl734HDILHTVZM1D/eA=;
        fh=xjVeq9G5IQTeA0ojX4Ywcg084aErI2ObLRJYd2LH3CU=;
        b=XPy/dqtbrDiqZYGf+iGD1dPlJXjR/KoEPvxnLdBp2W0iFMJmNM2BcEVlG0DaqL6EGv
         FjHYZ9PM+v8RsovzEztTR95bcDPt5Dg+D3B80tgKgDgDmeZOLTKXPNXhfyXS7b9ZzDCt
         XYLNoDM61lVmFMXWFaswUQf21F6BMxnjYNDBUaOalvqshfYG5T1pl2v4vPGq3qbJazqc
         0G59WGutED44aS+cr3uMLfh2you2LNGasdRwof8F6Wmoz0ghkT2pEh3QZlGjyKXp7W5n
         pMWIfuqVKujgNF4alA61sJHTrGeCQgFejnHWgzHhVRPvQtpqqccqgSVz7zHLDlbUSzgR
         muxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795555773; x=1796160573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sLqKQwqU70K4uqrptByEo8Nwpl734HDILHTVZM1D/eA=;
        b=csdtwl6yY64Qr+3oucDcj9vHi29lgcd45PzMVLlTsIe1bTNkJs6RBjn1S1Dw58QdT7
         PxGvUgeQSKuIFXQ+rVuekPcX0QHY0paBk9jI11O6eTthHDrZmC7e+QiRN+QZxMUWk0CH
         roA/FP+cLwqq06QZXRxFvz1ej0HIPGngxNedAOWxkbXUJNGWHewuP4GMeu+DAEUBRpMj
         TFImdJtKoFhe0DQ1YcJrClDMzp5daghUIiJV+QUJVx6oJGsuR15xf6mZ4OKX0l7sGd6g
         jpo5o1Jiwfc5pMGCd20U18Fa2/IYla1Kt9AvB6L6l00coRci7K1+PIeCqjmAKN7Q/OyK
         3mUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555773; x=1796160573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLqKQwqU70K4uqrptByEo8Nwpl734HDILHTVZM1D/eA=;
        b=VWDjWg6Zxl2IH88aFLn5CPWp3bN+SG6p4Ad54sDAWV8j8ubk6EyrYj8HRxPTD+x2v6
         zHXThtGfaCw9W7cY03yOrt0zItd38Wvw0xcpknYXmVAmSQIviAKs5BbI/27NKHBcRlhN
         yty2xRrBCV1ofsB0ylzpUX+uHVdYB3W6iAxJeAQX/D5y5BfzrnegVPgvhhdMcmCYXv7l
         Rb8oLv3el1VnI0A6ns7YeVCdfXVxA5SJJ68+3L+BxXGzR4JX4YQBLD2MGKjqxPjWTwK7
         h2A9zG9YyQHW6CsuXYFgz/ownXuQ1kFC7Kg7LU4klt4z2tbewrqVVMs8RA/Nup3Nc4EJ
         JPZQ==
X-Forwarded-Encrypted: i=1; AL+hErGFK9GntNthe6CuUnLWvZCz1pfI2vVua11DJeVhhrBLfmhfr+aGgujetevCJXyV2FBEqDxmgOYw2stKapk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RD1JhitYU06oCkVfpf4zPXLqTJjWzUz/Au+36VqOcm/H/JI49
	S4WkxNYHBa+28Zv4jSOnEle/RR5Sbc48HSPKF2fBAhIzPzd+ksWXBFUEf6X1oxiWRIwSw1O28Xu
	T3K+iFH4c/m5gFFEjNLS5HptkNOVLhZgI/K7UfMxo
X-Gm-Gg: AZFdTZdgpVWq4pkcnEHNXHARaC6YHTEEaTEL4mZsBDobNI0iPyB6c2mqVQAPrAG5eqx
	TCynpVe3EyObPl5STpntcNQkELcuaE69nksH0tdDHdTWjA5UI5y2o1QUWIWKDgbPkiTV6LBP1ys
	dm4ERWYi2Ie6e0enjFG7LKJHGB6ooEIX/mDTqcnWY85wDqopBSEToh4uPri8XBMuu0MDX6Vmr/+
	xhvQ69vkv7kP2S/Gx/Ak2qBGK+KT+iM5cRqHKtsTfyBghMmUgvYVp2gWHAyUsjMq2ZTpLrhjWUp
	+nsHvP+ubMcS/YZGyZecR4cPt9bLgWoj7xZ4gv9v7OhZyVx85agGTkEBYyQmh2hU1hJQQEuf1yP
	F4g357rtH8Xsb5gjIGj+eVhIaOahDEIQkP9PSSSoXJ3bdeesvWoB1zdwRQMypQz7kAIM=
X-Received: by 2002:ac8:6f05:0:b0:55d:74e6:e03 with SMTP id
 d75a77b69052e-55d87eb573emr70805061cf.0.1795555772309; Tue, 24 Nov 2026
 13:29:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116074414.3174737-1-irogers@google.com> <20261116074414.3174737-6-irogers@google.com>
 <27B92301-D708-4527-9988-3B39973558AE@linux.ibm.com>
In-Reply-To: <27B92301-D708-4527-9988-3B39973558AE@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 24 Nov 2026 13:29:19 -0800
X-Gm-Features: Aa3M54qJrZKt8VCbfYDtV2TirrlwmLQqLzTB13cHeJwX60qZQKN5i7hypJN19-0
Message-ID: <CAP-5=fXzbPSJpTnuiBtMbs06-4Yq63f6e2U4G=Pn6Q2WmEGOPw@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] perf/core: Implement BUILD_ID_OFFSET and
 CALLCHAIN_BUILD_ID_OFFSET sample types
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Leo Yan <leo.yan@linux.dev>, Dmitry Vyukov <dvyukov@google.com>, 
	"Steinar H . Gunderson" <sesse@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 9:33=E2=80=AFAM Athira Rajeev <atrajeev@linux.ibm.c=
om> wrote:
>
> > On 16 Nov 2026, at 1:14=E2=80=AFPM, Ian Rogers <irogers@google.com> wro=
te:
> >
> > Implement synchronous PERF_SAMPLE_BUILD_ID_OFFSET and
> > PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET payload writing in the perf event
> > core using stack_map_get_build_id_offset(..., may_fault=3Dfalse).
> >
> > For callchains, extend the per-CPU callchain buffers in
> > kernel/events/callchain.c to provide scratch space to deduplicate build
> > IDs and encode the compressed build ID table and tagged 64-bit offsets
> > (with the top 8 bits storing the 1-based build ID index).
> >
> > Suggested-by: Namhyung Kim <namhyung@kernel.org>
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Hi Ian
>
> I have few queries and adding them below

[snip]

> > diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> > index 9d24b6e0c91f..935b34d2dd33 100644
> > --- a/kernel/events/callchain.c
> > +++ b/kernel/events/callchain.c
> > @@ -9,6 +9,7 @@
> >  */
> >
> > #include <linux/perf_event.h>
> > +#include <linux/bpf.h>
> > #include <linux/slab.h>
> > #include <linux/sched/task_stack.h>
> > #include <linux/uprobes.h>
> > @@ -31,6 +32,26 @@ static inline size_t perf_callchain_entry__sizeof(vo=
id)
> > sysctl_perf_event_max_contexts_per_stack));
> > }
> >
> > +static inline size_t perf_callchain_build_id_entry__sizeof(void)
> > +{
> > + return (sizeof(struct perf_callchain_build_id_entry) +
> > + sizeof(__u64) * (sysctl_perf_event_max_stack +
> > + sysctl_perf_event_max_contexts_per_stack));
> > +}
> > +
> > +static inline size_t perf_callchain_bpf_build_id__sizeof(void)
> > +{
> > + return sizeof(struct bpf_stack_build_id) *
> > +       (sysctl_perf_event_max_stack + 1);
> > +}
> > +
> > +static inline size_t perf_callchain_context__sizeof(void)
> > +{
> > + return perf_callchain_entry__sizeof() +
> > +       perf_callchain_build_id_entry__sizeof() +
> > +       perf_callchain_bpf_build_id__sizeof();
> > +}
> > +
> > static DEFINE_PER_CPU(u8, callchain_recursion[PERF_NR_CONTEXTS]);
> > static atomic_t nr_callchain_events;
> > static DEFINE_MUTEX(callchain_mutex);
> > @@ -86,7 +107,7 @@ static int alloc_callchain_buffers(void)
> > if (!entries)
> > return -ENOMEM;
> >
> > - size =3D perf_callchain_entry__sizeof() * PERF_NR_CONTEXTS;
> > + size =3D perf_callchain_context__sizeof() * PERF_NR_CONTEXTS;
>
>
>  in alloc_callchain_buffers(), we are changing size unconditionally to :
>
> size =3D perf_callchain_context__sizeof() * PERF_NR_CONTEXTS;
>
> Even if PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET is not set,
> still the size grows for every case.
>
> This grows each per-CPU, per-context slot by the build ID table and the
> bpf_stack_build_id scratch area, and it is not conditional on the new
> sample types. get_callchain_buffers() is called for plain
> PERF_SAMPLE_CALLCHAIN too, so as I read it, a plain "perf record -g"
> (or any BPF tool using callchains) would also pay the extra memory on
> every possible CPU, without --buildid-offset.
>
> Is that the intent? If not, could the extra scratch space be allocated
> only when an event with PERF_SAMPLE_BUILD_ID_OFFSET or
> PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET exists? It would also be good to
> state the per-CPU memory cost in the commit message.

Agreed, plain PERF_SAMPLE_CALLCHAIN shouldn't pay that extra per-CPU
memory cost. Note that single-IP PERF_SAMPLE_BUILD_ID_OFFSET resolves
on the stack when not combined with
PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET, so only
PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET needs the per-CPU scratch
buffers.

In v4 I've split the build-ID callchain scratch buffers into a
separate refcounted allocation (get_callchain_build_id_buffers() /
put_callchain_build_id_buffers(), tracked via
PERF_ATTACH_CALLCHAIN_BUILD_ID) that is only allocated while at least
one PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET event is active. Plain
PERF_SAMPLE_CALLCHAIN events now incur zero extra memory overhead.
I've also documented the exact per-CPU memory cost in the commit
message (10,560 bytes per recursion slot, or 42,240 bytes / 41.25 KiB
per possible CPU across PERF_NR_CONTEXTS=3D4 at the default
perf_event_max_stack=3D127).

> >
> > for_each_possible_cpu(cpu) {
> > entries->cpu_entries[cpu] =3D kmalloc_node(size, GFP_KERNEL,
> > @@ -169,7 +190,22 @@ struct perf_callchain_entry *get_callchain_entry(i=
nt *rctx)
> > cpu =3D smp_processor_id();
> >
> > return (((void *)entries->cpu_entries[cpu]) +
> > - (*rctx * perf_callchain_entry__sizeof()));
> > + (*rctx * perf_callchain_context__sizeof()));
> > +}
> > +
> > +struct perf_callchain_build_id_entry *
> > +get_callchain_build_id_entry(int *rctx, struct bpf_stack_build_id **bp=
f_bids)
> > +{
> > + void *base =3D get_callchain_entry(rctx);
> > +
> > + if (!base)
> > + return NULL;
> > +
> > + base +=3D perf_callchain_entry__sizeof();
> > + if (bpf_bids)
> > + *bpf_bids =3D base + perf_callchain_build_id_entry__sizeof();
> > +
> > + return base;
> > }
> >
> > void
> > @@ -178,6 +214,172 @@ put_callchain_entry(int rctx)
> > put_recursion_context(this_cpu_ptr(callchain_recursion), rctx);
> > }
> >
> > +void perf_callchain_encode_build_ids(struct perf_callchain_build_id_en=
try *entry,
> > +     const u64 *ips, u32 nr, u32 user_start,
> > +     const struct bpf_stack_build_id *bpf_bids,
> > +     u32 nr_bpf_bids, u32 max_size)
> > +{
> > + u32 nr_build_ids =3D 0, nr_offsets =3D 0;
> > + u32 raw_bids_len =3D 0, aligned_bids_len =3D 0;
> > +
> > + static_assert(BUILD_ID_SIZE_MAX =3D=3D PERF_CALLCHAIN_BUILD_ID_MAX_SI=
ZE);
> > +
> > + for (u32 i =3D 0; i < nr; i++) {
> > + u64 ip =3D ips[i];
> > + u64 encoded_offset;
> > + const struct bpf_stack_build_id *bpf_bid =3D NULL;
> > +
> > + if (i >=3D user_start && i - user_start < nr_bpf_bids)
> > + bpf_bid =3D &bpf_bids[i - user_start];
> > +
> > + if (bpf_bid && bpf_bid->status =3D=3D BPF_STACK_BUILD_ID_VALID) {
> > + u32 pos =3D 0, found_idx =3D 0;
> > +
> > + for (u32 b =3D 0; b < nr_build_ids; b++) {
> > + u8 sz =3D entry->build_ids[pos];
> > +
> > + if (sz =3D=3D BUILD_ID_SIZE_MAX &&
> > +    !memcmp(&entry->build_ids[pos + 1],
> > +    bpf_bid->build_id,
> > +    BUILD_ID_SIZE_MAX)) {
> > + found_idx =3D b + 1;
> > + break;
> > + }
> > + pos +=3D 1 + sz;
> > + }
> > +
> > + if (!found_idx &&
> > +    nr_build_ids < PERF_CALLCHAIN_BUILD_ID_MAX_NRS) {
> > + u32 next_raw_len =3D raw_bids_len + 1 + BUILD_ID_SIZE_MAX;
> > + u32 next_aligned_len =3D ALIGN(next_raw_len, sizeof(u64));
> > +
> > + if (next_aligned_len + (i + 1) * sizeof(u64) > max_size)
> > + break;
> > + entry->build_ids[raw_bids_len] =3D BUILD_ID_SIZE_MAX;
> > + memcpy(&entry->build_ids[raw_bids_len + 1],
> > +       bpf_bid->build_id, BUILD_ID_SIZE_MAX);
> > + nr_build_ids++;
> > + raw_bids_len =3D next_raw_len;
> > + aligned_bids_len =3D next_aligned_len;
> > + found_idx =3D nr_build_ids;
> > + }
> > +
> > + if (aligned_bids_len + (i + 1) * sizeof(u64) > max_size)
> > + break;
> > +
> > + if (found_idx) {
> > + encoded_offset =3D ((u64)found_idx << 56) |
> > + (bpf_bid->offset & GENMASK_ULL(55, 0));
> > + } else {
> > + encoded_offset =3D ip & GENMASK_ULL(55, 0);
> > + }
> > + } else {
> > + if (aligned_bids_len + (i + 1) * sizeof(u64) > max_size)
> > + break;
> > + if (i >=3D user_start && ip < PERF_CONTEXT_MAX)
> > + encoded_offset =3D ip & GENMASK_ULL(55, 0);
> > + else
> > + encoded_offset =3D ip;
> > + }
> > +
> > + entry->offsets[i] =3D encoded_offset;
> > + nr_offsets =3D i + 1;
> > + }
> > +
> > + if (nr_offsets > 0 && nr_offsets <=3D user_start &&
> > +    entry->offsets[nr_offsets - 1] =3D=3D PERF_CONTEXT_USER_DEFERRED &=
&
> > +    (nr_offsets < 2 ||
> > +     entry->offsets[nr_offsets - 2] !=3D PERF_CONTEXT_USER_DEFERRED))
> > + nr_offsets--;
> > +
> > + if (aligned_bids_len > raw_bids_len) {
> > + memset(&entry->build_ids[raw_bids_len], 0,
> > +       aligned_bids_len - raw_bids_len);
> > + }
> > + entry->nr_build_ids =3D nr_build_ids;
> > + entry->nr_offsets =3D nr_offsets;
> > + entry->build_ids_len =3D aligned_bids_len;
> > +}
> > +
> > +static struct perf_callchain_build_id_entry __empty_callchain_build_id=
 =3D {};
> > +
> > +struct perf_callchain_build_id_entry *
> > +perf_callchain_build_id(struct perf_event *event,
> > + struct perf_callchain_entry *callchain,
> > + u64 ip, bool resolve_ip, u32 max_size)
> > +{
> > + bool crosstask =3D event->ctx->task && event->ctx->task !=3D current;
> > + bool has_user_ctx =3D is_user_task(current) && current->mm && !crosst=
ask;
> > + struct perf_callchain_build_id_entry *entry;
> > + struct bpf_stack_build_id *bpf_bids;
> > + u32 nr, user_start, nr_bpf_bids =3D 0, ip_slot =3D 0;
> > + int rctx;
> > +
> > + if (!callchain || !callchain->nr || max_size < sizeof(u64))
> > + return &__empty_callchain_build_id;
> > +
> > + entry =3D get_callchain_build_id_entry(&rctx, &bpf_bids);
> > + if (!entry)
> > + return &__empty_callchain_build_id;
> > +
> > + entry->has_ip_bid =3D false;
> > + nr =3D min_t(u64, callchain->nr,
> > +   sysctl_perf_event_max_stack +
> > +   sysctl_perf_event_max_contexts_per_stack);
> > + user_start =3D nr;
> > + if (has_user_ctx) {
> > + for (u32 i =3D 0; i < nr; i++) {
> > + if (callchain->ip[i] =3D=3D PERF_CONTEXT_USER) {
> > + user_start =3D i + 1;
> > + break;
> > + }
> > + }
> > + if (user_start < nr) {
> > + nr_bpf_bids =3D min_t(u32, nr - user_start,
> > +    sysctl_perf_event_max_stack);
> > + nr_bpf_bids =3D min_t(u32, nr_bpf_bids,
> > +    max_size / sizeof(u64));
> > + }
> > + if (nr_bpf_bids > 0) {
> > + if (resolve_ip) {
> > + bpf_bids[0].ip =3D ip;
> > + ip_slot =3D 1;
> > + }
> > + for (u32 i =3D 0; i < nr_bpf_bids; i++) {
> > + bpf_bids[ip_slot + i].ip =3D
> > + callchain->ip[user_start + i];
> > + }
> > + stack_map_get_build_id_offset(bpf_bids,
> > +      ip_slot + nr_bpf_bids,
> > +      true, false);
> > + if (resolve_ip) {
> > + memset(&entry->ip_bid, 0,
> > +       sizeof(entry->ip_bid));
> > + if (bpf_bids[0].status =3D=3D
> > +    BPF_STACK_BUILD_ID_VALID) {
> > + entry->ip_bid.size =3D
> > + BUILD_ID_SIZE_MAX;
> > + memcpy(entry->ip_bid.build_id,
> > +       bpf_bids[0].build_id,
> > +       BUILD_ID_SIZE_MAX);
> > + entry->ip_bid.offset =3D
> > + bpf_bids[0].offset;
> > + } else {
> > + entry->ip_bid.offset =3D ip;
> > + }
> > + entry->has_ip_bid =3D true;
> > + }
> > + }
> > + }
> > +
> > + perf_callchain_encode_build_ids(entry, callchain->ip, nr, user_start,
> > + bpf_bids + ip_slot, nr_bpf_bids,
> > + max_size);
> > + put_callchain_entry(rctx);
> > +
> > + return entry;
> > +}
> > +
> > static void fixup_uretprobe_trampoline_entries(struct perf_callchain_en=
try *entry,
> >       int start_entry_idx)
> > {
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index fd9f654de269..d38ffe52c301 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -2096,6 +2096,9 @@ static void __perf_event_header_size(struct perf_=
event *event, u64 sample_type)
> > if (sample_type & PERF_SAMPLE_CODE_PAGE_SIZE)
> > size +=3D sizeof(data->code_page_size);
> >
> > + if (sample_type & PERF_SAMPLE_BUILD_ID_OFFSET)
> > + size +=3D sizeof(struct perf_sample_build_id_offset);
> > +
> > event->header_size =3D size;
> > }
> >
> > @@ -8396,6 +8399,78 @@ static void perf_output_read(struct perf_output_=
handle *handle,
> > perf_output_read_one(handle, event, enabled, running);
> > }
> >
> > +static void perf_bpf_to_sample_bid_offset(struct bpf_stack_build_id *b=
pf_bid)
> > +{
> > + struct perf_sample_build_id_offset *bid =3D (void *)bpf_bid;
> > + u8 size =3D 0;
> > +
> > + static_assert(sizeof(*bid) =3D=3D sizeof(*bpf_bid));
> > + static_assert(offsetof(struct perf_sample_build_id_offset, build_id) =
=3D=3D
> > +      offsetof(struct bpf_stack_build_id, build_id));
> > + static_assert(offsetof(struct perf_sample_build_id_offset, offset) =
=3D=3D
> > +      offsetof(struct bpf_stack_build_id, offset));
> > +
> > + if (bpf_bid->status =3D=3D BPF_STACK_BUILD_ID_VALID)
> > + size =3D BUILD_ID_SIZE_MAX;
>
> perf_bpf_to_sample_bid_offset() and perf_callchain_encode_build_ids() onl=
y ever
> write size =3D BUILD_ID_SIZE_MAX for a resolved build ID, and size =3D 0 =
for the unresolved case.
> As far as I can see the table in PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET,
> therefore always contains BUILD_ID_SIZE_MAX-byte entries, although patch =
03 documents it
> as variable-length {u8 size; u8 data[size]}.
>
> Is there a case where size can be anything other than 0 or 20? If not,
> could the UAPI comment in patch 03 say so?

ELF build IDs can have lengths other than 20 bytes (e.g. 8-byte xxhash
/ --build-id=3D0x... or 16-byte MD5/UUID, alongside 20-byte SHA-1),
matching struct perf_build_id::size (1..20) in PERF_RECORD_MMAP2.

In the kernel, stack_map_get_build_id_offset() currently uses struct
bpf_stack_build_id which doesn't carry the parsed note length and
zero-pads shorter build IDs to BUILD_ID_SIZE_MAX (20), so
kernel-emitted table entries currently have size =3D=3D 20. However,
user-space tools such as "perf inject --sample-buildids" write the
exact DSO build ID length (1 <=3D size <=3D 20), and keeping size in the
UAPI format also allows the kernel to emit unpadded lengths in the
future without an ABI break. Note that table entries in
PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET never have size =3D=3D 0 (unresolved
frames are encoded via index 0x00 in offsets[] without adding a table
entry).

I've updated the UAPI comment in Patch 03 for v4 to explain this
explicitly (1 <=3D size <=3D 20, with the kernel currently zero-padding to
20 bytes via bpf_stack_build_id while user-space tools may emit the
exact unpadded length).

Thanks!
Ian

> Thanks
> Athira
