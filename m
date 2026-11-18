Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966983;
	b=QvkaQd/XuFL8qwb046eDI2oZkiK5CwW5oPcWjukogzfnedL8L7KsZ+iFfI9cfqJM2aKV
	 fLLwkFn8Al7tnZmBlZwyAAX9/tQ55EHlH2NIzJdTjFQPJtP+UKqQtgeo80ojI8Y4QHLPb
	 ZjevN/Mmi129Oa6pn5mXhwZxS4AQfmIh+JLpqIjJs5JYKMfLX0/UGUKyUcoO+l7nSl+Ap
	 9WmENwl+Js9qjmZAwAZ3gHOIwpoGgDmCtJmjIGVkNJgxhkQ0jmu/pZUiv/sx+9NFdymED
	 O8mAsMiCTGd1G9mBnLuP/xl68ACdU1BLEJCldK2nBNfk8e2DzDZEdqT4KhE+EnSaZ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966983;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PEzaiXe/BwYn0wyikcZkU7jHpGSWF5KdLHubwn3Rz8c=;
	b=cz0qVR2M7uPfgYe3cGUegF+3km/Kk3ol9nsLi4A3xxRo8DvT3yUaPusog1frR9SmRhe4
	 d0jnNyTNRhrdW1l04C+hdRzqDWpOZn/RotGGXOFbi0OReVtDU6mIRBqClIT2JRQ4aR0RB
	 s/N82Ym73IFSM5djAwL8ylXzEGrx0HfGaPLPsEjhBdzdfSR1GY9hP7p5dio4E1Mw/ZiKO
	 xQBHTLUEE9fAPQJGZ5jj48J94H+/o/hE3JduB02XIVuAg1vZEDnTH4DW8+Yu1n39UTfNn
	 NhYtPoKaAebFCTxl7fBqpz4FHnirUedihGmTzjZcH8Zpu+7vD4yG9cnBE3Dr/ITw0hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c+Yl5ksu;
	arc=none smtp.remote-ip=95.215.58.130
Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0B5606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C0B5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c+Yl5ksu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y6rqbLvaakw1Vs5JNP6HAQoycmzxKnGquwpiedhS5iA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794966981; v=1; x=1795571781;
 b=c+Yl5ksuFks4bXzGXIRBhDrdwPDqKw8yjrT6MBVuUpOSj58OYSRyKfNNxoUUVjBtfaWI5GG3
 8yWN0EgwnjmEp2K/IjgfpfKA0EfhxE6qphLKWEtaVIv4rF9sf5GYXQY+qJ+GCIUvJJcixkfhY+q
 aYPV2rid9dWX5dNT4RTzSUtI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e19851a3f875c143;
	Wed, 18 Nov 2026 01:56:20 +0000
X-Mizu-Trace-ID: e19851a3f875c143
X-Migadu-Flow: FLOW_OUT
Message-ID: <ff9a041f-27fa-425c-b2fa-4cb6a79670d3@linux.dev>
Date: Wed, 18 Nov 2026 09:56:14 +0800
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
Subject: Re: [PATCH bpf-next v2 2/9] bpf: Add log support for tracing_multi
 link_create
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 KP Singh <kpsingh@kernel.org>, Matt Bobrowski <matt@bobrowski.net>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20261114150610.84507-1-leon.hwang@linux.dev>
 <20261114150610.84507-3-leon.hwang@linux.dev>
 <DMX8HR7NDP9V.CDDWGLZ98C0K@gmail.com>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <DMX8HR7NDP9V.CDDWGLZ98C0K@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/26 13:24, Alexei Starovoitov wrote:
> On Sat, Nov 14, 2026 at 07:06 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>> -	if (!cnt || !uids)
>> +	if (!cnt) {
>> +		bpf_log(log, "tracing_multi.cnt cannot be zero.\n");
>>  		return -EINVAL;
> 
> The user sees cnt == 0 in his own code.
> He can't see which of up to 1 << 20 ids the kernel refuses.
> That part stays silent:
> 
>   bpf_tracing_multi_attach()
>     check_dup_ids()                      -EINVAL
>     bpf_trampoline_multi_attach()
>       bpf_check_attach_btf_id_multi()    -EINVAL, -ENOENT, -EOPNOTSUPP
>         btf_attach_func_proto(NULL, btf, btf_id)
>         btf_distill_func_proto(NULL, btf, t, tname, &tgt_info->fmodel)
> 
> The last two have messages. They get NULL.
> That loop runs before trampoline_lock_all(), so bpf_log() is fine there.
> can we pass the log down and name the id ?
> 
>> +	if (cnt > MAX_TRACING_MULTI_CNT) {
>> +		bpf_log(log, "tracing_multi.cnt is too large.\n");
>>  		return -E2BIG;
> 
> that's not a helpful message. -E2BIG says the same.
> 
>> +	if (attr->link_create.flags) {
>> +		bpf_log(log, "Invalid flags.\n");
>>  		return -EINVAL;
> 
> Each value but zero is refused. "flags must be zero." would make it clear.
> 
>> -int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
>> +int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr,
>> +			     struct bpf_verifier_log *log)
>>  {
>>  	return -EOPNOTSUPP;
> 
> The stub has the log now and knows the reason.
> 
> Consider something like:

Ack. Will do.

Thanks,
Leon

> [...]

