Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504892;
	b=vPUUBLSmWbSY+1uiEauil+8zt/XhIYspX5emV5tCRIoBn5NxYPiCr0VgXrYQiYmfwYhg
	 acss7VeutVO8tgP2CslZ4iXgXTIIE7U5RtxFR3Grahoh/3UO99CvT6fx8S3dvcFoxC7NN
	 mLf4EjK6hjvC6pxVt+3jMah3HmX/vdCQqyl13JDd1ddB6xblQqr2dbeyktEmZ3SdigCyR
	 4xey+zbxvX0CnxUUwGFVUpyeGsTJ8Z1KbH4HmDtPRr21w0nQzG8m1vJl2neVoNlwQJBIg
	 nWY4+byRZwlu+fFZYJKmy2s3wIC1lXZmCejkVYnyiJN3ge3NcYavb/6nhif4Wo0gzeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PCjWFrTzcH/5+g/DYitpRwbKVv1E+Kbizes69WQjlhI=;
	b=r1SvLc9o4aCo6CmKKhPSYrYrhBstJg+HVp/9RxokADIeHAvjcqP6Aeh1Uipfs5Sbtzln
	 Hf3gOMRqQAXnWF7wnyEQ6j8dm08/I6Yb395rTn2Fz9+28knCd9xC8Ae0DsSkoM1l1/5Ve
	 3wpRbLX7AFQIzGitiWGdZHA/C/5VVXmVUxxfKrGAZ9H4RIU+aDnUXmynZAYuT0HCUR1vo
	 3tmIrYVrQo1GlCmhvi3Y1FVN7B8c8zVz7wy1PQEzeo1CYICjiEP1ErOLTcIQRPt4irwVE
	 C+0QsYWXGMRzlJOhztYXJCd1C/M3YHvJPJEx8wBpAHBvBvdXoUyFoQbI7dy3dMVrFDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S51S1Jld;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1748606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1748606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S51S1Jld
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso40279735e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795504890; x=1796109690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PCjWFrTzcH/5+g/DYitpRwbKVv1E+Kbizes69WQjlhI=;
        b=S51S1Jld0TYnr89GRp/iWdDMGu9TpSFHjWKykoRbZ7+WO2jx7FQGz26JMxFdymzvgu
         l8A53IIdtheV0n/D+fcJfAByUTs8XGBpOfLuaL8kDK9rOvIrQhcQjcVrTMOpSU189ZK5
         s9Qek/O5dtH/W74CaQqrLlrpDxzav/Qc5WcRovpAQIJMXmRnzB4RiOk0To3zQYIkoQJe
         EOsbT3od9fg+w7QykqP+mciV9gAFCO971qH35AhvUev6ik4GrFatYvmNyvUUQkudNB1T
         VubOG004QnZzHavwN80d/4ZKnAnJhP4EbMfFSux7oc3R0Zd0F7zyFZZyDk1k4bPEelP+
         3EWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504890; x=1796109690;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCjWFrTzcH/5+g/DYitpRwbKVv1E+Kbizes69WQjlhI=;
        b=rXm8Xp8wFeHZFdwmyqe3cyADlpDrhaU/j1pdFwtQ2Ywn+THhoQdJlNLxHyrl681Jvq
         vRhOi6fzi5n6NxxurreCtYvf1Cs2WFwUsAQLh2rw07B4BEY5xq/R49vz2gzbITYoHJiH
         5138eyxkFpGEkpEPa03goyiTBAF/GHbajQLu8oMylBjgeUaLnOVVqTPcTyN5TBfUppK7
         P+7nYZrPBmoLLAoQXZ9+WOpJ6G5f5t3M5yBb6Pr5KvJeGqXw1uWs4R1pPoKA+x58k5Op
         7oVgcn77ERJ0KeveVojgr27iWRYan1uiJfRlbVgG43pQ243scTAebMdTTPbz5zR0/6qf
         gJ/Q==
X-Forwarded-Encrypted: i=1; AL+hErHMwT7aXOpP+7M4IUt4Go9PeT3q7PQCzRuL+jNrnKfjSQddBrv7BjrYaFusbdy71HYdcWNfNkmuqhtyoj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W9RS0ebBQdzwr0Ly3mxkwlYSou7zY6daEjmY9RQeuUG7j/C+z
	/SeinwbdL0Mr80j3PG29PXTlaPUdmutlmLM2yLxcLl05OirilvrDa/DdsttFyvr3d2Q=
