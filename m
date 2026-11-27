Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809805;
	b=2Bufm2cgGtv7u2ILlNCzZ1mKiAiItacOkTEStfwBCUAFUAhPjkQWKPHMgdozYvr/uJh7
	 7P62kMXWeMdLsLmQBRUzLCho/1A7KkWwSuyOuQDSReoNXVVn8VjHPIgWC8v7hvjhM3U4r
	 6/saS/k4IFisIbrHNkNbVgkMPOWIXWeTaySBYTWJwbb5Oh2l7uR6im1930IZtwKylQQB1
	 x5UOVKTwZ9ZaU4LPEXQXOCttAihHxdwciZf2W/RzNeLHCirivsWFuNG06pl1lQHo9vwWH
	 5vKxMj2OJEbjBuNA/0/TKH4jr0ZgRElXf01Z84ijhxu29bC0AwCcfJrkBmT3bXnJndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MVufmGKAarxmJzpLzX5jhmEod8gRto426LJqcynctLk=;
	b=izagoqNMN5elk+kov3HQOUULFF9WxFk6rueUny8HaPgiE/eWcKc8HNqEH1QtgvKLgjc2
	 2ZhSknOJ/NU3lphK3+0U7VobsTi7JOjVy9SMvNfAbI2qTFknp2qPmAXwO+FJwuuVL8vJW
	 JmDvh/flCb9kiaa+dRqMXl2VwWLUeAxU2k7vp6nKCpbtk1AJ3cKLmS4SiOHqFIhLiD/Oo
	 7tsPdAJb2UTniG8Od1nWbjP2U1fOPud/Q4ZuCRETwife57CaaehWJ3uXhYvaHqMqQf6zD
	 rKkMX/uKjQqfFE2emJVSrGiHQckv5if4mAGJ7AaLnkvftYEyF5EjsPtNUHVJmcKo0DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfiljDbb;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA64606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA64606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfiljDbb
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bb5afa736so1019965eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795809804; x=1796414604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVufmGKAarxmJzpLzX5jhmEod8gRto426LJqcynctLk=;
        b=NfiljDbb6DVeTK7L2hVdTAAsihpTo+cVNJyxizo3O2jemefbHlokUdiQhT8bTNPPY3
         3Fcb5jyKkO9gziBjQGhEWvQRR7y0vNSre9kAYw5UrlF5cnnCcUqOdI93OwFqVRMml8lm
         dIUfx8vKWr01Dyr/2gspHi6nRGkNVYMvJNEWP5ynTagNE5F8NNWcploct5Dvda+9hj5F
         531HYYRBnFA9U6ZwxQR1wtSafpnJduOzjvUivUI7Wwf96BTa9ea11JynUH3S/asrhx94
         2uc8IF/wUcpaOaiZt94pJdHSa2DX70hFQh6oKjzb4vcKjCE+WCx5MH5eFdLYJ2GAq0Yy
         mFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809804; x=1796414604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MVufmGKAarxmJzpLzX5jhmEod8gRto426LJqcynctLk=;
        b=kULVbLD88RHGhK9gLATgvqqtggSitiRLNBZLxjv2UnFQpD4Rd/cJgRvm1PbjL4IadC
         KC4gju0mX2CThSQDqAZAly+kGx14CeD8MG0MF2ICLrbRmTvaP+F5SSvCLfwDkqbcwzuc
         C4UWN7dHfE3aB+bL5NSORLTUt7WMNzJkD1Rpf2N2xmYbzYcbB3NVXjJwqQ6fR26P6Y2F
         Zm8wqhUjyppCPgMYJogxjptD6yQVfKInMo1o7pQPcIj9CLo6qwRrvE1bMJjFUhc13rFJ
         igaMoC2QpCfWIN5mPiliWIeU2srD5ZNM19EktsEtYZuESQ5iFNuyuOrQD3G05yKklPzI
         iPaQ==
X-Forwarded-Encrypted: i=1; AL+hErEy6xrTwhPFFO8jlrcBpcBv/sUSYPDohxAMZuopuZ+FrzZDun705+tg6PO2cJ34vAPWQanN++eLEqOSUME=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BiXBtruE6FjuJ1LpX/EYB/0bUqPSnxA1GhDPpK/Mj3oNoIiKq
	Lbpq7m1uYO1gG4p1OVTl39NhOf9ATJYL/HPj90GvhCL6UunKQUnl/+rS
X-Gm-Gg: AZFdTZfpnvm3/ikLA21Xt/GNBcL96wzX8sqpRwLOqsYTPXsC+adDCyW5cEzx0Hw1o7e
	2hj/951ZTG1wWHhjV7mj0oVsfMVuBQaVYKpimkNfx1tKd5fkooaASKn1zp/gRXgPTgk1tPvL87d
	0sq+6ohjytxiVbivdusgSBWupAm/iJjyRzDKYeh5KR4329gRfSh0AubKm7g5w++Uh9Eonfe2M+D
	grDF80lZRY2NTYTX46v82Lqw5zKXJ3SrlI1DXqNHUFsQeDBa8Oxmb1UP9D+ldu6TOuns+uDrMsZ
	WBln1MQm5ioenyOmg0bAr2fRNHndV9LAVsKrMUTA1FG51upam/VkpNt/Q18OSsiN7I5SOBVKKYS
	261WFzt677UbldruYNKtRdwdlnnnOPMgFR841J084o+fEo+R7Z9zA1C1rDGZDi45QyTAkpQv/iA
	muXHrcL7pJlNwcqcwfN+z+4cXnxShRoXs2969hBGOzGGjk3tAoh22ukJ2F1ogpPQqXqfTngcAbl
	3ECtNDGY1JlQylu09h1uHtkesrn55AAtYcR7wrPnXYPxhQXV5FlXGs3VLOZK+8xoVGVjbB7CTU6
	TOaHVGywFn7txhHunF3I7p4yN01A1KiQXnhP8kd/fyie1zGaa2rkVHieUepA6VxmnSY4h0uqyHJ
	9GOO9u1xy7RZDgkBwtnHK30xCztHetVhE/2AILjqywcnTDiYEHnTo89t96Wuo34TRHuEXCCu544
	w/oHs7890Aj6u96Ive49FmcbMUcAuF/4AJ
X-Received: by 2002:a05:693c:26cb:b0:381:6297:8f99 with SMTP id 5a478bee46e88-3856e748babmr38507977eec.2.1795809804291;
        Fri, 27 Nov 2026 12:03:24 -0800 (PST)
Received: from esteban.lan ([2001:f71:5160:2b00:ae2a:b9d5:71b7:3bb9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm73453117eec.15.2026.11.27.12.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:03:23 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Anthony Garcia <TonysTracer@pm.me>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Sat, 28 Nov 2026 05:03:20 +0900
Message-ID: <20261127200320.1575145-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <9M76pTkfqTFYYV0x7QQegwNjy5ZHwG2LsiwewU-KWrCowx5tvfp2L4W6za362xj-ymlfYDci3p_aGCNp9tPMPgy-jzBu-OFHHZJaNw-1o0c=@pm.me>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com> <9M76pTkfqTFYYV0x7QQegwNjy5ZHwG2LsiwewU-KWrCowx5tvfp2L4W6za362xj-ymlfYDci3p_aGCNp9tPMPgy-jzBu-OFHHZJaNw-1o0c=@pm.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tony,

Thank you for testing on the Surface Pro 7, and for tracking down the
avdd/vdda supply mismatch.

Antoine
