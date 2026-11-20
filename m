Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175045;
	b=dT2wYQRgE6S38SIQBZ/QfJ6SMzRgxjpIt/0NVh2/xUNmZNALhcl8ztkOOF7LY3sIm7DN
	 CaXZn+EJdqBJMGv9Mi4czdq1BjDwzVdROQXYFnHtH9ZLBi+knv6wpqDorvgS6N3oL4Dn4
	 Vr0GJS0etnOUHvb1gb1mHAszfy5IajG0u9OjQb3O8wTA8zpqC1SD1EkbECcb0ta4Yp5Z9
	 J+4nj4xfdRBNd1nW9JJzszzbWSiLQuPfBpRsZe0hNvnhpvmB1NTwim/oXgmpdF/4qIS8d
	 jD6PSnmdVXcLPRDubi1G+6DeRKAtRaamEEf+RY+hmJBF0woO9Dvj9y4fZT+rnZVWeCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
	b=gVZHoRNxBZQRuG8ZayfFupICXp8MJTsLNrOFZXhXYvUVZPxfeKp2U1phso+/Lq5bk2PC
	 NH1OZxhdGnQEdZuOByka+zjApQU1+ll37buNqlZ0TqknLtrZnZEq1Be+ZVH0ztlikn21t
	 mn7TK8qkHcaGENzcuQt8owsTV/0keiCDRRJnefYyJduOiVVtMK9bHXIgnkwX/E6zZuc9Z
	 qcEea0dSxd8q9AZUyLjpqFgEVHL3gqonnlvFrkr+Qa0j4CdpRiaJ5aDqKjfSEqH042eXa
	 z3Gs8j+I2J9GUc3RIfklXmWs/acHVw12xKlMBT2jhWJkHOtJOYDkl074x9a8tzi8W0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FMND5e4l;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C660A2610
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B87C660A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FMND5e4l
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f03eeda984so3875435ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175044; x=1795779844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=FMND5e4levyrV54M2W3Z9b0/63Cp1Z8LA7LFKzpOOikoEbWZWBnk3tpTes+MF4OBOy
         A2GhBQGBV9kngsnIfLRoK4+pg/VbGFEkta7pugBMIHT0Uja1J+0kLkxGpcYZv8zGMAuO
         ZnBbIPmEscyssW4ct7v8oVRaUmcZykVH4SkeNdQsFeGS76VVRwt3/Ljnsxp0kFyy96c2
         JaionjPkQOIslL7/vW6vpfXrhaBghErnswxg3V9MwITUr7moREBIzW21wSehfP0pDLMi
         GCZ5q87WRxfBK7dkoXsrzLNWliyxmldyMGUNdI1pDgcpRhDg/PYRUqe+E/KK53DFnXY5
         gbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175044; x=1795779844;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=cFBC/5wptzUrQAEUG+QxyXHs2vn+PzOj5+quYUO8/iGSHyY0Hzhn8sOg4J5JkqR/Hy
         1hhvIIBMF7HyrRwSYRhq7lTpR9A1Lp+OAI2EnBvCPTWxvD8smRm7We3PrK6O37/rkmbB
         bPxVE+dAs87gsQ2f36LkozCCvjQVj3pOzX1bCyq5n06lw7PUr4hHteKonjMs9GInrQ6X
         URDnbQ0Yb9OIBWWQQ8xcGdUFQK6nnNeJec13OiPZE2pLJQNCb8lsHVh9ed1/v22eu8pE
         HDAnxFRVntzGvHxyTBXRL60qy37f1PYv3o52tB1owftrXbce3/lc8vJoHBDD3TkY9pOJ
         PUcA==
X-Forwarded-Encrypted: i=1; AL+hErHPcWPj6KnvncWsclZ270EBo3KAZUDwX2OI3AfsbzN2m05sNeUy/10+AyntIt6yzTTtD8CU0ZIcewsETls=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PgI+i7K/urymTVi/dkXVL4t3Qmo38thlM/9/b6JKfxvOG41Sc
	n1n+9K+n5Y4IJ7cl2nMGXOx4nux7BWWY6JlQskj0519LwxJIHsbeC7Resun0fZCAwzA=
X-Gm-Gg: AZFdTZek/wADfAz4a8ITBqx13hKzZ4j6LhufN8BW1WRXjJCbzqyIIVyWHyq2QbuT20r
	NbBawbTFQGkPrXxtYfr69TOT9wrlWuY3R3WEoWUQ6IFqEkpImCJjfe/Sg4Kn7H6GTfbHWQGbTAx
	+ruhAyHobLXrQU3lygpMV83zDvH0CxeN0f0ykkA9QZSeOT9HKbql1YjApkqs9rSLd/YqCNbaBcM
	mMryBaNDYSTV7irxwxeeedKyfAq9xRAbCgVz6XtYldtWCxSZtaRRXz3BtYmdpBT6LteDbrN3dS5
	ZiqNwimakR3yaSQ8Qo3supUKlLnuf17WD8+NBYd86ZIPVca4x4L2L5tc987q92TxbhrqXMGogxD
	s2io3teuquBOB0cNASO1PM4fxxdvX9CNbLKL1lXfABFolffsjkWVTXHLbkQ3U/P8vOYWL+MXuSG
	CREUUZONo38Ax2VqdTdz46+5ZFMmCrCLPofrYQ9PNNKMLMsemqNofuUWKv0jgNdjhOi1dG3thm0
	4dhCoqCN2yaIKPMQX0wWCoJQGN+p76iCRmor+JrjvncG8kAL9wTPohS0fonI0He+PjOMGsZkKWl
	NC14iYUKcHg4mpjn/A2UtQ4G/2rehT/XGUd9yK+pvR9i6p+ZJmyVitauG5AyudxQXWLYn9kECz+
	ckZGFlIpiH/L/kQFOwFUcvvsoB2PAP6drOnsY
X-Received: by 2002:a17:90b:48d1:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3b41c95b41cmr2537860a91.57.1795175044059;
        Fri, 20 Nov 2026 03:44:04 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm4101459a91.17.2026.11.20.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:03 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/7] scsi: mvumi: bound the values the firmware supplies
Date: Fri, 20 Nov 2026 20:43:59 +0900
Message-ID: <20261120114359.3072514-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
References: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
