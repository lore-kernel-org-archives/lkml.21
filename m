Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619554;
	b=ponkYBtak6OMKOLdIU8WWsz2eRIW+Ldb6Z6HRI9NVtvyLK5h2ZmYDiU6moIyoH62uH6H
	 JLXYmkia6lfB4p3CnOwDCSyC432DShenhIMVCSwHkLsSJ2A+BJkex2oLm6tp10+pGVJrP
	 mi4ynR695BbiS8G849kFfXCc74e6k5OqHuWdnekR6KxuzcM1LIfmGqwtZmzG+2aHFWuGr
	 2yi76S4PGlGiLApZST2mQtLrcjG1zq6q9DnxXQfnfZYWmToXlFLTQ0r1LjDk1DfLhGMAq
	 DGEOc3ZxdnHbmkNRcdQ9d060qYmGMxYlctM3GpeX+Ah1ZclNMS5i2rNbRt1ZwuICvkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=xF4JRWH1q9UqaShKbo4Aa+Vb+tQRrPw7UDPaEFuk3BE=;
	b=HYKyQprPbAK3Ww6WWYmd0TBP6ABafW3V7NLi5ty4XuZ/yPTnqzDH8LDd4FG9Mz2R/qAt
	 s5kyUsBKO69OVpkRcQ1fafpvaRqfiOTORZOJzetiGwXiitmrIMUJ3EcletO0IzYzXYZlO
	 TG6yFyiT1Ji2wWab6/DglC2HMDgx0ishPJfAhAAFzEUaSC8nnoiA7UzIj+j9LSF+r6bul
	 LWSOyDnVAVSAUT4bSQX3BCCwr40sT2HJsgKyh3LDWyNWPIgjDeYxWwhzj73CP0mBIw5YU
	 t7o3DPvdkfL6jX6Xdj+u5dLZGdoXVcqIHugBzOmDV70aFd+3SB3Ns0FBrB0cziP0V+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Arf2l48y;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC6606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DCC6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Arf2l48y
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5203205f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795619552; x=1796224352; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xF4JRWH1q9UqaShKbo4Aa+Vb+tQRrPw7UDPaEFuk3BE=;
        b=Arf2l48yzE8BzILRqcU8Fya/JC8Vr1z6S6mDLKIAzxvHt9eahVd1LawKL1vtXXMMzz
         nyjU/LoSm3Vg/cBn6hd4Vpas9zXqLjI5XR76Y1TzRjuVmr9YTBdDFdbCqEUzX8BFsaEY
         BBHAW+akFqnceZ2nNy7iiu8wFD0al0mgnIne3odTnTpymm2+nQ90cXfvUqRmp7ihhu+7
         2SyOzAinT/RiOBPSaY/FzV2If0xhWMMzsXMhDVFP2SX+FFV22D1utEa96CymSaSZM1xe
         WPFFdu7vcLyIH1NbKaTHTibdT906Wp9FuxjO/Cee5lRSEAnM3jysduTtTY7XHjbvmLnS
         pv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619552; x=1796224352;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xF4JRWH1q9UqaShKbo4Aa+Vb+tQRrPw7UDPaEFuk3BE=;
        b=Yongm3zsreEaFO7qZgqu9WGmIxZPnpXc6BL70kAv44UORdB4QnvhiW4Vo4PChYgy6x
         YSnyC0Wt2Bp3Pq3humsYIFfHUBkXsi9TZJzjL8J5IbcBSu6jPdjLDSI6wUR+3fiykKii
         AcXdFqCmIlLZM03e1S02yFtxc3fc7edUxiAmOiyAJ+K4tsXLesy6HNj2N9WvTpXlrP01
         cTGJH/4D0biWRibU0+3UJUKLzfaDN0ol5QHJVugsqv8+dgmMpPiA5uLgSt20EbvbNNnz
         YyEsNBIvYArAobu4HJ0mu2QLJ49TamHhWGBbkJMrNx9dVRpUUHBcg/WLQP9fvTPHookF
         A+rQ==
