Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174979;
	b=YC1J1Tu37mXvLYjTfAQkK+LpifwYvEy2jdAPuiRWHi3LDdepI9wiEQ0M3ay6AmAizdu5
	 DQ0bf8jWavBrGOmMqEFK18pby0M0W8H4opejhonvmveED0KPxQs2zIip8BFcFCh6Pecn8
	 FIXFmADFYjzQz2G+rVZ58Gta73/+NpR/0iCqJ0KIwO/gJthZse0CQCD22w0ncAfYDlkvJ
	 aap9PWcKF/znOZcSSjkoRiLxWpp73zAS/k2FhmEeQkCuw1WatDrCkDaSsgWEi/C0OmqZT
	 h8PxDuoYs0Y4FBbQS0pEGo96aslImmruSQ3MJteOjFnRgbHLr0143G6/ER1+ft+EJFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cjnAbbZXJqzEeTrkOsVqC8UhuwiWl38xBjiqjnKRGyU=;
	b=HIyuD33mjmp6zs9qluPkbpHspW/bu0ElZt2Us5PMceoaAgCMQNxUTENjOBoN8MbDR6k4
	 IGHdg1YU951F2RSzTL7YvTlcX4OG4Ce2Esru9JkbvNCtoi/Jf1kkNHH+I/qaFx3APfl17
	 Ob1rQ1lZyqWQ9+qKfSZN7CpEMpqBrPVj9iGB8wx93/QVQOz2NNwwJJaFczohupB7v2A75
	 +t+VatAI6caRIQA5oFi/dnYhBJXuD8bJ3Oz/jZFBIMIbj52v52fcXa4gM/9niz8bZjbIR
	 LJd5mmUFIUmKP2nQ0fVYmbmw9SjRERIGJ7NRVYqBYmnIMb5ux1/Trtd+C2ojSLLahPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OuuIYDVK;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F3C606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F3C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OuuIYDVK
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so520100b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174978; x=1795779778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjnAbbZXJqzEeTrkOsVqC8UhuwiWl38xBjiqjnKRGyU=;
        b=OuuIYDVKYgTL8S1jZEfJBv8cEwn7EoDL77Y7V3LZ6qxdinqVqTaV+l2xeo/47tPyHa
         QIgtoGL8QF+MNLJAT/AyI2t4JsX1u18bSIajv/kw/wpL1uopw65XvB3GANIMGFJFlkKv
         PFk8r3+bBKNwClRGZl96QbHfcFNZg4NiUaqzYEhU/gx1gzEP+aIbWqwryU8nOiJ39V4W
         ++DBSND+qXvAlS4mYK6ycpQoc3tMQTf6oDIbI/XhYLHqqEzgbLr7mV6jXuMZ0okr4Geo
         sCWbF7uIFk+9CK8St/Th/ChxmZoggopAVRX4g36IpztnLB7T3w0rPCWnpYdtuR1OY/Op
         8yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174978; x=1795779778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjnAbbZXJqzEeTrkOsVqC8UhuwiWl38xBjiqjnKRGyU=;
        b=kfjPOktsKmRt2HDx6oCDgMnk8TFFLIvgUPtG3CVokv/KOK40UF56aPgjPNc9LQu7rm
         XrcywWB5GGwQn6fqtgo0QfkeBQNiAx53T9naGIEFLSlK3RLus96Wgb30IYqgstxL6acd
         GpeBEVCOoMPRp0IGZbaYI/sy4J8TPQhUqRqSuhd8jAdYtgtIAPB7eORxGrlwIkPwiuiB
         6DPU40bQDNBC8U+gkNcDd7XfgEpEhi73tPdPLXoES2Jjm/me7pfqpXT6Xnf1KEkztsWK
         JCDLUGaA+D5gSH40IWkwGXvlyrDNL7cyW9bJrzVYlAnEbhACqe9sQuNRPGXMjhXRBJpb
         zwtA==
X-Forwarded-Encrypted: i=1; AL+hErG/UAb+Jo8FA/3XERsF1h///EgYyiMR4PcCds9OeASE27XervfFSlYQ+20v8r5vYch6Q1eWSGqlUrhQZb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fTxH9iKi9kfukCkUHWFXWIGYDwVnyhoOuNlWhloA17AILNIxp
	EZQC9yX4hDO1BAF2wQD8HmgNbpwPYUyAMlGUNUGdTR8tMTX45dj3oyKsVglZl8C/chg=
X-Gm-Gg: AZFdTZcvstF87jIAETGLSdDrCLJ4YtvkJ2AjjK9nep0/OIy2WQwkSokh3kRNURSCiGY
	fHc0l+dA3/GyrRx30WqW/StnfiLkRrKBjJAOdwNqzSmwOQLFzTr7stENqunfn8+oXAJzWw6gEls
	Ca/yuoJpVmvLBeDS86XhvmX5BtsiQkPQfp1LTod83ZiQAul0J11YV0xZOl52oxe4+dZr3Y6ygFx
	nUEAZOI5OLfKiWE/uisJmaFzLYQcX3HfIyhcdYP/lv7oVE5gxcuHwX4xKqd01CGor3hXYDel0bB
	uNTR3PL+aWSNZWg3UKHUta3CZvMRn+Hvwo44qMkN1FXLM33beaqcGl7/1NeOc1LUmcQCaNUoaSs
	gHfQM6WOluWjFP9422AfApP1sb+/W+sF29p0vXPpgPB3tEVQG0vjsIZpZjkb1zpegFF0fE3nuc2
	E0+jLir7NpjVe/w+sgY3bxqXucNnOeBlbqS0N7uavGfB64fbOWfd3lKEsdjr2p0i610wz8ZWOaZ
	6FOm61OLzl2d/gKjeFuVgu5V2nLapCmyRrwrOpmWyGIyNFJXDgJcWGR1nvgp6quvBDfQhnafk4H
	kfkerPROePTIeLYmYQGFZnaALF4gzYdiU5FtgO4PDYJPZ1DQPiRkZikqv9rScsDpdemYpntUTOC
	q9VYk7RkihE18idCFPpuLzVGZWS0qkhrkygDN
X-Received: by 2002:a05:6a00:1ca7:b0:89e:99a6:4673 with SMTP id d2e1a72fcca58-8c87d51d50bmr2674815b3a.60.1795174978317;
        Fri, 20 Nov 2026 03:42:58 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm1406465b3a.2.2026.11.20.03.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:42:57 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: njavali@marvell.com
Cc: mrangankar@marvell.com,
	GR-QLogic-Storage-Upstream@marvell.com,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-scsi@vger.kernel.org,
	michael.christie@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: qla4xxx: bound the ISP83xx reset template to its buffer
Date: Fri, 20 Nov 2026 20:42:52 +0900
Message-ID: <20261120114252.3072228-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010181139.1911817-1-yhlee@isslab.korea.ac.kr>
References: <20261010181139.1911817-1-yhlee@isslab.korea.ac.kr>
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
