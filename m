Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880650;
	b=NG5p+fih0jgHGTA27gV+M43BpGlNyuKBhr5XWHm4zEvFOTzX9XGsbRRIYSSsws+w+5Y/
	 Tvt65L+O9FHzepbG/CKeSeQznMV9nJ8codiruOB+UN0GDX6iEBIL8lKOVASIzCA8PMaCW
	 spqbNXBTpZ44MboGuwoxVXTp3wI56WshfsHtLdmQpHw05nLoqxCPatzvSNYUYB0gGr7hg
	 AdNZb7bNKXoOawPsiI8YxERPuipt8zOqqZ1JxCECVfx9E5EuvD9xXegOxlAlK84xm27Tn
	 v+81z5QaoxWzxZ5P3rVbpHbQ/grs/1GQrZ8uBTwWxxVOP9EKXfXNic5FJTKpOQzPT9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880650;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jmXAwhrQ5ymbsUfCpF+AujjmPlx/SR9pWQPVUIPpwIw=;
	b=Nu4Yv/zlDq3tO8OFRgCSAEzZGRz3aUVDJoyBE9giC+kyMciazQxdfoNfpxBMx+bKQkXK
	 t5l/A4PNuH2j18Xeg7aAY4BvJ6xcLsHB8BMgOssp6G8F36zFvnBl0bMZrS6w94pEpUVii
	 SBN5HhAYWkeYnwgz1fIlKUBBVm7Quhuya2sz2UkqURFtEzlCaKcZsTFMrHweeWp+Qvb/B
	 i7izWYzu3cGoQQJFr8Qee7+j/5wTw/1I/T7Uou/oCZI5ErFVIMr0hQ0YEvO9lXJ/2GeqC
	 AkrzplVJjpPAqO5PJZ20GYokZzw6eO/n1ZSoOb6XhPZT+CTNsALzndl1gGjXcOMrnNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nr65j7en;
	arc=none smtp.remote-ip=91.218.175.98
Received: from mta0.migadu.com (out-98.mta0.migadu.com [91.218.175.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397B9606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 15:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nr65j7en
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h9/ojpyf9XJxk3yOP6Ru5jzVP3UP2xz3CkNyDRojkGg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795880647; v=1; x=1796485447;
 b=nr65j7enY8Gze4TdPO2HkpNHdfSfJhuh3VTv3k75nl0qMufqh/LYs4kSa40y6pRgiLS/6Jv5
 nTAmmI/UQCW/i4NT+3PivhhdsHBMZQBKizst30k+DViLvuDVsglRA+q/wHbLYyNxVc0kX3dQPeV
 2o62G9fmZp4GppCfbScQTIdY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ecf4b895d0f29da1;
	Sat, 28 Nov 2026 15:44:07 +0000
X-Mizu-Trace-ID: ecf4b895d0f29da1
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 15:44:07 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: ndokutovich@gmail.com
CC: brauner@kernel.org, jack@suse.cz, jlayton@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: Re: [PATCH 0/2] listns(): validate the reserved spare2 field
In-Reply-To: <20261128140623.19-1-ndokutovich@gmail.com>
Message-ID: <2DE3E250-2C87-4816-B96F-CD951F02BD6E@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 28 November 2026 14:06:21 GMT, Nikolai Dokutovich
<ndokutovich@gmail.com> wrote:
>copy_ns_id_req() rejects a non-zero @spare but not @spare2, although
>struct ns_id_req documents both as reserved.  Validate @spare2 the same
>way, and extend the error-case selftest to cover it instead of only
>@spare.
>
>Nikolai Dokutovich (2):
>  nstree: reject a non-zero spare2 in the listns() request
>  selftests/namespaces: check that listns() rejects a non-zero spare2

Had a nice read through, thanks for the tests, for the whole series, let's
put,

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>

Also, a nice question, since I tend to be a bit ^Winsane^W

Is this bug a edge case? Most bugs found nowadays in the kernel are edge
cases, but they would still need to be merged, because again, it's still a
case that can be reached.

My question to you, is could this bug be actually reached? Like, would a
future caller set spare2 as non zero? would the driver maintainer for
example be silly enough to set non zero spare2, probably knowing the
consequences (if they understood the code), well, if they didn't, it'd be
their problem, no?

I had a look at some callers, mostly selftests, and they all patch up this
correctly, so this wouldn't be reachable RIGHT now. I added my tag because
we will have to account for the future callers silliness (adding non zero
spare2)...



>
> kernel/nstree.c                                  |  2 +-
> tools/testing/selftests/namespaces/listns_test.c | 11 +++++++++++
> 2 files changed, 12 insertions(+), 1 deletion(-)
>
>

--- Thanks!
