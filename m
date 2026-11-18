Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001210;
	b=nn1a1rGlo2Wmo2aiBgG8mmnqASpIM1oDjTnGU91o+vgUkDCHdejqFgz4mDrPz36hYPbj
	 I/yyXFHd6F6/goidRGvZjr8jQLskgGDy0ZJW0CirYLYJq21/+Uityi/ysSEi43VORKncS
	 WwYBvomH2KpjB6VtJUJ4iSFgLCvr2K4rwN0cDrLbi8S14cGPQHB2lHuM8jWGPRzqLtwj2
	 Vj8Bkf14RuoWpDOaJw12DEWZZdjeR1ATwc9chqDdK8vqiq85ff0BKGfSTfhjVYRZPpeoo
	 ntgJwfky+Pph7nieIF+wQSvp4aBQueYFzWBDE34ZheL2SsnezC6EWnwTqp3HryVtGDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001210;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=brXugAcDbaCylrm2Wl7ARVAM15xweZmcyeF8T+2xKUM=;
	b=COgQ9lwZp2+YeZeJjp9HqbWPWmwlxKTeh+voAPq2+Zz3PLoRKY4nCFdPwQpfUnQrM6Ar
	 zqr/j/jq4RizL/+8i0jS6cLj2oF3TQKpJOeb0VJO1KjGfjAvm1M75HzMJZ07BbN8OkJMu
	 1zXIwjK4hke7MunoMzBwnTInqG2UuxYrISUgMlGI0+jmGeofvye/Ef0eEHpGtQ70uFc7f
	 omaOHgivjDFSOCx/jO+Mxxupby5AeyBVHe3MY/UGsN60ZTjHF1Hgpr0bC1x0mezWQmGa+
	 hUvJZHztlc0CUf85b6xUvgH1bzfE6D9qaTis7fQ+ZrbVMd9JLV4fqPEYYgEm8j7GJDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MTSCO9KN;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ldl0hQ71;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A9B60A2618
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A9B60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MTSCO9KN;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ldl0hQ71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795001208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=brXugAcDbaCylrm2Wl7ARVAM15xweZmcyeF8T+2xKUM=;
	b=MTSCO9KNWcHiY7wfpX0H9Di7lOMSsi28OWm3cotM7G3xoIOeF98RiUjWzm6TIRrqiP/7r3
	KUWQ6ihgyUBMfoqpXByi6EeqJeBgYQoNpWqDCzYxUQTKOAiFe9JVW61myXg4TBo5T7mO2D
	4f1o5u9Fl+gnh5e9syrfoBZy4vu+7hk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-HncAbFKXNFK8sDyhJH4u3Q-1; Wed, 18 Nov 2026 06:26:47 -0500
X-MC-Unique: HncAbFKXNFK8sDyhJH4u3Q-1
X-Mimecast-MFC-AGG-ID: HncAbFKXNFK8sDyhJH4u3Q_1795001206
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so6517295e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795001206; x=1795606006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brXugAcDbaCylrm2Wl7ARVAM15xweZmcyeF8T+2xKUM=;
        b=ldl0hQ71DHIdVq7HpWWFHFpHRtzn6igtDD/F2HIuoqcYe/H/DB7u8RQmjziUY0WyLL
         S9I1Cd8iLHjIJKfEPPGf/HoGVpuSqkelIVhCR6n92+lXpFUKil9nuyyl7Pf/GXvFOK82
         xjgbhGopkcyxS7WdE4ZOuV/p3XeBdkX5or/H9xjbbhrgMsNwlrT+KE/YzwZZYNvmcqRN
         ThslAYBt9tUXbgZqUkp1Tvp8MAYdvteJHFm27dS5VtPO+f2JAr0KywG0O0d9SUJx7iz6
         iLjsjefDNZ+hMi7wuOkL7B7CSpdIqNdADK/j/GrfRqmCUzDNcsCHV45qRRZFb1/aPekS
         rGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001206; x=1795606006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brXugAcDbaCylrm2Wl7ARVAM15xweZmcyeF8T+2xKUM=;
        b=qPHxCmAxmisfI7T39QSEn+G8O7JUldysQsD+GwPimtyRRI9KNn6eA5Xi9jYLlJxRhW
         tGlvHABnLinM24lRSDWpvfMy0MaPWrTYOuCG29YpeEB6wgPlfSR42386xnhvPnHCItLX
         x7CHZNDfCMXEBkYxnLP0mIXFigfHzHtTNq3YqAWK9q28F6+bp0MJjnL+OUo1/MtyMpKB
         ZEtrxIqyXBEWaozSjVHdcmKc1ysJcmLtJn+4Aj8sO7fOjb8M8AROIipIC0DQ+oW91VeP
         JwWwZEFKFOQAYdRJ0FGemeqj0xWnsW42/eCxubVYtJ6JKaWLfuU5ePaxwmoHvv+r77y2
         UaKQ==
