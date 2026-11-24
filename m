Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795554022;
	b=uQZXP3fgmenUhUzM+qSuKu/O07qEz4Uem+9XGEGydrKnPVz8oS85cvriPfw08LcVsjY4
	 QYJ3MjFoEAJUNe8v3RdxDbl4DMLGM4P+xnV7OM99LMixU0YxvWGXA10b6xISsdbanjUDL
	 ynIcrMrVLqTUsW0cUITAd0rYksmFOgw+U89IlAiCd0/2tsGj6DrSn90UwSO/IBXjDmojc
	 LrG+zKrAnaOY3e/NcjW2LEEAkDbGOmDTU1pLCw5E99fAwnqGxoryemKINVyoPPHFmjoYo
	 eARV3IvAEc3+k6LxnKnkLJoJCjYbeeiJmMKGmBIxC+IP0UUH0k5xzcbyyDqJ+zkvpaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lR8uZlGrdT5E7Fg86uJus+YwC92m7WGmkDym3E/bOzM=;
	b=5jerdVumCkVBj1YLu9AFfoD/ECi8SJ1uhnfJRsxECgzwqk6Kg5Fap4Ows+h0XuJOY3Wa
	 tB3tKClRh4Hv4WHYuPm30/fo5zXVWcKk8b8kKn4u0+0aA/7Oavr4RDcMMRor6U72B/GwP
	 vvS7CpT22Grdx2/dsgfBsWRd2EBkz3/C+0GiE1XsAWQmR+heAnX2+iGhxZ0F0EC7+U4/5
	 bP2DkXHq8lc3UPqmvAfmzNhpzUU2A8HDMW44rnC6BLhKfBbiXLPI2+UhT/DQlxr9nciLi
	 eCL/+K6jHUOeCSgWw7mxrCzNKijdbUxa01EHm868F6ZmSwAiwzEE7isgKXc9dayOuWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G25Cealk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28F606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F28F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G25Cealk
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55be673e029so949301cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:00:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795554021; cv=none;
        d=google.com; s=arc-20260327;
        b=nwemi3wKyhjB8QLyVSaoVGBNrnheYiNN55sb1RuKwEB7WWXHxUdwSIFDTbJHZt5SNj
         aPsYofG9tUSmM87j232/sPGFzm2QYInr3Vko69QqCL1j0ugWaROhs9zuocl06JCwpKK9
         +wwpRLEITSDvjUWumMMOEaQIvnyMl2zGAPxHq1j2zKEuJKPFqqiFYiUBK3Nk0jeoz1VY
         /6+Pkh7kCyNbQF+EjOJLllgrWh30PlxeiSyAbO4T4fov8bdBbezI0yHryfofdjgKk8BS
         8EE2RXnhFzbCcusTvkiAtYS25diAkD8PZD05+04qjwzUy7BYE8ElFmWvV5t4kez9rN05
         rCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lR8uZlGrdT5E7Fg86uJus+YwC92m7WGmkDym3E/bOzM=;
        fh=YJmNCAnOnZ4zAApWBVEb5AgiLz81ggnVc2Q354U7UoQ=;
        b=lo/J3DaS2e7ZUAIpToJQBPWH2N0+uoYGhMgPv6tuA6ZTbZJY175nKIfy7aIGqWANdK
         cV1eHB/axNWHy7odbUADNtuNsXkogTHcz3byXTwOWPKs3J8FVgCrMqzViQZjmoJdX3mq
         Clfy16wGH+f9gEZ5gMko4AEiEDFRlneX82l1ztXTwuvyDOXeCsPSoOizZF2SsdLY6WMW
         p4j7te8uqaw5dPUJCXftBIuEtGY/XRsz4cD3eof3hD6MUgFTEKiu/aM9uaLU9t/LzNbZ
         TOTOf99wsYLwu/76SvQMAZQnlCMcfN3gXjti1dGloQkrt/xNdBds/O788kuAP7QhT/ex
         iLGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795554021; x=1796158821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lR8uZlGrdT5E7Fg86uJus+YwC92m7WGmkDym3E/bOzM=;
        b=G25Cealkw3fSp3FMaqDH0XPZvWVLVB8bP9NAbG7kcyHVxrr5/4yB0sKYEHKCI41AEM
         lj9y/ejIXse+52JJsXFOVjCj+60S2R6vBjzmYevTZqTcBqICNHWmTzJWWSbDaCAS6yxv
         znsHYt519FOruSe31M7piRl+gdzog+AjHd7A10/KIJ6NLEFqdMs9wXGguIVh9l0Id2nF
         Kaat01ZhPAXUOhSMIK5LTRQXsFZbEGms1JeqmhgpwXAAdB1qZqmloFg8npJqYxOJXae7
         B4QTIrqc4kW6BUKMUY0HXyEFHmYfGLRUKFHnqIPpkWcwNusxLskY9oaTaWYLefMSagL7
         vRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554021; x=1796158821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lR8uZlGrdT5E7Fg86uJus+YwC92m7WGmkDym3E/bOzM=;
        b=1IkQ2XzDO5/Ir1WHkhZ08e3aYAVX2U5NFwWco/SFvOBDZpaIXTCTqjPpBuWuMfuRxr
         7VNMtA5beEZuh6lg+TjiDSlexTHAeBismDO+RjRzzWJYgd3iZVYcnQXH85EIPXTRwHw0
         0TaRaI1Ay5yPYKRKaY9BMJRYYLWqYVnE1Bi44iVyTK0jVoOL62bfem6yr1zxWtE/dAnt
         ppSuRc6fA0mKGc8sQiW8BrKs6vru9mbx8vQv86HMVepfmYM+YZeRY85B/0CLO88mjkct
         h6EDHR6jOdJVx+7nAbD+XVs32CXmazJmiQuyH9T6+V7LtjBQdvdLZoN6/PsWJLN4qtUG
         9DOA==
