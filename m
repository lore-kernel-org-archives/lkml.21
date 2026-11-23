Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442986;
	b=c7h2S7esSG00c612lMUBBnaIYN9lwRndEN6+1PpS9yeIGWZEjg9+28+q6DZT46y6y3sm
	 Wv26B8FU+na9lcA1BJy/1UK65GnOm1b2BjtOqi+diC5Ix3Y3EgpGPB2HVxprwpTYfqJ9t
	 fcbPWpojBSv7neI/LKQtv14mIJu0rh0yYOLqciahoqKudZAmmIJhY0jruvF8toau8JS9D
	 POUVBfTsRQFxvJ6cSjbRMStoVqzewurBroNgEMpVF1thmvs6/FZweerQ/Y7kVVntwqxU3
	 eYSvF/tnxpfQLwmINj3IROntcDQWh9IBW0tnIOoQHpa5/TqXSx+c5SOK2+nWza4xs7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0bvDk5tyLJ5TwCATr3/cvszAQOWSZaHFXbKMbS8WnfE=;
	b=Xg7pFbOz/levRW9F4QM10I1MvRZ+WZR+mDVxAT2Vc52ULkakKhHOo7EWFxFh8f9NUhfu
	 Ojcbm+8La6XwIRtLOOzzReB2eDplOvhHVqJGjhOmsNURVJZU7nPn2q1Vk5FlFzkU7lCze
	 43fKgZ6LvStsCVtjuAxw9SgaxeoxM8eZr9liXVmtE6t9y/AbXzGmwbOT+OjJ+m8ikCoG2
	 u/WRV4e5haQD7zp+mV95toDifbZvWP26iuWQJMTKNHRIVR4PG28//fL4ePlTMLYbOWycw
	 KoJEf8KZxyJy72A4eSq1eBP4ORzS3fEMOZsm5ALNFtN4E8nsHssbcra8wjDEsCX3pIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=T2k610q9;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCBE606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DCBE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=T2k610q9
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso4209279a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795442983; x=1796047783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0bvDk5tyLJ5TwCATr3/cvszAQOWSZaHFXbKMbS8WnfE=;
        b=T2k610q9dq6ABxK10/kvUfovzJT448peNpB8dZUFJ7a9M95oiFWIkbejfgpR0jq3ps
         JmdtTO2qbdhrvAtfbsYXLVSDSj3iPLnoYA3AX20Nc6N5ilB23Ve496FNeGcV7q0NLeEH
         zwQuebg7Y6bLkIXAEUPHH+uSwfuw6ufCyUCvbhBU9NiUlyP57IAHmhxTFNak3+iNQoEP
         lOkgQOTDkr075zM9+0efVaR+ZKdXXN6K2z0jb78i2cdgl3LzuXCqes7vTBoEVLPtsHd8
         ZLjf3wMWaNh5pzx2RJwOE7G6lW3A4YPzGRKoRnnaO9HNICIVLd+xvK5jcsu4sWPpH5S5
         uetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442983; x=1796047783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bvDk5tyLJ5TwCATr3/cvszAQOWSZaHFXbKMbS8WnfE=;
        b=uMunEa9apEntOBfR5wXgKISEIN0pqDerasQ7isNaLgIqo8FTX1BpTcFq9bltR3YDaN
         0WAh9vLkrhefYXq/grMR/0Pt0v0OXINMQlpz1AnFhHY5oVrmDu/2IE65LrjZVB5F039M
         ge3x65PB8xbQjTgpdZI6Ts9Z4uNEzj33RV5SDmcgOA1e4B6vTxrwCw/1YOlgixo+kYlW
         Pr27ojfkw7F2rMjKhWY9sOwiFQKO/5wjYavVf5j3scGlwwkjkkX9BLv5d0R095YVwEIH
         ggzy4qEtjbqSSMWOCxDaGmfIvoGdyRsJ3+6clxawhYIAYpH1lEEwgPdDGdvptMROlUYO
         xr7Q==
X-Forwarded-Encrypted: i=1; AL+hErGUqwNC1JfnStWhYdP6e8TzL57RAlgP1IbqaCOVQu6qcasByUTJkXt0AIKmZVyJPi24HhkbshKO+biopmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eN0EX17lEFBjkTdurlEpsTiTJ/cfsxfCJgCZ5zEPwfagk10O9
	0y/n7Nfm9VNA03bhHa5jfw2aMj9OnzBfBI8Z0U2bvQk0WpPCLzgWJOtAScQg8k9pebY=
X-Gm-Gg: AZFdTZcDoVRhq/CC29DOpcGXgUkBP0idA43q+POlaczUI9blO53VFErmH41rghHqzaG
	1eSSRjIkQ3KwBwQI61gOgG+cYd1mO0h22L8ODKMEtEovithAWJrGV0JltIMDGGvQqEw2DQ3W9jn
	5798VWszj7Km7mtdaN8Z4JZ3RCUarTkuLhr/j7jZNX1BYLvNgDypm6IP7FvyvSkxWOsx37PlgRX
	MgS3VLlfaQtchYwBQG06G1hAW8ZVnbNkchr4ITos5Pm7XQpCRh6go7+ZUm0ZvoSs9j2qDfBpKRa
	dE+/KKYjsUu2FYai0b2ogri25y19DqMejWRUev3LqXd/3hzklSwTGTdXQnOyVflyhH8XD8QWe2m
	pyZ4eIEC6wB/BFiWsK9Eqj1z5u/ImYIaD+O7fenbi8Mf9tIHCStCXVi4y4p3U/UzMk1vwPuW7uw
	ofUnuo5Y//4Z2MQlNk8v9xBJzizgafPqKlQo57axu8OhFLCPnujVWDAC1NUMqsDdWzdRS4xFYiD
	02QTOkhdMxcbhLq9rjaIlzEh9zV8cC/MGwz36LLzyl703DElTrQt5OGQfc51Xk0QtM6ILU16iF0
	auzVJBUd7YwUhPJ3vnhHP6GS0sbPsU18BrgZTwNxbXtiTDE=
X-Received: by 2002:a05:6402:3223:b0:6b6:e74d:407e with SMTP id 4fb4d7f45d1cf-6ba37eb9c1emr9126325a12.36.1795442983003;
        Mon, 23 Nov 2026 06:09:43 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36d730d1sm5419955a12.0.2026.11.23.06.09.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:09:42 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: hangbin.liu@linux.dev,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net-next v5 1/3] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Mon, 23 Nov 2026 14:09:29 +0000
Message-ID: <20261123140928.13688-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121182217.4609-2-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com> <20261121182217.4609-2-emmaonana18@gmail.com>
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
Content-Transfer-Encoding: 8bit

Hi Omokefe,

On Sat, 21 Nov 2026 19:22:15 +0100 Omokefe Emmanuel Onanaroghene wrote:
> -ip netns exec $NS_DST ethtool -L veth$DST tx $((CPUS + 1)) 2>/dev/null
> +MAX_TX=`ip netns exec $NS_DST ethtool -l veth$DST |\
> +	grep TX: | head -n 1 | awk '{print $2}'`
> +ip netns exec $NS_DST ethtool -L veth$DST tx $((MAX_TX + 1)) 2>/dev/null
>  chk_channels "setting invalid channels nr" $DST $CUR_RX $CUR_TX

I ran veth.sh from net-next on an arm64 VM with 2 CPUs, under
"taskset -c 0". Without this patch, this check reports
"fail rx:1:1 tx:1:2". With it, the check passes.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
