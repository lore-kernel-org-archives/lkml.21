Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948226;
	b=fORNKmHqfPjXZ5xjREdM5VRFyhm6JM+gbaK0sXCjK3my8CcCb7HdTi6a6BnFP8d7wTS4
	 PV9gVxtfWMqP2Nitcw50xf/h2YQjr2ZmEFn7cKY/JNQ4Xsby6Khf77iNbO3Tm/l20lv78
	 5J4GkSW8e6vu5wyk83vUs3hODuK9JrH75gZjTJXkyWYMxvVkcwKeaSoeSLytOBtvnrc51
	 yYYHGHk51kk409ui+9rck1GatJkD6+2F819i5wRlHFChx/7ss3oWr4Xo8WKBj5zdPADOJ
	 b41UvPq0CTdS6f7inyWDLPLOoQrYWDcC7BaNPrvdxTHHEJVaXSIwpn5NhRN72f4CczQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4s7Hggd7+AEEhOvi2jMoV+jP1lHkwbJcfKFilHVKaf0=;
	b=e6Ux39+UuHVeWqDsBN9FmxFUye+EL6bDl2TC/NAk/xUPoZjcof0PcF2YW+QbvvMNX0P7
	 mGAlMxsIJSdO8ZrGLa2L0o0n8ZajA2eqdCopeOdnAwBpsdWt6xcHe+Y4V0e/AoFwnlJ9r
	 IYoln4FZC3V088YhDjz5czTrRSH4dXLMoorvV8KAjBccewKBJOHVW+ydwNI6iBn6D3g8I
	 77lLhJOucbdRMFvIKJESs8n5sWzXeIJHXRnp2A88gmap2r8ateXO+pBgkWdCPBWwe6q+3
	 JTbMxR2zn7oKcx2z+knBmhWrOfzCnCpFlQpwvmwy8b5XpsLl8uBlq05NGpQnfhcGNTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hf1FZP29;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B874606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B874606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hf1FZP29
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab8b4887d4so92990b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794948225; x=1795553025; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4s7Hggd7+AEEhOvi2jMoV+jP1lHkwbJcfKFilHVKaf0=;
        b=hf1FZP29riuJ8joZj5I8/Dp0oiP2wnkbiDC1o23rDnPmSLp/Hn43Cv5j+JMs7GJtWI
         GY4XVk4SGzv2gD/1hGDkvfR4PyLkN1SbhbVEWOCHhVXigYfTI5IiFZ4V3outCg7fLKpA
         vCGRxxFRna1N+qQbWgwATRt6SKNzZp6f+irfV8mLi6rf6IrGSr2eOOR53WzAC8MKHpAd
         e43LX8V3zA2DQEZuum/94GtpwdHbMml8ijD/hPLC0cJrEgbropai5JeK5TjAsROXHMFi
         1piRarIL5dhhrUptE+aNEJFI4Ux4AKv6Ozz7meutcWubDikRjWlSHuzw8Uin9eUVdtWP
         vH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948225; x=1795553025;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4s7Hggd7+AEEhOvi2jMoV+jP1lHkwbJcfKFilHVKaf0=;
        b=v2hV47sLsekMe9DH33CEeKduAycWtVm60mTd6CkpCpdRHkumuRlM5MwZaIeI8rgxCi
         OdDSBl6J7VRmPQcEPvj01cJgfAfcsl7NR1QEp/N2/G0fs+M18ZzywkfMB/Bs9HSfugTD
         G2DgVeNOIwoSrUFSPbkT/ToeL5pHlQKDX+RCkXod1K107mco07Muovj7tf5WMiUCkcSN
         nnwKkm6/GYDlxxYm4HpamxyseiKYXzGizQV9ZpGIzvKuDAJjd8lkFRZAhDTvgAmVXXg4
         pGg0sAQcHluvu7HZYegA+C8kglN3kX7/Vf1fWmMxSEmXmmPXYppzW6Vcbrc1QtoLz6+W
         vxlg==
X-Forwarded-Encrypted: i=1; AL+hErH009c54FrNNR8CUSMqeCt+1qZ2Ipuw+8NdHk5Bo/2BYW6jtUZUtSWhNf8+c/UhvNOKByHl3LoLFncJhUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z817KNdwfJOmwxUx6P57SjGL3L9xXhMrklkOiu7v6tIfSeEy9mM
	3R46Xem5d2UZ9LDa0lhFiu4hkKq0MEGSgSKGGVFUKu6Dp0jRl8GDMnHn1Ay89pqRifHES1Ej4Y/
	sij4qT389CMXjadnI2wYWLV3FuQ==
X-Received: from ilbej27-n2.prod.google.com ([2002:a05:6e02:4e1b:20b0:522:8039:f8b4])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1c0b:b0:571:b166:3d76 with SMTP id 5614622812f47-5773c6322b9mr918759b6e.29.1794948224648;
 Tue, 17 Nov 2026 12:43:44 -0800 (PST)
Date: Tue, 17 Nov 2026 20:42:19 +0000
In-Reply-To: <avyNBn24sLjxrfgR@LeoBrasDK>
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
 <20261116200418.3535619-2-coltonlewis@google.com> <avyNBn24sLjxrfgR@LeoBrasDK>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261117204343.4017815-1-coltonlewis@google.com>
Subject: Re: [PATCH v1 1/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
From: Colton Lewis <coltonlewis@google.com>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Leonardo Bras <leo.bras@arm.com> writes:

> Maybe feat_nv2_e2h0_not_res0(). What do you think?

Agreed on renaming it. Since HCR_EL2.NV1 is the bit marked RES0 (while
ID_AA64MMFR4_EL1.E2H0 is the signed ID field controlling it), I renamed
the helper to feat_nv2_nv1_not_res0() in v2.

-- Colton
