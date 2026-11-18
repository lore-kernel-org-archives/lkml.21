Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018060;
	b=J9V0j1GW8KMafmsmS7l2jGfyZKTXwhY08Wc9IBUFGfjympkTE0psAqf7RNfyE7WqrwxU
	 ZQMtUKOj207po+jUT81nyBMujaYjbTkV+yngb9WsuCqolRPfqgvi0enek03bI3eScf44b
	 3Qt6XnpAGvLjFSAdCjX5sw7hyfSYCeoWyEaXAPzMzYnqt1UAY+NLie5zmeHshYxG7j9bV
	 89EDk6i4d5QHlJgS0XaYhv+bRszfhyhAOJAnndPDgFdSp1UBMBVJot+mbIQ/qKqz+2MtM
	 EsOFNU0YJ5utMVC/fWsceKbvgazYIW3MuKUt0NoVSJijKqYqBvbr/PCybqKjT+GAjoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=GmuWkJzh1iCQH+rXKDpsn8JTG/S53WJETWtD1300bps=;
	b=4g/DHr//8QNb00Ryn5+toGcMoiMX+xZl+XQLk+T2cG/hBWNJ8SjIj/KLdZ1aW2ikdb18
	 EMLQ5Y8QjPR9ZxG+zRFpWtsIKu9PWUYd8c/axOVqqxQ9IqSwAnut2xX/83im61q1qNxCz
	 j/im1u2AenTNuY9nCEkUYXSP3PhP3ApyIx6JD3WI2l+rfI/O3qxy/UjJr1k1Gx95UFFWF
	 4Su2+2kPiwTOW5jNyzeWb5yot8WtRQ6Hbn1SIQavF2DUkvUHBOqi6mrxm1tOYymJvb4uJ
	 YRWOLzpuzP9x1lgaFupS+uebR1l1bnvBTlMrwLSNiYqnMtGGZKpyEmDWzhNjBcmTCtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="aji2d/Kr";
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8D60A2602
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C8D60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aji2d/Kr
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4ada9579947so682604fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018059; x=1795622859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GmuWkJzh1iCQH+rXKDpsn8JTG/S53WJETWtD1300bps=;
        b=aji2d/Kr8V6k7QQba0rRBp0IMiEQuDL0q7D5u7T1vwWrBP5XLREHI/CF+dOabfJmNB
         UOywoE42CQSdL5XDF02JyLEPcCoViE1p4a+M+FSykcnW/mR8VYwJiZpALoIX2O8E20Xg
         9UlYN/D3K8nHSSVGmyvrVUAIUedI075J/bBSALiqxa/lXI4gKMNw2HS0YJQKMRZRvkB/
         EXbiNZ0if/JrI/DZ7K9PLIYcx6y8mSvTtViSJLsST0yXmp0LQs2epcbEnIGrZDRab5bx
         F+T+9BqbHZngk7FahaUQ/HuKZT/wEYbDSNBrONJhAI7sDxgEaNWmmPXaX27w7QYft3E5
         S9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018059; x=1795622859;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmuWkJzh1iCQH+rXKDpsn8JTG/S53WJETWtD1300bps=;
        b=ibp9djyMssIL/fjeoHmIabW6/1LK8eJbEAd6EcFga548rcZi7US6de9O37TLcfpi4G
         HD/2n2v/atmtkD4CKnZlaIWJMRV5cTjEvDd9lun0dwz/5w40NNeV9RqEHknhsLm/blmj
         5GDEj/0MDlhfTBGMNynlUAlJry9HBRZNkA3tnLtSzmU1KVjJxjPnNSg9CI/S8e6CBq5C
         31a7/kYZIY3xG33vuOUFVFQpObQMk827cwDtIn6xix6Nd/8n8G43cujD4niOMZM1nx0m
         09RuICVCg6f1ZOyRPwWkVPNOVDZZp5qUz171dao0ZR13dSWvzyZ/buEzNVY95xBV/t91
         9DJQ==
