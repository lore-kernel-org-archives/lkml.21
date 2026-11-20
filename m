Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207386;
	b=ccnOvrKDBaob0Ro3xbx/LqHerNo/6AVykjW2ZYppbmCvxp5P5pN5xMVrt85vEacUQ9oH
	 MBiz7XawPQr+ovHgp7h8qaiIqCXMkKKjcBqMDcNzTnoJxUS892wN9wkvfkQ8Jn5Lm3PlG
	 geVueATMol0WbMd5xVr+Qul//yJyEUFAWr/xsqdLyFUQo9BMOtjvYdsrHaQpDTuLHHSkH
	 aTU9norzCFJNMHwyCuCvJyhoEAYJp45CMdHYuhLWN9jEwWL0xNW0oMxPwsQlmqDBE4Cre
	 e8QQAR+0Osb/VXWLTszrOgtO2um+UfC+/BWcAXt1ZC4phcddVRbe8my+oXqYrv2Sd2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207386;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=gYU6H2/wBp0m3RHfRk6KSsrkcHEKkYUH+D3d0ccp7Sc=;
	b=5aac0wTo2H91QoWh+plHY8VoYFdROhOjuYq6Ai6xhmtCHR/H1LuE/WtJnYoelFcfD9iT
	 smR7szI5b+GbofXj36kMcn9MYbTuTS6Hr9jwzh9CbcTgMk2zyuUYa/jn5CCC6J6sWE/Qd
	 Q/8CnCgYJe/7l8dSQNM2dC/Cqz9AoEWuwqGZhF3ztMxsEii8bJixfGx9bze2Y2NEcpkc3
	 kyL1ZFsZr1sp2aOscAUDGPbbUn2BXRtDXtTCMTXK2LkNbywlPLHhUdbuVJYxb+j3XbRvk
	 rH529Xr6WeT6Acou/4M9uaaQIjgR3CNfdHg3gGKVlgny5dc5QsCOa64+SWRkn7fZ/dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7EE606A70E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B7EE606A70E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9496577d4c4so142819085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207385; x=1795812185;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYU6H2/wBp0m3RHfRk6KSsrkcHEKkYUH+D3d0ccp7Sc=;
        b=Chb3TvELq5NkPqemkwvaZiSpPnMshcKR9TF0BveJGb9BK1kEgsc/Jh43sNoWibJ/kG
         Lxa13WzJNOJqlIAPhpQ6uZk3y1YjyT6/j8BxhUQWYJmnt6tDrUdr/RzK4Q8vjud+Rpi2
         7GuKN+VuYjGWVsfOYKJK/9gDBXAc8TjNJvUXVu5J53+1HkjZdpff5jVSEmhdBk5pWVV1
         ZNVz+l/2avLEpzYgPG40yQAzpWrRdTorllmakmnKfLH0KO/SYJ6avdKbCcmt7HVSRpLl
         D2RS8KMJ8qGZM/4HqyR8loIadqiNP3tW0Cn1xk2OLfKKSMn8DsE3RIZ79AtJDrdOB9T5
         L7+A==
X-Forwarded-Encrypted: i=1; AL+hErFErtWrrTE1P2K6KDzGq6hvedcVpie59+mQ9pIsEbiwzK6qXbtZvJ/V6FhjXEPO4zixKlaxjyYHy1IHJ7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9udkzqioz8r+2Kg9P5BuarCQKBLobohK5JtM3iLrVCSxx5DmHv
	Hy7/8BfU4/2nlJi2CnPEs3tb3EL11+BAkjy/08nHfmTUebNaVEOpXWUA
X-Gm-Gg: AYBFou2IxPHd8dhX74L9PPcdWb33fZfi6DX+kEA5i1OqhYRaYTiTYx8GoHTED/jNDBy
	9gvnTJ1q69RLyiAzeSuTbPGq+B4UFP5TV7XFYzfofwbUeMN/nC/b9aI1Zo+1FbORwMLyiLnGvHE
	Wnts4iyPcZwP4RfUugKA92LYeGYKd8mv4HIQNh05QfUa4h0aN/jknPPQhbc8BoxeL0uYPPg61Q9
	tkcHHaIzNVCcAjWhRYTYYL+r7mqIMfDiYjWBGi201Ox5ZMzuO0l2LbXo78pUrijgM6dE8j5Vrm4
	I5vFDKDWUt4ziThWojEGVwyvwH6at9b2dVfElArNblT9dZukhpJxqqnlcRG/lef3F21EBuvI2gQ
	ogh7yfQBOwAKD90ASVDf0TXV+bUPfFD3/6pR+jAxUxSyxeg1r988HPr3xWrIRK3N5itzLSy4FzW
	K6AB5W2PE0g7IuxD30uzD6ToEL/OYRsvYmMNizdlqK1PiHfR3LZljdfW7jElKkutfVTlPT94NgN
	8pH9+hK9oUyNmYT0Q2pFNVE8rjlMSmZZtbRqN8OXObpo4JfzI58528+4r9w7VG+I9PGZHAoz/mk
	tLJalN65/BsjSgShbneHtcfbww6QztKJ6XgKigmMTr1FOa73xJ/7JDCKhl5zJlK8fOuHqRu8dh1
	qPXsZAmMtH6OvUPWt0mTVbSdASHRvGdTdVopNJb7N9ebLfraQkSDG
X-Received: by 2002:a05:620a:4142:b0:945:d6e9:9a8c with SMTP id af79cd13be357-949baa0735emr674761885a.33.1795207385322;
        Fri, 20 Nov 2026 12:43:05 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb418241sm271210285a.38.2026.11.20.12.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:43:04 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf v2 8/8] libbpf: ringbuf: Prevent missed wakeups
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711471.18576.6533152874363127425@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAEf4BzYKewRUpOboOmPcxdX25731tF0w63V0Ha=_f4D_F-ie3w@mail.gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-8-33fde039ddf3@kernel.org> <CAEf4BzYKewRUpOboOmPcxdX25731tF0w63V0Ha=_f4D_F-ie3w@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> so we do this one time retry

The retry is needed for correctness. The producer can commit after the
first BUSY read but observe the old consumer position and skip wakeup.
The consumer must reread the header after fencing before returning.

> [...]

> Wouldn't it be cleaner and easier to
> mentally follow to have `goto done`

Done for the bound exit in v3. Callback errors now publish, fence, and
return directly; cnt = err is gone.
