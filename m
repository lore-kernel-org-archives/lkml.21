Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074889;
	b=tJDormLX3e445lKQ4IpIhx+/flWNm7V8onjE9EIxQ/5Rxhx43QTzF1ocMAG7xAQx7LR/
	 iIMkbALAJ9yVzxTHvstCitGkBVy7hhIJ+XWJemVGX7LSciFC9rZufUbrRhw+9J/j3J9uJ
	 Llw2q6uPFp9DrpOUrGIobKNaGugw3TS+LCvaMrVDvNVLJvUnQc0YjY+XwrRPnDBW/Xaho
	 +bFoxnBbNjn8UrW+bA0vTV/7SRWHCjOKHWrekAWIHVZmOjhsCcledI0TTvlHYzXa7jWjN
	 SdKX3Qv8/irSIy6p2x/oRwgpe8AlEx4urkyE4QrkOcPrEFXmUhcVEzkWbUKcCOXZlow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074889;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+H4AVHAkxU3vkubZcic9ja82r8a7H7wKS0//pc/pxSA=;
	b=yAxckme5JMZVnkr63uAhySG4rU4dnLiXsL3usbZ5rDUe6X3ssXD8QzDDA0DLaG9i4MzT
	 f8s7GFVhBC/mBv2n6GA1XAWj5xGcvBkGM19MghoXon5voCajJ4iPWfbWKQskqM2wBke4b
	 JxkEy46mRKlyyHYzSYGnlagHXy3YUosHeggrxQp1Y6XUHPuHIaBXMbC7wViSpnGtJ47Zj
	 /ZWSP0UjwCI3G16wPSi4cGNDK5c6nASzGmI13hIlyRwIJCLjDQlCZTytip4WdpPHg/Xvb
	 y5CIN18nnWGyqwrxx646U/SEX2Yy6MefJVsZK1D22ZW5GyWMT9dgCEnEoS4IJw32Ztw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="PLyB/oPQ";
	arc=none smtp.remote-ip=91.218.175.151
Received: from mta0.migadu.com (out-151.mta0.migadu.com [91.218.175.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A35B606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A35B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PLyB/oPQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IUkhtioo34/vN9L4UPndwkkOKppLGI8BNNMRdeeG/sE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795074886; v=1; x=1795679686;
 b=PLyB/oPQ9b6eLgD2g4wfOAop/YJ3tndisoVwN/4RLy8pXxweh/I0WEEbonehvrFoMu8DNRC1
 QmzFf0xpR0hzCiex8dhBkp/VFSV+Jds55mQqkMdhHHQucBTMc5+wOqlrJQIFsKNUu0WqTR2BBGM
 WJhHlzGz+Uo8vnrW+vhg+lsg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5a1f0e3e9df6a29d;
	Thu, 19 Nov 2026 07:54:46 +0000
X-Mizu-Trace-ID: 5a1f0e3e9df6a29d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so3774e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:54:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHG/4B9FeJ1PZtNKTvWQ1TWCFU58PRN0ifufYQWiLVw21EU8YdX7HXH677E2qaswKbvBJhPFlYKXmlv7uQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H/4NO82qUx4T0xI+PqivMkKTlW+pNtyBp1KBIDo5/2Vwf/YEE
	756d8GKbJX35w3DtMWT5k38v0MTxh8Si+XZw7t5TmNATOa3jPMHDtZ2TXNYCVvF7MIhiilGBL1K
	iuTEc7Saj4+dmUhpcm04ckXgLu1HxgwaoQGESZevJ
X-Received: by 2002:a05:6512:3d20:b0:5c1:ac33:5a4a with SMTP id
 2adb3069b0e04-5c1b67303bcmr26361e87.14.1795074884909; Wed, 18 Nov 2026
 23:54:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117074428.7544-1-fuad.tabba@linux.dev> <20261117074428.7544-2-fuad.tabba@linux.dev>
 <avxfgWNePsGPK9mm@gremlin> <CA+EHjTzUrDxLSMEo6X66XhKtQ-=ew3zZhMdFWR6U9Ga17WLWkw@mail.gmail.com>
 <av5CBjbeidUUWiLq@seanjc-mac.roam.internal>
In-Reply-To: <av5CBjbeidUUWiLq@seanjc-mac.roam.internal>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 07:54:08 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwdkbx=1yQNP5=-BhE=S0uaoQnO3F-83d2WbYC=j9fd6A@mail.gmail.com>
X-Gm-Features: AclHuK9mtkqv6V--RBoHl1Fg-Xb2-fd2-ZgaHzAt1DD9Kl83ENlFhqESP2uZHtY
Message-ID: <CA+EHjTwdkbx=1yQNP5=-BhE=S0uaoQnO3F-83d2WbYC=j9fd6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's
 dirty ring is full
To: Sean Christopherson <seanjc@google.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Thu, 19 Nov 2026 at 00:25, Sean Christopherson <seanjc@google.com> wrote:
[...]
> > > Maybe worth mentioning the exit_reason thing if we keep this arch-generic?
> >
> > Sure, I'll document that userspace should complete a pending exit with
> > KVM_RUN before it pre-faults on that vCPU.
>
> If we're going to do a documentation update, I vote to keep it vague and scary,
> otherwise readers might think the exception proves the rule.  I.e. if we say
> that KVM_PRE_FAULT_MEMORY isn't supported, then userspace might think all other
> ioctls are safe, which is most definitely not the case.  E.g. something like

I'll go with that in v3.

Thanks,
/fuad