X-Forwarded-Encrypted: i=1; AL+hErH8xjL2bbCtBwXXvTSp+2CMlpk1jXTvtLniZBrJRCkXqBCM9m8i6uobp4EheFj6zK5G7zri+MZGPfqnkb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GVRWizjn14grCAfCXTQ77eigSZNVSZg0ETov9kpoXG+gHBZrX
	HcXhChAR8SmFJfcXYrumXdSYQTwO3UHFuo7xTJ80EqkyZtAXqh6hIkiQaID/CteOrKba5FqnpCz
	CBtC2OTlgPbe7xx3lKfSG+lB4TlOBSymyNV2cbdA+WrdPyEMNFrr7D9gLZP8nfCEIBQ==
X-Gm-Gg: AYBFou0iaKYQt7DH6doSniF9HJJpg7VyOGldXp3OefXtz4JVehms2KzcLNKHZ/lBTZa
	j2dgo+6L3UkSqao+PCFFw9KGw4XpAhrm8NmXHYIeJFTza0Fsx812dwOB2QGC8lakf2yrki0FpLW
	k8OPWu5h7kBx0wZyKT/XOyyU9F3Ue6VW1HE05DNxvrsGinoBi0qqAsX+B7/bKe2fN6V2R6hR8WX
	09oUxDL8zIuv3AlwRIuFC69p0mb5CPuNd7HbJdVg1Wn8Xik8Yms14peqDrdVSaoZ3aqz8V655g7
	95/TvreApMlIJwOWvXS+jsrtFwVDqnkHys66l904xzyTCHZFf7/uQZ0ujPNTD5wn02qK0MIKN48
	3kRfE2etgnB6FAyrz2OqAm0EG85vF7kInnPXrqmOfgjxsRBONxj5hp5B/j4LCjhtMXCZ0m2tJLj
	53Jwc=
X-Received: by 2002:a05:600c:1d8e:b0:4b9:f90b:1c4d with SMTP id 5b1f17b1804b1-4bb783aec42mr139593175e9.5.1795001205674;
        Wed, 18 Nov 2026 03:26:45 -0800 (PST)
X-Received: by 2002:a05:600c:1d8e:b0:4b9:f90b:1c4d with SMTP id 5b1f17b1804b1-4bb783aec42mr139592495e9.5.1795001205361;
        Wed, 18 Nov 2026 03:26:45 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b2a1sm4049093f8f.32.2026.11.18.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:26:44 -0800 (PST)
Date: Wed, 18 Nov 2026 12:26:41 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 05/40] sched/deadline: Refuse dl_server debugfs writes
 while the rq is offline
Message-ID: <av2LcczdGk37WJLm@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
 <2bee6a143319301f082855a15274f0563e99b8a5.1794922146.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <2bee6a143319301f082855a15274f0563e99b8a5.1794922146.git.mathieu.desnoyers@efficios.com>

Hello,

On 17/11/26 09:10, Mathieu Desnoyers wrote:
> Commit 4043f5498416 ("sched/deadline: Reject debugfs dl_server writes
> for offline CPUs") refuses a write to a dl_server's runtime or period
> on an offline CPU. Its message says that such a write has no meaningful
> semantics.
> 
> It tests cpu_online(). But during hotplug the CPU is still online while
> it sits in the default root domain. This lasts from the rebuild in
> sched_cpu_deactivate() to the offline, and from the online to
> sched_cpu_activate(). That root domain does not count the server's
> bandwidth. A write in the window still goes through admission. With
> admission control off, it changes total_bw there. On v7.4-rc2, a write
> of the current value divides by zero in that window. The previous patch
> removes the division, not the write.
> 
> Fix this by testing rq->online instead. It is set under the runqueue
> lock when the CPU joins a root domain that counts it, after
> cpu_active() is set.
> 
> A write now fails with EBUSY while the CPU goes offline or comes
> online, as a write on an offline CPU already does. Writes at any other
> time are unchanged.
> 
> Applied without the previous patch, this patch alone also stops the
> oops. The reproducer survives 20 rounds with no warning, in 3 VMs of 3.
> 
> Fixes: d741f297bcea ("sched/fair: Fair server interface")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: stable@vger.kernel.org
> ---

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

