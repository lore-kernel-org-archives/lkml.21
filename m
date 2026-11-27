Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795771914;
	b=lFmnseusdd5lyaaDIFArBlFdptc5znm5gBaOwu0jpdgh7TzLXQXulwMP2W4xbFBeMW/s
	 KZeJtQ5PuJJA3rPiKQnMCdEw+N3A94xLMjaOfBaIj1KNzg3xUgQyfeGm0gBhDTCwkaRyy
	 zLsoV1hpB6ECqwH713h2PRAFQaOrjAhSNwk+Z1W0MyZsF7sDH/V/Tr9vAjKxpZSJE3nIs
	 /zUFUXQBpOkWqizMKPXpfDHrUORAj0/7Pp8Hd3UZSGUu6NY1Br5tLZwTmnq3sVkTlPROt
	 flLdWxuFSqkOsKPhecttpdXnL6WMzoXJpSOc72tz+gM3AUqGsw11pNaAzXlf6oQAw1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=rYtTvFCeRVwq4VXRd7pixjilcP+eVEpuccpxopQo40U=;
	b=SiLJfsmz3DslJfftWTpTlMU6oOtzGpiwPcjBjnxGRYGTITG0UxbZFKkEva6192odSkB5
	 pomBUzcWAwiq9x56XcI8Zq7vNpFFSEP3f+BM9myn2q+HfxNrRtTkqMl/hSzkuOwJRni+m
	 VAXtag0J2oJ9Fet03rdg0Lphm8aR7SrkBYPsnWuARdUnLjrgYLnNNbKfNXrLacjQKZs+c
	 O4gfnsFkuAfIv1vuOXd0NVNAqtFJKsquB2D0REYDVrqEjibGYd2HJ+fGXiBTeeN/KJpUl
	 N5qbfBc6FVB2f+z/6uKpdA+zAOzonvf1dsNHxLwww/GrsKaDCxo+whdOhtVDOG3bsuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgTH4UB7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A14606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A14606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgTH4UB7
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-702dedeb70dso4540719eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795771912; cv=none;
        d=google.com; s=arc-20260327;
        b=foGqQMXlCipq7ZzDnnEJMyhGqWGnWekIYAnpxn8NbCMU8wNW/0tEjmOkwQ6kx1jsNj
         Ur+JFMqa/CkuVwytVjKGRbfkFKNyl1Y608asz8Wi87OHriWROgO50xW2wpAIluuf7QeG
         vVrLszIYlnSIKLmIquviUXMY4Ca8m6ltdiynnFARhyTzj8F1osz7HrC4aeUrHdwH3xjk
         PIKJ6CydBfJyPhHs7W8kmbBqekMzZjL+2j7IhhvMOJe9kOOpp0QBIGuzl5lhWktivF/P
         KR+qU3WnSxseCVPOY1hPOxag5G1YY+ftnFzv5UfMNtCvOJ3PVhtb/pAJqwPfxD2kWug6
         n8AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rYtTvFCeRVwq4VXRd7pixjilcP+eVEpuccpxopQo40U=;
        fh=oRABvT4sCTylmYFQ+P2asjJMkiHhnFahKPkU4l09LnQ=;
        b=g65RXQJge1/I11N3kpnvik6YLTS2xGb1ubG3U37D36zcCiUowYcwAJQJopvTTrAg9u
         xACQQ2KlsXBWQdfxvCBwNeb160/kj8hrVGX5AEFIhsXjYR9BgNx30MSL5P48Lt2d0Mrp
         TLHjgHJqBDLHdEaFJ1djM/LU6IRQseMmQ/Q+8E4HyhXqXCZrYEL5fBZ9b6rS+V3v33rl
         syWlt6bot0OpbE/+zEC5bhzdcQAIa6rhphtfBhpt9CGo6iYKqilr+1H+SJIg8q9MKOv1
         3H6lci+ploUQvWb+V0F6PQaqPn38ULYfWV+cSN/1gQJZV5bPoLmRrJN7xD5nDDgZDLyy
         nTpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771912; x=1796376712; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYtTvFCeRVwq4VXRd7pixjilcP+eVEpuccpxopQo40U=;
        b=kgTH4UB7TdH895I/yZyfl2qhrZUiBsrMugyslK9h/xhdkLD6Z9tkvI7FrVSaDYvpfr
         9YdnFQMkrWvNOwpUrkrpulfUFxnOn4F2n74PiGMCDRMqfPny+hOciZuP9+7ndAr6vrD9
         xojkjXE5ZfmYZpX+fPBX08FfXdT73jkGpvsITUj+L6yQOlCGo+1aNpZQIH0MxFrQULvw
         ri5hh8P99w3If95uJasGdUwKPNCbz/+gSyunmSAcKqW2IyDHh48rf6tslmM22jlQJBAi
         DXY73qiH9NYpY15PvKcjUsL/b2Sqc+WYqj5Q9LCUiiPo/0obdsObFiUz6TLBTgq5/Rmx
         w9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771912; x=1796376712;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rYtTvFCeRVwq4VXRd7pixjilcP+eVEpuccpxopQo40U=;
        b=HU34HNVj2ucS6y+aGrxvE/rveoEuCgD1WOTg87ADHlf7QU2TrM+bal9NJ6CSTHmwM/
         NSk9Imxjvm7Tdp68MWOVclSo0QtkmLFRrwzX75NqFdeajlsf3uGtHcq8t6zDMYzYP9U1
         UWkr6/wK0g7HgHb06SGYgAQ0SN6sXcQeLkMx033XGFh6i52tMU9cSMg/0C4D7tDhtCYT
         Q307OVO76fhaMiKxoMJOl2BZZtdhzsSRscArFJazHvm2vkGNqbI3sKqn1wKrlcafO6dk
         yTp5LqjwlIJOaD1poemXyO7Y8tfvK22rx0CmhRQIN5dnIu0IjPHWDFTPedf6EWm05gVY
         nznA==
