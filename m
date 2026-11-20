Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174959;
	b=k0h8KbVCJOdLecv0RQqrrpNP7WAONs0F/BfF5+QtpaajcHjv4xeA9Qg5NodvdgG4Xyh3
	 fsFQF9X4zdbh0vX7Dp+z3z4O0LBjioHVCWflZsIYbZsFh2Y1XFo6LD6ryZAhjV3t3/14q
	 tTGh4f/b5C1EZYjEjzAGCPjLzV0cAUXkJ6PK84R0aBKBSbKBj9SB7uIqPKujljA/cRYRe
	 6I02LYebMwNSwsFtHmtVLKnXGHOBdMK0I7/Fz+6UBR7IUAveSEqZqXH+aJ09+8/OX5CNP
	 nogE9smbCHJgwcT5I3htzGeX/ifvwWwLo6JVg9qZfxWXsmFfOt6KnFPHFUtn90GcN0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
	b=hQuQToTX9rk1mftbcMVIrU8LHRm7mDiQRRnQfXJZCFG2Scxd8wjGI5ICrGyV2OWC9tiz
	 QHvfYgAiy9ym8Q4fevpARtvRrvBR1rs8fh3fncAWAT8KgscTf3nKJX6bH/Xo7N0w3FvyB
	 1coqiuKOA3gRZIhJW2Lk6jd0mQI4gB1q/xs1akAdI1thntTd/FZuYr45Uc9J/rCorio5C
	 y55ezwBsHKEfBAHtFKRvRrKOK3J2NSf8P0PJO9juPzKAzaczmzPP8D6rXwDfEjdB91rD5
	 PswnfY/FurVL2RNc97CSr0WsGqSrlbVhBE6Dtw8EC0G1NqvZlC4muN0iFEMGp1+oIzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=slT3Sf+o;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2044E606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2044E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=slT3Sf+o
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso469162a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174958; x=1795779758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
        b=slT3Sf+o+/njjw83JzBBA5ft++fNJqgHgcPLr8Qwp7R+GLw93bG3ugU97Qn4QvRe9+
         pmi3KWx3ywLMfu25bz1x2SWKkk2Cv9X8qlr6SG8z0JjCRA8TCWzKxLdlAr4zn0uz8BTg
         07Ig+Yd97lZ0zZIkcDnMkYbyb2h9pL1yHysIXfI2DoHNjMAlq1nR3LuRx6j7M0fCaxn+
         6Qsp+vDYQnlR+UqBHlsU33434ww4HBuc2I+Qgo+EhNXgPU+JGndDBw2JEF/PEZJPuQOc
         m/3wUBg8iRX5NfJHB+t6fpRcVlfazUIvB1iSpzsI6uE6uJgXqK8Roz4lB4uzKKvvbaUj
         vklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174958; x=1795779758;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
        b=jWzNW/nYAIZPbUDI0lQMeQcyizh/4f/42dFYGutLX6wAnr3yLgHghTmeWW63iDmZRR
         8QYKRpD+29ph+PYoSIdLLUB6lVysGvlexBRrOeIrfMF4/Wo9+FnA9I0U+VqEJrfugXmf
         uPf1KEIsLTdjM/yZL3F5O7VRngTS+OhRXNwk5vLCYY70rudh+q+kaun1jHwdrCue39h4
         S9v1c04r3a+Q8363uifHkhSAwGjckuqkl/aE99bGaTxXvK+VCzV7iJKNumuitTSMArEE
         EQUcrve5/aF8kQ00k+OpBaSgNViZDkaiJ7T1Xlrnc2xVI+u9nr68WuQrMkuOkiFUPPNS
         hjcQ==
X-Forwarded-Encrypted: i=1; AL+hErGbv2ZSv0GR9GQdHcJ5znatIMinYm2Nb2RfcUmLfS1z4Q6IXoIa+WwkS5sQbV65PywlCiPo1KfndEkfOkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xI++n1aaMweZ7rQ8yjFvDatwRR3uISi5wKys9cSoSLnHO48i8
	3LAZfCpKXM1DvpWwP1A8sBYD5FQYBueiRw20nZe1k2no0JZGlh/88OEQ+hngthyD2xg=
X-Gm-Gg: AZFdTZcxS8Hz7Uhv5reNaaWGTJC9klK2F7nN0hLOAyRAkyAqop8uK2OEOi+d3BQc4jg
	SfcyjCcW9TnhMN3tXbJZMU9Z9zlEsJlZFHDboAjd5FcTpSnw3XXebm7N2LeGFO6uAfR0rRRyKbC
	m4U0ON8EGJqqzANAWdfTtzDGmYRA18Egex5ZPZ8vdeJ2YTYseCVIoshShli5vUSg7+q0a9u0ckE
	uQBiReSFAcm9ItwCNTIwAEdeXnMZMPtqo5/U2GQDpMBgROmhAQhNI1DsBPUwSo05WbimP88luiU
	DbtrYvcTY4cmO/dfXJghr91TqBkkk7tAYz3gNtDHBYL2BqGVxmRdyXfylLh/7EXgJxbZMlcuWRI
	miFxJI9wY5WHIHJ7gAOdmadBfPhGWUxk1vUHhE30SxFN0Rma7/Vq7zTlt8Fmpby+Sz2z3Df2KQo
	Xe2uiL4M/EwlzozNyTCqIlCdcLiEV2GPepXH2SVzzKX8gZLkXZICTy54mk/FRylWoWVnL9huCEG
	1tuhqpQQD4Fp3+xYKiNcJtTh/94xkktcTO7xTYAs1Hpx1M/oKbM01R+4GGkDsERF9Ktk7IPrpk8
	aCCsrUgKYUsxktO3+gYELt46mD/0JuEDPi03M9O+kiZPgT23zqZX3tvNJzSY6SHYuFc5MO+6Zus
	aRpgx5rBMwFCIFFgorxGsCOCWFfERAqNMLUr2
X-Received: by 2002:a17:90b:2884:b0:3b3:c930:35c7 with SMTP id 98e67ed59e1d1-3b41c92a1f2mr2728231a91.27.1795174958467;
        Fri, 20 Nov 2026 03:42:38 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm7166263a91.1.2026.11.20.03.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:42:37 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com
Cc: martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] scsi: libiscsi_tcp: check that a read got the data the target claimed
Date: Fri, 20 Nov 2026 20:42:32 +0900
Message-ID: <20261120114232.3072170-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007070207.666738-1-yhlee@isslab.korea.ac.kr>
References: <20261007070207.666738-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v7:
  https://lore.kernel.org/all/20261008063248.767676-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
