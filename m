Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479172;
	b=EK6bLkUG/bfETPfJg8Z3l7KB3lOWUeQf4+7s+LQF4FRhIze4xPj3ejZ7UV4Yugx4NqDZ
	 zY+t2m7beiMMvmmjuDqKMGeEe8MFsvqSvewgoNYQ7K9nErqYBKsiofZSyXh6WnzRZk3RJ
	 WCAPOMONLzmAOXg+m66/7NX8qyrMEX+3W8TlEIDPZRrdYN7U5ylIrNaJrm+IRFYBZaEND
	 OXrBPZfDs0HnW1URlkL7yaSmMNHAh/7DX3TO7rm32PB1TaKsIrlR4SV0nsLgqF3dpTv1S
	 esclruHpGBfoQTK+ZKZ/QGAFyPjLboT2ocM2t1dsUmLCkAktAJ4dfdV4FsdNoyM0F2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=7bDIHXXIM4LNEtaYASA3zw1NmzIi1pMS/QPwvnMhMAg=;
	b=zYmtn5QOmXskuLutWdinBr6B83bkQNhc5I+zujDS5X9lOHbnzRK0carHR+MQUd8vmoeX
	 A91M1qo79i+WxNwFZ8a7RJQmrn0/sBRr6FykncamJa/g2WpHX1KWX2bCBFMmFDy4/9RZv
	 O1K7BrGsPPbNWy0OusCEeKRpKMIABmrP1PRSSmG97oUjYSG1iqietCcB7e5rYzqE0cn4m
	 2mMatWsc7pBEgbflYQuu6VkjLNrHnOVgGFSaif/GZ9bJg/JkYx7Wrx/3Yt5ZRFTMFyUl7
	 7GLPCsKdQ9yHz6hM0v73NRzJd2hW89wHzBXY7xAai8qryXsQkyTHOzztXtgj4p0pMSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvzGf6z3;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF55606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF55606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvzGf6z3
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a07078200fso1951412b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479171; x=1796083971; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7bDIHXXIM4LNEtaYASA3zw1NmzIi1pMS/QPwvnMhMAg=;
        b=EvzGf6z3rhg+QVwRCNjiqtCEZQCgcOG6ShYMP0kcI8BIeTc+i+i1MBX1jcLv86gWPK
         nyHsqBHq/6w7+m9DsSBPB+vW2wMewdPpAMBY2hX/Uls7uEq7FEl0qbsUwWhAxBAwrC+W
         +S5cCZa8peiG/UWSsGfsCamGsA2WW+N0Ng8wgEG/f8tHfVjaETAJGRpi4zoOJVmSk2Fk
         yMKdj6HtQbbkDpc8+pkb4cP7A8uDYL+GEkEZIYMBDAuTLKWDOZC5Yh+kvlrf0QrZ3MgU
         xHDFWEv+uQAg/q+KqS+6yXIIvnoFUGR0Y1VT7IFBmxqe7g1OrYn/zB5z2DbJlOn0IIOF
         B+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479171; x=1796083971;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bDIHXXIM4LNEtaYASA3zw1NmzIi1pMS/QPwvnMhMAg=;
        b=YbyPmZoQraNUn0ngXG4uwG8CTbN4UyQplhJqUEY3KgkpsfQ8TgiVKIT25RIXBPLIW5
         Fz5nDPXeZWajIGml5fD8zxHZphBmSOzCHMQw2B1kqYL/KYHJ/WrYOl8rsdRfozmIIcnk
         KiSfvO8PloVZwmV7zVYYhpNC9Wd/35mh9RJm5dkiOr5XrBBTFTXRaf0G1P9+FKdy7BwL
         RiMxWCmDYxdz1hN2yn0ZPKXB+CYT2aVmlAd42iw5vZ7StkCVrfz2+oK4LD963ZwzD4rN
         0ZWuCJp8wOMZd3Rwokvdw2OeWUNuONzIOjrSHclCrAwXZFQ1E6BORW8IAdQR/unGtLKx
         5+Mg==
X-Forwarded-Encrypted: i=1; AL+hErHvnKX2gHm4jwdXnG6o6auZM791JRpjQHpS1MefP9Ao0/1xKD7/7RUilrJP+eck3VRtP6HU/2nCfk1QqIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RX0O2XC5gY7KPEJPpsuUYLHVmG7DEk8B8m8KMQjzJumUp5IRt
	kjdvEmO1tjWgE+Iz2TL7gjTmV+it1BoUSvO94Y6b3v/LE5wdckGwg6xp
X-Gm-Gg: AZFdTZcrV5YE8EU4Sddz9E3VDfh8QLEc8zpvjoZVR5orizUPBLrTLEcYsWRWTG4oDhs
	BpEY0j+JIu5dt7HX8fOwaq3325R4JBpPHqwyqw7LYJZPPvYSioA8+bG7BmVNsVXwkC4v+Uz/nJk
	RrrY0r26LnH2qU7b9eKZeqn9jYVrboUuWgEl1tn94O98hJz7emm6VC+SaSpt+F7tInuR+nFEz/M
	17MNRWGHdB1zq7kePirCWrwNOntRSD0LsTs+jfnmNrrDs5GR9kRloHvEoMFhntX3kpB3XvNwDx+
	46DCmQyiPpBB64wIk1IwWUMrI4wFe7fzKw8y3dFCiEZVthHvp3UHpVfh+ty6oPN/3FYhw9LWwhl
	WQC33uQNXiu0tu9BaQpJh695pKoD2UdMdumnuDmGJ6xSxIW/BkfxtIXzx8+/tahpDLqrpM5WTjL
	vG6vI1ax34DsW3HoMVguMkM70eQ3ArryAtm8Nu+VuY0g3blDv2vBeZLnU5SVRnkryOQLKTRYzjl
	LGjtIxgTQPXL0rhwHNR38ABppE8KAN5Dx9G/y37gTHG/mjUzj+JrbsEF1w5UQe7+loGjgd5IN1t
	1i09SdvLnlKpJYQap29ODkZfS+d2aerRwmGZFNrLgecn0ZR06khqWBm6I6mFIuzgIKYGlvAmune
	1r9QHlsEAJxkzV3OpMCMBWhf+h6YTHfarfQ==
