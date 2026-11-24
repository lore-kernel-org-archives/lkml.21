Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516166;
	b=j+TJnNTX92rsO+xtmNnhvoooM1I1qfNilzXYPy45vQfnZkPTTlVPMOZlgTTtIsthH344
	 oi+SHUgSpGkJ6gnXDh49mDRHMUS+u1qAqC9Zbl+s/CdMqbujHbrsNKIFUN0uemmaQEE0a
	 qpHvdUfj6iUanB88bO3Bw4ANuHGzCKwO9Hf7GRJvCqb+O3hLHCQIwslsV/6H99OGbQp2J
	 qJR81JrROVWzcIna18Cza+HFlQNbvNJiuYKHf6+chuNPqMNl3hpSPowh2G5Nzvf2YdIzQ
	 4h+e/SkjMGCWnp9LigXh5fG/T6Ursd6w00uH/dd5dkcUbyK2tqGUhd5HzT9kYGuPM6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8DPto8EVmQeRqjuegAdBfODKwtsnd0yVddUJOx12zys=;
	b=wI5orln3lGRx2nnTTyMfkhlST26+ijD/p/SaEuegN2LrBrmaoU49TaUZPrONvnUE6PcR
	 IRiOsCImb/o71ABXYfUq7n5OA2lxrQbmjoxD8mIeIVaxsaq9QT3C/kDbJLurndNdLlCca
	 yVlq1Q8hbVws839uV1so83UYm/oIsGD1VcFOnwhHwDO0suvblGEgH7WiHgx6DW+Smec2Z
	 GciqlYjnouXkpGmt2E/qJ6K+2dgqsa9WOWtJxWTXQ7TQLp/Xz4ihiPSDTDj7mof/E5m67
	 VpY+xUHS96cBumNtQB/QLLg63qS6/DxWqxvo8hZkhkXEUiK5JXj7OkE3nYXEPbBlTZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CVUxB6TB;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223D1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 223D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CVUxB6TB
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so3676919f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795516164; x=1796120964; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DPto8EVmQeRqjuegAdBfODKwtsnd0yVddUJOx12zys=;
        b=CVUxB6TBI3VFeP5A7odhU2OAl6Shf4ODREou+6/TCMRgCvQ+YxOWNzGgO7ElxpOz+j
         aInJTmQ7ETCb5tcIntf46ki1Zhd+oaqy6+ZOXbJs+BFaWOW2S40T6z8KqTO9VCurBzrL
         TvpYQ8C538fX1XpsRiOoAGbyObiHawarA0LI2/mQo5zTx24ZBxzhaynESg9xU+4VctRB
         tPmsx4buh4dfriERuV016btKGzT99pVKpKQtTqbVjAAzcBbinm1qGCo28qzgDQ5UrhUi
         060MnJcNKb868Ydcop1om4swftLw9zTdf+KzbbKRFWaAL/LwktwLcrlM99x5iWHzBNP9
         XGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516164; x=1796120964;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DPto8EVmQeRqjuegAdBfODKwtsnd0yVddUJOx12zys=;
        b=Y4+nsTrgfEwNRh0Bqd3j3Ghm7c9aJH8v7bF1C/GeYmNnh/9g1ySlhgVF+CB0N3011w
         A3GM/+VdulKLsEHa6j7FnymCh1o7IxzyFooNhaXJsyOVIQzbinF5lmRJCq3gq3B0LdzU
         Edq0WwSdMK8cRP8ra2lCStTkA7k4oea4JVZ2lCpB9nuZebgQKpHEW+EITtkmj57QUFad
         +qnGPdAiXdEj/ra/Rda2avWQgB8tTTNFE3Ge6EWLXy2EbCAgGPhTDEn0eIveK6Hhkodg
         4TQHFZUYEhpspyPJtCILYFT4V89lo9YnCc8EmAbynpHdXH+srmnU2Qt+8Sq3QWXLx88/
         EP5Q==
X-Forwarded-Encrypted: i=1; AL+hErEss2fwEFR/IEJnft0Fd1HjczDDgCIKf0979bFwm6nE/veuqJHH7Zk4ePfz+o+XheIB0Ej9a6FKfFdA6CY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rv5xZWheSp2NUOJc5qcT9AH2qkYQNn1i64dYwXOgH6U2ihJsZ
	hN4wdRb6Rln/n+eDVj/FlxCt3/oMsFHdSnk9R2WDNelItYOxagUHlyA96ZONwLDKDv+nXw0+3AG
	9KeOZanhMdFFTOQ==
X-Received: from wrqn16.prod.google.com ([2002:a5d:4210:0:b0:4a7:5aab:c222])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c9:b0:4aa:f8a3:3cf6 with SMTP id ffacd0b85a97d-4abb3955aa0mr28954373f8f.30.1795516164147;
 Tue, 24 Nov 2026 02:29:24 -0800 (PST)
Date: Tue, 24 Nov 2026 10:29:22 +0000
In-Reply-To: <awVEFDoGl0ZqiHN_@gpd4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123145927.577162-1-jpiecuch@google.com> <20261123145927.577162-2-jpiecuch@google.com>
 <awVEFDoGl0ZqiHN_@gpd4>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124102813.217423-1-jpiecuch@google.com>
Subject: Re: [PATCH 1/2] sched_ext: Fix suspicious RCU usage in
 KF_RCU_PROTECTED kfuncs
From: Kuba Piecuch <jpiecuch@google.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
	Changwoo Min <changwoo@igalia.com>, Ryan Newton <newton@meta.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrea,

On Tue, 24 Nov 2026 08:00, Andrea Righi wrote:
> Can we express the existing protection in the dereference checks instead
> of adding an RCU lock/unlock pair to every call?
...
> Can we use rcu_dereference_all(dsq->first_task) for the return instead?
>
> That accepts explicit RCU readers and the implicit protection provided
> by disabled preemption, softirqs or interrupts, while retaining the
> pointer-access ordering and lockdep checking.
>
>> @@ -11957,6 +11959,8 @@ __bpf_kfunc struct task_struct *scx_bpf_tid_to_task(u64 tid)
>>  {
>>  	struct sched_ext_entity *scx;
>>  
>> +	guard(rcu)();
>> +
>>  	if (!scx_tid_to_task_enabled()) {
>>  		struct scx_sched *sch = rcu_dereference(scx_root);
>
> Likewise, changing this to rcu_dereference_all(scx_root) should be
> enough.

Agreed, will switch both to rcu_dereference_all() in v2, and convert
scx_bpf_cpu_curr() and scx_bpf_cid_curr() to match.

Thanks,
Kuba
