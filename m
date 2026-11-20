Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187093;
	b=1K6i0teMqkoFRzew2SLj6w59aK1G/Bl/yDijMCitEieFVCzCTfXJ4dQMFR6VNsIzqT5f
	 oLPOHGEZPgTgQhizyNoeXUTrFZC+DTkVo6Kyo4HKrTMOVhyNFmpi4NmE5k+bbcYO4EjhH
	 eGPV/kmesBu3/djZy90gNWP7B3ynDpWKzp6vTG+MHIWlYZqkdmBA85o+12P77LeuCvb69
	 hQsT8ZWMwVjOll+eDfeIxz2zRfM8VBses/DRmrn3tUU6DNsDPQyAF6xGbOiI3IzzEbt8W
	 WHMpYGu8AajMYdmQepxfChH/G7FOl4NamrAdiG0YGU/ZnQm2aucHhVioISYHaZvO2aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TrNB3pyvZ+lZ0OPeCFGzkUm2O6G++eG2RC/suTM6IO8=;
	b=103d5NWPAvu+vsPZ5SVqh/Crg5QfULt5Gan7qvZjfaT6+7hygGmzlNv608lMCJ6fSNkV
	 SveBWHAyGUi6Y5oeHYGByCaKz1J7G8fMSO126TdfhgvQ0rpVUJvpHnOf5hfsyeyzrAyW/
	 dl20eX5q1v8cOCK9PROYUZxhI1Qocs55m/7yXwlTEnZZN0wSdMwbsR/zL2i+Z1t/Ph5Bb
	 S9zHze1OxQaU+CvXo7Iz4DXtmFHDf8oLWBV+OZcJlrFTypr0AGPIjzt8H6tS3jFe+3AYD
	 rAg1Ipwf8ndlplVwpnJ6RS0ruX7k7uNZfgREyvLDbuVUWkvRxA+QXcQ5yozOwJm4aOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CV5LTRZM;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC23B606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC23B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CV5LTRZM
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0481b35c9so4090215ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795187092; x=1795791892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrNB3pyvZ+lZ0OPeCFGzkUm2O6G++eG2RC/suTM6IO8=;
        b=CV5LTRZMrC/kY/NaGg+Qd92MwUWGEAIsaz6o2xwnUutYQfrVl0CuL6jFJanqSUuXTE
         CoKkCFDs+LlwUxO6yZGY5rRc95T1OUG8knMXbBpBaU8TWBDvTDj9htuzx4m9rhv31b5V
         AWhWLBBBFdmQHm8hAlGnfzXgORTuXTTcoU96O85LXaEBfpq7gDVC9J2wGRIsBlqTWmkH
         I+sXlX93M99mo7Eh9LpBKDA+8bF8B9o7vkNezwgF9S6krzjO++66avlHo0mDZbuOxzr4
         3fy46K0CGmTwAkGzJ/mmPCy+KGIjl/axECXnOhxWIoctdNf1biQR55wZ/1gNshU2rf13
         vTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187092; x=1795791892;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrNB3pyvZ+lZ0OPeCFGzkUm2O6G++eG2RC/suTM6IO8=;
        b=wIl5Y76padErbfsNskWh1DYMQ58hjH3+CAihST6iz2tLbz3wol6L1MHC/595f5fOWu
         wf8j3K4M3PDRCRNCrYSY8ma6TDBgcyGjz8T77HSkM8ao8Cq7MUENda4wBykUykOOxvpq
         1h0VVTL5mUl0kxUBMeDmGQw78mTW4HjSRxokWHD+5S0EeCyeVvXQ1tjbHkchbjcCyhnr
         RZtI7a/qXnc2GEDl2PWMF3Rz5/ofgUG2nSGqTC8lfnVr2l5GEXKi2sCvTe4I6hW060xc
         rGxBMAz/+uWCIHfxOrkUyZt1d8Dq/+lXTLtTQti3eaGKQAP935pzzTICF/P+4d9sXbkR
         maww==
