Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560623;
	b=RB860V6hjZnv64FpQcB7RX0HODX0TD/I/WMp7wp0bHiK4nJK8A9kWkJDuRyVjQPOEynK
	 HAG3D0cxx4lcN0fhH2CzSUcp3jICWA8abFH++vVMX77udwdGzIJmtPbkW6bCUA2v4Xb9F
	 +7zQVf4hXRNwjEMzXyi8VpMPjTRhuJ+yCUXu672a7MZr7xxatsHnYL1r7p5XYSDltNbQQ
	 gVXF61VgJ35mxc2nYnBeIB1G/F6F6FpJXuM5gECrWCQ6YFqbeE+tqDaMWUF0crhRk1Lh3
	 5DcJIDk6vuInBq86dOh+ZTtENR2pMbmWasguRb7fsgKEOBDw1IPC1IX6m+vm5KFOTAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560623;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:From:To:Cc:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=g4vaPQV74jjxKmY5Gc7djswsfNDRHhGFLeRXFEbgJNo=;
	b=r5bsOG/eBRAR8U3QnwYz52u3P0joXnX+1Um/BJ5a2WgMXML2Swrqm+QCYhT7a566mtVl
	 S2SZ+ODSNoib7vwz5yTYeA3v7Lve91Q79PJRV0C2BlxeE8YXMJBCaxvd7n7eNQILysjrM
	 cyj0cLlTYs37PK1DA1yf6ac9shP3L/0zD2tZQlmfN8xJamQdBM4u2tVDzq7N5U2oc9g27
	 1EEWfYhhg4CY5iCWbupsp05S4sDsi1Wga2jWB+l6adx/Ut5TqBJYLSvSoO+DEWOoKb/wb
	 nTqz0kw0cpHb51AktTjp+8k2yW4IxlUpLMQ1k4XDGWExADaiN5fcwWjUtE/yyNBWqow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TGN3MB1D;
	arc=none smtp.remote-ip=95.215.58.123
Received: from mta1.migadu.com (out-123.mta1.migadu.com [95.215.58.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E6B606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E6B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TGN3MB1D
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8BfRfPvn8AcFnIZbjU313Zrp06xfpw0x4Vh6IODgOkc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795560620; v=1; x=1796165420;
 b=TGN3MB1DVf1+VRcO794TtcfIiuwbNED9ST83zuhScRqNYIqxyNejVcjXCVV8s0R3e1edMr+x
 GcAY4dmbV0TDb5sh2YHUKk4Jst+O+1rVfsqPZCQrZCvID+Smm7x5LjvLcZTQ3vcQDUPXnMfXFQc
 JW2hn/RUlxuFjQ5ufiFJGufY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 20d3cf91c86cc936;
	Tue, 24 Nov 2026 22:50:18 +0000
X-Mizu-Trace-ID: 20d3cf91c86cc936
X-Migadu-Flow: FLOW_OUT
Message-ID: <10ad779b-708b-4b0b-b6af-54f3d7414f82@linux.dev>
Date: Tue, 24 Nov 2026 15:50:14 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 1/6] libbpf: Separate interfaces shared with
 in-tree tools
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>,
 Song Liu <song@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev
References: <20261124224811.16134-1-ihor.solodrai@linux.dev>
 <20261124224811.16134-2-ihor.solodrai@linux.dev>
In-Reply-To: <20261124224811.16134-2-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-24 3:48 p.m., Ihor Solodrai wrote:
> resolve_btfids and bpftool link libbpf statically and use some of its
> internal helpers from libbpf_internal.h. That header also defines
> logging macros and poisons kernel integer typedefs, so resolve_btfids
> wraps the SHA-256 helper in a separate source file.
> 
> Move the declarations these tools use to libbpf_tools.h and include it
> instead of libbpf_internal.h. The header is for in-tree tools and stays
> uninstalled. No shared-library symbols change.
> 
> No functional change.

I posted v3 with the refactoring as described in my comment [1].

However now I'm thinking it might be an overkill. With the re-design
vs v1, resolve_btfids now only needs btf_kfunc_proto_match(), if it
includes relo_core.h, so the new libbpf_tools.h is not as appealing.

Speaking of "API levels", libbpf_internal.h has already been
functioning as the "in-tree users only", and there is another special
user among those: the selftests (see paste below). So if v3 is landed
as posted, we now have two "levels" of in-tree users.

It's... fine, but not exciting. Adding libbpf_tools.h doesn't help
that much, and dropping it doesn't hurt. It's all bikeshedding, not
directly relevant to the series, ultimately caused by name collisions
between resolve_btfids and libbpf (u32 poisoning and pr_* macros).

Quentin, Andrii, Eduard, please let me know if anyone has a strong
preference here, I'm happy to respin. Thanks!

[1] 
https://lore.kernel.org/bpf/faecfef3-ac9f-41be-8bc3-83a66572066a@linux.dev/

$ grep -rl --include="*.[ch]" 'include.*libbpf_internal.h' 
tools/testing/selftests/bpf
tools/testing/selftests/bpf/prog_tests/bpf_obj_pinning.c
tools/testing/selftests/bpf/prog_tests/btf_field_iter.c
tools/testing/selftests/bpf/prog_tests/btf_sanitize.c
tools/testing/selftests/bpf/prog_tests/core_reloc_raw.c
tools/testing/selftests/bpf/prog_tests/cpu_mask.c
tools/testing/selftests/bpf/prog_tests/fill_link_info.c
tools/testing/selftests/bpf/prog_tests/get_smp_processor_id.c
tools/testing/selftests/bpf/prog_tests/global_data_init.c
tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
tools/testing/selftests/bpf/prog_tests/kprobe_multi_testmod_test.c
tools/testing/selftests/bpf/prog_tests/module_fentry_shadow.c
tools/testing/selftests/bpf/prog_tests/perf_branches.c
tools/testing/selftests/bpf/prog_tests/perf_buffer.c
tools/testing/selftests/bpf/prog_tests/raw_tp_test_run.c
tools/testing/selftests/bpf/prog_tests/recursive_attach.c
tools/testing/selftests/bpf/prog_tests/sha256.c
tools/testing/selftests/bpf/prog_tests/test_global_funcs.c
tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c
tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
tools/testing/selftests/bpf/prog_tests/signed_loader.c
tools/testing/selftests/bpf/prog_tests/tracing_multi.c
tools/testing/selftests/bpf/urandom_read.c
tools/testing/selftests/bpf/urandom_read_lib1.c
tools/testing/selftests/bpf/trace_helpers.c


> 
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>   tools/bpf/bpftool/Makefile            |   6 +-
>   tools/bpf/bpftool/common.c            |   2 +-
>   tools/bpf/bpftool/gen.c               |   3 +-
>   tools/bpf/bpftool/prog.c              |   2 +-
>   tools/bpf/bpftool/xlated_dumper.c     |   2 +-
>   tools/bpf/resolve_btfids/btf_colors.c |  15 +--
>   tools/bpf/resolve_btfids/btf_colors.h |   4 -
>   tools/bpf/resolve_btfids/main.c       |   5 +-
>   tools/lib/bpf/libbpf_internal.h       | 162 +----------------------
>   tools/lib/bpf/libbpf_tools.h          | 184 ++++++++++++++++++++++++++
>   10 files changed, 199 insertions(+), 186 deletions(-)
>   create mode 100644 tools/lib/bpf/libbpf_tools.h
> 
> [...]
