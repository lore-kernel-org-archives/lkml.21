Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800709;
	b=BCBfuAUqRCI4H8MtP8++jR4pxDuzRYXJTgFkJHl1ov1b+e9qWvsW2fr93H1zTEoQTGH+
	 1taJiwq9mMXHGn5HvYaGtgTZ9F3ImHbqzZclhAakEUs3L8VcJb5mWKwJkxmNabeOE3Qm4
	 8BccOuABjFi1ff6SmA3Nm2WfanpF7gZwQW+m7gwIqBt6SPbLk4DM1XnPCQOtHjLX6XMJ3
	 YuvuvP0hLYPX2sqEudz+g7b78n2EC6DjqzOs+4gocGQY9BoC4BvBvH5m5ljc4hy0MJqRd
	 D66VVxMt5cAo1wk083wogSsaQ1skKMuhKXAx+4++m9Yq26F36DJcUOUbIxcjisRoXiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800709;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AWQWqXywBDDIWRU4zWJSNieOsk7Xn0x93AX3BFvtQ/g=;
	b=sTxrHR2QBJK9xOh5aNVUWEUAzN6Scx9Z3AH97Nugr2hhVtFVso0CizKN4fQe0ILYNb/f
	 m/wNEc7qouv/+ENruZHT1BtItM3LrIm2DZOs3H3+wGWxywgb12hKgq0ilhqdShEqR7bbP
	 0+QfPAhlpUUc4y0SXRK2J3iJfKqoNWPd0JEQZzC+4NyMyqOlW2OZpvAPZi9z5QLmjyF31
	 wXHjOpHixFaf18927aq4N1HIj9C/kE8lpCESf/nn77FCNBwxw3vhzB9fWzdiNL5C0tPFi
	 vAGHnHOVtw2mXQJUiPeJ4FruZF6r0Jd8yNc801H3VDTIJXTm4Q0SnqIXFAQqzJChQhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lYUJXOPO;
	arc=none smtp.remote-ip=95.215.58.198
Received: from mta1.migadu.com (out-198.mta1.migadu.com [95.215.58.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28319606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28319606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lYUJXOPO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AWQWqXywBDDIWRU4zWJSNieOsk7Xn0x93AX3BFvtQ/g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795800701; v=1; x=1796405501;
 b=lYUJXOPOld0Hvr3XUnF582/5EMDxc/17bMRAGsF0xD3Q+bPVMxME66GD+mnW69VXhyp6W3Vr
 urKNWECySjoaKSD4BCHhLUxLl29iwyB5JysKweVisx7pUltc+qUj3iCIkLzniGBpH+MeteHv8WW
 dxNGTQyZynAu5OLpjlomY/HI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 30ae3ac87ed445b5;
	Fri, 27 Nov 2026 17:31:40 +0000
X-Mizu-Trace-ID: 30ae3ac87ed445b5
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 17:31:35 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Will Deacon <will@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf] bpf, arm64: Fix jited line info off by kCFI hash
Message-ID: <20261127-jf-arm64-bpf-linfo-reply-will-r2-648665e850e0@linux.dev>
References: <20260925-b4-arm64-bpf-linfo-cfi-v1-1-e930ab335170@linux.dev>
 <awmhAIbMV7qo608O@willie-the-truck>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awmhAIbMV7qo608O@willie-the-truck>

On Fri, Nov 27, 2026 at 03:25:52PM +0000, Will Deacon wrote:
> I'm just chasing up old patches sitting around in my inbox and noticed
> this one. It doesn't _look_ like it's been applied anywhere. Is it still
> needed?

No, please drop it. v2 fixed this in the BPF core and landed in
v7.4-rc2 as commit 3e4279dc5144 ("bpf: Fix jited line info off by the
CFI preamble").

- Jose
