Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795063761;
	b=Nlr2+yMhBCs1LC9ACDPu9bHs8WYy27gun5O+42zXfFkM3KwDqFzLuwGPuFY2EJhcTi00
	 Z1+VP//gNrtnKu9EdlQd6DC8CDCSdb0ZmBplIbCWof4cZmFwqpChvtZGlAHOkCXr/SRLy
	 FXa222MVy3IHnOW35l9incy5G3RRzirLssJGfTNTdo/T8y3/ghbNRZzB7uQgf8UB8iQFX
	 I00bojdepKJwIoyF36UE8ItG++IUldT8vaYT+siBEvqhDHvqydIcR2WyPzbkmaqYgnXv1
	 kF4KfZ0hpRFRqGVNkF85pQvbj/IspqV1HhV/JWQe6lkxoeYgwSgrf4B/BpSRhvy/SJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Wm21ueq0I/1G2UOkIkQFO3tHFpTVrQyEUMIC6/qAqE0=;
	b=DetcVaSo4gTTYs7tz5mOWYxY2D9r1k+GL1m8k+QoH0JmEFqnI+1HnPWsjd0lH4AMjzdG
	 cAiUmV1wlFtv5AFoPxs5LW2/DLukr6/XCzdT5sOw/sTTvsoE+Ii7TYV3NllzkGamlzjr3
	 Zyre0IzEzdMsI2xH5fJ0edDHT+DRVr2EjqNOCB5udyWrwoeS4w3EbF2sXVcUdEjdc/MDQ
	 vT1VQl+ErZKzg4n2alA0rLmiuGGt8IoM86xkpfsLCP3RSkc+UPZO3453ptomrTQN0Ru63
	 CjbibsiCTyb7dIJ8/tC/Fu3thuztzF9xf703s6f3abgGfFHhbZg4P3k1JUYd6b2o9Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K3i3fUcx;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87569606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87569606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K3i3fUcx
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38431138772so539499eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795063761; x=1795668561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wm21ueq0I/1G2UOkIkQFO3tHFpTVrQyEUMIC6/qAqE0=;
        b=K3i3fUcxHf1/Pj9XgZKuGfkJ0jESpo4qE6AcK6k1zp7Ayou9cPKoTzxcrzl4Z6DkEX
         9HqBbINWlHurD/Fe2H+AJGDVNJdqcczOypZg+7d5FTUSnA4VnHxRV5wdN7Hw5nrkCmdA
         fcZNoGm+hs97H9vgFEBD1kOEWgUD47Gtr8L2IBLLK4+zS838mjV5PiSi39jJJl8uzKNV
         YC0YMO7TTf0bIn68Zw/uE3N+YQGmoZAo8kvjnLf3PcNaXz4tXemOM6+DJUoAXvbbzzkL
         5L1sowWXUdWSi8M+h3+VpYWyST6dOU2THQxdRdOHMMVlg0E0lArwKkxcLz2uRBI73ueT
         aunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795063761; x=1795668561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wm21ueq0I/1G2UOkIkQFO3tHFpTVrQyEUMIC6/qAqE0=;
        b=fYbh3eYXTqNN1caSESfbM0jCBM1/Xa+UpnHXaiT42g80zAFHwoy4RRVFNaL99grT/z
         kMYTkfXtpVaQL6lwxAeBmot0eolJoiMvPLUxsEv4S7E7yvlyS0LKOb3735jgYRZUmnMb
         +5kH+SfC8IVsWRh1IZFsjBoHNRQPoxkKmt4gqBu0vzSKfvGCmgf0Q+7uZvwo0eKIWKLV
         zncTep4+EvlWQesHYRSW36Xg+iGZ0KMy5hGlfG1NovkSl6C6SFKGsD98dw3vUKrGWH9X
         SNf9wL6A50FNy338Z+bcQPiMmSvgqE0OKsugStC1wbyVSQdgUJbk3CkC7btLa9AySqRk
         0z9Q==
X-Forwarded-Encrypted: i=1; AL+hErHEG3vhm20J+1H+DNMveR0cC9N3oRphZ40ur4QArIUmVp+/nBAAf/nCFVtxwjJF+eMZ75g5PGMcxj68Auw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oHI0LUBYtFZHzXp+ZJjXI8ZEh1jdiAAIJ1mFLTbC73ecRT3DJ
	2R59y3EbxDPeFvjnlm5eOtRo/VN24sqbTPygGmlvcrr+9nlnoioBNA9hUgLNymI7m6U=
X-Gm-Gg: AZFdTZe9hoYgL9ygJHV3cbnveraKbLRyTrNRO/rpBhaBnkWz8tsJp9b4/0r+GzNiDVj
	Xv1cFIvg0K6G5T2t6iV8+YWn+gll3AT64VsfqA8kegp2kyIvRfEW3N/DVxKmfflfBRh/gOtNSQv
	TlWEDTiiNQ024Kh40QEtwqghVzW+viB8VAxGboDoZRFHbNxtUyB1Rnrgs1MxNYhxWbHgoaW/tvX
	Mr4xAzs4kUXfbE7YKwRqC9Ymr7dPyocZ+QtaokuvkfmqnFrzJQN6GjqOIyYHjiJbGCN/pzeqnvy
	XlrzbhciwMpKnf6ZlpxkrsUyR15V9k8rlVZm4FfU4J4WhnoqMJz4EX/zpRJDMLyRWCXo2ff7qFh
	GSyJypyKDC8I9Jp5qwKvsclNlEzj0FXu/RSJkTEgUnt/h8EhUks3ZlWGE0gVTftB6SrJb1XOIhw
	XJ1XFf6p+da770fea2tNn+5yhqi0s7hR3tCr3+zhSrLBmarI7xbgnkwNQAkwns5B+LAFGx2V8qH
	lwPvjcAlkebLKTP8R4XHgqZAs4zkHjjkzN6r+fZgENRyO4uIlCDUtJtGz1XkVejowpm3mgEZJjd
	IWRzW8VEF+ETGbBx/bwPGi5zpkKZIw==
