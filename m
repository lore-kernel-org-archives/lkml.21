Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713776;
	b=lGVp8092PLwnonKIYx6rDlDSH+9BMwL80IVhoUapNh1TDCsRVyrCIE6v3KxTIYIwTQs6
	 1qXJEimVvtDZnBnJc88sGGI9vdMTusw9RFuaJUuX9/KtAPT0LyjNoAXhYUZBiuojcuOMw
	 CCXywNqwWi8y+dR0FL7YGqoVKDZAuo8n3B6A2hkkrBtQw6ddr4Tk7ypMF0wSlAJs8gixM
	 9jrjoYN9OHQxQd+SLs0f1eR18xeAOA4SI/kFRZH3tgHWu9cpOL7xEs7PpH99A8viGGSWm
	 S7L1bqikshDxwU28t8+OVFMqW7yJoAT1Vc+Z8DhLmWT6mC4zbMJK4Iv1OgGpTmm3Hgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2S7ervQayQeTnbc4+lOdrZ2RflbmP4EuKa4TdP+F+Us=;
	b=wCGulVyUbk7aq4/yz4Y+GVQKJH7PSSfm5Ru8wlKs8FkKTi3qzsjyxg2ubRKCdVthP0xL
	 W3+g80DKvCSHMT1MfkPactjNpsNk39kJUxRyfjwYOn5uO1DvANJKIiXUinyLJdJsnmGsz
	 haustrcixrXAE/4y95pm5/r1HebBwxNSblGbrTQZKN50YaJzO9Qpuj6e7MZ3MUYHCJqf+
	 lYzDPCe83bvETYsT3XvK250f0jrny/Bt6vs11JIDj7NXQDIbXq51SFN/J8+px3XT3FHXY
	 jD47uTT2CkRorhQyiWfn9Z77DbIWcNhnatnuk3MNtZR6gnwJekl0DZRlkn88e2WVowQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaQTZfCU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3221F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3221F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaQTZfCU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a3ac4ac65bso396074f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713774; x=1796318574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2S7ervQayQeTnbc4+lOdrZ2RflbmP4EuKa4TdP+F+Us=;
        b=NaQTZfCUNCGPaTJtPntZsIv4geUdnb9+MwBL9cvMaup1E6n3HZiJ+mDOMufAo5VQWD
         AruR0oQynzsgbm+W7rKdileTHozunam4/kF/YkrCDKz2CF+xSOu1u5UTjfTYMtAMOrlO
         JT1cvRF3xGzB3PWdZOV4kQ8G9X7SXvy3tc8KgxXOpDrVRTKeDJq2FrcvXjpN/VoqhsWl
         5IPdFt3VcSdEdrnK50QsqST2TEia+k73MHwKk/x+gPpgLXGdW1IQj5uMH0oBvgOXWOdb
         hhm0n2bKZs3m/mTsqLqA3f0TMpiZ1YfIyiYEpNnhIhUcih4AwI8ON6rYzPkPiW6CPcdc
         Zwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713774; x=1796318574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2S7ervQayQeTnbc4+lOdrZ2RflbmP4EuKa4TdP+F+Us=;
        b=TvmslNHuJVXVAvI/2Ooiy+j/S/KjeRHYcZtdoT27ifRE8plGRM+cp3C8ytDllojitX
         VLzzYo3kgW4SmgXcFHL0oEWtqAC8ZXYljxarNBOYPXx4haoyQW0gRFjSG3+hVWNvVxkT
         P1BkvP4C/qeYSqjdBcELEcoYgBZ/LDQDw2A2erZSEN7asftFzVLnVeX350zwia6ySggY
         SFBEwpL6Se+PPjHZKx1tMvaeWSTh1XquJ3kVobiFbdNujtmNXqkcUKaiNmbKM2yG2d00
         SaUVLbLgIbKa43le81y4yy0fwIuCj027HoNFObbuJRusZ/zTQijlMYBfelvXd0ldMud+
         S4rA==
X-Forwarded-Encrypted: i=1; AL+hErF7vWKq6a3k+ETHwZXtBzd4XE29ueccZam/QLejVZQtfuLdjaEu7dV5G71Rsn/PQsGfe5WAWVqmkWF1S3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nf9+j3GO+2ReUg8vCTSH3VvQ85K0hajnWbaHD3ORCD8xO6I9+
	UY3cmfgK7opdRFAsoz86BE03AyhCp/pceCftF0iH/s5Od+0xwrZLQb52
X-Gm-Gg: AZFdTZcvcw2WXyX/KdJGK/pU0ETkhKXJU7V6BAtlMwpzop1O05Uuor1Yz9scfv99FA3
	qGlMWxCOqdku8h8fGsSARQFyQZamaf2JduQ3wNOlRR/gmE6935CyMva2IbF8ZuNPOUN1d8kvbZV
	yYcu84JDglkXzzBOdf4kATdpNPbyLS/VqOyaAtzrPmrYWlci8qyPa8b+7qGXiZH3tK1RAh3TSYA
	sFg2BCmDVSS2/etg9JQBMk85ofgiA67QX29TRF7vRZKGkMMup3nJbddk1I0gteYqpxUQO9TVH1l
	VJRXRcw76hTyukgw9dvTKQYy0ch9D4WZSW4h4F9SLPnXIOQH4akRwhR0n6/lA46fYDP3SVru0MX
	nmaFbUoOR7dH133dCtOagjZgp7nHXS5OIHrCSfDdvZOIRubAT3EcummJY5lYyDmYho9kEbeuOzB
	2T1+/7NpMQogcGld9Zj6Qp+xg0r+hoMKXSEjGtrEyMOmZYPw0RNhUpU8awBnSSUs96Md33eDGMI
	PKCECnWgVUp89fG4qNTj/Lj+OynKMJ/Yaexezl4ZM6IMJcbf3jiom9CWIh4hfrFRGEk/hRI1ufy
	WMuuYcCFkcyVXMWM/MzQR3YCzi8CT//DdVwW8a+RwC+M0Z0w3Lt6VtKi
X-Received: by 2002:a05:600c:154c:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4bb887f43d8mr420368245e9.1.1795713774379;
        Thu, 26 Nov 2026 09:22:54 -0800 (PST)
Received: from scheduler.schedules ([85.100.65.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm373501985e9.4.2026.11.26.09.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:22:54 -0800 (PST)
Date: Thu, 26 Nov 2026 20:22:51 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Use task_delayed everywhere in
 __dequeue_task()
Message-ID: <awhlwJTOLPeNqFW8@scheduler.schedules>
References: <20261126164036.1938852-1-vincent.guittot@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261126164036.1938852-1-vincent.guittot@linaro.org>

On Thu, Nov 26, 2026 at 05:40:36PM +0100, Vincent Guittot wrote:
> Reuse task_delayed instead of checking flags bit
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/fair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 731d78155e65..942140247f76 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8354,7 +8354,7 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  	update_curr_eevdf(cfs_rq);
>  	update_entity_lag(cfs_rq, se);
>  
> -	if (flags & DEQUEUE_DELAYED) {
> +	if (task_delayed) {
>  		WARN_ON_ONCE(!se->sched_delayed);
>  	} else {
>  		bool delay = task_sleep;
> -- 
> 2.53.0
> 

As I see and know, cleanups attend to get lost in sched's traffic.
I don't like that. So I'll review this :-).

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Thanks,

Kayra