X-Gm-Gg: AZFdTZfd2/FeMkRqryo727uY/gYXZaPf7Un+fWroI+sSnV+G/jvfcVERRS3ixNplLrh
	BXymG9hKS6Be9c2C7XVIExXB7qbJ/nSbxf6VUm/8Y7PzaLiv9cngg5U1arVcbt0s3BBSIQk988e
	wAVRihxmd79mdTtiWV9bMox52oFIXv/Qd5Q+oMT7JKDW6y1u5uImgFfLSWLsMh/+MIS/Crt2Nuk
	SeJkTOl+bwODBPZcuPlQELzmG9qAwkyowyMKrRt1QvMKL5Bf7FDiUafgM9oLAfMk3y28lQjxKX7
	9aMotX81ZNYes057Fq/p82q3yZY9vq4wjJb5eBVeKUpkyMxLALPWVvPcbtkDzYucLG8DsNSVRzb
	eZVurv51ntDNLVqPJOJXRtChMHLha+dpxp76McjIgk6RpcLOE4bJWpR9B2eB4rpguwatl8VA4hb
	G3TR017ItHC1RD7d8xXEYn1J/4c3OyLKWE7ZlGSzf8/v8b7JMMfROvGVsdZd7N2ESmCIqHLU6vH
	yoot6sokpO/Zk1PQUaDbhN1w5RDjvkQgTjBfP6Vi54YoXKr45wXYTv3KCPHlscJ9EdIsou12lz3
	yD1UpKZPQEdrUDh4/MCk1gObbqV0ZlB/mDRra6X3ISG4R/A/TqX9c1NVRMCHU2TKb7tYGns027h
	vjeIyuQ==
X-Received: by 2002:a05:600c:4f10:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb88804d35mr310228065e9.10.1795504889562;
        Mon, 23 Nov 2026 23:21:29 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm241127015e9.3.2026.11.23.23.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:21:28 -0800 (PST)
Date: Tue, 24 Nov 2026 07:21:18 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: Re: [PATCH v6 0/3] Fix uclamp race against non atomic static key
 enable
Message-ID: <awU36OTU45MPn-Lg@aerith>
References: <20261121041507.39582-1-qyousef@layalina.io>
 <070726aa-0e91-4d65-b3c5-00df3a180732@arm.com>
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
In-Reply-To: <070726aa-0e91-4d65-b3c5-00df3a180732@arm.com>

On 11/23/26 09:19, Christian Loehle wrote:
> On 11/21/26 04:15, Qais Yousef wrote:
> > Latest version drops the partial revert (patch 3 in v5) as RT group
> > throttling is going to be marked as broken and anyway a proper fix will
> > require non trivial rewrite how dequeue happens for throttled tasks or
> > full revert of subtracting nr_running added 10 years ago. Both of which
> > is not appealing and with the proposal to mark this feature as broken,
> > better leave it and hopefully just delete the problem area.
> > 
> > So in summary RT throttling is not fixed and being ignored. Fair
> > throttling is fixed by pairing uclamp_rq_inc/dec with
> > add/sub_nr_running. For RT, we do that in inc/dec_tasks() which are
> > called when tasks are actually enqueued/dequeued - as stated will fail
> > in RT throttling case. Given the minor severity of the problem and
> > effort required to restructure part of RT group throttling that is being
> > marked broken as we speak, I think this should do.
> > 
> > Changes since v5:
> > 	- Drop patch 3 to partial revert subtracting rq->nr_running for
> > 	  RT throttling.
> > 	- Drop fixes tag from patch 1 as the series now is partially
> > 	  fixed and not suitable for LTS.
> 
> Is this how this is done? I guess we could also NAK the backports?
> Also presumably this was observed in live systems, so is not-backporting
> an option?

Is this the best way you could phrase your question? I asked clearly for
feedback on v5 and you kept quite. If you have such strong opinion, speak up
next team at the right moment instead of trolling like this.

FWIW except for RT group throttling breakage, patch 1 and
3 could go to stable. Not sure what would be the right fixes tag for patch 3.

FWIW I work with Wei who reported this and this is not a wide spread disaster
walking on earth. It has taken more effort than it is truly worth actually.
