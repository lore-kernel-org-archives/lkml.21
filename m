Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034135;
	b=ueTgDN1tS4BvRu5oWqUw/K1QCfI0Ng8SJtYo4l66ovgzo/KeqCVGS8A0SlWycnQq8d/E
	 eMSeLAbzluz0PGW1dFMx1/iWrX2gSHKsQWqsSX6HN+H8CcJgM6JDBtoppL4mAzBEK4mIV
	 19NTeH4rcrKoD6ORPdfy9b9FqVPZTcGF768CJC40p1U2lkCjuh2pb6C/6ZGRWgEKfc4dy
	 VytWmF+vT4rVkmyI5AKLrwNRLtIrLlqbMtq41AZ1haTZUqGuda01VgN2C1zQJkw8kSkKx
	 pAYTU9QuB9BajTF9Zf1NIDpq971viQFn3nvOtz1FpGhzcTZ/PUJI1Np1zZMTKnVSsqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=e4z/RAPfyhYM0nAZxFd/+R4Vt1inNTW4BSIaRYbDcgw=;
	b=r38C8MWK5oJ0qh4FaCkgXu2fixKLrKnjMewI0yDM4qjXgG/HvLrZ9vTFyVzzSrLAL8rs
	 Avz4ZesbET8m/b4aU9efnML7HL6CbFW240gAk7kFAlv8xwdvw6oi5jfr+YaebIUBDWb6r
	 a8TInuXWkbKJ8XD1JnrRnQn25p0dP5kerdXBO8WefkP1jF+V8wsNxrCIrkchbIGxq6GZf
	 O7gzhQM2vwS8l3dypE8oAHVM5QHfTFtKc/tJ3OPU6syR+dbbo1QCi9iY/SfuenGhkjVGM
	 mC+sRmubTHiJQ8CiPMq3eG5OzRYurvfN+mKSf5/Nr+XCBzydoUXrmlDL2Cya55qlcUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oCGsYpUE;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C33606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C33606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oCGsYpUE
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b26d8d2498so1446475b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034134; x=1795638934; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4z/RAPfyhYM0nAZxFd/+R4Vt1inNTW4BSIaRYbDcgw=;
        b=oCGsYpUEsv7cjMcivMaHXNXe6vIvid5OJm7KhCZTDi9zIBEg27FeI8EG5Mg7GqmJvf
         KWOaKyCXf7xHDp5Lies0dwnw/vS4J1QyvrtUQDrTLkWjyWa+I79i5GGhec4jKafIozwJ
         fWUBqa+67F4Fc2ehRYbiTly6NWqmmUG7SJ+L3wus4iIiHMDbPWXP2PwvzGjjK52+VaG/
         TnaEhgOGoS54HvHNRSNhbyTrdK2wo8xfJqwlMIPUJA226Qtw+yoF6tBbcp0DHOVwZ8lq
         0MnZmGfWgxCnrUK0ImP7UEgNWOVXeucYbyCMcRC7Q0YYOvMWNYJHrvlK/FeXQ4hkMTit
         kMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034134; x=1795638934;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4z/RAPfyhYM0nAZxFd/+R4Vt1inNTW4BSIaRYbDcgw=;
        b=f8bf1gMoLVN4fQzvFJtNr4FRpdTB6JFVW0BowTRm4dixyTHuf+MPaXOIFfdbibd0P4
         ZJmV7n4P7HHQPbDTuhmyfVMcwhpD8+/hhS7KYhqqzRvzY3BI1ZNrL2DQNFZWgPwHMU1z
         RpvRA3A2Pois5DNUhMYqnGkOk4XOjrhNZEjdq6dIgOmyua09T0b4+/ZYBiEyu+OkL2og
         7DfoSHtz3uz/v8mV6Gq9lraoyWbg8VnUCC5PYZzEVCL5ZuXn4SWQcB4Qgrc+1GAzOsm8
         lrXmOBM5u9SN793pIFKa/tnODKL6ZtU2QwbaLh2/WwJvKoVp3HuKv3gBTirNj5GC0D91
         zr3A==
X-Forwarded-Encrypted: i=1; AL+hErGTnnp7TZbjqCjTxYSmJv0iTiFEMNxJZmL7BJNgadGQac2QJry2aaMB0ZIxhjQ5uSA4jVnOaNulfQw+/7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EhuSA2d1DyBmuuAAbLMPhnuBFly9j8FPK+hADKBT0Ii/JRXqQ
	kcMO+VknxK99O3PNEUmSeCC6kEIbXiheE5FA/72JKMlrlWm8Qy45C0Ddun2tmYSvOf5xyXExW9g
	GtEFWJl2dh2u3eCBQww8pdIMxtQ==
X-Received: from ilka13.prod.google.com ([2002:a05:6e02:e0d:b0:549:a2e5:e0b1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:308b:b0:564:4d77:7051 with SMTP id 5614622812f47-57740a4b41dmr5099085b6e.26.1795034133585;
 Wed, 18 Nov 2026 12:35:33 -0800 (PST)
Date: Wed, 18 Nov 2026 20:35:32 +0000
In-Reply-To: <avzaDnFRQ2GTHDiN@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117204535.4036191-1-coltonlewis@google.com>
 <20261117204535.4036191-3-coltonlewis@google.com> <avzaDnFRQ2GTHDiN@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118203533.740768-1-coltonlewis@google.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0
 when E2H0 is NI_NV1
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Oliver Upton <oupton@kernel.org> writes:

> Again, comment would be helpful for why this is done from userspace,
> i.e. the RESx as seen from the guest POV is stateful but the value is
> ignored.

Agreed. I added a comment explaining why the RES0/RES1 check is done
from userspace via KVM_SET_ONE_REG rather than inside the guest in v3.

-- Colton