X-Forwarded-Encrypted: i=1; AL+hErE7zAa7CVAZQkvxn4r9uGslSQzpX3Ps1fEBoI3bdkMb6gxjniCyAIphXLEEsMV6u02DUjTKEcFkKY9AuKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z88c2x8+hCzfIH3tRC1TF2Pz5Gd39htGBziKjfIomJKTgm/ov7I
	Gu3WoC8CWjfgGoUxSQJKugIHGJPtk1yOoweGDLaBp5orCNgewvU9uJCjraSa1KJCgig=
X-Gm-Gg: AYBFou1TDh0GWgms1qvuNmAJNurhRjWCyeMwX6tGHVjkdNODwvbb/DaVDITMzBPSWRr
	k/eWMUKWVPsPcvJ6+b58/PwtC34AbFu+HlRAmC/SaVaoxdLUYyDIZF8g/69BDPNGXtV3NwPhZ3m
	OYQHZBZYMsG5jrxEnbfn2Ni6qV3FFzTMLM4JRKPVftzrM4WwG1xtgVWbY9AdpShW0/A9dmEUIXi
	P9AdJA0mr1obLDF/BBiyKtpYURCxayyv8KpqJdhGd9pDrI6AhV2eF5bDiyc8axeZkwhgeen2Syt
	Vs+YBCxUrQuQoISd8IJcVSFNm7WaAMo/9AdNwjzq+y8eSy/qySXzzX7d6QNcLxjv3h9JCUyYqFw
	tXhT+uMkoTIK92uF14YH+Z/pMkyNPHUNu7Foq9aZqlJ3ScryGTpC/6kZAvmqtorYWtv3zGlfKhv
	hy74NjilALjnpgiR5vCwTVueC0fF9I4z4DvCSVZ8adokaebBVefTlyGdnmNxC5uMPfbtTm+cxiN
	vnQCrunvzKB/XCY7d/NVW53aMxzqgPqwQvv/RBn5zDBMBimlrePBMjcVkWrKMcghpAaqYbWVD8d
	y7gCg6trRh7u8lwGtTYIxP0VB7L5wyegbf1rRAJT9Jvty7DbRZI7sPdk2GTCVv+BXH8vqhjSp0g
	RSWmNhiP+XTzjuoZN8cyZ7do+zkAAWLPAUNlo/SAs/rpovqi8eji5clNriPsFAwYL5kCs3on7
X-Received: by 2002:a05:6870:2e90:b0:468:2c18:a031 with SMTP id 586e51a60fabf-4b75f029d72mr2362162fac.12.1795018058604;
        Wed, 18 Nov 2026 08:07:38 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:38 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Damien Le Moal <dlemoal@kernel.org>, Ming Lei <tom.leiming@gmail.com>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christoph Hellwig <hch@lst.de>
In-Reply-To: <20261114-bug-block-elevator-unchanged-v2-0-5a1fe7d72fa0@linux.dev>
References: <20261114-bug-block-elevator-unchanged-v2-0-5a1fe7d72fa0@linux.dev>
Subject: Re: [PATCH v2 0/2] block: make changing to the current I/O
 scheduler cheap again
Message-Id: <179501805754.17649.16701221943802051712.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:37 -0700
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
X-Mailer: b4 0.15.2


On Sat, 14 Nov 2026 20:58:31 -0500, Qiliang Yuan wrote:
> Writing the scheduler a queue already uses to queue/scheduler takes
> about 10 ms and freezes the queue, which stalls I/O on live disks every
> time a udev rule or tuning tool sets the scheduler unconditionally.
> 
> Patch 1 stops requesting a "none-iosched" module on every write of
> "none". Patch 2 returns before freezing the queue when the elevator
> wouldn't change.
> 
> [...]

Applied, thanks!

[1/2] block: don't request a module for the none elevator
      commit: c85f570121c94679854b570cae2c0dbcc0eae43b
[2/2] block: return early when the elevator doesn't change
      commit: 375a88c6176ffe05e521c2df31b1ceaf4ae5fbaf

Best regards,
-- 
Jens Axboe



