Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691534;
	b=dbpFkH8bY62G8/mevPZ4co94f0lJRGJRD+kLd9hiBOUEKhIeWPy2yh3v9MSZrg/eWfx1
	 lYY5D8SjZtSBNvmKDBQsewip84jUObdPBx0XtkOoBnQArOI+ipLAAd12e8cOMnUKbPDb1
	 77cvy9z4X8i8hnSWRLEiSSzHuFxCFKEXxoX075cBRVA66htQ9TF7XSZHWva70bIjssPHh
	 QOCAnDZMnIvjrp3IOXFU3ZSPuyxf+eHV6AE2N+FCuaaPEzr34388xOOEIBO77gRbG0wV4
	 RS0rRNJ8ic08brM6GfPFa9RRs2eyQ61/JlL3LfqNRASJk8S7gE7pnFAVXiSbwQoOlGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691534;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/bantJDujBdPXRkbIoqLhEHljHB1m6SQlPYF9yA+ZR8=;
	b=O7EAA62FQd9mWLRp1yFK84Vc/pw+O7VCJ5LN/wWvyAVLoy4R4Kx4N00CfI9ZnCQjBApP
	 EFMQNjejpLeZ9Pf6MVvI4yNyEazk3IZXkMNJvgZEXxDYWvc7uYvFX+SzrK0TEyLk2Ftoi
	 JviDWObZ/+kygwV0tvfmxl12eHU2gChrzuCOxq+tvcKMIOab3O3qTpqijTw+S8HEE+8fr
	 +HppXeJhKfWKnAjXADFS0NqvzH8UWnqdpaoVuhgGQfEyjqVDgaTdRafeiM2s3awJehY47
	 UIzsvqwuvoTmGrRJK2yIGCPAQTGN8lJJE9Mzl0U7Km8hJ1KJc7JNsXYpXbO50clg+jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YHZKUJpu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kfN1mrDt;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3839B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3839B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YHZKUJpu;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kfN1mrDt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795691533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/bantJDujBdPXRkbIoqLhEHljHB1m6SQlPYF9yA+ZR8=;
	b=YHZKUJpumBI66a51J4TjHFGehtZb/PYkK7+MWQO8DwSq6sxB7q6SP8b0KcJ0kaH6+0b29S
	VTXkiJTqlnXqC52Kx0hForoEHxuwfRAyXtZ/IilVXdxqIOiOeh9KD3EKUllhmnLQNs2LVD
	57qk1KrltNTOE9g89pmlp5ojuiPUVC0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-JVy6R5QFMgCMBlrzjmHIZA-1; Thu, 26 Nov 2026 11:12:09 +0000
X-MC-Unique: JVy6R5QFMgCMBlrzjmHIZA-1
X-Mimecast-MFC-AGG-ID: JVy6R5QFMgCMBlrzjmHIZA_1795691528
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4bcda4c853aso313640f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795691528; x=1796296328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bantJDujBdPXRkbIoqLhEHljHB1m6SQlPYF9yA+ZR8=;
        b=kfN1mrDt0MhWb4rjfmm152dJZ9X1yPBt85q5ThY+EZ/oTKmOu+XE8fqlh4Yo5gkF1p
         5c3OAjR+JqN4ZQIkbJ0OoXcLFONt50vhNaHcwGSMqd4+oEo4M+Q/p96SfY/DyiGEmlP2
         GbVM0LYIcbS5L99JsGIzO2+n3xh3/ZMTGReyrsPxxtvCocGkkddXPpqHW485uPuO0OXA
         uNQGE2PdejFU4dhn6BPktODzA2gVouuYKOBWRlTESJItq6QtCduAOnz2p7wpas997hUR
         knukqjWZxgwcHKo3DttfFrXoawcEVo89erTlVcBb2xaHSHzn+5+1UfK+e0PWKMFHZtEF
         8yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691528; x=1796296328;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bantJDujBdPXRkbIoqLhEHljHB1m6SQlPYF9yA+ZR8=;
        b=mWiTiTFSL1aJlOPo5uoqCm/Dv4po7HTcfq6iKgaBCk4ZpBlW1ImpGUmDh49H6hiyUO
         YB3jqMIrNmCxL++RIOES1EDTYN69JkHY96p/FghKVze17EV1D3GAIo44EY+pvb1br961
         N/7rWASgrB/0Oa4rIwf1oBIht/rv1gOXfwvYOKffGtdER0yynNC+Ph5pMte6Bm6KzVNk
         5wC9GjmSCGpxnpxO8eiXoSmTjz+tKk/opdOCDPobp9CDu2q5b2hRRGWxfPGiA0zp2o/V
         kipAstSG3LnNF4TrVeAbR9LeCV1/jZzIcasiYfFTxjzeZZLhPLdRGUkuOX7tOBks9BB0
         G9QA==
