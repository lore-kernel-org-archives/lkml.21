Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995369;
	b=ASeaDK61kgyvHT2Vezk6B8E+dIUL9nIU36yqra/mIipZXCOEcdyE8rH6CCL1Lc/5Jmaw
	 yg845lVPaFcqITjpf1l23T4xypPkmknTtqMDmcpu3IonimGykxEBVLnfbRDZQUIRBbYo+
	 O6JQQofeLh/J46li9fiZixSZ1dPhNDqLed3/r2CgMgATmcXsnoa+89KC0CZybXNPf0em9
	 xfR3DBTr0aY1AmosELtPjTAkKQzFn/I4qBQSgUymoeICylqcyGcUQcpEFPT29B8uLKWJ2
	 iSHNY0FODJjUchACJylp0n/uWfEg7CM3jL36k+1ytvwaTxjungxMz3m5MZH91tE6DvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eKBaI9IJFRvSTDs3vFF0BZP6tRpEFtGp1f2GxMVgAgY=;
	b=3PIVUYbooX1MoqiNP9LZrZmd3MPNV+hOIu6wBNnx+vF+8H5DERV1lbEUJAKiFBGJfH+b
	 cLGNQfzQiTh5I+ifXgVoow8LzvFEzdkzni/4JOSVb/3Gi45a17cClTD6Drw1UmaxiQVTH
	 IOjqdqLcae0kyxY7isJTi90BPdzt1pw6ETY/XfqqXSH+s+GgKwMPpSQtQyd+rsj6Ue3bH
	 IppY4g4NwL0KgzqmfyNhSzZ6q78npkKJNDgW6VMbs2iN9dpGkq1jGAP/1hJUxtcQ/4bzA
	 jkrMgsinkf351sjl8fOCYpu62UhydZPIr5dajQGfFKxhqGIFaqQVkZCt6g6TvJ508eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fKsKG7jD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCE2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CCE2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fKsKG7jD
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36dbde64409so1504106eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:49:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794995368; cv=none;
        d=google.com; s=arc-20260327;
        b=i6barmtJNjwW09p4nyKBUNaDweofvktLCNMU65brDREdld4HZzwT1x1PM8qXdgKrS0
         jllTwy1kdqK0P10YZ4O+zNZ+QqC0CjY4wqjkTKrsP2G+54i0rB4o4KXaq2IKQHgiWu3k
         64a69eEAgucCewqgQe42C46v9QHVFGJWyvBVgoRicai4kVKuvjp6ESM6m9WhraPGLTru
         77MSffU9WFWNrBwIXSEKBeQKwp2rFyXodra7/mUDq4gkx513knD2kE9EdEsx/x03B54y
         eYkAbB0LB8J2/aWaIF/vTjan9YR49EMh9M7eEIrRiF58geTQF08oe4K3QywIMQbljEuA
         kNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eKBaI9IJFRvSTDs3vFF0BZP6tRpEFtGp1f2GxMVgAgY=;
        fh=YFHP4F1c/OO50PBPd2jtjH7lDzVk3TCbN3LwyLwO4Nc=;
        b=BhAC9hM+M7F5U4KEz/etZY3PTIHPP+O1Fg53v3BUEd5kAcat6dTdB8ajoHCkKxBA3A
         gkxfn7MZLhu7UZ+SepFzklpa94EnFhU/bNjawvvdxPAssGxnA13B5iDyB0C3BFCijar2
         crTHHT2/dV7wh5LMkBfJtLXk/OBZOYfFNWejF8Wi32iGFGgVMsis3Cs28e6oo/AGZyNQ
         Ey4bxP8kCg5f27c3FFYSpIg07HGjOcdHosrFq0ZLnWxgdVHq5G3eO2D0tVY65AqZIWtn
         2fq1laO8V0DQxka5Hv6Z3yWUqf6YzMG8QvyKpkE9UAI0pxfmXi/bDHvn/tBbM3J57/kp
         oP5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794995368; x=1795600168; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKBaI9IJFRvSTDs3vFF0BZP6tRpEFtGp1f2GxMVgAgY=;
        b=fKsKG7jDuhYdfDbrzyai2AnGdgT0eA/inifsMb4tw84Dib3roTwAL+gZabvHTB6QoP
         tlZDgOevWlibyWkYiikzedORhchAONmcO4Xolq9GgO4A/Hyp+TWtXSPoyhznAA3mEtHD
         DJJOYCoJZDcM9UxdJbhmTPdJwnuXmgCG826XhRpoVMm10S2jhnO6jFi8WxZI9ybt0uhx
         Kz32ni+bPwHg0ZjUZa+oiWGCa3xDVv1cqUN52APAJvFbrJkQ1ESKwVNJfV10K1QlYTLO
         sOFjPQe8at6h34vsaJ4QqPOSw64F6lVRMHF218bS1EvYo1H30RCc5FJAEsVyZEOaVnoQ
         JDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995368; x=1795600168;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eKBaI9IJFRvSTDs3vFF0BZP6tRpEFtGp1f2GxMVgAgY=;
        b=P6FFNaN8YBZoUwErpkMctNCg7cM3Oy7MesBw+AF+TWNI+niSeAuSad6VMoSPPRotY6
         o3oBEgJpmbQ5vtlJo8x5pHoSsnZHBxM06sE7CqSgSQEf60YaIWK/2UydUWEDol0Ege42
         O0p/mrbHYl6xXYKHNAE6phSSyITgBx6i6tr2vNnpFjpxBfroGC9CQGhWdAxKvPBkWZCK
         LoZGv7lG4IcP7hJI8jKY23Di6WwvGLUYogQqPoKRas4N7mFmma1RKtoAQv6bX6xjs+UN
         N6O3NtfzwcBzeYtMGg/UR3682+H2Ermldf5VbLhcVfUSFdZ3VIvVFMh5kioS8URhtb/p
         LBYw==