X-Forwarded-Encrypted: i=1; AL+hErHn7q1f5bqRMHEj8nrfSKHiCY7XNAU9QnPiJ3Z6vgBN2xBSUPFJ3AsPSmtGQ9aQb5qIkHA+NowCFIPEksk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SOhIVDUAzeLLo+OjeDN2cpjXLCsMiobw3NUo8YsiipdM2wXrr
	GxSExnVyiugTgLao8K4vntS0FHqPm7r3qVSOwUF2qZn/55+AKzmDPrbeHUGf9FcWRQ0=
X-Gm-Gg: AZFdTZcN/4AgoK1R/Yxs3XyVTIMZpvzSB0RMMauTp+YzWBULlJHw5F1poEhMiGpFKF3
	saam7CLg22qXgtNaH18ZJ0GwrkaGtOI4qBNLZqsEKZBKCthawn+HPMTW2KChylVFn5+vF8NEzaP
	DUoi6TqsWNX4G8ZMdPWoYqevYyd5LtjGfd9kY85NZSnmg7w4kY0OmoBB4UmSCiBqmKvyk01tBat
	VrWAZ0b2Y/v033VcU8xBDZO9vWdG0bFXPG8hya2qvdK/VkrKhOwvdqNm7YAPg5yBOd0MLwO4Dqp
	Cg2i3LTWpjnqgtU9uC11rmxfyqCDY2900Az5ZgB+vxTaPJj5lcUiw26f8UVyCngTFcUfWrA0se6
	2uZtxu8d820Ypbap0JwAYypL7dyT0JoGs6q2jV3WpixzTPjMrPGx/Ejou4WcuCv3QbYBg4qa14S
	S99NrGvli18i4VjvhY7Y4PFq7a+eLBHWihmpviJjH4QcFH5H+19RVImMR5PfzaE46aabc4pFfu0
	Z5G+0V64L4tbzNooAmoxN9Dp69Tkt0pl1e++oE4m5PglqjFeRLzp4VIRgnZzz023UxPKd7qwTjK
	OoYzgJX4Xfij6FmaEA3g2dOkPjeR2PJvBE/xZfX3R9/oHiM8uP5WnQni2P2ipKAFf0EsZ57ZBiL
	e6fQlOPxLugyYHM6vkOuyOvAkDT/Cyzvf+sZDe6T/zJBoGqvBnZS226S0CQ==
X-Received: by 2002:a17:903:22c1:b0:2f0:53cd:8789 with SMTP id d9443c01a7336-2f053cd96e0mr6696815ad.21.1795187092427;
        Fri, 20 Nov 2026 07:04:52 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1058fesm16035565ad.48.2026.11.20.07.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:04:52 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org
Cc: Lee Duncan <lduncan@suse.com>,
	Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] scsi: libiscsi_tcp: do not accept a Data-In for a finished command
Date: Sat, 21 Nov 2026 00:04:47 +0900
Message-ID: <20261120150447.3128910-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117115058.1955891-1-yhlee@isslab.korea.ac.kr>
References: <20261117101500.1894608-1-yhlee@isslab.korea.ac.kr> <20261117101500.1894608-5-yhlee@isslab.korea.ac.kr> <sashiko-outbox-218654@kernel.org> <20261117115058.1955891-1-yhlee@isslab.korea.ac.kr>
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

On Tue, Nov 17, 2026 at 08:50:58PM +0900, Yehyeong Lee wrote:
> The patch narrows the
> window rather than widening it: a Data-In whose header arrives after the
> task has left ISCSI_TASK_RUNNING is now refused, while one whose copy has
> already started when the task is failed behaves as before.  That case
> belongs in a separate patch.

That patch is here:
  https://lore.kernel.org/all/20261120145243.3124991-1-yhlee@isslab.korea.ac.kr/

It also corrects the changelog of this patch: while a copy is pending
the error handler can finish the task too, not only the receive path.

Best regards,
Yehyeong Lee
