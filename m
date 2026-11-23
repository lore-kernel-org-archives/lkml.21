Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415162;
	b=r9pOwzauJY8dGUiMVX8PMcLMNqCK/kGlWCpfw0RptQjT74f8vEJN9TXUb4pk+WTNoZHD
	 yNtTZThcJoMhU6+Rv+tngrKduMADytI4B8rK6NmUO0ORRPOOWBZOCzM3EJe/YXD/wEXUS
	 OX8ykBtWaYRHM0a7+JhErmCpnCyzFWP1vXS5HFnc9d2LxmUfJ6EGFlz4VLUM7K6oyjVIB
	 acTk/jREE5Hpnu0b5ug4e0kuIfBN1AGta8ylSSYe+qmeYxr89Mnb2I97q7ElWAwCDUmar
	 ihqomzABxo7IuGT1ugbIRAgrnGXe3L+zY7c191cEJKQgcq8D7FVtXDRr53rSHnYDjQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415162;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TIdffghSJlSSvoACGCvht+x8YKlpMwi7tdF6MONLBA4=;
	b=KOhrW/mvkVun8uUpYJ3XQzKpU8rYRfPKKDqsogiTcU1TmR8AGeW2QIhjvWuOZFxkgUiO
	 2MYGL5G+2ir++tVT4wGast5VuQxtnCJWS62vFLUSHqPNzXWV+A1o0X6FWJ5OGPx/P297F
	 SkZuuipOVh6HylPK9L17gPxPLgafOj3WXKPx8djTexCQ2A+cNDZBuDtdC+bC4UGi1wpJk
	 BmJnv5vFWur6KFb8CaDhf2ZyPZsKUb3glHDkY9H4/hb5dLvEL36EFZTPxtiG3rzNL2f9Q
	 pLcIVkn60qBremCN9EsRYQAY8OOOuZDoNWLHYyqHQfDx+rVrvt85qgzjaDpsJkVIjsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T9CTXZpC;
	arc=none smtp.remote-ip=91.218.175.143
Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01529606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01529606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T9CTXZpC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8RgpuFL/0AjtN2cxvRLOw38i1czpAgoobTTA4kOjNqQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795415160; v=1; x=1796019960;
 b=T9CTXZpCHQA70sjmghMjTe7L9ao2bYAe4shfeXnIb5w8uKId7ek+F3WdSIr5U5NDh8No77d2
 VQf4azBExrN1jfg6rOrvbBUZ+MNFN9tFgFYNMqgcoUFglk3dUIQrdBLMrEPlddVw1qdI96/zFb+
 VFie1u2KkFOBpw8ujKreF4rY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id ed972c9e76fd63aa;
	Mon, 23 Nov 2026 06:25:46 +0000
X-Mizu-Trace-ID: ed972c9e76fd63aa
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 14:25:41 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Cc: Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <ricardo@marliere.net>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] selftests: pass the timeout override to tests run
 in a netns
Message-ID: <20261123062541.GK10218@Liu-laptop>
References: <20261120-kselftest-run-timer-v2-0-9802690a370b@xs4all.nl>
 <20261120-kselftest-run-timer-v2-1-9802690a370b@xs4all.nl>
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
In-Reply-To: <20261120-kselftest-run-timer-v2-1-9802690a370b@xs4all.nl>

On Fri, Nov 20, 2026 at 06:25:28AM -0500, Jori Koolstra (CIQ) wrote:
> When run_kselftest.sh is invoked with -n, each test is run by in_netns()
> in a new bash process, which sources runner.sh again and then calls
> run_one(). Sourcing runner.sh resets its global settings, which is why
> in_netns() explicitly passes on logfile. kselftest_override_timeout is
> not passed on, so -o/--override-timeout is silently ignored for tests
> that are run in a network namespace and they use the timeout from their
> settings file or the default instead.
> 
> Pass kselftest_override_timeout to the netns shell as well.
> 
> Fixes: 9d0b4ad82d61 ("kselftest/runner.sh: add netns support")
> Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> ---
>  tools/testing/selftests/kselftest/runner.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index 45fb8ec38493..bbb2e61f323c 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -169,6 +169,7 @@ in_netns()
>  		BASE_DIR=$BASE_DIR
>  		source $BASE_DIR/kselftest/runner.sh
>  		logfile=$logfile
> +		kselftest_override_timeout=$kselftest_override_timeout
>  		run_one $DIR $TEST
>  	EOF
>  }

Thanks for the fix.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
