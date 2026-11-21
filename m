Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223981;
	b=e1azUIykMPip1iUyN9zg7/zo572KyT41hA3vvDp59TNYN22gBX3JvdhjxSAGXQbnZeF6
	 YFPIOeJafJG/ydz0RfOtKzCq+Q62HV8IckpNKKhdWpLGpARlfSCHHU800EZ4B7DDNFetX
	 HWSjJOgYxHSFLiJWBSaAEzB2Q9wf4adVRXHYEjhMFxcQEthYy20tkXB2MYS+2ssYUd/Wt
	 jwYvJF/DYDQWEQr+3sa3pv3OTudguSMlgevRRc+Qywv43mfHy+hy/SXSNsokCqBkpeoDM
	 1kwqlyujh7LS10BJDKzgI/UJvVlSVT+A23dqQw7b2vDaSqPaD5Agg5iPUdjb+4F2dhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=boy6I7YzdeV1IlgS2ODm4n4eVmwaOPrG03iw2OUgD9o=;
	b=DyeDT8+OVdNF99WVLW8FG0v9YwcknG71+/Owqgv7q4ADux0Xz9elqLlyC5rbCRMHptIj
	 EWTxf5YbGYW0N1Boqpy90e9IQ0vANv0Is0Sqvb7/z0xJfQExvX/R/PJykfmWGe42swbhn
	 Do+4kohKIKU60r5CI1P3tI/x1yZrcj+qXvmKjYPYbvQFUlWR03ugwb3pHGgMBAdsS958c
	 H1kONeTTAQRLfYY5Lm7jCUjb6I9o7cJ9mWfMoJj7B8d6Jo1lumeK2XiHxrcXY5UQYD9nJ
	 yyJa2H8xKe91UgHZ4QJLAjREyAm64Znr5IkmzLsgpROxMWOasjUbOrPq1KAJz13s0PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZbH2MK9D;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1812606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1812606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZbH2MK9D
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb96533adfso919870a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795223980; x=1795828780; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=boy6I7YzdeV1IlgS2ODm4n4eVmwaOPrG03iw2OUgD9o=;
        b=ZbH2MK9DAY2FxSG3Y4gngUfmRNmM/cRJIlLMfpYITyMkBMgM5x6MUdRkfCXG6fc4E1
         ZBY82La6PAba57yZRG4kDO347m0ynuN/48NBYIFFASf87clrhLkKKCFRnuWdpGYtqpoL
         ElRvL2OD9hBLotFsP9Z3eUumNHdFWe0ly+qjlNHGY90ia/i4GL2p+CCJyKLVcac+RtEL
         sL6lR/X2FzM8I81JdyXMuLzuXPGeskAwwh4dRcSUWFlBxMqHyp5ioNLDyeX5n4lXL+6M
         XfIwJ+ytuMiygZ35LNrGspJggi4LsyLC2K2Xt2IbxVksw+8hx/CjUj8zAp2CswhL005g
         9VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223980; x=1795828780;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=boy6I7YzdeV1IlgS2ODm4n4eVmwaOPrG03iw2OUgD9o=;
        b=S9M5/DhMurvMsudG2D7/lJ/zpIZz1UtC90Ws49P8RVIB0dvsPekx7IlBkXfYfKaUxV
         L1YadBKYOxFsdJ3jfMLG39z9tLYDLpFplCgPFRXNksZDWGLym1afxycnQ8tNjn94bXI1
         /N2hw2V1GUA1LeJBZj4I0yZJIEN/IJHew/YOiNIyR+f85B1u0vK5WvhLnau/o/uMJPPh
         eRpUu9bqwW8jPJKxPkcVnA5x0b/Xi76JHNSDHDdLO6XOpFNvMU6gdO322sxZjT4cpjtb
         iubM5V/IkqtUNNs5hgp7dxdLd7ALNNGvWArsRR9Jq3xfcgTvVR8iWVChf6+aCUROtzD6
         7Teg==
X-Forwarded-Encrypted: i=1; AL+hErF38toDoTOI4j8UMvzZoVNfIrNiN/loGvUz53khi9QbZWqXr0AUjIy56g+TXA5I1fpZVYO6/CcYLAk9W04=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CgBikbJG91/1z36Ayd7O0zbOGqtzdx30GVZDlcHo0t5NC6wft
	yZMOZlfRiEwQSa2e28B9NNXueE0B0xWF08TytHSTwA+H00RETlp5BlX28336FHw64Sn6fXRS+f2
	ft+1XaA==
X-Received: from plhk14.prod.google.com ([2002:a17:902:d58e:b0:2ef:dcba:ebc9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e811:b0:2f0:22b2:bfe2
 with SMTP id d9443c01a7336-2f03f201151mr46755895ad.31.1795223979813; Fri, 20
 Nov 2026 17:19:39 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 20 Nov 2026 17:19:38 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121011938.433314-1-seanjc@google.com>
Subject: [ANNOUNCE] PUCK Agenda - 2026.11.25 - CANCELED
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

PUCK is canceled for next week, as most of us US-based folk will be offline.