X-Forwarded-Encrypted: i=1; AL+hErH51S18w/LuoigTQ2p7Y2PlV4gW7TLPAVaygMt0I7DrcGUpNU2EFFZhjnG2eWepBnuVFbVnqZ2+f9OBrOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HX73fGfjO744E6S4wpjs90HHMu2RomjdBKcT74zd+goT/eY+C
	+k0sGW4dGgHNb3MDgJnLJaCIBnLyxTYYXlKmblyDz3S+EXJsq2k2xJ52lqQEUcab9e+a7mq7Aow
	SHjt7IQ3Ro46Lx/pgGYUdMee0liHTVEdp/pI1lsTB
X-Gm-Gg: AZFdTZcpfh3cTl7XXYXFikqk3rEc49EsrqEsefJR6wFVEazq52Zq8wb1IiMjIY/uT4W
	YsCWxY7NN8RRoVgroQasfngUPavxPHeYvNcUw58eMh6TjlAruo59vW0MB+ziXwJPZwyEWm5UQ/S
	CWhqCvpX2V7O8m0GtIz0rqyMPj6jnqBJQNm3eDyCP5RM+/LvtNRwS1RW4DHGQWPZq0+0Apm/QCU
	oA6KF1cBPgEHZc33oxdpY2ALpdusKD6WszrFCsAT3+o9yypwrH3pMWKrjWvLoSjtxiMv3F1KgmM
	QlufpGguAESblOeuk7gSreT22du4YZZy4fIMlaajyPVxb5LFR2Kr6HsvKSoMIBiYxM8yLfDCacI
	6/7iCFhvj2p5ME2WIZ88vi+tOjNOL3UeDeAothQ0eG5aXqs5hEGNwgjv9FqVHD2NrhKo=
X-Received: by 2002:ac8:6f05:0:b0:55d:74e6:e03 with SMTP id
 d75a77b69052e-55d87eb573emr70187881cf.0.1795554018819; Tue, 24 Nov 2026
 13:00:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116074414.3174737-1-irogers@google.com> <20261116074414.3174737-4-irogers@google.com>
 <6F41ABBE-16A3-4B1F-96C0-D6369D5A5A55@linux.ibm.com>
