Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175358;
	b=xILIrhOORDG6lBiDOsbIljZU4XjCTX8A/47CVTucBAmUHEXDxGSDJFHmlP6X9mMFJ5Cj
	 /eWtHKX+USMG4PuXE+AVZXCWTWsOvWXkC+Dpxn2iakSm4bLLd5nHqwoCN3Rij8erbBKhF
	 jy+//Fh+Vsid+pgUyGiG3vdDQLQn/eVdlH+eXXV5+NHPyIEm6+uYP3WKx/Bx6OnLYPJVE
	 XX8OQBgk8N3v4PVyIAl0hwYm+z6toB/NXuG0uc2jIDF69Kwv+n9r6fmhfTc/Bv2NTmktK
	 7WNWAQR9/TDVb1AtL0Yk2RBkifnY4AfB08lpbUlu3ZsEb99STRKYhQuBzGlVjL2J6pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175358;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=Nez0UXFsumo3+L/J9xcaupNVhnyClOnzleCniiAWq/4=;
	b=mEGOhrWnFA9iv2cM/RW4alJOQm8crlMM+nkuJTaS/WddJiZ1D1/r6+jCSVLFmMrYLl+u
	 WQg7ARKFlp2v0hpONBlWcNsVq8eultmkmDAEVOWWdfLdOpIgPTdKUPBXVh19jLFueWPFD
	 NQ9YOX2zFUATlEGl2c1yCb7bBRAP47Bw60sRYiLywk6dwe5Lrzmas7Ju7G/Dbkn8EnV9n
	 KreENlGVqlQc5hLQvIG/Z3Lx18W+bkuW6Tc4Get1vOZn6y7oxecI02tbIpUoiSSUxN1Vs
	 ZicFk+ka06Kjj5pOgz2XT6FTcol3gUz2zuvluz9UmhmLNLIkqbqW3GBiIB6uGbZALVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bUfRfa6V;
	arc=none smtp.remote-ip=91.218.175.165
Received: from mta0.migadu.com (out-165.mta0.migadu.com [91.218.175.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25F60A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F25F60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bUfRfa6V
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=leJ4NXueywkyUGIe5I/Fu1YvErAj1SAfTfxmCLv2MaM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795175355; v=1; x=1795780155;
 b=bUfRfa6V5yk2xNssa8St7J6F26hiMa7tDe56hOz7a0v/EFYznmNwCULoBz1n/X+BnLIpJf0V
 5T42Ez6EGt552ur9FDYr5taxUJMZ4TW4HdDWmij95lsgloqhz74crf7ztygbzI8IWbAnWTFYRSg
 4TPG49wup3meQ+BKKAx9Y8XM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7924206fe925bfd8;
	Fri, 20 Nov 2026 11:49:15 +0000
X-Mizu-Trace-ID: 7924206fe925bfd8
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH] mm: shrinker: stop counting when the seq buffer overflows
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261120110538.3256962-1-wangxuewen_ky@163.com>
Date: Fri, 20 Nov 2026 19:48:54 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 akpm@linux-foundation.org,
 david@fromorbit.com,
 qi.zheng@linux.dev,
 roman.gushchin@linux.dev,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Xuewen Wang <wangxuewen@kylinos.cn>
Content-Transfer-Encoding: 7bit
Message-Id: <04D634C5-9E6D-4AB4-8863-63CAFFC60D8E@linux.dev>
References: <20261120110538.3256962-1-wangxuewen_ky@163.com>
To: Xuewen Wang <wangxuewen_ky@163.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 20, 2026, at 19:05, Xuewen Wang <wangxuewen_ky@163.com> wrote:
> 
> From: Xuewen Wang <wangxuewen@kylinos.cn>
> 
> The shrinker debugfs count file uses single_open(), so all memcg rows
> belong to one seq_file record. When the buffer overflows, seq_file grows
> it and retries the entire record. Queries for subsequent memcgs in
> an overflowing pass cannot contribute to the final output.
> 
> Stop the traversal once seq_has_overflowed() is true, using the existing
> mem_cgroup_iter_break() path to release the current memcg reference.
> Leave the overflow state intact and return zero so seq_file can retry.
> 
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>

Acked-by: Muchun Song (ByteDance) <muchun.song@linux.dev>


