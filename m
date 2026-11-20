Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174985;
	b=RP9q0lx9VuIuLKuWyIXU/hVkjIAR+QMoUm7RAXl0itMIGuIjJEfGbZH9oLMNIb9ZsVAZ
	 uO3OrTDglBWDySByUphKRCMDpSU3LWC9+Ko8zZ3K0JXSwmXD5KQG1+DQ8FJsqwr7uLO2m
	 GjYzTdQO1X4P/3t0ABUzdQgmnezZFE+HoMspYdqhNyhGkzsBpcozuNKSw/uPHK9oKoEEr
	 bp7IfmZ6cr898vgNBBbUyF8MnAnLxpk8a4m6NHSs+UUFsSyKe9m5jmiPYqdbl0ECQYPo3
	 vDhQ9TIjH0PCD7dtUwGuHuXfvkEzTbZ6sdScQeX8rDDm3D262frxqko/p5MYC1mXQvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cjnAbbZXJqzEeTrkOsVqC8UhuwiWl38xBjiqjnKRGyU=;
	b=bu2S9ZsSIKvfkZa7ZXsWcib1em4yFrtEZ2Mvg+tis1i8dnTZwDboYEgMIYnKouRRcLje
	 qy2PL4xqFT+fG7kjl4pZ7Ny8AdsydAfy79ESpGDIedRV5Xvvb8aO0NFJ+xRGxMO7olard
	 icBO+xz8aF2dqERhauAWr74pL7Lztd3y0Vaa9KEmBqxRPaYDITr6S1mlNx6AFSbODH3CY
	 R6QlP4+x1qkZEZvfoV5LwDavuyX7/s5CRxvpbRuLZWzlGKw5B7HJNyUXIv2lodogyOqWR
	 k3RK+hG+DQiirjHOyhqk2JwTfqhvTGCvDKXVnLllGU6oCMVz0Azr6jkxXLYNFDq53YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M8c4rnww;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50485606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50485606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M8c4rnww
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f0426a65e0so4852555ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174985; x=1795779785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjnAbbZXJqzEeTrkOsVqC8UhuwiWl38xBjiqjnKRGyU=;
        b=M8c4rnww66GZ8Abyj3I9MvBehqqdQE9CnXAXTVgyNAPKfTQYugLP+BkxaqUeHJCY9d
         K7EDSaZLQtyx2+ZUQRMUT8rPvBcBY/GBlvUjrchpOHpOwdaS0TRxfJPrbcK27MLyo3un
         2mSrjVMKYQloJNOjJrNWHi7IHthBXVZJPdtApr3avdvPqzzCZMdVTnwHCqweS3BQH57i
         8F1yZ8imyqFHCQVvDAnTRptSNCzJAE/JDN83PwrYX4eIGBRVXKxsPV+qYgkLDGA4RrCR
         /DC1NI2dICi9rBF0DmsPGc0a5FNWQgLVhMl7o3HeO5uaYacsa0qHGR75943f789k5ElC
         x7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174985; x=1795779785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjnAbbZXJqzEeTrkOsVqC8UhuwiWl38xBjiqjnKRGyU=;
        b=i+lVxEynbvRUvcdSzyQ9Tx/d0p/6w8CJkV2GTLQjqLIeuPp5fY3BL3qKTymac8ZCcc
         lLsmUcTO7hIgcXAR7T+ibV9GUHBNRkVtoyvO42NGdff51MkBzsNwTPYVA/kSTHvtRzXe
         3ZsIuYRCYyvrd/wnbd9ZLngL2VWejLtMXALhwAyLfIYaNV1cbGb3ZYdLk4iRrbSx8i34
         9nU/evPD3xmG/1bEKkNpFc2EsdUBIKTri4lIGgKrKKiJPfHSbrrItE0ZDYw7/3Ljk6UP
         3y+Ovhya84FKBU7Mp42uFKSCdHrWFtnUWCVOLOFnMMeVFpMIzZDPeFf3seNC0BcZD8Rb
         2DiA==
X-Forwarded-Encrypted: i=1; AL+hErHtvXECB18ehr5H7dUq5sI+dPyLPHWd/SlSrp5oqTZdfdDvC1oRf5k5r1pqPQaTYGjHNXXTgNa42RAvmh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FcSuVn5cCzAR/d4U58xNUm1eiOxaFr6qTL4dBL/jbLwqdfMVG
	M3GHVHkmZ5de6ENxHpm8E0cbF8TGFagpFcbrN4ofGbtdeyyYLNsX1ule2A0+UrKayCY=
X-Gm-Gg: AZFdTZe7ttyR7AJzk3Pz8Ef379IlUfmrPNeLwA10gAl5w5rI+U7jI4bD5IRwdu6TLjK
	Z47a+UlNSxuBjA2V9Lqj4xv7BMaACQsZXQy1D6eql9Vwoa7AJeWYn7YkoUejIKfyj4DaZKjBOp0
	c5Qh7cV9brwXhZz0lG69fcsu5/duPNIWjdjNQ7uOXdO0Iu+d8ySGNae+rYMDqdXZfUPGlnK8MfB
	+K7KmmX/lV4XhgQy1MZghCeQfIF3KUeB8VdVq4+zO2KpnUOdwi6oQXCzJPsuWihZxdL8n5+xX6p
	TQp/3fUnTt+/TYBC0/eUg4nz5mg2pdGoa8vx5h4ELZEL59WpEpNq1gUexFxPgKfwWHIvZ5ezQFW
	e/ATNAYiyMVQZTvM+KTZMmi07G2ix4X17o/P+os8h6UiXLtIUcKUUvhuRIru1XRGU55ndj7rSEi
	xzS58/vaWpHqRIXHGN4JL7EqV1VbDxLU7un9/Pf0WFb+GQpWnmNWhnrhoki/l3CT6RwMnQoc9Ml
	M4NmI2shN6wjO7+/EjjrbLD46szzrHRrW2+6rfFMqeMY2M6Kuq8QPcv+4duMyYQWooR1fKePpdG
	SE8NdaRKoJNmYASD6ySU7q75CnzLVWxDZAuU3kWJ96X/CPzkMfPKzAvcazoktnDZRlHTabgwDH/
	wrfSMryisnq0GS9t1yZxVl+f65O43dqvHnq4U
X-Received: by 2002:a17:902:e811:b0:2f0:22b2:bfe2 with SMTP id d9443c01a7336-2f03f201151mr27718695ad.31.1795174984741;
        Fri, 20 Nov 2026 03:43:04 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ad2sm13209395ad.16.2026.11.20.03.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:04 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: njavali@marvell.com
Cc: mrangankar@marvell.com,
	GR-QLogic-Storage-Upstream@marvell.com,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-scsi@vger.kernel.org,
	michael.christie@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] scsi: qla4xxx: bound and correct the ISP83xx reset template
Date: Fri, 20 Nov 2026 20:42:58 +0900
Message-ID: <20261120114258.3072242-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011040257.2017421-1-yhlee@isslab.korea.ac.kr>
References: <20261011040257.2017421-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v3:
  https://lore.kernel.org/all/20261011144752.2063334-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
