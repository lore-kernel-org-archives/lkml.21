Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048115;
	b=eye/wGIgfenmfih0DRUXnyFBhb4t9e99v8ZxpCD+BxiVnby1gE+RWDWUUCxSJ2CJMrlv
	 MIEUCCrHuFi8BXMrArnI9K8md4bx+vweqIVkq+B7OzX02gyTuzEYMG/6EK3mQVypc9bPy
	 013yvqxGCB7L/2m3P5XZIViPPmerxvOXTj383TMXVXshudCcno+T4WfjShjT8oJsFx0CS
	 AdZQEcnd88IC2CNVeeqXOL9UtFmG2wso3zTWnZ+wsllz5AhcGENQVqHgIWYH9EE59Zd+i
	 5vF87o+Esoj2D+yRFa+g1dpKBIYJA0VgDwSPoG56lGTWIOlvT444rHmQJ0RckanIWjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Zq6Tqwoy13MDZMHyfOVXO/CSS1LCV1C4G1JBls7Zm14=;
	b=ZkM82/v/8eLbTkf+4866djqmIQyQCoUqV5OmYA6OCAZiBrY0g2mmOE94UBcegmrtwXxi
	 E+ezLdvUxEiJwytNI867m9hCvTNzgY9AErd3Fn/kfalZ3sAy1q3jFBXQ+1bdXLa/hh+oY
	 GfVNxkmqGFyMqHV6bKfIqCFbpVwj63Ni5UPidr0uHCIm+a2J5Z8jGdS/nEHMRu1alXeh0
	 wH1gFfRgZIjbm3+iZVeMcd2UzIpB8KM3rni/KCx5Eui0mK3s5kd7/Jg2OK2GZWv7bzCce
	 t11m0CUAjaqPfrhdYfh5rUcI0gRR5BWZowEDtTgADKZ8YvHQSGWRDLcsdHZjojVRHjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BOVg9qHA;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20156606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20156606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BOVg9qHA
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45eb9967696so463794fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795048113; x=1795652913; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zq6Tqwoy13MDZMHyfOVXO/CSS1LCV1C4G1JBls7Zm14=;
        b=BOVg9qHAqYHj1JjipDuW3QnmDrR9M0cglgBDwp4lyFMAW+jOzsoGEykR/ITMvPJ25G
         1DQsBAMyVFKBrA9R3yJZ2pH2hSUk52OiTv+TH88N3Rg2Ulj1+AxXiG5X2NXU1D9BI+zp
         nV0J0KbwZeOnu4NhVblQ4kkJOfCdM4lYbUpFE2YLMlMAIaigYaaQWPN/7/4N51JoRkAv
         QF8YMtgz0CZTKlcXxF5zUGDdYa7e+2GtHWdWykKgTh/GF1ozmG0KY9Ha6KQTfv7Hx9T6
         ezu71WKQrY01Gf5OSXY4Om2oBjhk7TIM4+/18WusJdV4pYmvDYn5ch/Sqd0RYsV2XRcu
         QAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048113; x=1795652913;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zq6Tqwoy13MDZMHyfOVXO/CSS1LCV1C4G1JBls7Zm14=;
        b=QqMOYvN8Xjgm46oY9zfAOiXaGurUkyV9qFclrhOzEE9eTmgMfjPyHJsQAIWabCZZ1B
         GYNOd01MlRKwNiDr9EOK2bUn7POAr6+t58XI/ulz69MU60q2dqCZWiIMK0sOebpWHwkP
         5OnkXG5hYv7N/8P4AhX5IiwQsrt+r2j79cJ23zp+IQ4qv2/kkW7cDrrYYMpM9j/lv/vI
         bREpRjBelnuYe8yFjDIWJHcqv2ouRyPvOf67I/6fHJ3qkVDM+ZUtvCmXmgN5cjeVvOyz
         ycnglUQYleLlWjOf5FwsPWbOyy9igjChbxJVetAoppSDRtt4JzB20JhXVC+eQcf3LOyd
         359Q==
X-Forwarded-Encrypted: i=1; AL+hErHPYMYC/cXd1qw6Bc0TQQ4j3jU9bI+DKkg7Wx2iccu8Y4xbmnMn9MPYSmUyN8JjY09h7yh/6jwsNDMaX2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OxjED9xYwGrdV22GlqSORWLUC1GRxO/3sb0sgbhvoStU7db4/
	GFqlKoc+v8tyVr+pkVznBhEisFxzGCLPg2B6fD92nlSMAboRSPOAGfBd5v4PRFTyPVUE+sl33bs
	cEhmVjw==
X-Received: from oaccw5.prod.google.com ([2002:a05:687c:2705:b0:4ad:bde3:7f14])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:4e93:b0:48f:a8b6:19d3
 with SMTP id 586e51a60fabf-4ba69ba5e90mr327034fac.2.1795048112768; Wed, 18
 Nov 2026 16:28:32 -0800 (PST)
Date: Wed, 18 Nov 2026 16:28:31 -0800
In-Reply-To: <20261118211152.3430478-1-satishkh@cisco.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117205428.3717-1-seanjc@google.com> <20261118211152.3430478-1-satishkh@cisco.com>
Message-ID: <av5Crz-e2PaTNAjK@seanjc-mac.roam.internal>
Subject: Re: [PATCH] KVM: Send reschedule IPIs instead of SMP function calls
 for non-waiting requests
From: Sean Christopherson <seanjc@google.com>
To: Satish Kharat <satishkh@cisco.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 18, 2026, Satish Kharat wrote:
> Hi Sean,
> 
> I tested this in place of my IRQ-bypass patch. The latter was reverted in
> the test source, and I loaded a kvm.ko built with your change against the
> running test kernel.
> 
> On an Intel UCS C220 M7, a four-vCPU guest used an ENIC VF through VFIO.
> With the other three vCPUs busy, reloading the guest VF driver traced
> vfio_msi_set_vector_signal() through vt_pi_start_bypass() to
> kvm_make_all_cpus_request() with local IRQs disabled. The trace then showed
> three reschedule IPIs from kvm_make_vcpu_request(), with no SMP function
> call in that callback and no warning. Posted-interrupt updates occurred.
> Three more VF reload cycles passed bidirectional traffic after VF traffic
> became ready.
> 
> On an Intel UCS C240 M6 with the same test kernel and patched kvm.ko,
> irqfd_test, irq_test, vmx_posted_intr_test and smptest passed. I restored
> the original KVM modules on both hosts after testing.
> 
> One source-review question: should the direct IPI path check
> cpu_online(cpu), as __kvm_vcpu_kick() does? The old batched helper filters
> offline CPUs, while x86 native_smp_send_reschedule() warns for one. A
> target vCPU could leave guest mode and its CPU could go offline between
> the request check and the IPI. I did not test CPU hotplug, and this would
> not imply a lost request.

Ugh, yeah, that WARN could be problematic.  Thanks much!

> Tested-by: Satish Kharat <satishkh@cisco.com>
> 
