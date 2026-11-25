Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638228;
	b=xI1Q1Y3LId35FcFa3x/hKZv3rbXhzHm5pztjFHuO1cn9xIXkaS9sUBSg5k45v+E6g66P
	 XeM5vmmiJ59A/xYUnCKoLHxV2a8p6uCSNxPNrMnikMIxGpAqnwT44ZkowQBC+Iup2xQz7
	 fBF0XH7ywBYX/RhX8bq2kHDXq/qeYMJM2AvGnkrnr0K8pbao+hUcr6ghB79h4hYsvckiB
	 qmpZyjptoqLmR0O9NtS4uti0kNunC48rK/M3JMuzHUhvydX93996/2H/UjRLlQsYpKuNh
	 EvA6YdJMnhUJDvl/LFU6M7FKp8kk1JpF+ADPgqLu/4ok7U4GqrmNmVGKu+NReQrm1lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638228;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hKUU2imahZE4B9a0pwQkizpFVuU4ssI550E629F+HU4=;
	b=U21QG3MGjTNqQm9/Ml21WWEnPMXc0O+0W7GEv/D1oAHh+t4hShUvitcb1kPUvV0mosEO
	 wE4ZdYFrRt3t1BrbTzpfzWRcQ+CBvC2IEqbh168xGvgDHWMqc8/kElUG0sr+f+IXHVm8d
	 qz3e0fkjWScJRi6ao6YuiAjVBQT3K7ipfVSqDhPlKui4fLPrXdZ8NEHtpRGQ/BJYnnU8N
	 wIBymoypcRwBLvnorPvgmOB33f85P7qOI2BMnCwy0TYfewNzuMAE+2zlglNBMbYibc4nq
	 Kyop9qpWKbp9b1UpUX0t+Ny+ZqPSMP554CmHE7fgQRWACi3SktvOfeO3PTymDwDcFMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w0DU1h2I;
	arc=none smtp.remote-ip=95.215.58.173
Received: from mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A1C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A1C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w0DU1h2I
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fdrz78OYlKMGHh6IXGtV5XttBhxWpJMlzeekMNBSw3k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795638225; v=1; x=1796243025;
 b=w0DU1h2Iu7iOo5sYgszHSa2bYau5G741zzfxIlhRUY4uRk8oGxMFoJi3sj3Sj8bU1t3mZIeo
 +qhSzLfqJqJybM2BJIFx/c7EQGh9J0GVhY7Rc+S+q7qWFm27v5HJDsbJQ6DHZ4cLyPfEKvwTS3w
 vZ5fmeV8kCyGDXA5HfvDf85E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 92300b7e95544926;
	Wed, 25 Nov 2026 20:23:44 +0000
X-Mizu-Trace-ID: 92300b7e95544926
X-Migadu-Flow: FLOW_OUT
Message-ID: <4f83adb6-29d7-44d0-8dbc-beb28231a8b5@linux.dev>
Date: Wed, 25 Nov 2026 12:23:39 -0800
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
Subject: Re: [PATCH bpf-next v3 0/4] bpf: Check recursion per task for
 preemptible programs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 mikeba@sentinelone.com, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, Martin Kelly <martin.kelly@crowdstrike.com>,
 Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
 tyler.wilson@crowdstrike.com
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com>
 <44034fa7-91ab-4777-ba72-0037a6932b56@linux.dev>
 <DN3ZR4IBQUKK.2KZHQUDH3ZRAC@gmail.com>
Content-Language: en-US
From: "JP Kobryn (CrowdStrike)" <jp.kobryn@linux.dev>
In-Reply-To: <DN3ZR4IBQUKK.2KZHQUDH3ZRAC@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 8:02 PM, Alexei Starovoitov wrote:
> On Tue, Nov 24, 2026 at 06:06 PM JP Kobryn (CrowdStrike) <jp.kobryn@linux.dev> wrote:
>> The patch below is a proof of concept scoped only to x86_64 trampolines.
>> It was validated with the bpftrace prog that precedes the patch, along
>> with jited assembly dump to inspect the new private frame API calls.
>> Overhead measured was roughly 60ns, but this was just a first take and I
>> believe it can be optimized especially in the JIT area. If it makes
>> sense, this could be integrated into the series or sent as a follow-up.
> 
> If you want to redesign private stack please take inspiration
> from insert_arena_stack_get(). Much lower overhead and no artificial limits.

Thanks for taking a look. Since it looks like v4 will conditionally disable
preemption for run context entry to exit, this concept does not have to be
tied to this series.

We'll pursue the private stack work separately, but will continue testing
revisions of this series.
