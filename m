Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795230109;
	b=qJwGFKnTFyutS6pOb+zxdAh3IaLLFjJqcJTAafFJck+JnVWdDJf+gK0eVuOXM4otd2DZ
	 1Ly9wWROgbSwkFHUsZlz3hIJCC3TZBBJmZqg8VPXuE6yU54ERuS9iodTktcgiZAdifVwF
	 xHgR/qA6RlNuiXMRdEvNvTLgATcwQYuYYy+89PlLnQhGAnh+Ct1MGxhFLxzOm/7OxAegD
	 OE/2IcME2WWQMnWDCbUJq+XvtQNLmnStX6ToYpsAeIUHYnMlh+AMguu0aT9fecb6hszMa
	 1QPHnxqwMA55TaJWyDeqv6IeU0dDcmHDd5bQMAuzS7EBhbP37op7XEFrf37eYtY0zIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795230109;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ywPoIWURrrH5KkyxwY1SfMOlMWxZ7GGIQgz38Z63dWc=;
	b=Vz4V84E2Q/d2IUnKif/EkXWUuSH6IWSOVIucVq7m9qCHZTpP7LRIs6PHOb0WtFo8HE10
	 xbJ0Qyh+1z8TMVdWCTITCqBPvogU2X2JWTJ4aua2PE9A8pbMBVSkcf2a0EVxTCMDih2j7
	 sZ+M0pBjVgrmHDKjP94DarU14/yay0dFuM/haEhYNSskzsru95D2LQWjnmrLsm+sgPGi5
	 PkRzjYRQGYyYEfSl6yfN9ixwglR1nKoJvHZRwEkyACb89BbMsN2hOCPGgceCr/XSEoS4v
	 bcyxXbFmYWdE4IC/xU3Gj9MxoqLIs9B+fDgmDfBlUUsLUG70UqiH7ibZzm6dGZOgLlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pywxHqlj;
	arc=none smtp.remote-ip=91.218.175.24
Received: from mta0.migadu.com (out-24.mta0.migadu.com [91.218.175.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59465606A6A5
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59465606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pywxHqlj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HSZLlB8/kDuoQhQ6wWt7/Tc4Dx6a2fEeRsBjkzGgzGk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795230106; v=1; x=1795834906;
 b=pywxHqlj9Ow0eAN1QZC03eR6snLyms8HUB/VsKpg096Oo3NociFQ4RZjrES4YyhdIyQBPiC4
 E9mMteKhWUshO7ZndU/SwYZcWr61jqGNT+V+wAL7gMo6jOmFnYOzJY1Iz5UffQujOnEPBHSog/m
 AFUvyP2F2U3Z4DVhGpuW/I/w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 50e77010917d361f;
	Sat, 21 Nov 2026 03:01:46 +0000
X-Mizu-Trace-ID: 50e77010917d361f
X-Migadu-Flow: FLOW_OUT
Message-ID: <d93d15a1-cf67-4395-b2ea-2af05afc7001@linux.dev>
Date: Fri, 20 Nov 2026 19:01:39 -0800
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
Subject: Re: [EXT.MSG] Re: [PATCH bpf-next v3 0/4] bpf: Check recursion per
 task for preemptible programs
To: Mike Bazov <mikeba@sentinelone.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Martin Kelly <martin.kelly@crowdstrike.com>,
 Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
 tyler.wilson@crowdstrike.com
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com>
 <9a47ede3-24fa-4fa3-8d7e-50f221de0929@linux.dev>
 <CAPnbwjpmRCR3F4V3StUz=702AdWZzHHZjP68GepnYdYykjoC8g@mail.gmail.com>
 <CAPnbwjrQcd5R0aqNKeJV3wWuMcTTsxsamxpKVpKY7Za2xKB1gA@mail.gmail.com>
Content-Language: en-US
From: "JP Kobryn (CrowdStrike)" <jp.kobryn@linux.dev>
In-Reply-To: <CAPnbwjrQcd5R0aqNKeJV3wWuMcTTsxsamxpKVpKY7Za2xKB1gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 3:22 AM, Mike Bazov wrote:
> Thanks for testing, JP.
> 
>> fexit (marked)                61      135
> 
> Marked programs take the same per-CPU counter as before, so I expect no
> change there. How many runs are behind these numbers, and how much do
> they vary from run to run?

That was 3 runs taken over a 30 min sapling window of a specific workload.
We changed from a timed window to the full duration of the workload and on
5 new runs, we got mixed results. In one run, we got the inverse where the
miss count was higher before the patch. But this is only in terms of marked
fexit. I think this is noise from system services. We're in the process of
building up a new harness for this issue so I expect by next rev we have
more consistency.