X-Forwarded-Encrypted: i=1; AL+hErEAWWeExF40qdM4Fm1f13pHvH5h7sTmKlKOADlcYejBfqsrBI4FAJ0EsTZIpSrujVxvRmTpxFS6Xi9A1is=@vger.kernel.org
X-Gm-Message-State: APuU4Z9chEojYUpL9dpKfHSbxLNS65Pjfsw7hLz4cTVYgXLUwdeahEQO
	5BpHpc7W+PFMdElhnRJipwS9wRfnnVhKYeuSv+X60EvP2xxlP1QSYDPnxZl5zFjpkHR7WItQh+Q
	TYgpiw/1vPTode9wO8nhacH3OuIkpeBo=
X-Gm-Gg: AZFdTZfJ8Ucfzlxz0wCQLwU2iwmRCizlwxnFsMNDOK2eujshKujfz5k1SPuofvYPa5e
	evOfrg0hjVRCpnaOfRvfO/BG3Lw0RlAGgi48x2+V2bk6lqljrGcQ2WSKESMwTrOV+dKcFVAdD7z
	68Lpt/1xiB94Bjzy9m4m7/sdpI/gVqLr5NVAPqoG3/KJj1taNUpB0AXUoH//toTtTU7oVGgoHXf
	4JXznZJW2f83vT/tnd7brcFjNV5uPIh+5O0ehRiidlCSHANuS2bfy5hzowi8gun305WjdrgAipp
	XP62nC01CYGMpV8DyCx2AatFbex4zgQNoH0/zk8pz64fL5y4AkJ4S5ejS6fIgiEAIyC/14YIFJ1
	q1IMk7GmhXbV3Jku9Z2lWGp539uXBjt67crpdsrv16qqX95olu7+3eWFDiCb3HYeIcK6G3IkGjM
	J5wsKOd2QGxVI=
X-Received: by 2002:a05:6820:a747:10b0:71a:fcbf:2468 with SMTP id
 006d021491bc7-71b395bd211mr13965028eaf.88.1795771912538; Fri, 27 Nov 2026
 01:31:52 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 04:31:51 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: getfeus@gmail.com
Date: Fri, 27 Nov 2026 04:31:51 -0500
X-Gm-Features: Aa3M54qQ1tt1j9P7Rj8XS1ubdWaAGsLnrU-PhqZoKg3SNgf-6Tc7NA8ZE6SAwm0
Message-ID: <CA+m4KrAaEbbZywwCq38BqvTuh9dn2+23br6N3FYxB-mix_+R6g@mail.gmail.com>
Subject: [PATCH] soc: qcom: rpmh: Return the first error from flush_batch()
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a TCS write fails, flush_batch() breaks out of the inner loop
and continues with the next cached batch. A later successful write can
overwrite the error and make rpmh_flush() proceed even though some
sleep or wake commands were skipped.

Return the error immediately so rpmh_flush() stops and leaves the
cache dirty for a retry.

A mocked TCS writer returning -ENOMEM for the first batch and success
for the second reproduced a zero return from flush_batch(). With this
change, flush_batch() returns -ENOMEM after a single write attempt.
The ARM64 kernel and modules also build successfully.

Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -334,11 +334,11 @@
 			ret = rpmh_rsc_write_ctrl_data(ctrlr_to_drv(ctrlr),
 						       &rpm_msg->msg);
 			if (ret)
-				break;
+				return ret;
 		}
 	}

-	return ret;
+	return 0;
 }

 /**
