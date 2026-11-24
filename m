Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536682;
	b=OeBXzh+Bc6v/T/O3e4rbv9Uk1kSTz+p1Isz3K8NpUzgbQnltV3h0U+sb7qvSHuozHZ7k
	 mtlVi/C682As58fxq+ID2mlJIhUojf45qg0gicumfATdLXB91RmqiOBUO4shEiowBhwTi
	 4cgJfsSVblJ/NH/e8DeWVoueaJX2TUMjLw1G1Iq+RaPxP56qgh8Kq4yziH8iIW/5IszO0
	 n36Ptifz4rk1JwbPq0mXtlCkQp7cCEdnALv0xldfKguZm0LOUZ+aJpY6MD2wZiP/hKJrZ
	 ViR7KjDpqVKxOHfEZFW8Wg6mkMlOeem4D/mygy+9T3PJUbJ3Flk667pTL4aHMgjdkYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FC1Ad9FNE9LJrnknPfG7UGlh7vjFQN9q+d2pNc+QVWk=;
	b=0qVg24ZSNI+e60pgxSPNpMYTLdK6DEQR899LJdMhU7NZjmW3AE8J+IXiVywQ9loutjZJ
	 7zsVnZgy7YUADnFwh3k5OUyE4zGviOreTzdrHHfrtwPZNFjZgsu4hTdN5CBYkL6UrKdE0
	 lhfZdbzgah+BpikZcSvbupb8BYcZeFZJ76GSuMOA1SbROT4U66cn4Qtdh7thOKd6c42An
	 YSlPQP4mJSaRxHdvePViBrhS9g2R/pqxH3A9aDqM592u4ylNn712FitqjpY+2HplueHes
	 rFp0p/QzmbmiU1oIH+mR/Alav+SCJI02rRGAKtVKh8hGWD9i8CyszoEy/0y9YGyJ5Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2xhrgeo;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E4606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2xhrgeo
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso1289923eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795536681; x=1796141481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FC1Ad9FNE9LJrnknPfG7UGlh7vjFQN9q+d2pNc+QVWk=;
        b=u2xhrgeoSe9s2a01GZXjhi8FRnpDReu1iW63pjIiP/wa+q6vgm38CJdr790LX9+Gi8
         +5oGZ9isel2dhyjRkYx8e9s3Bvu6tjePO5kSCKMGDI26cKz9S2TUFzSJHxBgTCqlPEv8
         PzhiM/OUlMVPRKlOuxHnbdkofWzWsXWp/wymaY91Db/MjJICELVDigSAFl6DmgnkrViG
         7k9raRfLRolgHUq8LjJqzrnDE1LIeeRzVvxsMMgAhLAe07UD4tbnx8ZXptxDc16d9EeP
         E1nk7Yavo+aUOcpuOei2skcL5QH+z0A9wxK87uGIb3uWPDze0WRbM0PWLeQiK+NQWzgk
         ssOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536681; x=1796141481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FC1Ad9FNE9LJrnknPfG7UGlh7vjFQN9q+d2pNc+QVWk=;
        b=AL0EhY+/ENeBUWzMgE6eSz0KAGmapDuM2TMAVs4uVb5tHadqQnqQFPTFRW34Pm/rgG
         o0uJ8zAypSIhhmUj6hANypSSh5oTn+Y9eNcyuSbIWrud1WRBbysKQp0S827DiccdMTtk
         s1Y4uULyfzfw2OGzTzYzGpXPLYqdACr0gNvmIV7IZezII1YGrUnvV2COOuEMf1KvQVs+
         brH0PgEet3koOTqiEALD+dh0O8oF0qA9TFkO4++IAMfaKtUCJW6N4FazcJjUxdOHl6N+
         QvZ/5X4JCL2b5+lcfkwTxFE4zIEhjWNRfodIu+U2VKHhTMTzr/Tek3Ircl4LL4tslqww
         1A1w==
