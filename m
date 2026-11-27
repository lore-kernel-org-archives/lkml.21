Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795784102;
	b=MJSQ8e+Q2IzDBg6P4nldfJbItDDFyNtg66Oz4Gq8/k7f/JonAEeVeB2KIMxEsQNPZjeR
	 N8iflbYI6dY/iD6jOtlVzMrjGiNTZepnYlkyPEFSmjesrCbEMNjeFTBQnH1yUMq74i3bD
	 igx1TFMXi47YbZ0zA8CXMYADlkLrAG7S0iDcPfyBoB/lU+eKS86HKVNk6DzkmD0Ej/Y5p
	 FBWr/Mtcrku7U8RlG2SYQPU5XnZ1VxFMbS/4GJXRXrqNNfLionLcuUXxI15h+1ZWQNEDJ
	 YpIAJOyouYOTA1NG1+rsVrX12ZtbpC12jRazhYMSWbTTnXmBgIaKX/OHzvPvC+EltgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784102;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=aoCFCzIshNyrPQBZCxE5KPBXPIt/CPhY20OoZaQzriM=;
	b=HObtTvZinQd+R2R3B0QBoRIKTXk3gnarNl5bj9xJOCjjQ2MFtrXNWxEPnL7ACNC60Kjh
	 HtC+tH2STTLnZNBFcob+AWHWZL2w6O1/CJtkodNgJweXsoh43PTMnniBz1kuyvg2IL5Yl
	 dwTv9cGgCCHpdzGNsIeWRpElfgtgGd6JORWZQqzeD8TCQZSpfn2zeOVCeQImg3bmgXkpb
	 QJQG59zGRKIil7Qr4JcpyLoxGir+tVwryBunzbpmlpEWGHc/iARe4V9InNydMolqsay2w
	 B6LCwe3bZ8Y4/yLck4nb2d3s8ssigWOKfC+01o22D4Tmlqj74splbZ9escs/1j113xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aCDspefe;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h8kqykhQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C9A606A68B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C9A606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aCDspefe;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h8kqykhQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795784097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoCFCzIshNyrPQBZCxE5KPBXPIt/CPhY20OoZaQzriM=;
	b=aCDspefevn46mO8gapgkFn+GdAxLziNUE7Z8ef4p32vzhqrVpnKYFQxLoVq1GLvv5w5xA+
	jW1HFhB4BpM/FpLP4e3Ph9QsGZqWLy1bRT312OlezKHgnlLjxaBG1ci6CtXK+00O6NnJKJ
	uF1zQ0Hw3kJscDIFoqXH3cuWcv1aXZ4=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-pObni-w2PsCnFCbXzfhtlw-1; Fri, 27 Nov 2026 12:54:53 +0000
X-MC-Unique: pObni-w2PsCnFCbXzfhtlw-1
X-Mimecast-MFC-AGG-ID: pObni-w2PsCnFCbXzfhtlw_1795784091
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8aa185840bdso5717655b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:54:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795784091; cv=none;
        d=google.com; s=arc-20260327;
        b=Atva1Ojn/U8y6vCz3+vJ4Fr9zCMpOy0bqbeg26kI1cvIH+V/E5ihur1Zt0u/yTWSVx
         AYIC/K7qPEmGDgouL7GCyDeUxcgPpI3GfM6BgFAxG2eQZBqXf1wmgayeuE5xjbDn20so
         rc7RDgqR8TzHdGXqCDL81LyOABwHqyMmPkSy6YKXVC+sFicf1nGbIy9Vd7zA7oFmgOw3
         6P4KEWyNNXOep3GpNIgpMlzO3TCvdGzoFpZlGyZCfHmdk4Jm73ooQlEK/zf3vpeX4obK
         Y2tBBDczToep9C+x2gNk8KBjX0Ii0/HlPpd68/C1idhRwqNd7oPLkJDnC7YIk3zhbDDX
         gbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aoCFCzIshNyrPQBZCxE5KPBXPIt/CPhY20OoZaQzriM=;
        fh=RnwX7deN/ngPCFjtuv2VGCpO8gHUrmLsvvibA0Dq/OY=;
        b=aoQCH2HnYHMeDa0x4peoMVLpjrJku+GuMcG4Qr0ppVh2H9BkuFdKTKsOfkp5tKn2By
         b2/Y56z0RLHdtNghrPE0ncyZWWLSdYYCOHbmqqheZ+1Ma/+i3MkqqZZFRMEzziii7Aqz
         L3q1yrmAyI3KeKQoBKhUz7NajSV3mVIYOQKAFYeJUn2LChCLDxoCxc02iJx0wy/cE38n
         Se75Y0L/52cBqL+a2NSB60gqQz0thybI7bhqJpgBQ+9SO8Y0d/N4pcnMeA66Nkg95+NU
         /Y6HXG/WxHUmvlmAxHkAWRd3MVw3CbsWSg2jKS2cdGirHj5B1yhMN63dyBG2itneVKoe
         vShw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795784091; x=1796388891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aoCFCzIshNyrPQBZCxE5KPBXPIt/CPhY20OoZaQzriM=;
        b=h8kqykhQofMIwsAZQHR6r5bGmQlLoaYssKrmejJb60OLvtNbNJtgXJdbHdfh38LjsJ
         pP3hZrLFGd2b+NjhAqM46Jgpfzfw0NSYUI+BKcYCBPDCUEHwjPS1qjeDBgFVxuS5AMhE
         uxPQT56oIrYbeNlN7pXG1ZqP0GL8iX+uLduMadnSyGAffiWp/puyLQZb06vHsp4Vs/DT
         Z17aAUwtryaCvfSMwJ+X1gmDUgOP6SMulzhab8Ru1urTD/IarFQGAUU4goFlOeSv1veX
         mWzU7pANQA61Z2LlA3oBYrn2QfZIFsfEShgCqPaxTU3Hukc8J3bVkebTllE7txH39WuA
         iCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784091; x=1796388891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoCFCzIshNyrPQBZCxE5KPBXPIt/CPhY20OoZaQzriM=;
        b=laRXc6M87nrZl7B7HtwZ0XRfaKdHIGCLclHlKK5WLmzQJCOyy5n75FEsxg+5RaeF3d
         DIHRifIjWDIG6bnCvH/P3wZb0IEp+4qbRnPBXbWvsUDpGdiqob7hG5+queuUQdbe+g8y
         7Eq9Qv9VQw7z2zhyW7uhhdf8si6+T3TplJIRR7EPmzzGw7SwTlCvPm4PL3VeRIxgQkPt
         1VKeCLH94dNdsN6LsCLM30t/TYcn7mI45ntHayAB/Xp2LAXWMftHJljFldkYTE+aBLFS
         pDYd/rCMBK/YuA3spvv9aVYESXAojN/XsZg3xHbFxSZo3K2fSi+WVXaKvl2p5i7lveUU
         AUTg==
