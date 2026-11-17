Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948230;
	b=g3EQhCzBz9l8vSLRmu7v+Dll8P1Fcile05YlRrxevnGEEp8EJDNEqOAlHV6rWnUDPXB4
	 Ow9zB1scx2jNYC4j7GM5MPdOQePC/QFq56tYkr820/i+JGvSgS8iTwmPB+/8CJS5mHHyv
	 ziPhoTEwMMPeWoiHJBevOhYsU59/m6ykthpLDUncj1OcFsOl6g5ZIKUPWJKIF1HVBHTgw
	 xH5ftgzRXlb0xcejd8b1ubFtuiu+FWkhTZ5gpZAqSbnLWb8dzwAUB+rBtGiomWH/N8VUs
	 67tf8/KGhAjHNh861BtJPBvrU3BSHqaj2xwjDPrbwvgd99Uqmsm0ovECHxlIGmh/zOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7+VP2e4/Jx1gpeLV32IskoHLYhFefIx3VrQoyhcc2vQ=;
	b=mEinFOuRYlyyw+3YMJWwQYdIp67NT0fn8He+0pq/NQXD0loxu8nlrRvs916teLKWXGL/
	 wFx12y3Jeeyp5muq3jFJLD24hK+OXoPaHyN4dYXNXdvJ2LJFAg5QFCPwiMEgOE6/sIsiB
	 G2PjTfGk6CNnip+0u5aMva5vNIphNvwAfprVp/HI065kI9nQsxl2rMc9xPWs3v9MCKfvl
	 1YZheDGEy3lv2r152EMYSkJ7fIMZmS3pukkPzChbqIv+ec2VMr51+Ub33uBiyElv5yciZ
	 otN0JoDDWm8PVSpC0dpX9J5Ikd6dlxMuNWsZTSVpkvdfcv9nEv63YutofnqL+nVik8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lqbpY5GP;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81218606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81218606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lqbpY5GP
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37620eb73so207304b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794948229; x=1795553029; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+VP2e4/Jx1gpeLV32IskoHLYhFefIx3VrQoyhcc2vQ=;
        b=lqbpY5GPvsl7zhPAqUNihZIL1NAVyyEGEX/qnOIniGI8xTvMmxNSHu2vsK7I4lgg25
         0oJi6dkbUV6+GjUh9aNHRHJ9I2aBTwc5FXR6xiqpKyGZ6SgyrOzf2CkEb3nZMfDuf675
         sDwE+apequohwZHdSJZ7FYuW8CH2Jzv5CbQOUHhgMYdGr3bxRdgl1it1d2ifMFN+imPP
         Dids0Ns0ll8XachZAX4Jz5yKXKz7HjyezbHU7mQ68lAs/MXwk777pYrgZldcXRTnosgP
         16hRAp+3fg028x/hpGt4S37dgc8NRc5Wr24iHZdtC8LJX1t2IL05tcfE8wTberj4e+8J
         kxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948229; x=1795553029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+VP2e4/Jx1gpeLV32IskoHLYhFefIx3VrQoyhcc2vQ=;
        b=TEPI49Y40Tp8STLA++yA1MT9aqYfTAL3rwS3PY+4Aeq/ibkGSzonOkLB4rzQe1SLp8
         X7LHuyM0WFqWzBbhUSN9L8E466l+rAWrltnpJEacddsG4m69U0IzLc8xkf03/QPKWvQ4
         FJc1ObG4iAiBDqkiNg5bmDwyd5Aij3gWRBikPRpzIPA5J9XYls2q0HhOdkCCyZRYYPkc
         qwM7682VEjm8zx7wcnsMtVSSxWKAEEamQr6Ey9CwqW5IujC71Xnxd9UHOf+pkaRWb0P9
         D9VOKVXWzKD1HBipH5vsNb/pQkkwHa81YUUqRZx/+ib3i9kz0u7ps9IywsLB8GUUVM/x
         ybOQ==
X-Forwarded-Encrypted: i=1; AL+hErFqf0w7q5DR5NdHICGQgM2o+7lQH321ASEqdrok9dsgc09XelsNsCD3H3KO4EvOcntVs3oto2ygU9AcDSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TXDU0JBpFR4gGWgPbt+oS4QC8QHUC2porBRVOWtam/1vKV2vs
	otOst/6JWMHZmtlLIOEphqt0AU3RGjdKf4Z8y48EFS6xqz67Remp1kVmw9Hm+52VCCQyFA8S88k
	vzAp04aSk6/XGymrr4TnH79Jlmw==
X-Received: from jabha52.prod.google.com ([2002:a05:6638:6bb4:b0:620:1989:fc1c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2384:b0:572:72d4:9ac9 with SMTP id 5614622812f47-577424093eamr890686b6e.27.1794948229188;
 Tue, 17 Nov 2026 12:43:49 -0800 (PST)
Date: Tue, 17 Nov 2026 20:42:44 +0000
In-Reply-To: <86fqwz1udi.wl-maz@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116200418.3535619-1-coltonlewis@google.com>
 <20261116200418.3535619-3-coltonlewis@google.com> <86fqwz1udi.wl-maz@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261117204348.4020440-1-coltonlewis@google.com>
Subject: Re: [PATCH v1 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0
 when E2H0 is NI_NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Colton Lewis <coltonlewis@google.com>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Marc Zyngier <maz@kernel.org> writes:

> I think this is the only reliable test you can implement.

Thanks, I dropped the guest-side HCR_EL2 check and kept only the
KVM_SET_ONE_REG/KVM_GET_ONE_REG test in v2.

-- Colton
