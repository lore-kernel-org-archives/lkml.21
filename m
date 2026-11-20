Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183769;
	b=x7HCSBl4YnpVFvOG/cwCKiWWyyAcKIebr+CrK0cvUVhVYCZr3tKk+rcgRF5ElYLjzq9g
	 Qij+3cJ+6FLaw4WYIQNhYP4R6j/MpjpalQHnMc3y1LIJ1mFg/qDac152/8BFq8jPxp5hO
	 aH6fBKy3oVPOKW/8l/qW2uQsgF+mlhN/XdWV0HptKZ6WkiOEWWoDtGhpBiDriloX8EHcY
	 myb0COyZkz7Yf535Vj9eyHbU4lPlKCASl8As+w/g3NHCezlxoQRplWICO9RZBTYkqxrXe
	 rgJufiVGi4Jd3N1pr9fnmN7nSjMOO86iJE2VOhpfTYihi/I9aKlU1NYhIoYEG+LsBMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Fcs0DJBKtZLUxloKKuDwNaVEQG5Sv/NarhrhzSQukPk=;
	b=eEOeUAvBrsMU6VqjeawmrOBCU960jCbzrW6UXTcMI2qIxWFvAvXaxZIZPKnk8iuroaIk
	 Eg4N5h18Yx3fFeMFwX9eThdkaAj52M3yK0kcD8yohfJEZxAp3XznQ0EvufJTiSqrrgKOP
	 Wxqaq0PeHLB5O1q3Syi0E4f0jpd2xiJBRDFjUe3y0BoIjnrC/hc2RjsmZIggFSW9q108X
	 EXe/LfPBg5ws44T5BE2G8pCEP2tWFumjvllSqcwIPZlwbrLKy17aFdQuBpWZ2McjvjAkq
	 BgQ9gw24iNkmZkey0R8rk6fxStC54FAXEVQxDlcHpov3y1Ml1g5r+Dtl8zH5giyAnnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=phsZOd6F;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA158606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA158606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=phsZOd6F
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b97460a133so902217b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795183768; x=1795788568; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fcs0DJBKtZLUxloKKuDwNaVEQG5Sv/NarhrhzSQukPk=;
        b=phsZOd6FHm2fLXlBEPUk4HxHQsr2YjaF/8w8uBbsM/PVnx356OU/hMbwUbzUHLeBg3
         qHulj4rKFN9eSri/EBSKVaLa+0AQcb3ImuX8vxCNSMnrR8V4jU54wTq6dFhHpi71fH/z
         6XWFpi8deUl4U2lVzNSiE/+4/UY2tuES1tkJhoC5wME/1koEmYrUy2UyQ4zF3rnIdiAG
         TJu2vG9djnhknQ0fmwqmmjfxBxl7SrmDA2hz0Sc6d/KfCkF1tkKrSF4jZZUo0Paf6fJN
         zBUoCLo9FqJpdsnseJS2iTmbWZtGMaTAuCyL5OEHvpppSWxcOl9ntNLlkK99SXPO9/6y
         kEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183768; x=1795788568;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fcs0DJBKtZLUxloKKuDwNaVEQG5Sv/NarhrhzSQukPk=;
        b=DH1DJgALMWhFuZ6WC90RyxHm3BfTCZv7P2NWWfeWDrxAYHNUHBYBIuxbsEHCyzVlop
         UHj6QoGO/1N/gwNeJj4D6+XGenrvJEaOnMpAMcSKET0ZiTu/Il6co0N07C8sDs6KxGt/
         iDrMH2hxqYD5vqcKutaiYS3r8k2p1mzxvVvw0FJQKGmk0V67Cnx7EceVuwVb6LuFPywE
         2tRktvXfWe14OW5WX2Xd/vFrxuq50fkizJFRsFzqs9G5f6ARQNJZKgnE4wJ2t1naqgtc
         OYEfEY9tJzzxLmiRylmgbsNUpRz+aMfoDrmpwGWRFrbCZMAmJ+Old2DGQyR0H8vH8d1/
         pHsg==
X-Forwarded-Encrypted: i=1; AL+hErG7Tvu604sYu5dMPfo4GX2SMH8RZTtbpFk56cdqXoPA2X2cKUpvXbxiOMUqjY+eIIfcmUFpkOzCOC4gFS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gYMpqS+at6FPpUcLONbC09ahJEfe+mqCVKGdzfdqIKxW//Agh
	3ms6xKLoWynOFwxqz+IlM5rdx6xQ65RgEHMORsWGAiNf1nhFhm+b+dkShkaOZnssevZNfad7DLB
	XucwcxQ==
X-Received: from pgin4-n1.prod.google.com ([2002:a05:6a02:8784:10b0:cc7:cad8:adb5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d52f:b0:3de:b95:d50f
 with SMTP id adf61e73a8af0-4014c945bf6mr2794811637.24.1795183767718; Fri, 20
 Nov 2026 06:09:27 -0800 (PST)
Date: Fri, 20 Nov 2026 06:09:26 -0800
In-Reply-To: <20261120-gmem-selftests-fix-v3-0-d94ffe17ead6@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120-gmem-selftests-fix-v3-0-d94ffe17ead6@amd.com>
Message-ID: <awBUlv3ItZiyZvlS@seanjc-mac.roam.internal>
Subject: Re: [PATCH RESEND v3 0/4] KVM: guest_memfd: fix NUMA selftests
From: Sean Christopherson <seanjc@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Jim Mattson <jmattson@google.com>, Peter Shier <pshier@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 20, 2026, Shivank Garg wrote:
> NUMA selftests in guest_memfd_test assumes that node 0 and 1 exist and
> have memory. However, nodes can be sparse or memoryless which would
> break this selftest.  Select the nodes from MPOL_F_MEMS_ALLOWED instead.
> 
> Based on kvm-x86/next.
> 
> Tested on bare metal and in QEMU. Without this series, the test fails
> with EINVAL when node 0 or node 1 is not an allowed memory node. With it,
> the test passes for any set of allowed NUMA nodes.
> 
> RESEND:
> - Rebase on kvm-x86/next. No code changes.

If there are no code changes, then there's no need to rebase.  Please use
RESEND if and only if you are sending the *exact* same patches/emails, e.g.
because you missed a To: or Cc:, or a mail got dropped by your server, etc.

If you want to ping a patch/series, just ping.  v3 is sitting in my TODO folder
and applies cleanly, i.e. there was no need to send the entire series again.