X-Forwarded-Encrypted: i=1; AL+hErGGliK4jGRUUJlRT/AsED5Tal/qapcxylkMfGK1/wS5th3Lr5gErppzsrmayxPTCjdakdpVj5ScWY6FaVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z95KHW8tuyT49l3PdgF7jgKypx/Jqebis5n+NegX4ewGzVxeLzh
	u50W5EYSu7QIVMz+/h2RRiU/TJFaWSOmxWLJGm6d10c1Dv12MtiMGXULB/TWtOLeEdAiCjx/G+2
	vD5/8tQoKuUCcUUAXEjW76Zn1Dqh7pcEumLkhX4xlbHDPHD33kV1SAmA9z66ONkjCXnd79eWp4i
	B7Jq7pcIL64zw4WXuawCJkhnzWpOkXxQpIZiyY16TCwroBPi/N5QI=
X-Gm-Gg: AZFdTZeil1U2IGr58aGqag12imME6/8IFimYcNOQ5lmqlh3mvuxnebMm29PjZslW0ur
	krkZ1YQuAubwnxF0mfgjqDdshNOvwdwQ7kothQ22c7Vddh28judCpTYR8Ht4qhe9EaBD2Ssl+/p
	7KRBfiPnAegbBz9f2zYfbr9e0mEVwXJQQJNSkYoWt3+HLH0SqDD4KGKR6Js6rkPtgneJ5iucQhJ
	OptHFAXGjvJxMk=
X-Received: by 2002:a05:6a00:124f:b0:89e:b12e:7ee1 with SMTP id d2e1a72fcca58-8c8794b9878mr22414592b3a.1.1795784090561;
        Fri, 27 Nov 2026 04:54:50 -0800 (PST)
X-Received: by 2002:a05:6a00:124f:b0:89e:b12e:7ee1 with SMTP id
 d2e1a72fcca58-8c8794b9878mr22414574b3a.1.1795784090148; Fri, 27 Nov 2026
 04:54:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795262546.git.chaosheng.qu.linux@gmail.com> <328ecfadb98649f317985124b6b49bae2d356bcf.1795262546.git.chaosheng.qu.linux@gmail.com>
In-Reply-To: <328ecfadb98649f317985124b6b49bae2d356bcf.1795262546.git.chaosheng.qu.linux@gmail.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Fri, 27 Nov 2026 13:54:39 +0100
X-Gm-Features: Aa3M54qGBxxWIk1P5kyegq9H4jk8G8LmhabQ5LcSTQ0-EevIyeLc7S4mtnWR1HU
Message-ID: <CAP4=nvSFE95SAvysnn2ay880DgFUrqQgUY1A3pTcSTXagdiDNg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rtla: handle SIGTERM during a run
To: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
Cc: linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 1:03=E2=80=AFPM Chaosheng Qu
<chaosheng.qu.linux@gmail.com> wrote:
>
> rtla installs a handler for SIGINT, and for SIGALRM when a duration is
> given, but not for SIGTERM.  A run stopped by the system - a shutdown or
> a service manager - therefore dies without going through the cleanup
> path and leaves its tracefs instance behind, so the next invocation
> finds the instance name in use.
>

In my experience, stopping via SIGTERM most commonly happens in
runtime tests when a test times out, as that is what the "timeout"
command uses.

> Install the same handler for SIGTERM, and restore the default
> disposition in unset_signals().
>
> Fixes: 2f3172f9dd58 ("tools/rtla: Consolidate code between osnoise/timerl=
at and hist/top")

What actually regressed is RTLA no longer resetting the thresholds
(osnoise_stop_us, osnoise_stop_total_us) before starting tracing -
which would otherwise protect RTLA from being affected from a stale
osnoise option (that can be set by someone else, not only by RTLA not
terminating cleanly on SIGTERM). That behavior was implemented by
commit 0122938a7ab49 ("rtla: Always set all tracer options"), but
commit c219d4ee1d6 ("rtla: Set stop threshold after all instances are
enabled") broke it, as it flips the threshold back too late (not
commit 2f3172f9dd58, as far as I understand).

So there are actually two bugs. Together, the fact that RTLA does not
restore settings upon SIGTERM (never implemented) or on start
(implemented but regressed) causes RTLA to misbehave with respect to
thresholds in multiple ways. I'm going to take your SIGTERM
improvement, without the Fixes tag, and send a separate fix for the
reset on start regression.

> Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
> ---
>  tools/tracing/rtla/src/common.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> [cut]

Thanks,

Tomas