In-Reply-To: <6F41ABBE-16A3-4B1F-96C0-D6369D5A5A55@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 24 Nov 2026 13:00:06 -0800
X-Gm-Features: Aa3M54pdXM1oIOYL32K8_t7w7fCY8XhU-lLpLLFWOFQ3DDBOcdGlds-hyc2pHCM
Message-ID: <CAP-5=fU-tWJM7brF=YJGfX0fbdivH-oFDo0s=PCt-UcQcqEEfA@mail.gmail.com>
Subject: Re: [PATCH v3 03/19] perf/uapi: Add BUILD_ID_OFFSET sample types to UAPI
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

On Tue, Nov 24, 2026 at 2:36=E2=80=AFAM Athira Rajeev <atrajeev@linux.ibm.c=
om> wrote:
>
>
>
> > On 16 Nov 2026, at 1:13=E2=80=AFPM, Ian Rogers <irogers@google.com> wro=
te:
> >
> > Introduce PERF_SAMPLE_BUILD_ID_OFFSET and
> > PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET in enum perf_event_sample_format.
> >
> > For PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET (and
> > PERF_RECORD_CALLCHAIN_DEFERRED when PERF_RECORD_MISC_MMAP_BUILD_ID is
> > set), encode a deduplicated table of variable-length build IDs
> > (u32 nr_build_ids, u32 nr_offsets, followed by packed { u8 size;
> > u8 data[size]; } entries padded to 8-byte alignment) and an array of
> > 64-bit offsets whose top 8 bits encode the 1-based build ID index (or
> > 0x00 for unresolved user addresses and 0xff for kernel/context entries)=
.
> > In common cases where multiple callchain frames belong to the same
> > binary, each unique build ID is encoded only once.
> >
> > Suggested-by: Namhyung Kim <namhyung@kernel.org>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> > include/uapi/linux/perf_event.h | 59 ++++++++++++++++++++++++++++++---
> > 1 file changed, 54 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_=
event.h
> > index deb7c42d109b..775420ed9aee 100644
> > --- a/include/uapi/linux/perf_event.h
> > +++ b/include/uapi/linux/perf_event.h
> > @@ -165,8 +165,10 @@ enum perf_event_sample_format {
> > PERF_SAMPLE_DATA_PAGE_SIZE =3D 1U << 22,
> > PERF_SAMPLE_CODE_PAGE_SIZE =3D 1U << 23,
> > PERF_SAMPLE_WEIGHT_STRUCT =3D 1U << 24,
> > + PERF_SAMPLE_BUILD_ID_OFFSET =3D 1U << 25,
> > + PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET =3D 1U << 26,
> >
> > - PERF_SAMPLE_MAX =3D 1U << 25, /* non-ABI */
> > + PERF_SAMPLE_MAX =3D 1U << 27, /* non-ABI */
> > };
> >
> > #define PERF_SAMPLE_WEIGHT_TYPE (PERF_SAMPLE_WEIGHT | PERF_SAMPLE_WEIGH=
T_STRUCT)
> > @@ -840,7 +842,8 @@ struct perf_event_mmap_page {
> >  *
> >  *   PERF_RECORD_MISC_EXACT_IP           - PERF_RECORD_SAMPLE of precis=
e events
> >  *   PERF_RECORD_MISC_SWITCH_OUT_PREEMPT - PERF_RECORD_SWITCH* events
> > - *   PERF_RECORD_MISC_MMAP_BUILD_ID      - PERF_RECORD_MMAP2 event
> > + *   PERF_RECORD_MISC_MMAP_BUILD_ID      - PERF_RECORD_MMAP2 and
> > + *                                         PERF_RECORD_CALLCHAIN_DEFER=
RED events
> >  *
> >  *
> >  * PERF_RECORD_MISC_EXACT_IP:
> > @@ -852,7 +855,7 @@ struct perf_event_mmap_page {
> >  *   Indicates that thread was preempted in TASK_RUNNING state.
> >  *
> >  * PERF_RECORD_MISC_MMAP_BUILD_ID:
> > - *   Indicates that mmap2 event carries build ID data.
> > + *   Indicates that mmap2 or deferred callchain event carries build ID=
 data.
> >  */
> > #define PERF_RECORD_MISC_EXACT_IP (1 << 14)
> > #define PERF_RECORD_MISC_SWITCH_OUT_PREEMPT (1 << 14)
> > @@ -1095,6 +1098,38 @@ enum perf_event_type {
> > * { u64 code_page_size;} && PERF_SAMPLE_CODE_PAGE_SIZE
> > * { u64 size;
> > *  char data[size]; } && PERF_SAMPLE_AUX
> > + * { union {
> > + * struct {
> > + * struct perf_build_id bid;
> > + * u64 offset;
> > + * };
> > + * struct {
> > + * u64 zero;
> > + * u64 context;
> > + * u64 cookie;
> > + * u64 ip;
> > + * }; && attr.defer_callchain
> > + *  }; } && PERF_SAMPLE_BUILD_ID_OFFSET
> > + * { u32 nr_build_ids;
> > + *  u32 nr_offsets;
> > + *  struct {
> > + * u8 size;
> > + * u8 data[size];
> > + *  }[nr_build_ids];
> > + *  u8 pad[];
> > + *  u64 offsets[nr_offsets];
> > + *  #
> > + *  # Entries in offsets[] include PERF_CONTEXT_* markers (which
> > + *  # have top 8 bits 0xff). Kernel/hypervisor entries (after
> > + *  # PERF_CONTEXT_KERNEL, PERF_CONTEXT_HV, PERF_CONTEXT_GUEST,
> > + *  # or PERF_CONTEXT_GUEST_KERNEL) and the cookie word following
> > + *  # PERF_CONTEXT_USER_DEFERRED are raw 64-bit values. User
> > + *  # entries (after PERF_CONTEXT_USER or PERF_CONTEXT_GUEST_USER,
> > + *  # or in PERF_RECORD_CALLCHAIN_DEFERRED) use the top 8 bits to
> > + *  # encode a 1-based index (1..254) into the build_ids table and
> > + *  # the lower 56 bits for the DSO file offset, or 0x00 for an
> > + *  # unresolved user virtual address.
>
> Hi Ian,
>
> On PERF_SAMPLE_BUILD_ID_OFFSET, the layout comment doesn't say what is
> written in the non-resolved cases. For PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFF=
SET
> it is clear: kernel entries are raw 64-bit values, unresolved user entrie=
s
> have 0x00 in the top byte, and resolved user entries carry the table inde=
x
> and the 56-bit file offset.
>
> For the PERF_SAMPLE_BUILD_ID_OFFSET form, could the comment state:
>
>  - What is written for a kernel IP? (e.g. bid.size =3D=3D 0 and offset =
=3D=3D raw IP?)
>  - What is written for an unresolved user IP? If bid.size =3D=3D 0, does
>    =E2=80=9Coffset=E2=80=9D hold the raw virtual address?

Yes, in both non-user (e.g. kernel/hypervisor) and unresolved user IP
cases, bid is zeroed (bid.size =3D=3D 0) and offset holds the raw
instruction pointer / virtual address. When attr.defer_callchain
defers a user IP, the union carries zero =3D=3D 0 (so bid.size =3D=3D 0),
context =3D=3D PERF_CONTEXT_USER_DEFERRED, the stitching cookie, and the
raw user IP.

I've expanded the PERF_SAMPLE_BUILD_ID_OFFSET comment in Patch 03 for
v4 to explicitly document all of these cases.

Thanks,
Ian

> Thanks,
> Athira
>
>
> > + * } && PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET
> > * };
> > */
> > PERF_RECORD_SAMPLE =3D 9,
> > @@ -1306,8 +1341,22 @@ enum perf_event_type {
> > * struct {
> > * struct perf_event_header header;
> > * u64 cookie;
> > - * u64 nr;
> > - * u64 ips[nr];
> > + * union {
> > + * struct {
> > + * u64 nr;
> > + * u64 ips[nr];
> > + * };
> > + * struct {
> > + * u32 nr_build_ids;
> > + * u32 nr_offsets;
> > + * struct {
> > + * u8 size;
> > + * u8 data[size];
> > + * }[nr_build_ids];
> > + * u8 pad[];
> > + * u64 offsets[nr_offsets];
> > + * }; && (header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID)
> > + * };
> > * struct sample_id sample_id;
> > * };
> > */
> > --
> > 2.56.1.703.gf848ed807c-goog
> >
> >
>