X-Forwarded-Encrypted: i=1; AL+hErE4XaXGAqVgpOncE7MJv6H0Irig0bp3VDz4Ix5iBAZ1+DGvVT4FbX9zfSunpwprjnNDR3tqM/KGZHyGYs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W+9iom+tZdtUPyTGXOVC28ZgcHUKWfuP24OIiOeucMgnsxb91
	b8oP9ju6lSxhnxu8QWx+L5QjsVjxZwuMoagoI0Hq5RtPeH3laWUeUG32EAfPubrQhd8D/+FzV4r
	bOqVN
X-Gm-Gg: AZFdTZcbkUsYyP9VsgHNwMH8oGUkO94/fE5zeFyKmNiPuXCMD8Drp0rvsVycNDmZGFR
	Ivbx4xF9Zd7sA4REaTSV3RmkEpLXVdARRTuX2DPLdszLsLwsMZwRUJHB4+1M+BnaNcOpDenu4TH
	rc+Sjs9f8Cnh3xPACMOYRQKPkSG7ABXcxeF1vcucjSbVNKgPaMJWA9QlhRBuYSNwP8sclEYxgWf
	YmOMbI5x0AQXOiJIhFdN3npReWaz4b8jvbxyhNh2DLAjzSvAZ6LcVl6W2l1ZUmJdMCVCEYyd3mD
	5UZ1B7/2vNRtCcsTfnyDI1IMeDiFS40NJiUjZrfBnfw7zNVfsNSHcarLDOsctkFX9ODBso4zJa9
	CnGiK7A2VgBhQjN5nQ5sYtg5x7/7vuv2smebd8hKc8J38AFusG//Xm/IX8CXQ5dfruAb5xtduNZ
	kTwKqDOZEcrkPVbDve5M/rVAt89P5OETuSS2ZLgvDEAZSGEnhsWO9PfyqhKJIJAKJvEh0ei0xWz
	aq/gfMK8nwUCBHHjaC6gFclAz8MvVEIzBwVAeZh92KiWUGJIefs3xGKB4Xj/i+6I4ryE1c2oWxq
	Yv3AofkKnM6jM/fQ6EOZvlLf9wHIUzaGusckEnAQTGOZ74Qw8PqS0Q==
X-Received: by 2002:a05:600c:5307:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb88921468mr352479355e9.19.1795619552272;
        Wed, 25 Nov 2026 07:12:32 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm39845282f8f.24.2026.11.25.07.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:12:31 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/2] perf kvm: Don't create an empty perf.data in live mode
Date: Wed, 25 Nov 2026 15:12:13 +0000
Message-Id: <20261125-james-perf-kvm-live-file-v1-0-946f478ce2a1@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM36BmsC/yXMQQ6CMBBG4auQWTsJraCJVzEuKPyjg4Ckgw0J4
 e5WXX6L9zYyRIXRpdgoIqnpa8pwh4LaRzPdwdplky/9yTlfc9+MMJ4RhZ9p5EETWHQA177sgsj
 xHCqhnM8Routvfb39be/Qo12+P9r3D3gdzQp8AAAA
X-Change-ID: 20261125-james-perf-kvm-live-file-520dbff37b4f
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>, Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Running the perf tests drops an empty perf.data file in the cwd which
gets in the way sometimes, especially when the tests are run as root.

Fix an existing error path bug to appease Sashiko, then fix the empty
data file.

Assisted by Claude Opus 5.5.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (2):
      perf kvm: Don't pass an ERR_PTR to perf_session__delete()
      perf kvm: Don't create an empty perf.data in live mode

 tools/perf/builtin-kvm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
---
base-commit: 148690b95cc425950dbba79d73eb4f7938347fce
change-id: 20261125-james-perf-kvm-live-file-520dbff37b4f

Best regards,
--  
James Clark <james.clark@linaro.org>

