Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094307;
	b=X4pSqK8W+piYLLSTRH0pfUY3vCmiWKqrtG9oQq/IH4pErv+hUuIjDLsegoTIjRJmDmy5
	 DL/jOxIcG6YvNBvtfV+8vzYqI2i+w9xGy/2r16+kT94W0JIYorKYp7ks5U5w3npBMr6ud
	 +MyZV+uhhvK6WaUHBjCLo88wT+uVPt45brTnoH1v4DjuM6nTf47cFWL8wsSsypTB5NvVq
	 EtfkhHQUEX9HOOgFC5QYmn+y9zyUvNDRNavaU5pmdFq9vNsQE3lHqE3wsEV0GJZtxBO3V
	 n4KFiKpxXAx27nh1Qgz5XpJSv3RzSnt/Qwh1rmaMwO7NLbmZlEPEQuRs2kf4YYqz1LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lW0rsTzAv8g0kMd3ojP3+GnYyed/cwVnxWGi5+Nic2w=;
	b=Qq81oh9S/U48Gth2xyrHZRIfyrB/SO853AVrU9L2k1iOEDUbTsVtIdr4N/FIm5fxLX2o
	 oqBaW7WALTr7cg52APaJ+3itaO1Ee/CIwJtkkH9CAOfEWA8TiuBX4Yr50f1Cjyu2k0w8r
	 ZA0+UcJpF7qluE/HxeNF3njxrkwkzL2YqOvfNAqCeqRLxQcACOXCz/4ScE3Z7A6wFm5G0
	 bl6007gYc51gUIehU0Em6eHB3QrnHEmgiW/cY/HTN/OXONkYFWGaQJE87PVdEVCsHdBwD
	 Fyws9cle5JzX3eLXhwg/UTvijqB82YjOKLteBkgmBmAwA5N8R3Y/JTlFy1a0fUG+g3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PnsugRTi;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C7A606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C7A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PnsugRTi
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso547606a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795094306; x=1795699106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lW0rsTzAv8g0kMd3ojP3+GnYyed/cwVnxWGi5+Nic2w=;
        b=PnsugRTi43kd8Jc6wW0hk/YmUu0oNjvvRG1DQNje/m8SbD3TlSSeMEupfF4A15j0K0
         HHQbAEpzZbImTOgkUBPzUgfM2+34y+Z1Z3LIGfstav+IDG1RD4I2Cz0fIFwUVCFgap/W
         ko9db2jEwjEMacCCr6UIQxyv0rQFSJbLtRxjZVppSI41nq2x19GgjfGV/qPASE07OR6U
         1OppQBWCjSjSHcxZYnVd9Iq9hI1paPuJVUlegnwTpsZdlrGCng2ATgrKzd6hLmo89yy0
         gqeWEAFW62yKxK36qNil/zzi7Qh4eIVuAxFDAwaoe6Cy6S73PAL3j7f3kmooKXmhtUGi
         i2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094306; x=1795699106;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lW0rsTzAv8g0kMd3ojP3+GnYyed/cwVnxWGi5+Nic2w=;
        b=r46Di+bBnbtgNZ7Fuu7ZSFJdH6C4oq3HehRKiSxOZ4ZAnLFkq8Pj+Mub9Qidp+LC5O
         d+ZREhHQhf4Hh3TpfacGctA4Lh7fBP9lI6pdqQGI4Ugl3tsh39ZaCBH8E2RMgKLq/SlH
         k2J/EnspGvzVvg65lBXO+hLkti0A3NkxWnbqE+dODKiTEG30ou8lQB0SAnrB2iEsGzFp
         0CVPfC5H4BXfnh6qkbVyCOrUEcoj4O/KT+L7AP8uDvHMe0/V6lmlUizG7tcR9ktmldJN
         8VUIYW1+j+nJfW2vdia2813/RgjyYVl3FeJ8NnPBRu+4i6j2jb37vkJ6zWAwDTP5OTul
         Cb8A==
X-Forwarded-Encrypted: i=1; AL+hErGTlePfsc4eZR0vOSaFd53SFdSuta27Ct3Au2Lki3RqK88xOBhsn30UMYjH+kU1frfKo2xmXDKuePvhd+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wNxm41ck4YtlfbF2Mm3q02z6RtJcqrme541edHe+89AAfYMcg
	Yh/beGGliIU1EsXc9GYqx1V5WkVS/M+8BqtPO709Msen4UKCZY4CSElANnsRxepjqOM=
X-Gm-Gg: AZFdTZeQwUlYxyjRTtveCK8WRE6qkbDBYhsqE8Zpvq0lflpy+78mih+CdT+dW+glJP+
	Ku/M/0oN4MmHoiCksXhwFOgzuxI+/mgwh9imBDjy+9c6rqw3Zirrg7eB04Ztpji9KK5EISZ1S7E
	FdRkVFN4I9UrtoLdlqO7+BzVDl0d56mMrvC+bo8cDhQMm/8B8lp9ctIx7T8e4gIIDpwyiAbUid7
	GuscZG6/pRyFpIoYN5u8SFTi3/nvbKAdk/NomXcaXIwHv3+oyScpQkaFf9TscfnQJBD1IxyvGed
	Z4a16HnqgBdwcpfVyvri05Ql+CRFIDMsqsn9qTQNDdcFgrYDWBMvEZSMDhkJFfAdWVAENbv96yy
	P9o2dFdZWVunTwjMBKiBop629Pjxo7cIQGuRB4hUT8JSdzC2tGrKIvh4/4opAxG0o4mPgR6lklD
	Ddn6v3GA4hEYl1hgoC3Ax0SK2Azb7f0TOJ+fTcqtngBRbjuyjzKd9yfA6qITcmmYkZ9baLEIfrb
	yZBKP67XEEMLbDDVKPHd0s2dfaGX/MJR0GBHK/yathevgAd4EQ+Z0KB5P18Bz7LrDh2FoKGXUcr
	L13BLVO/baORN9RAG5sEbNFmZ4b173oLPr4fin4r/lyFGk8VEaQRLCl2GceDaOU2s6e+b/r5Dzp
	ZHtouW+n8X1kB/wgKF5GGYhdynLXqEbMolUV22g==
X-Received: by 2002:a17:90b:2c90:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b40a0e1cffmr734949a91.21.1795094306265;
        Thu, 19 Nov 2026 05:18:26 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:1076:1f1f:dde8:a816])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40543eda7sm2794953a91.0.2026.11.19.05.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:18:25 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sagi@grimberg.me,
	jgg@ziepe.ca,
	leon@kernel.org,
	mkp@kernel.org
Cc: linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] isert: the commands the target core allocates itself
Date: Thu, 19 Nov 2026 22:18:15 +0900
Message-ID: <20261119131815.2722343-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118211503.2526705-1-yhlee@isslab.korea.ac.kr>
References: <20261118211503.2526705-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v4:
  https://lore.kernel.org/all/20261119131700.2722108-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
