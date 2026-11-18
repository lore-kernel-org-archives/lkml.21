Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002028;
	b=MsmldENyoquVUtl+SRaIIXV+GUFzh9B6+XuCFFC/KarjdAsiDdgQLolIh/kuKvkNk58C
	 8Ubwb1lJlKGbepW0CKHdl8qc/FT/Jltnf/fn71J6sdFOpt/rAR1TYZo/HnR8KoJuJdVAE
	 nJia8JwHlAj7MlSrFtGDZJM/B0LPCNhqrgGj33Ke93mC8IbbnHNw2K7TuKO0qvui0/p3w
	 iomeTy56kHPYlZlwdt7zfGLfX1qmDn3ZklntEf5V4zjj05xMdSJxcj/z2RMtknWVyWkQh
	 5gXMnJ4gh0rKTDJxXULASGb0WGWh+LqMYulT5RnypQ7qnyDJuxNqORqg8biW6Eg85oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=joKPrh60l9RacrgiLaA7oi1DDDf9ZOY+t9J3WM0zaLk=;
	b=ivcHnctJ4MB/j1+UkAGKWwANzJ5sFlPgzt4901rIrTT3/f/YwGxk2aPwCFhqJMP8WzVG
	 tADP5PPKdWtbvZK6bqCScWlJBnNRtgUWMinPe2jIpCoBW1AjJIHVCouyEMRJUl3tt+wdH
	 wiAhXGC9dpwpfAuDFMIa7Wht9+x3RRRtFvvr4qiG3BMjZJsewieId6mRGEMpgxx18nHxD
	 jwFEgQ1F5sFqCACWFi/NQ4TaTR9WRXQzop3lZebqeRepFRnzgf+9f3bA8TsMkCmjK/ZLT
	 pGpOqsTncZsZGMAofoe4gn7gMTvHRUQDADVDUN6ysfuzUFgXajKI9hb9ZPOL2xOW5BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ri4FMxE0;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E542606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E542606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ri4FMxE0
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a058315c79so434501b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795002028; x=1795606828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=joKPrh60l9RacrgiLaA7oi1DDDf9ZOY+t9J3WM0zaLk=;
        b=Ri4FMxE0ENmt5ExlIpMFuucBbg8Ff7sKAf10q/8ianryZQyKtbi3YXq+ktSfczLSfu
         IctLlAj/ddfPqpMpLdJSQfghV9HsCVBQXGWEkWXn72XaqMlG1/eCJwwmgrY6/N3rntfN
         ZfpbOVhacSiGr87oYY/VR6SGrjRQ6qgHuYNfoBwiKRW/cuRuT2NWrM5Mu7Gx4VZAQNMu
         gxJRzVDdgVqV3Xko6LFK3vws1WamrlKSqKm9s8WgCUZWPHAPe/9bwG6Cn6uK0NqjWDH0
         EzCBn00mfADqxTRlXynqAz78TtowHCugr1TZsMaq4UJcPOVvGtmybUrhGNu/nFBP3gme
         pEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002028; x=1795606828;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joKPrh60l9RacrgiLaA7oi1DDDf9ZOY+t9J3WM0zaLk=;
        b=xlz3IPsQze/8YTtClmQCe3i3G7Ocz7EtaTA4TnwRsUXM6+r+Us5/TQlovTLyp7msd8
         KuU/S6LiSTBkco7yfEE1gtnTFveWgG/n36xwZezd3RFON3KPQsGJP1gGpy3IfB1qmAkc
         T4BAwMQKLBLvS13D63/4EAOSvnLesyw0Gdb/RYbE9gw9ecX7+PrGNRKG9rNaOhHSffWQ
         +t6ei+KduYnD92yasNNfhhJjn8PVaqKDTK2fT90n9sLMO+jQi6PtsqmvXplDkM0hHBRF
         S8vyPDWE7lve76iXYyu9OCPQskqaFHlp09R1tSm0Yj4OVWeoksAco72OaLgvRe7WO9gC
         u/9g==
X-Forwarded-Encrypted: i=1; AL+hErH/fBqU2wC5bKF/dqRrkHqFgQ1kQEXAiLv7AWPWgtjjanqgSi27uERtnoHTgS6ACksjMa2Fa3DWUcoCxtk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SnFnTPSAcAoTppP2o/tPE4F6UredM1VSHNEKVmM6tkOvN9II1
	oIYvGKbDlbRfDTfErWG2gSmQH8Tu0o1atdtqM+whvoyTXt+yuCMStljmaUtWiSm/5HZmT03nKnw
	IIeYmuiY=
X-Gm-Gg: AYBFou192cST4bglDtYrm61TA2+2iuaw0FCxmGY0PxGP4QfkF+CSGij5gdh0V/lqMn+
	AUTj6zDKEXngOcd6+pjBMNr5Ymp8z74p8ucvZu9fYMiDpaVIzbIyGshbel+9v+NDtd8tuZMp3pD
	i0z+xRaiQawcHBBMXc55fnROoBDnEg/k1zH0R3poIfPDacb70/DwkgZ5df6Q+4pL55//F9RlINm
	Ga398Y8ZjHQeKQA73+vNKSTVFCtBVWuulsRIcyM20uL06ONzqHlSjJ9QajDlqnkMCXXN0SrYUmD
	KGucScomIZEH4312+rgKGC4WJl91s2h2ErSFC+MO2w+j+rv6v+S6UhKsNib8DijYBoLNogIsW4y
	6CFGMqsTq1gL5ikNWX4ps9Ik5HPUp/neraMsxN7pNQj3F20i/DU3PiVVcUC7Vtt23QyUbtXQt84
	BhJN4He4BRcO08TSCwrcKjRFPtiJVF/M1mGfZSP/DKaAenHNlZVgh7MJgZ9g7ceyLooP35EhKvF
	8lNj+NNeevTCmdVCUJKRJtGFrnGSAz/xylaosmnSUB0BGmGgLbUbT9Vv5tfZOg1f7yBWRJqa3cM
	7nerRQKQOznOBZ/9eJubqu8L0Lc7N2zZsv9Tx/1epbEmAZAc3FxBlEW3XkssopkwvmTqqaYAAJR
	rjBoWEXC+8fjsw7BDGPNeJIozJNHtcjCiEQGH3g==
X-Received: by 2002:a05:6300:6690:b0:3fa:988:1ba7 with SMTP id adf61e73a8af0-3fe86bdc721mr2207986637.11.1795002027791;
        Wed, 18 Nov 2026 03:40:27 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb35db4esm1038189b3a.35.2026.11.18.03.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:40:27 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sagi@grimberg.me,
	jgg@ziepe.ca,
	leon@kernel.org
Cc: linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] IB/isert: finish a Reject the target core allocated itself
Date: Wed, 18 Nov 2026 20:40:19 +0900
Message-ID: <20261118114019.2362132-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116101108.1650132-1-yhlee@isslab.korea.ac.kr>
References: <20261116101108.1650132-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v2:
  https://lore.kernel.org/all/20261118113905.2361969-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
