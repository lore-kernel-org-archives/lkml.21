Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034123;
	b=rNAsQVKEwHZlnzxIBxidWNUNKuuWR00rHgffjkhveEUZxamLHbI+v9W/TXSrzrdTDepS
	 Vf4hSZWqHSBvkzr28WlYn4TvD/a50DA6LOPboqf/hwfUTI9EOoyFPnfZsmtIWUU06gyVE
	 RrKAC4nriT6+IgCcpBApfrRNR3S8zDCkcDP3gz/9Qjmq2tvGTaAg4oNbRniu+peGZYwsw
	 KEknXXdSnsABjAKf9/NnAbZu8TJdSAITInJqovzABIUoi0ArpjM0qp9EcVdzA7z42tjUS
	 p0FYRsX4M3JCQzx3LcqyWwFpLbhDM70G93VQvPmVl9z06F3txaB3/P226UqCa7lXDiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=U1/r8Tac5IXDtWrYYG3dpfT9UXio9UGAzrSbVmuM17k=;
	b=pTgIBYiSCVpBHyBmdUxu2mwbSDC0Pnwd2DUWmt5vAES+Ngt79sMrPchH4uZ9qVGo5pT7
	 3m+e+aCmpdZmzzWsb8aRJNq9THKszJMWj+leiOb6qq/UBwxeIKiMHhaUrw0Vi53MgUlCl
	 m71f9jzf2QodE/TVIKJhuxTJfPbJj5JhwWTxDwEHWCk1HAe1xczM4ptcdwXvNqq4wSGP6
	 C4waZBOgYgbqUe3rjUYaU3kkdwyuEW0+gJEmrjNg9mLvsdlXXlErjfSCflZZ68NddZBEc
	 5xbGsaJN0Ij5DgCcuSLTeKXBteMW1OhQh1XtItJiUMrNY5cyerxootAiWbLYhp5luiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KGyGY7Ng;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F43606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F43606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KGyGY7Ng
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47b7f5b898aso848480fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034122; x=1795638922; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1/r8Tac5IXDtWrYYG3dpfT9UXio9UGAzrSbVmuM17k=;
        b=KGyGY7NgHD+M9L9D6556nDD9aFaMrIq9UYx17UtCTQIxrDJehYLXk9BTuTRDOT7XCV
         sCtOouzs71UmKBjnlAjTy+jMGJsRWPw2clssW7fbljC/SJ0IegRWULA0ujf4nLUzA6+S
         sngUEC1aqvilCRpAYGh5/iUk4faxEXwqAkfwn3yxdwnhlnJDsQbWGxAmdrwFdztH+Gon
         rgfrESmgepqXPDVtYMvy1mnGEomxy59tmzux/MPKNN+ihvDYKFhad8VvGuRFHdoijWOB
         6YOYlSMWs3Rq2462wbNj/kEGizMRcj/IUf2JXGT944Evo3zlnsJegTjf82EgkKp85bO8
         YyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034122; x=1795638922;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1/r8Tac5IXDtWrYYG3dpfT9UXio9UGAzrSbVmuM17k=;
        b=Ed/8kCdKZZJySjOngMu6q2ZOO70VmEWqiB8oUKWAygX2Kr8euNx2L93V+4ZNBm75lb
         Zn3l242YyXsx9F0eKMB0RmzvpJKlE6t6X88ZW9CvyFmoNsnsfu9VKdLFXIpCp8Jp9anv
         NjQVr73QzIrGEctr6zgQmSlE2cVHqNggzxMPiHvZ2hpNRyP0YQhJ63XUIWubdZM8ok93
         iYzok5K260dnPAAgof9DUa2mA5bLimMfbqXoPoqOn8RBkMX77BujL61jYcWVtfmNsPFa
         uPpPwQFszu5NIi5xkIr9FDETxc1Sz0zv/+GqHsW8VGc7HDSmwrdSE8Nfkt2qHtxbGWdR
         Ki3A==
X-Forwarded-Encrypted: i=1; AL+hErEERo9L29790s/kwsAxboEBjhnmDIgG0MYx317llpQboHgDrnABircgAaIbaxRJE/Lv7oclMLQMCbs5n40=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0DNid2AdMEx37e6YKdiz6C+hKE71c+ouwllVx0DxZJOkHblbw
	U90VzeOtsnZN89y9oV9iX6qdVrHVTOWjDHtiSxycxECM2Tqs1ExGlxwiNQ5v1uQo6tXOf1ctOs2
	+fc+js7azuXwt2T/ezSXJLX6qyw==
X-Received: from jacnj16-n1.prod.google.com ([2002:a05:6639:290:10b0:61c:b6b7:f372])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:5088:b0:567:cbf5:bb95 with SMTP id 5614622812f47-5773db242camr4395212b6e.7.1795034122012;
 Wed, 18 Nov 2026 12:35:22 -0800 (PST)
Date: Wed, 18 Nov 2026 20:35:21 +0000
In-Reply-To: <86a4n61m7s.wl-maz@kernel.org>
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
 <20261117204535.4036191-2-coltonlewis@google.com> <avzZUyu9EhxAWtbd@kernel.org>
 <86a4n61m7s.wl-maz@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118203521.740501-1-coltonlewis@google.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Colton Lewis <coltonlewis@google.com>, Leonardo Bras <leo.bras@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Marc Zyngier <maz@kernel.org> writes:

> I really wonder why I bothered describing this, introducing a bug in
> the process. There is no known universe where we can deal with NV1 not
> being RES0, and this helper is purely academic (and therefore wrong).
>
> My personal take on this particular problem is as follows.
>
> -	NEEDS_FEAT(HCR_EL2_NV1, feat_nv2_e2h0_ni), /* Missing from JSON */
> +	NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx), /* Missing from JSON, RES0 as an IMPDEF choice */

Makes sense. KVM never exposes a configuration where HCR_EL2.NV1 can be
non-RES0 anyway (either E2H0=NI_NV1 with VHE, where E2H0 is not
userspace-writable, or E2H0=IMP without FEAT_VHE/FEAT_NV).

I will adopt your simplification in v3 (with Suggested-by) and drop the
helper entirely, which also eliminates the confusing NI feature check
Oliver flagged.

-- Colton
