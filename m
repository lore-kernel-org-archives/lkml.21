Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999503;
	b=xoUUxdIDyyv4H8zCtlh5gwHaYGjhw41Si7kst3vpd/JR/RpE3oQY26vHxl4VVRxBUfCi
	 XGTiZGgicmEMzGngpf8SyazJDnGBF1573ldU2d6RzeuAd6tGbhE6Bs/6mjmnP8w12SwgF
	 oTsfO/XHrznTs7aPXAj3IsOpVr7fCg5HJVh+12n8vg9Q65q7VzzpX8DoKtEUwdLYiti2r
	 8aT/vluE2XUDcfcLa/qwFnibInCS8kRvzlI9+N9KHAx377mGNtGjyP0deCODubGbWkBKY
	 H6U86Vhm09UGIbnPW8XNM12J+UjB+Z/efo7nXMe/uI4JZ1P1ixI3EfLCgdXE5zz33rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999503;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ji0Sy7yk69gklaMPP5Zc2g+qgmHVYq7bGDR02Mw+y7w=;
	b=k+gdMPlTwhQUzOwur6V2v/d7i4+cRgelpOff15X9V1W00jV0+vmVgcYqh+HbXr981XLV
	 9N+QjD7JYDv9gwNuXf54vmsRdhKhyTz8ZfHD1I2c9h+umi48mYsKJahIPqD7nHvRsDB45
	 AiztqRIb8RyFcGumnUvRjd3szPCyqBLnkOG20GqNgNcJjkV5dpkaRSYuZybAiMJhqo2EV
	 yvrpPETGsEVf5sAJ4yJ4JZTN54aaQorQsnC00RiBbntsHHsNu2TBwhGA5ocPUr6imC7mN
	 /EkvxxRWxtWHdpN1/DyWE598NRwxEJaBZPi35a8sLhpgDD7Tk82jADqjvCOz80hPK/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vt+IfZIZ;
	arc=none smtp.remote-ip=91.218.175.91
Received: from mta0.migadu.com (out-91.mta0.migadu.com [91.218.175.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF45606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF45606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vt+IfZIZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ji0Sy7yk69gklaMPP5Zc2g+qgmHVYq7bGDR02Mw+y7w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794999500; v=1; x=1795604300;
 b=vt+IfZIZJOS0URSsZzPpdtdsks8eAAoXxtanAnia9tpoLGYih90ndeL65criPFR/mMaeZzbf
 uzD1nRpduIpEsqu6Fxvs3Q1n9Z22EIz+r2sA3w68RgfwEhFr9pVOp1v3bW/3HKMBCT+aNvk+OZG
 lEpOXQMrET0YpQ+nqPVdmU4U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 712f68f25f2d5ccc;
	Wed, 18 Nov 2026 10:58:20 +0000
X-Mizu-Trace-ID: 712f68f25f2d5ccc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so6825e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:58:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGtbZRt/dY1CPmEMjJYQQRCGVqCxJdS3igwqmRJXMZ3B9mMeog/ZT54mP+SfivSsknB6Q4KoMit/vP9z1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sSIwOBhu1Xf13fEvduwayQpmzLHMymtaXo3h7jojxQPYd6CZx
	rv0dVn2L4hcKsNSJSswvnBurrf6I8rFDDGYZsC8NI5e0bWN/P8uFijjz1UMFebWkdrJckGSIhqy
	2XViSKPOmoXDxPmBor9vW8afDWD0gKiBwz/54/2jf
X-Received: by 2002:a05:6512:2346:b0:5c1:6e17:16fc with SMTP id
 2adb3069b0e04-5c1a985f78cmr169644e87.2.1794999499497; Wed, 18 Nov 2026
 02:58:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109084854.840576-1-fuad.tabba@linux.dev> <20261109084854.840576-2-fuad.tabba@linux.dev>
 <86bj7n1bzx.wl-maz@kernel.org> <CA+EHjTwJ9XTCfrfBLgGjed3GrRtiTnk-ErvPSwU-AhvyTVcnsw@mail.gmail.com>
 <867bia1kab.wl-maz@kernel.org>
In-Reply-To: <867bia1kab.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 18 Nov 2026 10:57:43 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxMVXR11s5_U5144hdpYStkd1-gi1P2HK6DLnn5D4RW8Q@mail.gmail.com>
X-Gm-Features: AclHuK8nMc23WqG7bzjhLPz1LETcOHXAsv2Kso31Kz9QH-6JXZhmhiORkbvHHMI
Message-ID: <CA+EHjTxMVXR11s5_U5144hdpYStkd1-gi1P2HK6DLnn5D4RW8Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] KVM: arm64: Hide generic ptrauth from protected
 VMs without ptrauth
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 at 10:55, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > It's in this one because pkvm_id_regs depends on it. The test checks
> > that GPA and GPI read 0 in a protected VM without ptrauth, and it
> > fails without the fix.
>
> But that's a *test*. Nobody runs tests as a production workload.
> Delaying a fix to satisfy testing makes no sense to me. If someone
> screams that their tests are failing, let them scream, safe in the
> knowledge that you have fixed the problem rather than the symptom.

Ack.

> > Would you prefer that I send it on its own, or with the respin of the
> > features series?
>
> I'll cherry-pick it directly.

Thanks Marc,
/fuad
