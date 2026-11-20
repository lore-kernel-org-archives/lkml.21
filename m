Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186869;
	b=BwWvEzhbvpDvXo05zdLOPV3dVwpNW36HJtdBuRmO2FP2QMy8Ekng87iTZSNE13uwNLGw
	 JWAwQWyQQIu0ULRtRPUZ5KDy5ylmkxM9Vt1RNByMPZXmgRSB9z30OH0XPmhKOReSw3JRH
	 EWS7PcX47Kpoy8ON/diLXNFuCg005UyNfLHJiGOE1iuPUOy+aMpNbW0lbm87Iw3+2/0eG
	 SVhVbaAckpd47WWARNqzocLsFXuhNypUsGBwchpIFWGRvOmvrMdO6aDeLVlrr2w8/YVtL
	 sOywSyQ9QSLHFxDJcS4m2WtJVCPnZsgOjXmYB9fuJqotc8JIm1WqO7ve29uStneursA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L/5mAGH3aPwFpVY9BN4LZ1kZQhbM7xrsqE9PUw1UWjs=;
	b=4gzZxJjhftPOAqYPItf2Q5E+GG1W5iiiieqTmGEudwS8QUblaysVhqKi0PcYqPKnr72k
	 hBMjwp+JykmpXfv+YF+y8rSJiFnLDsO7zS8QlEoOZ0RvtTTuIM/01KEWWckVqPbRlGcHE
	 C0zAyvGBZIwAp75oTNm/Am32tDRoCtfhi1ldmHYG1ZXhHxw6cHDdAlNbPDdnntUO/QBzM
	 J/cydMcnT8e0LgmDw+x6paAh2abyiaQLoZm6NkBTG2ydefHdaM1QTMw5pb7RebfwgmOJF
	 cVBLbL4+jsTDlrEnVSbs+bUKRJKG8FLIDa82jjMBAeMwPRQ1ORHi3Q0RuLqeO+Puptw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAus31OG;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D35606BC99
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D35606BC99
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAus31OG
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso727083a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186868; x=1795791668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/5mAGH3aPwFpVY9BN4LZ1kZQhbM7xrsqE9PUw1UWjs=;
        b=KAus31OGiJtgNAL+5jtXDvzZF46aa7xdd+zYHakqqAQlMcsa4bsxRLVTLfKoreU7H/
         TsBZqFvz/qvDslO8L/YcRM5bX2+q6wLeZrTmy1jHIzBe46CPefvhYE9RhlXJu+M/68Ik
         ULtvGlZyC9A3gpgz7SlTSWlN0Cn69YP6Ko6uUHgwVEEj8FBcmcGCWWtJeGuN1aD0zHa7
         E2R5/gt4YyK/NE0unG1APYiEVvmdhrLQVu7Zn+rCyPJo3j2rPGIxbpDoEmzeur0JLBOu
         yRIUntPZ8sKJ+KrUrLs/Z7gx24tBev7BZHdiLgu4wrZS/WvsLdx+XMs9AAAgtnucPisD
         S5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186868; x=1795791668;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/5mAGH3aPwFpVY9BN4LZ1kZQhbM7xrsqE9PUw1UWjs=;
        b=TdnHMQC8Gq5fcDzzmakOcb5f6UdrF+Qwli8wE5c4neaNb0mlQV+HkNLRFjNMICmx9u
         1XFFsNfMKlGy6Qy7A0Z+agoFY3XQgNIjbaFsGbnrm1HRZPi2c6UKVmI1BjjL8Qd4VJCy
         H0p5t6OadWqNcFPPPmuLKzXRJuMOAzS+RmiJPXCL2hA0QOoP3Bo1TIM32shFtKx8zuIL
         7UyTwMTzE3B4lZepWY13Fx8kttYdAnk4gj5JZtWalyui/OnlPG4OJ0wu8oP1SsWeaZGZ
         U1P+q2TUtRBnB/XebVx3Y/E2+K3ALyyxyBs49XiZ7bR8Rw8dkQFMtfE+giJzk1Wjtb+A
         uuIA==
X-Forwarded-Encrypted: i=1; AL+hErHuuM+9a5u0CncRCM5RnsP1yquCbbwr/uolyfmwtvaW2DEi9tCkjAQg02qTKvfGbNvEhHp/qxbmOyfVhU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wxg01PmeOYTzsSVkzQhJ+ewmkuvjXZSxaRRPFzzbPBC2+KTJL
	zlB30VidOqoj7BgbUrf62esPxVdC52vju/UKqATNskANcIvLdBRhjOWSQlGCkUZ+cIE=
X-Gm-Gg: AZFdTZcAwYYq07aQrp7Ws+Y/MNpFmEvQ44b6061zH/03qcO3ZoNJpPvCwBVMA6c/F2G
	r8MyGCsodV7o/i9I2APEmnLsJzXjdKGr+NoXePRwLR7Zj1CGV2b29WYRmPH9WS7oWt3KW0AKoXj
	ozDOHqIP5ebOro+nCiMme0+7u6kHNceRC5IBdgWvRRNDT0oaRHS+i47Ks8HnONdPFU+qzzVS7yr
	uH0Hf3zjxGGMy0ah5Px5MJPey2Ref8f/c1eCLLNnLxpZnSc4A285RwPXE27ZxM7K5m92nmuGvyr
	dmGo3/qv6W8ydO5m/FHcPnOC4kigTMqQl94okmd3HKBvFQC+CmwDmFi9eQlxYROEbFykMYSN7+1
	8Tg8JsObyLQBI5PkluxHQFLbiBb63JmlNdwjZsZItCBSCgqabJnQOxL8y7k7EkukpshjGIx2hk8
	QTcT7gq5i40RLTikOnUC1lUOt0+/pzcNHFH1ilLDYIMDaTRwJwm7IfHxJrq+i0ynu8F/8L16D7+
	ZGmTE3wKYQEaYOYl15iRt69fgt+fNVDF5DIxZzqsC4aYExi4uP8yRw0T6dhgJMDfpFrsPSJDU47
	rig1OB0vrIpLqKK9dEo8cu2rSLzMXCdYcrP5e9yJcQ395+73zLyutO2y3coXMIZ91dvfrkBkdAf
	Hz4H+3xLeSmDFp2TbvlFYw4fK++b4CqtYPAiC
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id 98e67ed59e1d1-3b41c9b2d4fmr2978870a91.19.1795186867563;
        Fri, 20 Nov 2026 07:01:07 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d1361fsm7645554a91.6.2026.11.20.07.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:07 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] scsi: bfa: bound the unsolicited frame receive path
Date: Sat, 21 Nov 2026 00:01:02 +0900
Message-ID: <20261120150102.3128291-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016082818.1237059-1-yhlee@isslab.korea.ac.kr>
References: <20261016082818.1237059-1-yhlee@isslab.korea.ac.kr>
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

On Fri, Oct 16, 2026 at 05:28:15PM +0900, Yehyeong Lee wrote:
> Three fixes in the bfa unsolicited frame receive path. Together they close
> the length the path trusts, from where it enters to where it is used.

This is superseded by v5:
  https://lore.kernel.org/all/20261016155441.1607196-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