X-Received: by 2002:a05:6a00:368b:b0:89e:b12e:7eda with SMTP id d2e1a72fcca58-8c8792c36afmr11522943b3a.7.1795479170548;
        Mon, 23 Nov 2026 16:12:50 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b278f0sm6298093b3a.51.2026.11.23.16.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:12:50 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 00:12:47 +0000
Message-Id: <DN308UHY5QHQ.8CJOFGAHVVTR@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "KP Singh"
 <kpsingh@kernel.org>, "Matt Bobrowski" <matt@bobrowski.net>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 0/9] bpf: Add log support for tracing
 link_create
In-Reply-To: <20261123152743.19629-1-leon.hwang@linux.dev>
References: <20261123152743.19629-1-leon.hwang@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 23, 2026 at 07:27 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>  .../selftests/bpf/prog_tests/cgroup_link.c    | 324 ++++++++
>  .../selftests/bpf/prog_tests/iter_link.c      | 156 ++++
>  .../selftests/bpf/prog_tests/tracing_link.c   | 741 ++++++++++++++++++
>  .../selftests/bpf/progs/tracing_link_ctx.c    |  17 +
>  .../selftests/bpf/progs/tracing_link_multi.c  |  36 +
>  .../selftests/bpf/test_kmods/bpf_testmod.c    |   5 +

1279 lines of selftests for log messages ?
This is way too much.

pw-bot: cr

One row per attach path is enough. It checks that the log gets there.
The base kernel leaves the log empty, so all four rows fail on it.
Something like this:

diff --git a/tools/testing/selftests/bpf/prog_tests/link_log.c b/tools/testing/selftests/bpf/prog_tests/link_log.c
new file mode 100644
index 0000000..4f7e71a
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/link_log.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <test_progs.h>
+
+/* One row per attach path. It checks that the log gets there. */
+static const struct {
+	const char *name;
+	enum bpf_prog_type type;
+	enum bpf_attach_type attach_type;
+	const char *func;
+	struct bpf_link_create_opts opts;
+	int err;
+	const char *msg;
+} tests[] = {
+	{ "tracing", BPF_PROG_TYPE_TRACING, BPF_TRACE_FENTRY, "bpf_fentry_test1",
+	  { .target_btf_id = 1 }, -EINVAL, "target_btf_id" },
+#ifdef __x86_64__
+	{ "tracing_multi", BPF_PROG_TYPE_TRACING, BPF_TRACE_FENTRY_MULTI, NULL,
+	  { .tracing_multi = { .ids = (const __u32[]){ ~0U }, .cnt = 1 } },
+	  -EINVAL, "4294967295" },
+#endif
+	{ "iter", BPF_PROG_TYPE_TRACING, BPF_TRACE_ITER, "bpf_map",
+	  { .iter.len = 4 }, -EINVAL, "iter_info_len" },
+	{ "cgroup", BPF_PROG_TYPE_CGROUP_SKB, BPF_CGROUP_INET_EGRESS, NULL,
+	  { .cgroup.expected_revision = 2 }, -ESTALE, "revision" },
+};
+
+static void run_test(int i, int cg)
+{
+	const struct bpf_insn insns[] = {
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	};
+	struct bpf_link_create_opts opts = tests[i].opts;
+	char buf[128] = {};
+	LIBBPF_OPTS(bpf_log_opts, log_opts, .buf = buf, .size = sizeof(buf), .level = 1);
+	LIBBPF_OPTS(bpf_prog_load_opts, load_opts,
+		    .expected_attach_type = tests[i].attach_type);
+	int prog_fd, fd;
+
+	if (tests[i].func)
+		load_opts.attach_btf_id =
+			libbpf_find_vmlinux_btf_id(tests[i].func, tests[i].attach_type);
+	prog_fd = bpf_prog_load(tests[i].type, NULL, "GPL", insns, ARRAY_SIZE(insns),
+				&load_opts);
+	if (!ASSERT_OK_FD(prog_fd, "bpf_prog_load"))
+		return;
+
+	opts.sz = sizeof(opts);
+	opts.log_opts = &log_opts;
+	fd = bpf_link_create(prog_fd, tests[i].type == BPF_PROG_TYPE_CGROUP_SKB ? cg : 0,
+			     tests[i].attach_type, &opts);
+	if (fd >= 0)
+		close(fd);
+	ASSERT_EQ(fd, tests[i].err, "err");
+	ASSERT_HAS_SUBSTR(buf, tests[i].msg, "log");
+	ASSERT_EQ(log_opts.true_size, strlen(buf) + 1, "true_size");
+	close(prog_fd);
+}
+
+void test_link_log(void)
+{
+	int i, cg;
+
+	cg = test__join_cgroup("/link_log");
+	if (!ASSERT_OK_FD(cg, "join_cgroup"))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(tests); i++)
+		if (test__start_subtest(tests[i].name))
+			run_test(i, cg);
+	close(cg);
+}
