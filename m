Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944897;
	b=nm83qGJ/CZ6EYRRKEk6VTb7T+uky7mubXjq2oa/JEd1Ol3GsiR+u61QW5CIwPmGSV4r9
	 wMDPg363OAygmQ3Be+Qep2G8KO8zVKUP5ag4Nn628KeqdcLx09HUUDmp1lo4UK84AyQcd
	 C60EijpVcAqtCgTCLW4cLmMMeOZj4zhsxilfriAEcLqLAwUrjKuUzFE9u5X0D//qNEgZ/
	 sNp4yzGPv3buZqY7PNFhrk70peKW/j58Ce8U3qSwLO/q48/de9ZQrfjD4Uvm1pBTu0Xkd
	 LeOrheX/a6IDw2NACjIBVKhgMfO/7RH7cOwNxqYKXPNKUOb8zCIJw3JrgC/YSvxHLnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944897;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=uKJuLqQr75Y+bo8J7GoFF1WkhE7oAHbeqLhg/Qlni5U=;
	b=B25AFFFgiUZw4F0Tjib3dY6A9Sp4ssssOLdBe2Nx1jVDZ1849y+wMLhsSPPdpAlr3nwG
	 pnlZ3baLJxJas6odPeGWIXTctVmzV6c9XQfKSLFk5jzvI4RA+aIdm0eLtl2sExm6ti7Ja
	 SloMoeLtjdcqtCDbCIZ/VhsgQSKrG1ZomMCBPE/4SwIntyFJq4DPwbmC/KmYtzXG61u0O
	 5tGpSXWVbc5Juy6Qo3OX+zNApSbA9S7pmRIT1I6thobpgvwUHa7h8DIp/Exh8AK+dhz+y
	 +zh/O4U2lnYcWZQWjx5rHEzMx8hUlg3EYnpfKQ9R3ZoHkRFgGsOr+lypQ8kFyIout7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rqw4fFDc;
	arc=none smtp.remote-ip=95.215.58.96
Received: from mta1.migadu.com (out-96.mta1.migadu.com [95.215.58.96])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A6A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A6A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rqw4fFDc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uKJuLqQr75Y+bo8J7GoFF1WkhE7oAHbeqLhg/Qlni5U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794944895; v=1; x=1795549695;
 b=rqw4fFDcMRAqhAuvdwRL8hNlOoenIIO7K/12aLpx7A9cgGVc3YWlB9ZmZceoSoSM+DhnuEG4
 SgtimKp2f1bmwBL4YrxaNMYujgzU2DzYWQc50zokR1iu1k1zpbxF+zEsmqI8hRi9oPV02sngOlR
 9TOrnrGM8vZj/DpmlhMtpCDo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 736f7415fbdd7fe9;
	Tue, 17 Nov 2026 19:48:14 +0000
X-Mizu-Trace-ID: 736f7415fbdd7fe9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be58ad9600so1460e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:48:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHc3ZtWf+pcAKzpk9rE8V1DHex787wUEN4DJrmWniNPtDnW4GGEK1zBwoB8PZ7qAGf98gAXPGCJKd2rYaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/c68n3KJLimRx0x81TVnGEyhicV0RfwKys5ZB5jbE7LLHLQLb
	Uer0id5NdysXU182OZL09UQjEWkojaeQDvR/Z/P6DzYPUvrtMbj0snF69slwXhy2y7HqQpLTCCb
	T5Qz4yIW9XOMwyXc28rRn4ZHohIIv+i1UON+70JNU
X-Received: by 2002:a05:6512:2514:b0:5c1:488e:a067 with SMTP id
 2adb3069b0e04-5c1a21b8c88mr211122e87.16.1794944892940; Tue, 17 Nov 2026
 11:48:12 -0800 (PST)
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
 <86bj7n1bzx.wl-maz@kernel.org>
In-Reply-To: <86bj7n1bzx.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 17 Nov 2026 19:47:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwJ9XTCfrfBLgGjed3GrRtiTnk-ErvPSwU-AhvyTVcnsw@mail.gmail.com>
X-Gm-Features: AclHuK-8bTfTjzWgE2se3igLLysfjqAzQV8BoEmKuQlaC_gyenaFOJ31_2y-pYk
Message-ID: <CA+EHjTwJ9XTCfrfBLgGjed3GrRtiTnk-ErvPSwU-AhvyTVcnsw@mail.gmail.com>
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

Hi Marc,

On Tue, 17 Nov 2026 19:41:54 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Burying a fix in a selftest series is a recipe to make sure it is
> ignored for a full cycle... Why isn't that with the "massive feature
> set" series?

It's in this one because pkvm_id_regs depends on it. The test checks
that GPA and GPI read 0 in a protected VM without ptrauth, and it
fails without the fix.

Would you prefer that I send it on its own, or with the respin of the
features series?

Cheers,
/fuad