X-Forwarded-Encrypted: i=1; AL+hErGTcTxlhkNZFF3AcpbfexR34RAbA7xzOYm+ajclg97nzzhnu9NFKHbOi7/rwR17RYzag5hIvFVLrng9t/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DQmLPV6K10Nhr5E8pSqexIkdQxEV4G4FHlSI67wWCPpCiNs4W
	Fb/NNyY3DtjfaHRUAr6Ky/hGrU2ztp3M15FiPJ9MqIDgmU/5EzTr6dTHUVCAJw==
X-Gm-Gg: AZFdTZc5hnP5elnSk7vwmy0n4mnLuVe6ahwuwiW3s5wuff/nbYERFIieZ0mjdVk7gW3
	rKbNCHXeuYmoZBONkDJqhe37z+lYeYiR+GKoLLp2vbJ0bhBOiAd8WsQ9K4jmwpWtAXEK+0drWHc
	BPgrGj0Q5xpfqkLuVylddM6nkVOo+7zIs8s00GDyY6kvZCrdNCXAaD440Hu9ggx3643W8rUEaL+
	ia0PM17Bv1M8W+cdHE5rySOxK/21ggttyjrAOQmZup5vzMSOuTg7EtE/Nk1BBdTv5Rv7pCqZxFN
	QaZCTSCybYihF5vyouAsmT0ArQ8Roj10uR069CW0WPv0nSTzCNMdZi895T/dgdSnrv4dbGk/gow
	i+b9ZNdf28iXASk4VaqoUFa66zCj2tL+eC6itTfF8lsHMomomu6sjPMq/rjhn9Po5pZXok9Hw7f
	/VbPj71MCnjKFAzbQLLuqx+X4KcxfYUN2ZKkYEgbX2eiTZSJO7JISja3MfsOeHHK1+v38zYvYRi
	6bGgOsbEfyNCj1+DaYgNeP7svUAiO3KZ++W2aUGTWcXyhRb2ygNO1XxJ7n2L/PxHTlzNGrAqkIF
	bpzIlanaoZJ8USOz3rN/KRZ8CetHqZlMTCFeU984pUpWSN2e3KULug==
X-Received: by 2002:a05:7301:6192:10b0:386:a7f2:88e2 with SMTP id 5a478bee46e88-386a7f28967mr8524445eec.23.1795536681241;
        Tue, 24 Nov 2026 08:11:21 -0800 (PST)
Received: from srsys1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm21043446eec.18.2026.11.24.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:11:20 -0800 (PST)
Date: Tue, 24 Nov 2026 16:11:16 +0000
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: reject oversized exit_dump_len
Message-ID: <awW3JGUuyom8oG04@srsys1>
References: <20261124100508.1060692-1-rhkrqnwk98@gmail.com>
 <07a90f0f36c010fffb626a80b6275772@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <07a90f0f36c010fffb626a80b6275772@kernel.org>

On Tue, Nov 24, 2026 at 04:05:29AM -1000, Tejun Heo wrote:
>Hello, Sechang.
>
>On Tue, Nov 24, 2026 at 10:05:03AM +0000, Sechang Lim wrote:
>>  	case offsetof(struct sched_ext_ops, exit_dump_len):
>> +		if (*(u32 *)(udata + moff) > INT_MAX)
>> +			return -E2BIG;
>>  		ops->exit_dump_len =
>>  			*(u32 *)(udata + moff) ?: SCX_EXIT_DUMP_DFL_LEN;
>
>Maybe read the field once into a local and test that?
>
>  	case offsetof(struct sched_ext_ops, exit_dump_len): {
>  		u32 dump_len = *(u32 *)(udata + moff);
>
>  		if (dump_len > INT_MAX)
>  			return -E2BIG;
>  		ops->exit_dump_len = dump_len ?: SCX_EXIT_DUMP_DFL_LEN;
>  		return 1;
>  	}
>

Sure, will do in v2.

Thanks,
Sechang
