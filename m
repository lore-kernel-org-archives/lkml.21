Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539453;
	b=oDCfuXtlKki3Lq3Al8EmYWta+viEhfzlWLpJ6Tg7dSxp3Ufrsb45oLY4wypT87mfyhgC
	 MHX9z8inNx0VpTHRRPOr3eJbY3768KB87UHHccnEyE626nQMWG13EMMDSWl51ofUpmrgx
	 dSmgmCUkdmYqxelLe/DNkOa9gXxGnnhk1wGqCHs3bsZgkBw0qca9583/AcGfDOtvBol7i
	 cBbBPchOZmt4+dSmziMnnbeVUhJ3PbbghTd+gR49+KgDdceSQR2iGFNmOGPZqA0a6KiVM
	 YHRCQ4AoGOHl/D+5cZoGLE+VKD2jsX/kSdBCXRnWQl1g44PvjtM4Vat8+COYzB1xpQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9Nt89NySweTcsDeqx2ZV30b/bI7m+hN29lQwSVv8iTc=;
	b=2leLOtwcND/au3jj+QnJALHUqj6Y1QkRm0As021Fp7pFvwXm0jpHZLn46nl0S/uErrVM
	 ik1/ZViESIJn2mjWEz+c7487ziPfdht6ki/37bhUewl0tZqO/QmvyBagMHsvS5o64+Tia
	 6vUHdTCrQ4JN4oYpH7KtWiUekfl4vdsv+fKAV6ID18q1PnYyWlCZVlMiwFADe4Pq4Po1y
	 L496zJKCrGVK/LVCBGeqGpau3/Rd/VsrUaiuQT9Yl7hOMm7rwKCOdELAEw40OrVzAaiR1
	 W6upM//a4wHslKQlbkD2hDT4bVx2l8hu44JAXlsr62Leoj5aiWeaurF5bmQ76/mP7tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6OmpsiC;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D579606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D579606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6OmpsiC
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso1385288eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539452; x=1796144252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Nt89NySweTcsDeqx2ZV30b/bI7m+hN29lQwSVv8iTc=;
        b=t6OmpsiCyA0xoZyXsCUjF8NlDIKxiYTplEm7NxXVZqSOh1wEcxC6gIm9qSdSG6q9lG
         8Ri2P5Mrxe5wR00d9m4bPxlfIpUa4eer5mD5E6npR5UkKSmdN3PbggKEmRt3VZE/oFXZ
         qBbTOCIOjIntIQczm7tvFAZBIU95RY/I2XPA93zRmSZllAC4kKFeD0TmmcfPSW+Iy21P
         KWYdLevQNJBNc/9c/fvu1VWPNm7zVJvsDlW/YzwtdwRU/qeMLnMlvmwzQGSE+phI966a
         I6QdMJra46HZ9ecxLqRntzPhFs//aw9pKb5eNjQegaC+D0vu9yN9/0SUoXv6VZFu5+Fh
         Xabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539452; x=1796144252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Nt89NySweTcsDeqx2ZV30b/bI7m+hN29lQwSVv8iTc=;
        b=K+xlyfQTofT+F33L/YqJH45JyiRghypi5nEy1rbKhNStb/wLLuwSiPN6REp9y5r+dp
         8kIAe6/FwxYJ91ZjNsAVzNqDvXi31wgdN8QpfNT5VMaefrU/qFyvsOuZRWwVnRKwzz5N
         qpvbARIALG0es/JzPS9ghAemxL4jgB9yPkC0ZdDevDbVrmd6sCH4mGNAGEIbiZisaFa5
         1uEWK4M1swn7LQlTmKNsshqB2HTUKD2VoOmBKCOUHxaHLBxt3WdFJWTuNbATEO1BrjID
         htoT+EklyeBg6EjVFGCsdKsLGH26F1y+70pLzn+wddawKiKnbqxbHFU/bAvXyztnDGhh
         zm1A==
X-Gm-Message-State: APuU4Z/ZguTCIwSEqK2E4UNEDniIxo7CrbgE4bAZj5FLLEyenXMJpzCm
	zoMTS+ZKPgiu859rj43UDGe8OSanu/v9ZrPu0YLs12Y0mFKnL40TgZkx
X-Gm-Gg: AZFdTZcFmdaQoTzNklROa/rdgsU6/4GV/ixJ3GOI88iRNsOr2VHIRnLCP2SauaDD9Du
	LxXJ6gwOoGAL2CkLV7nX1eopXjlXjy0zh+38vIdJklg9WuY6zl8Fbg6SEkOO0PwU4XehFawiFiq
	p20oQxqvIAwzuIXBnO1WnM7o6HJD9ZCaafXI3oSVTHCIdHDQiEfh0zzI/HEj14TGdsyQ5Yidgxe
	vW7f3ijfe9jLcJkEcr1Ho28sGbrNA+1V2Y1kaibO220F0LWk2ZMPR3hjxwMLU8D44p1PWOnt7rY
	J1PqPAbFYHzL+DnAVC3rtlg9x54mN6/g64J2EaINgYJje0+UT9HgfogmAN7t+bbcmgNerw9KY5b
	BI7leAYayRTo3fZt/ILTA/ITsd3T6jb17yltn3TPWD4V2Jc8Zy6+IxhEmlzNUCCZlzigj8yNXo7
	pj5EXCiSxkgSvnAdfL4TJasCikykIyI3Mg4kicXnQucm9b988gi11matkkB8QxAoRrGf78yW9rY
	Ml5mCHFZUXyJU3xTfEak8YmX/pKxAbJHY8ToCoM6/ONWcwoDbLhO5ljdbPEq6SwRk6qrGrQmdUp
	zPKtnm3saNELPWbqcbdaccgFbGUxG4VVB/uZrfxH24OyaqHeRl/i
X-Received: by 2002:a05:7300:6da7:b0:384:5885:2f81 with SMTP id 5a478bee46e88-3856c0c7c05mr21825030eec.5.1795539452370;
        Tue, 24 Nov 2026 08:57:32 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm82259395eec.3.2026.11.24.08.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:57:31 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: o-takashi@sakamocchi.jp
Cc: linux-kernel@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2 0/2] firewire: Fix out-of-bounds access in CSR iterator
Date: Tue, 24 Nov 2026 16:57:01 +0000
Message-ID: <20261124165701.2780-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261122134947.GB503983@sakamocchi.jp>
References: <20261122134947.GB503983@sakamocchi.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

Thank you for the explanation and feedback.

I understand your points and agree with your suggestion to document the 
preconditions of the iterator instead of adding extra checks.

I will drop this patchset.

Thank you for your time and review.

Regards,
Sreeraj
