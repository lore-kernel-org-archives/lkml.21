Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098592;
	b=Qo/fN98LQDbirRB381D6yd5CSJVnk7qaY+gUYNAlwmFvFOy6o+TI1bt2qu7z7hyoJz5y
	 Vfvg81nFhtAMsIMQ3850CQUT2AwhFt4DpD8h7o/3SQyB2sR90bIwX5VaMy33MFyS18S8u
	 j50Wh73vjdqZtkBUAV/9UWjVbQwrjUS2/F0UChvQd/av5PSL+vfypJRVY3KB1wYT9GOI0
	 XFPSs385jalaEyoNyPfLE1nZj1HQtRU65doAEK34l3nPuWgy9GKctY9fu7N6FRWldimnJ
	 9rdUCaHswLLAe8kWZzplhZDf9+x5G0uY60OcN1EpO5gTFT9z/Ry9qqCx8GoHoZ7C8Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098592;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IpS+OvTiHBt9cos72bPyyscFetGZCa8xcAWeKuLcovo=;
	b=n7hnmVy+TjTUEM4QeGbDY/vnGgL8yqB7Iq+P0qlaK5XKoTVFMR16QqRpw1AgxsN0SrAr
	 ri9iZbOZVAYBiJ+zl3W2gz0Br1C/2TX4dzLysR8s05IWuRZO5+8zsU97ShoZbnR65wkba
	 MZ2acvlN4OlhaIq2ghmpEHE6l+MGrFRamAUXcYtMWyFHpafNXUazm1V6i/QXuJwxgvRBU
	 +tJ2TNW3/29rONxLdeVi+cweMDKYgDOWJQcHCqPgRhWXXFNiDudZsC3v1ihLP7xAJqyiE
	 DKuAkkFXjh8DnJhM3dKi+FDKS95Xyp2PgYcUwXqTl9FYuwGHh/Z7I3mx3WpPri4EtGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ugSMqoCk;
	arc=none smtp.remote-ip=95.215.58.92
Received: from mta1.migadu.com (out-92.mta1.migadu.com [95.215.58.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EED6606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EED6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ugSMqoCk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yiF8K9EPXuxHZY+ZjFT8Mm/qvdcpO8uxIa1zzcDtecw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795098589; v=1; x=1795703389;
 b=ugSMqoCkZvx7zRpLcWqRkrfKZZPhQ6HijDYz7b5lfIVGgOYZtUjwCZdvXDkUDcTrCgV0B9s7
 M7P2I3PxiK7zVEe2I21XlDt8Ef/Mp3la6sQGid0xMRx6C67YUdMZlGHXGd21jPh0iCyF3Rs3bTW
 2lyPk1pnTMxQ5L1Kd5RNtTvE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 04f58529dc36ba04;
	Thu, 19 Nov 2026 14:29:49 +0000
X-Mizu-Trace-ID: 04f58529dc36ba04
X-Migadu-Flow: FLOW_OUT
Message-ID: <8bb22131-7f3b-4b70-a7a6-92f465027350@linux.dev>
Date: Thu, 19 Nov 2026 22:29:39 +0800
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
Cc: cui.tao@linux.dev, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH] tools/sched_ext: Add "arena" BTF type tag to the __arena
 qualifier
To: Shaojie Sun <sunshaojie@kylinos.cn>, Tejun Heo <tj@kernel.org>,
 sched-ext@lists.linux.dev, David Vernet <void@manifault.com>,
 Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>
References: <20261119102613.811845-1-sunshaojie@kylinos.cn>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20261119102613.811845-1-sunshaojie@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello, Shaojie,

在 2026/11/19 18:26, Shaojie Sun 写道:
> tools/testing/selftests/bpf/libarena marks __arena types with
> btf_type_tag("arena") so that whether a type belongs to an arena can be
> determined from BTF alone:
> 
>   commit a0fa68d8ce75 ("selftests/bpf: libarena: Add "arena" BTF type
>   tag to __arena qualifier")
> 
> tools/sched_ext defines the same __arena qualifier but without the
> "arena" BTF type tag.  Add the tag so that both describe arena types the
> same way.
> 
> checkpatch reports a false positive on the new definition:
> 
>   ERROR: Macros with complex values should be enclosed in parentheses
> 
> The macro value is a sequence of declaration attributes, not an
> expression, so it can neither be parenthesized nor wrapped in a
> do-while loop.  The selftests copy of the qualifier has the very same
> definition and triggers the same warning.
> 
Looks good. Tested on sched_ext for-next: all tools/sched_ext scheds
build and scx_sdt loads and runs fine with the tags present in the
BTF of the loaded program.

One nit: the patch doesn't apply to the current tree since
0a5e9cf2525f ("sched_ext: Sync common and compat headers from the scx
repo") changed the context line to "#elif", please rebase (git am -3
works meanwhile).

Also, this header also lives in the sched-ext/scx repo and the two
copies get reconciled by hand; the most recent reconciliation went
from the scx repo into the kernel tree. The scx repo copy doesn't
have the tag either, so it needs the same change there or the next
reconciliation will overwrite this one.

Tested-by: Tao Cui <cuitao@kylinos.cn>

> Signed-off-by: Shaojie Sun <sunshaojie@kylinos.cn>
> ---
>  tools/sched_ext/include/scx/bpf_arena_common.bpf.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/sched_ext/include/scx/bpf_arena_common.bpf.h b/tools/sched_ext/include/scx/bpf_arena_common.bpf.h
> index 2043d66940ea..fb796b356f86 100644
> --- a/tools/sched_ext/include/scx/bpf_arena_common.bpf.h
> +++ b/tools/sched_ext/include/scx/bpf_arena_common.bpf.h
> @@ -16,7 +16,7 @@
>  
>  #if defined(__BPF_FEATURE_ADDR_SPACE_CAST) && !defined(BPF_ARENA_FORCE_ASM)
>  #ifndef __arena
> -#define __arena __attribute__((address_space(1)))
> +#define __arena __attribute__((address_space(1))) __attribute__((btf_type_tag("arena")))
>  #endif
>  #define __arena_global __attribute__((address_space(1)))
>  #define cast_kern(ptr) /* nop for bpf prog. emitted by LLVM */

