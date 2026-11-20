Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175076;
	b=3Kn9ldzCCD5H1TmOjtEIu/zhfFpwLMQYbQlFSMEcKIHhgdQlBI9gLmv+/eae2wI65Cp2
	 FDBRUnXJWqXkhLncpVNEo/THBh5ZAQ0UYCj7pWrsj4KLA2WDMKkyXJXF7ZfVerKJc8yNs
	 hW7uUksMNWDYgthRFcToJsp12X6ZJONIDoylveYceQ3y4miY6xMVNU9CetLGYJfcqTG1l
	 VWNQvHgGwPZ7a/maRNiqoNs4Dad4TJS0PRllim/FGKlTdh/MF9uiD0q8pRQoDpu4t6tR0
	 u5ckacct/KzIfdTsm8t0uwhwW2WVGNpAv1ybcUMO/hQyzlOY4ViQCsGFFvsiX3sZrsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g6MTsOqU3k//pwl7FRMf2NFcyBzVHK48odAYYtmSl8k=;
	b=tFiBDiez+ZMod9sKcpxSqBjhWlrFe+t+Lam+VHVYJ57vSPAsPa/yktx0rxyU1e6vp1PN
	 6HlFoPgui7mBN6+PJOFjH47uPdUx9b4jrQPsZ080Y/YzU0zYlxlK0UsSNw+AucvhAjXi3
	 5lsfgOxDeQ7hd2a1taxibtnlxwwNBhOcCvr5FaM6nxAD9a0xS0XO2/EXqt97ye0i/E7Fk
	 +NNhbu3tgP3lkTmcW+R+km3svjBdLaJDl1pKOJGPQvUY6O9aLBQVpcyWiFKQW+7t8s6d4
	 nGUGzmyMv0Ur0VgNytwmShcXHmaU+wh4KxjI88A/xHMcgTZVvbXw/cqLySRwGf9dnpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="tFKensX/";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4620E60A5BE3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4620E60A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tFKensX/
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so407634a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175075; x=1795779875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6MTsOqU3k//pwl7FRMf2NFcyBzVHK48odAYYtmSl8k=;
        b=tFKensX/IVE1xNls7FhXjPwujTdR1gGHuvBvo9s4/yqZvI1ZSFmGitg46dg1b5nF5j
         L9x8O/2mBFzcfQL+C9dmOHZtx+c/6g/bPejo4J7OJaxthrOhpYFyHlXEehfhJogwKDyH
         pu4JtN3FcZ6nUzY0t6mVEY3AATrdiUe1GJUpDbmgrdjZ6N+130p/LZQrd1AVEAO5SVYc
         qofUP2/ID5rbo90pRfi9W9C1d6nA5Wh6ztIMp9NRwnbk9do0kPmPC1OYKS2l76fxzN5g
         Mz7tZq33/Xmi611g77yQlvrL4Fd+nHGNLyHl14NQ5CAfxHd0RuzqFvuENdsuIO3jnV27
         uwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175075; x=1795779875;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6MTsOqU3k//pwl7FRMf2NFcyBzVHK48odAYYtmSl8k=;
        b=ZY1UsdrgfgVIt8FLomvEMj0zQf9LnX76lNWLVURSaFX6B4cOK9UIvIOrRunMwYnHSA
         Hms6fEiTzokLvCK9PBUuidBIXBbNcXTRaUI2v1mypQsDb3WMI+6Tp4PbszXYQvtLkrHQ
         JkaUAg/ZikXvwooZUP7FVTSeqJ2niJOmaXgL/ACggyAz22U9LCITuIZl0Kj4PKio7FT8
         gxctrugskaRlahIllV388u1g7ksvgoAONjFlU5iBwY5IkYs/RoVrfebg3JObnmA6Q2Ft
         dWQeNyiSRcxKCJ1abZ/Ao3Um6OkuReG8fpAFIrzZQ2Qif0blEhQ4KsruKC0YM7fXa9gO
         ghxg==
X-Forwarded-Encrypted: i=1; AL+hErHQMi152Q35mrh1XsF9BbB3ujmP23I1Md7mW2zTQC2xXNWChxQGLENzzByeD3OggDNCOeplBz/v3kt13gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z87M5gR5Eu3UOsun1+hZbkZ/b35otqlK/MfhYKdsv5FNVcs5C4P
	quVP2mHXFlfGJspnYsyyTwoETxaWDeNSA96pJCD59m+pdoTYLIkK/amQX34aAhIMTJQ=
X-Gm-Gg: AZFdTZcqPTZ8J5Uwn4GO31rvJFLbz3nfAY2stePazx33+XXJ9g34wimSZbaB1KCupI+
	m9NQ1nqPsfDoMM5EXReK4gAMQBCORrk2SvufAE0bIbErV1b4ShILOsjJPx7gEPdsfVc5QipSjpy
	Lynz0A+PUbySS2czKg66YQE/3lFCGKW0CnjxqRtIQqsyeecPY4+iEMFz8wWprO5MPp+DMr4Lm8b
	KoMqQFOal/P8FHbVYF4BjTmU+0ocS5LfhiHGFeheRaVyfX3e5PZf45lTVppVmwaSGn+d7ku8zEr
	CuNpsluY2hv7hw3CshKr1Uyc9rTvoS1IP1jlP3PpKNnm+gKR5hzhyVfMOGPnsJOkW3zvbnvJOXX
	W2R2QEx18dL2T14qHflxRpyf8ml/ZAnjoVPmuyvInR+aZ74zTEelfqAjw2Lrz8bmbMUWOWF+njc
	XKtV8O1k4SRYC/CzjIbfOp9Pld7AZJlhIQ/F3ANzYlyDNy4nakkS0BS7KCZk/VhegQz1re85peB
	V2BRYPxhUJsDsPxNt4mHoZCxFdBvOQ8E5TXb0peW2NiNTiT7kGEjya4C8SeAT0W2ChbhRzGUjED
	jgN7WfYT4DiiN8hmPIJEbzjQbpZS8CAA0LqHhkeTcAoDcipp69G5I+XizPp0uQsk/hkBKpHuGao
	7VCd5XZiwsGUVTdYiGEbLgwd+C37gc52MbxFq
X-Received: by 2002:a17:90a:ec88:b0:3b4:127a:2bb9 with SMTP id 98e67ed59e1d1-3b41c8d9275mr2609195a91.13.1795175075688;
        Fri, 20 Nov 2026 03:44:35 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm6476169a91.11.2026.11.20.03.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:35 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] scsi: bfa: bound the unsolicited frame receive path
Date: Fri, 20 Nov 2026 20:44:31 +0900
Message-ID: <20261120114431.3072616-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v5:
  https://lore.kernel.org/all/20261016155441.1607196-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
