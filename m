Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412881;
	b=Juqs48rf0UobY0+QEo0jUXmwa43TdaD4gc7dzyBfhvd4TjUe1FNlPmdliL6PxE4k5BQI
	 k9WLoXJJmuMy1fa4wMVTI8NKNAMyHcNQKR2Sci1eKVKLk2stZ3Wp4ntR3LNPDqEBmz13s
	 pDt3YVuvlcrZUto7Qhpudzbg/PVu17vy9mPsB9dzxpONOSc2CocodumyEchqjqdWud+Cv
	 X3j8CDp7hUvHqM1/5P13z5I5LzyhrJqHFconUtrBCnNcfJhuaogKpmaLl6pzrhuOeF3Zn
	 JmRQ8BxveLQNr8Xbbi5mqD6LqdMG6dHoDhVAidFF1x+j77fR9ZBnEochYONR+DuPgcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412881;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dDm8enaXt6KUbR62lsJrwlrH92JPOg+x+WMgonNOw3Q=;
	b=NAYljVmAl/ngwtO0yRU/dZzWeIg76AMH8Yxgct/FnJZ9o8/jqFk9if8+uR16W/q7O6Dn
	 +KERg8K/n6YhbFf1Uy5xf8Fr4DuVX3exi/UgXsM/s92cjsaCTV9dhUoueAUmtooIRu1ZS
	 3sL6LfxbAEM0zKeSWz5PkORc6oZ12URB1ruSss42CJX4ZDzvVkYGNsPwRpvXQ13ebPNwT
	 qMuPwmChxpwPwpdEse6EUV6/0mfB/PxccJaF9KdWxZlbkCupiZD82XmTH5glKOnlmqJvc
	 N3zGFjC1nQ/RAQGJfIwdfK8Y09E+Ut/05sPb/DOiiU9f+JrblPMxA0T+VtMLuj8nbqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HXAj5Cwg;
	arc=none smtp.remote-ip=95.215.58.206
Received: from mta1.migadu.com (out-206.mta1.migadu.com [95.215.58.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38512606A682
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38512606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HXAj5Cwg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wtYxCaOhkKaQS027UbI65HwTad/cCHg0b6t7j6tNI4g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795412879; v=1; x=1796017679;
 b=HXAj5Cwg8JsdMEX62RtpSz1rJnRKfzMWAnrTfQotgWRYxcmbPv2WbmgemNP215ltoagybytd
 YsU9CabcszyCy1aNewKGYbWPoD50BP0XfZMzrL8ZE37EK1bO4byuDkvSGcvcWjiFUkI/tnjr54l
 bxqQH/KvuSiF8+JWjaarDMYE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 02b9e5797aee865d;
	Mon, 23 Nov 2026 05:47:58 +0000
X-Mizu-Trace-ID: 02b9e5797aee865d
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 13:47:54 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH net-next] selftests: net: sk_connect_zero_addr: fix
 mislabeled connect diagnostic
Message-ID: <20261123054754.GI10218@Liu-laptop>
References: <20261120063011.21557-1-emmaonana18@gmail.com>
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
In-Reply-To: <20261120063011.21557-1-emmaonana18@gmail.com>

Hi Omokefe,
On Fri, Nov 20, 2026 at 07:30:11AM +0100, Omokefe Emmanuel Onanaroghene wrote:
> The connect() failure branch reports "bind fd2", copy-pasted from the
> bind() block above. Name the failing call.
> 
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> ---
>  tools/testing/selftests/net/sk_connect_zero_addr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/sk_connect_zero_addr.c b/tools/testing/selftests/net/sk_connect_zero_addr.c
> index 4be418aefd9f7..4441e9c62fde5 100644
> --- a/tools/testing/selftests/net/sk_connect_zero_addr.c
> +++ b/tools/testing/selftests/net/sk_connect_zero_addr.c
> @@ -46,7 +46,7 @@ int main(void)
>  	}
>  e

An "e" here?

Thanks
Hangbin
>  	if (connect(fd2, (struct sockaddr *)&bind_addr, sizeof(bind_addr))) {
> -		error(1, errno, "bind fd2");
> +		error(1, errno, "connect fd2");
>  		goto out_err2;
>  	}
>  
> -- 
> 2.43.0
> 
