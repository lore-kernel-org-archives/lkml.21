Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880992;
	b=HJ64GdioDeT60rUvtG+0jL/x8xigW3Zs0GsiHqqEqa/k2ygDv5AHZVBWai/ktE4vCPhx
	 RM7i340X1vwyzdjmv4qbTtKDVmmK9HW/UI5JnI/axKtFHWUXrZgZMNSm7Q5P9dgFV6vLl
	 KoVB9aNHsairVaqKQmu59iYSXak7seh9o7j5yJgkfk+Do+y6vGo/PPQWCjH87h2I5jJCF
	 ZJEVV5LJRCVJn2UZ2zlao+lmLL7jvIM9RBQest/fmepvxaAi9EHTqDTJVFbSf4OZY40+c
	 b99QWrym8cX9fr4yOEVmU36r+i6Jv4gl3OUkj45AmgwIbgIBmRwbgMlJBT3o4G84kxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880992;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3tDHcCr13zYeauyEYlS1W+adMoKlAGX2HKcZrR7frLk=;
	b=PYrYOK6iO5iwdvhpwxDpaTkQFZapJG40umf1UVZmIAPdibk78fUVgEUW+JdRrBZ2IoWD
	 LUUZBoQU5c/Vf3/XSq5a4o/stA+lQyFPmGc98qJvw7CSDOu+AXHwZpPui+kQUhM7WTp1m
	 PXP8srmXDRjE+nBWGtZXBSm5M64DyhN9S3XRpSTbz4UlrtdsfU7cAF+HzCEKXNqu330yG
	 iSRV9UPtCUYO0qghJhCKz1IbQY6GoeyY/mX0qjHECsqvFmT3nch9AepQMtsS6n9AUkKke
	 CG3+/OkvKqJgDxV+b9fi6z5umiJkpBBWatEN4e39L0VrFSlL5DHkU3s6eI9WtTCA1Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eO2HPSA0;
	arc=none smtp.remote-ip=95.215.58.184
Received: from mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CE3606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 15:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81CE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eO2HPSA0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=x/SfbLT+C+46sgDmsdu/nt9Gx03sWMPSsDca01XiedE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795880989; v=1; x=1796485789;
 b=eO2HPSA0D3vRqQrjQukuDAFkG4KVFL+qKB14HiqwS1dbt5qW3xeHA16u/Q03+UM94UnZxOQ6
 JWLQUoTKns6/0GmyFPF28bvfmsf8uZ9JB7LtOVuoM8+bIWvNOP3RRBNAvPxWKeXgGKuuVYBWBG/
 6KTWNvi7pV/zqyYc/slnqtbQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 05e75da0e92dddfb;
	Sat, 28 Nov 2026 15:49:49 +0000
X-Mizu-Trace-ID: 05e75da0e92dddfb
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 15:49:48 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: ndokutovich@gmail.com
CC: brauner@kernel.org, jack@suse.cz, jlayton@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: Re: [PATCH 0/2] listns(): validate the reserved spare2 field
In-Reply-To: <2DE3E250-2C87-4816-B96F-CD951F02BD6E@linux.dev>
References: <2DE3E250-2C87-4816-B96F-CD951F02BD6E@linux.dev>
Message-ID: <B26886EB-B8B6-4892-B1A0-8893AA79343E@linux.dev>
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

On 28 November 2026 15:44:07 GMT, Bradley Morgan <bradley.morgan@linux.dev>
wrote:
>On 28 November 2026 14:06:21 GMT, Nikolai Dokutovich
><ndokutovich@gmail.com> wrote:
>>copy_ns_id_req() rejects a non-zero @spare but not @spare2, although
>>struct ns_id_req documents both as reserved.  Validate @spare2 the same
>>way, and extend the error-case selftest to cover it instead of only
>>@spare.
>>
>>Nikolai Dokutovich (2):
>>  nstree: reject a non-zero spare2 in the listns() request
>>  selftests/namespaces: check that listns() rejects a non-zero spare2
>
>Had a nice read through, thanks for the tests, for the whole series, let's
>put,
>
>Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>
>
>Also, a nice question, since I tend to be a bit ^Winsane^W
>
>Is this bug a edge case? Most bugs found nowadays in the kernel are edge
>cases, but they would still need to be merged, because again, it's still a
>case that can be reached.
>
>My question to you, is could this bug be actually reached? Like, would a
>future caller set spare2 as non zero? would the driver maintainer for
>example be silly enough to set non zero spare2, probably knowing the
>consequences (if they understood the code), well, if they didn't, it'd be
>their problem, no?

Aw I was wrong, sorry, the function is called thru tests and as a syscall.
Apologies for the wrongness :(

R-B stands.

>
>I had a look at some callers, mostly selftests, and they all patch up this
>correctly, so this wouldn't be reachable RIGHT now. I added my tag because
>we will have to account for the future callers silliness (adding non zero
>spare2)...
>
>
>
>>
>> kernel/nstree.c                                  |  2 +-
>> tools/testing/selftests/namespaces/listns_test.c | 11 +++++++++++
>> 2 files changed, 12 insertions(+), 1 deletion(-)
>>
>>
>
>--- Thanks!

--- Thanks!
