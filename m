Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195901;
	b=ZE7kNE2zgy4nfVaHQh2+Ck9FuxLNmb1wEE7gdiqi0mUAPmOikxnpkT1ZsDsYuyvUKLx6
	 7hIb9rKc/FmwBmF1ED3xpVRyvQ3RdBjrdggpb+bnpT8cR8shhVOHBYeHnCNzn0RKzrWNl
	 psSRgGbgCluu8PrxBRGd+Wt4fvOdz2NO5cLk8rdqKRfYKG0PTRNsN3Gzp3JbOSe6HAWDm
	 HElQvB/cN0G/Zsx0tRYcqnccFdQuAEp3KifWxJOowjROg6GiwZrv0unk5tmT4rImciZK9
	 P4VjQXYWvmm8J6pNNH4jD/XWC21usWJOqKVNQzq2Z0BLn01pVbwVv9A6nERvwHhfimg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bxKwdrIUuzixTrlHwEraSTTfViGb7kgcBDYdj0LG20I=;
	b=nuLFmP2hXuyjp+tjNOhEOVQZIefvUEw6aNfyJqG8ibgUph+gk2lptrHL6BqRhE2Vg0NN
	 x5yKZMTB8XPgukgtYdKNYczj5AmY2FoXlAUmyoOGiLGLFYQHeU2r/DyHMtFzkotUK7OdH
	 4nLwB7vovl61VrLIsGj2+W2HhgbqKhjeatW6wLrdWK5+/K0p9dErAN9o6QtMlBov9XVgv
	 rw0XsQW5uKVq4x+mPgIhflz1RXXiXOJHdvx53aX6KNb+dtfG2oQI7P8SZFSpAycFCysYX
	 MWq2BQlp3J20ZT7n8Qn6RY0imNW2o12JMVk6MGPLqtqEJBQHcCigPdmH/VItIQjW2MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h6UztEPa;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1E1606A339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1E1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h6UztEPa
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04ad2c46dso4503435ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195900; x=1795800700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bxKwdrIUuzixTrlHwEraSTTfViGb7kgcBDYdj0LG20I=;
        b=h6UztEPas0J1ez1Yuh9unLqPaR1gDwtjlSvghhiSA9vaXNPrRi5uxF5XEJRGkESiUd
         lRKd1Wx9WDP6/GvtOIgzygcN8Ir0csDzBM47drzwYJkDExX7qaqcrGuvB5kfqo5AgVyn
         tCgkqmAja/nlGi4MFQMTlf/BWdsQwRzgAChDghUENbT+UCRDtKEo6NCCned5mLOSgJFC
         VcyluTbKGOOqYmC+NIOZqGt1fcOy4nMjdTuJCGIJsNUktotD4q7DQVgyF39jjv95aZT0
         pjjbTtCPbYJmKL+VT/Fy9v4YtXuX7drAsoAk1VQTGMiEivSpHruSjmRhsEEmpErZRVur
         fo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195900; x=1795800700;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxKwdrIUuzixTrlHwEraSTTfViGb7kgcBDYdj0LG20I=;
        b=CAfjXngT/ihsIwHjMLFc6Cv8rVI5Nhb5JnWGL6sFOF7cjfL73+9EpBhqkQXY/q4awQ
         Dq4oeA17v8VQ4fHxGfmSv3hgwqXYrjzQepSanNTxIxbo6sfPyCnlqUA5fJsHI+0mGdVS
         igHzomOn/fCeESLsvySr9xR9bulyh8aUsTtkk7UjKTxu2uTFoix3a8oJE9vLPSbLIefV
         kkSz17HWqsikwKdh//JOOwTqg7wpi357I7uA3vhfZI0cJxIL0cW9lReQnjUbkpSEvaaH
         glBHOwacTBnfCGBHda2qliOLNcj7LQ5XO3zbhUBVRFQ3VYMhrWWJPV5aTzt6tEHiznHL
         ojSg==
X-Forwarded-Encrypted: i=1; AL+hErFgUyZbSLO9nSQU2xTlKSAiE9gjGdZxTjnKM97r0KJp+23gFSlFJGs+QIpkLCXWTsiQGfvmDNBu8Yc3xOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TDo9kkAL9nCZOsrPzYTKCK3tLF/Pr2QEd6j6fJdP+vuz0fZjU
	2arXVJYV+xrk7e1pxI7lLNklRAUTDqoR3OU/Y8X8dvhpbXFSGHFft8EbCL0LmCnWHws=
X-Gm-Gg: AZFdTZcFNAYm7dJHHDw9IfJOX/M2QPWVD7EOsMJapYqLy7ts0ZExM9fSiOcA/YNH45s
	vj4AnD1Ve1C8GwmrcVqcjyHntiRDccW2Euu6ZGcMl0BWluciVIKIE4yZm7j8MZO/F5eK5Blz8Yx
	XbwQEsQMWA/nLJQYUn7ZB2RJJwesWqTvG7U9gfO/W4xtua9fKITL3uNLGA3gMoY0d4eOtzXSwea
	MO0PXTLSGZFErINynn5jHI2R9suN4P7MEFkXBmKKByWuj2f7o8xZqXx+wGokJuYlstn+/CZ+G5S
	mAWqQ4mx0npT52o6U51ydZNZb408XTXKcjc3P0Is4Kcs9SkO2CjOUcPzJv1tXLXNzR1H6C4K2jS
	rXgev0sCFwJIhRv5zl3YhsdGVBR/3RuVkxhnn9rfA+0hp/E6hArOhXuANdDy6NRUz00JRr9tC08
	DQkJylZeSLmxZ2dOc8ABOTZPz0qC2DdAaoycW4DhrwJe4IDtcVi1UjpJ4Rq1X8NtUamWBq6t5+C
	6Qfft0ALyMkrvKoudFRaYeoaCrsl9zDu/R6Wx/kLR/g/HnhWREzraX1oA5Gv9/oyjE58/FoKcIE
	reJQV/X+r5YfcBkslmwoAF1Y4TZQqyFdUnK8NTn3PBCdO6EI8aQ7MWBtTc7VOuqrA9EUhIjeY+N
	IeQRrJ12TXpPm5GnQ5txH8WROCPL2W5LoGTCy
X-Received: by 2002:a17:902:dac1:b0:2ef:f819:3aa1 with SMTP id d9443c01a7336-2f03f1f0a26mr46054785ad.56.1795195900424;
        Fri, 20 Nov 2026 09:31:40 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1482c3sm17173225ad.73.2026.11.20.09.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:31:40 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: Re: [PATCH v8 0/4] usb: gadget: f_tcm: fix infoleaks, sleep, and UAF in the BOT path
Date: Sat, 21 Nov 2026 02:31:34 +0900
Message-ID: <20261120173134.3286557-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
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

On Wed, Nov 18, 2026 at 09:40:01PM +0900, Yehyeong Lee wrote:
> Yehyeong Lee (4):
>   usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
>   usb: gadget: f_tcm: zero the CBW buffer the status path sends
>   usb: gadget: f_tcm: reject a short write data-out transfer
>   usb: gadget: f_tcm: clear the scatter list when reusing the BOT status
>     request

1/4 is in usb-linus as 69b3b657087f.  The other three are superseded by
v9:
  https://lore.kernel.org/all/20261120172829.3286180-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