X-Forwarded-Encrypted: i=1; AL+hErGwfTSNAaLJn6VfmGoxrQd+SSEKpwAB47nKzVkI3MU/fdN/PXHaG3uLhj5eAf7ott7ueO6Rj3D97i9Nmqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bY/dXf0j2uLJppq9F4PMVNVs/LxmdU6mPPOmkM4/8+2IGP1v4
	GaxT0gRSiMqsxQJiBKwtXntZRA2n8Qh0y3VFJij3DdPyPdIC23fBVaJ5QJOp9eEKSn78ZCU2e4a
	KGsPQ4q9l39IQOByaGQVohffLluqaQjbH8qe/RF9dGRMPZzWVGKdHUShm
X-Gm-Gg: AYBFou2+RUY3H3K8RP4+BubwqZJ4KTVvFqDjabLosu9P3q6QkirAY5fY4L41jVUEm29
	lRH0SxprWwbfaoY+6rSP6xQeR1PTvhJ3UjJXnyEeubtiKTT7Wuh2TPSQGDHxXNc2yg98ZbAvCde
	laP+8GVwEyw8CboDduBcumIqYQwHlG+ay0jrluUbLdMHDip3MxF/HSq+QE/AU9YFWxjnhkwBAFw
	T2Dbn5YFsFwCk8FqjlLS3oT8AGcmdvh7fTgf5gtikEKoPZLupD72XRYI8NpOfo4LZXhZF7JWgb8
	qjgp085hDGyhkCyCRmU42cHeUcvZyJjvf2OG5r440k7P1SWKwtnplANB8RzHiRBatZqjREkCAzR
	bZfuesmgbRwFo2f52VgKKaKOi7oIbJ628htDOWREpW0CHJ00BcV8heO5fE1LpBc2NxqKV
X-Received: by 2002:a05:7022:4183:b0:18d:5ef2:1644 with SMTP id
 a92af1059eb24-1b543be5439mr2689602c88.30.1794995366690; Wed, 18 Nov 2026
 01:49:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794869902.git.bvanassche@acm.org> <1120d27263be7908709829ecb184a49e1eda1033.1794869902.git.bvanassche@acm.org>
In-Reply-To: <1120d27263be7908709829ecb184a49e1eda1033.1794869902.git.bvanassche@acm.org>
From: Marco Elver <elver@google.com>
Date: Wed, 18 Nov 2026 10:48:48 +0100
X-Gm-Features: AclHuK9BFQzWa-t0_QwXBzM3wajdbFON-6HFjocumqGFV206fQIWhHQtyJ39um0
Message-ID: <CANpmjNMfoPGq81rJm=nntrj4VQzFB_G3xrw9_PBymGx+ok9eWw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] bit_spinlock: Fix the __bitlock() definition
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 00:01, Bart Van Assche <bvanassche@acm.org> wrote:
>
> Surround the bitnum argument and the entire __bitlock() macro expansion
> with parentheses because bitnum could be an expression that includes an
> operator with a lower precedence than the addition operator (e.g. the
> exclusive-or operator) and to prevent operator precedence issues in
> callers.
>
> Reviewed-by: Marco Elver <elver@google.com>
> Fixes: eb7d96a13bf4 ("bit_spinlock: Support Clang's context analysis")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

My Reviewed-by on this is still valid.

Thanks,
-- Marco