X-Received: by 2002:a05:693c:409a:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38280c2fdd6mr4896083eec.18.1795063760196;
        Wed, 18 Nov 2026 20:49:20 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm22522996eec.3.2026.11.18.20.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:49:19 -0800 (PST)
Date: Thu, 19 Nov 2026 10:19:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Pierre Gondois <pierre.gondois@arm.com>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jie Zhan <zhanjie9@hisilicon.com>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <av5_zDI4bg28H_6e@vireshk-B250M-D3H>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
 <avRiWsxCEAuBouBZ@hu-anancv-blr.qualcomm.com>
 <avwtsmp7Mqacbbtl@vireshk-B250M-D3H>
 <av2aFWw3kh11U68A@hu-anancv-blr.qualcomm.com>
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
In-Reply-To: <av2aFWw3kh11U68A@hu-anancv-blr.qualcomm.com>

On 18-11-26, 17:59, Ananthu C V wrote:
> This does fix the issue of policy->max not being able to drop down back
> to non-boost values after boost disable, but I found another caveat.
> 
> The commit 8c83947c5dbb added the following change a few months ago;
> 
>  static int cpufreq_policy_init_qos(struct cpufreq_policy *policy)
>  {
> +       unsigned int min_freq, max_freq;
>         int ret;
> 
> +       /* Use policy->min/max set by the driver as QoS requests. */
> +       min_freq = max(FREQ_QOS_MIN_DEFAULT_VALUE, policy->min);
> +       if (policy->max)
> +               max_freq = min(FREQ_QOS_MAX_DEFAULT_VALUE, policy->max);
> +       else
> +               max_freq = FREQ_QOS_MAX_DEFAULT_VALUE;
> 
> this max_freq is then subsequently used to update max_freq_req constraint
> for the policy. This means, assigning a value to policy max in freq table
> directly will cause the same to be kept as the max_freq_req, which if
> boost is not enabled will be stuck at a non-boost value. The boost will
> still work, as policy max is set directly, but the value will be above
> the allowed qos max;
> 
> # echo 1 > ../boost 
> cpufreq: cpufreq: policy12 boost=1 policy->max=4723200 qos_max=4454400
> cpufreq: cpufreq: policy6 boost=1 policy->max=4723200 qos_max=4454400
> 
> This also means if at any later point any limit refresh happens, the
> value will be brought back to that qos max, which is a non-boost value,
> even when boost is enabled;
> 
> (e.g. here with a refresh_frequency_limits(policy); call after the boost)
> 
> # echo 1 > ../boost 
> cpufreq: cpufreq: policy12 boost=1 policy->max=4454400 qos_max=4454400
> cpufreq: cpufreq: policy6 boost=1 policy->max=4454400 qos_max=4454400
> 
> tldr; is that it will fix the issue of the freq not dropping down from
> boost, but it will introduce a new potential problem of boost state
> potentially dropping back to non-boost freq while still in boost.
> 
> So this alone can't be a fix at the very least. At the bare minimum it
> will need update to how max_freq_req is calculated/updated, etc. If
> nobody assigns values to policy->max before cpufreq_policy_init_qos
> is called, max_freq_req can simply use FREQ_QOS_MAX_DEFAULT_VALUE,
> which is S32_MAX, as its value, and not cause this problem, so the
> solution proposed in the current series will not run into this.
> 
> > Also, can you please explain the issue again in detail. I am not very
> > sure how you are reaching to this issue over current mainline (without
> > the first patch).
> 
> There are two issues the series is trying to address;
> 1. freq can go upto boost values, but they cannot be actually used
> 2. once a policy is using a boost value, that value cannot go back to a
>    non boost value.
> 
> So with or without patch 1, which addresses the first issue, the freq
> can still go to boost values, which can trigger the second issue. The
> logs relevant to the second issue, reusing from the cover letter, is;
> 
> \# cd /sys/devices/system/cpu/cpufreq/
> \# ls
> boost  policy0  policy12  policy6
> \# cat boost
> 0
> \# cat policy6/scaling_max_freq
> 4454400
> \# echo 1 > boost
> \# cat policy6/scaling_max_freq
> 4723200
> \# echo 0 > boost
> \# cat policy6/scaling_max_freq
> 472320
> 
> The reason why this is happening is;
> 
> from freq_table.c:
> 
> if (policy->cpuinfo.max_freq < max_freq)
>     policy->cpuinfo.max_freq = max_freq;
> 
> and from cpufreq.c:
> 
> freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
> 
> so cpuinfo.max_freq is only updated upwards, and that value is used to update
> boost_freq_req, which is a FREQ_QOS_MAX request. On boost enable and disable
> the cpuinfo.max_freq value stuck at the top will be used to update the qos
> max, and the value never comes down.

Pierre, any inputs ?

-- 
viresh