X-Forwarded-Encrypted: i=1; AL+hErEGGwD5yW9KAmH7bvaHeV1KUKVqpy5zzwb9IoUxrt53PHYcclRY1bsaeA2G9D6SX0g965KDTwIqEJdqpKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tso6jvBa/0UbWWXlFGSfr9JQDuBuUUJw7IKr4eJUuMo7SU23g
	pLQ1B8aG3N25/LHjoTy95iD8T73uDcot3F1wckHGJOwuV99+zVR6qEjw8BOOJlNC2IzdqpWxspF
	vxtd+J1Glf2HVUk+8puS/wxpT9Q2Pdup5fS6TSM9BJK2XBHIqs1rH6k7BQLHQvSUqnA==
X-Gm-Gg: AZFdTZec0zxqemmt9CMinicX6JjdbNzjGLX83Tp+4F5Cv6CXtof5Jh0DIVigaY+iClI
	iLhHYZzhDiRe8e1qcIHuiJV0wRjSPab0YJOvQq23l48DHzp7xlCwRrGb21vtIkKOrBFEL0mm/0p
	iJo0fODaNshSAnpjSD2wyePbxVPMcU6aa9TMRSSpMKbVwG03Q9nA9N4og2w+EBFE5USth0Q/lfS
	KbkHfWl+yAHV0VPJPDRou26N8HzEXid5NqpHxRRbdLvO84COLHKf9QKBF4IUGlUJOGJA/Ch8/68
	6jvDIBltqpnbMCTQ+Z3KEjO/0GWtGTDEsC1e35zJms/QHSxQOIdunn29tiwleBo1VdYeq9SiwN1
	gcjOhigyO+MRxK//rdsIjwwV5Yw4wRfgcXnbqKPFSiKEqwLXOemoz0RJskhhmV/UFpxhVU71NzF
	Wr6Qiz
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr29541065f8f.47.1795691528408;
        Thu, 26 Nov 2026 03:12:08 -0800 (PST)
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr29541030f8f.47.1795691528027;
        Thu, 26 Nov 2026 03:12:08 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.146.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm15925798f8f.54.2026.11.26.03.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:12:07 -0800 (PST)
Date: Thu, 26 Nov 2026 12:12:05 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Elkin Cruz <elkin@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	irogers@google.com, stable@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] sched/core: Avoid atomic cpuset_lock() in
 __sched_setscheduler()
Message-ID: <awgUBa_9VrhDahUt@jlelli-thinkpadt14gen4.remote.csb>
References: <20261125222729.1450842-1-elkin@google.com>
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
In-Reply-To: <20261125222729.1450842-1-elkin@google.com>

Hello,

On 25/11/26 22:27, Elkin Cruz wrote:
> When Magic SysRq-N invokes normalize_rt_tasks(), it holds
> read_lock(&tasklist_lock) in atomic context and calls
> __sched_setscheduler(p, &attr, false, false) with pi == false to reset
> real-time and deadline tasks to SCHED_NORMAL.
> 
> For a SCHED_DEADLINE task, dl_policy(p->policy) is true, so
> __sched_setscheduler() calls cpuset_lock() (mutex_lock(&cpuset_mutex))
> while in atomic context under tasklist_lock and then skips
> cpuset_unlock() on exit because unlocking is gated on if (pi), leaving
> cpuset_mutex permanently locked.
> 
> Guard cpuset_lock() with pi (matching the non-atomic caller contract,
> where switched_from_dl() releases deadline utilization under rq/dl_bw
> spinlocks) and call cpuset_unlock() on exit whenever cpuset_locked is
> set.
> 
> Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
> Signed-off-by: Elkin Cruz <elkin@google.com>
> Cc: stable@vger.kernel.org
> ---
> 
> I am trying out new Clang static analysis checks for kernel bug
> classes, and they flagged this code as possibly buggy. The findings
> were triaged/fixed and commit descriptions were drafted with help of AI,
> then checked against linux-next (not runtime-tested on hardware).

Thanks for this, but I believe Mathieu's patch takes care of it already?

https://lore.kernel.org/lkml/9194486f15bb0cb36b51e4525f471d1150c0d58b.1795115075.git.mathieu.desnoyers@efficios.com/

Best,
Juri

