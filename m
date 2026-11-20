Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175040;
	b=R9AXkWno2JoguY3cHnQfI1oRRkM7KuxX7svsa84qU6/+puEYGG4Gyb9g5duNNy1ATj4W
	 dDLlMHWMZkweK+3qUqYNgBgU7czwzMKnMnoBqS1sQpO1meTJyZlQUmgUZAD9DwLm3aDwb
	 gJgijxpW6b4wu7qY2XWsVO+CHCRO8jb9mbKyyBoDIwOIhYzwVlyhSSoLdw95qEmrT4SPA
	 mNo4EUThO9C/wtvkpNCPB/0Q6rK+arqIvpuZAEDqOYEEuHQPtgzMoe9d99L3ECdBZmZ18
	 ynlKLHe/AhZqqPFp4R0RILb5uSNieYOWYx/AmOxiPXBFZtb+6VLhpxJaEbIA78CH7Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
	b=Y2xRsB2KN601CnmBy8qEui4gWkGY5tMlualPRqkYsvh1QUkxALBGeHU5Pe0mvvVfAjLo
	 cXZy3I6NUpbos5v8X1phJoI4EZ7M/BwzCLtixRocI7n+E8VzC+Tpc9JDm0IVtLjjO5EwP
	 xQOhSVXzM0xDIHbPSw1SWAUzC1gvj7KsuC+s8+de3RjohP/JyWG2eoiIuCo/cDk0IsAjH
	 FNdTJlZ330Og7wa1tUYdJKedaF9QA4yegcJiVVgkRtBI9TTQ+fhyTD2dWYh6NYkSj5MUS
	 pEEsu1r+d2uzPYTDm+WDX73EgQL00JeNU8he1CLQGOpWQU/r4qXY7zki57Avs0s3WBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qEtHq4QY;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B060A2615
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31B060A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qEtHq4QY
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso403229a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175039; x=1795779839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=qEtHq4QYBKeddUlud3LHKlKlbuXs8UB6TG4Vb8wQdiPtwgFNkogRw72UYHUhxfAaou
         TaAuolbyaM8/7kAu0+ks4pOA6CG66/dgynvH90EKRuBsEWFrCHMwIiuAR9uOyH/o/W+M
         DVQ0MQjigtPd0SGmQn8yZpEJ+kCBZMBEK3uKV+/eU1UDt8zBX26nkmKFFHGFCrldFrVN
         U+yEna70seAivGA1i/13zwh0VYuu2sTGsJSLDmmUKkxDxbqMU++6hCMJXVkcGwlm3REV
         WtYtv/X7/S8F8nplDwL1+BE60y66VtbXQGLcIH0F82qS+ixBDE+ydd3GZrAWhYu/AwG1
         PKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175039; x=1795779839;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=Z2N13zrg+e/fYw6e7DG+JPA5BGdr7guJKAUsIaByo5kCEBQrL9dMXUbpGg6tMEqzSR
         4Ngv/+8B48rkwXfXwa2x6WEeH9dLdCNlnXKcellYHs3JTx3suHj6yWy9zDr4JsXracdt
         ErGGYE08n0zcf/4ws+9aYEOrzwM6LAlLS0/RkBgBesemhmh7gLRUVE5xL8PkItoHKMSl
         agJ4PdDRUqMc6hRSpJu5IoPwqvNvGwhY891M9cNWKZvCuXwXnrYTF9SLJF0uQ8GMZZ8J
         NhIYMtIamRdi0HmPbRn/ckAnHQwlQn2UlsEdDefBhAxySmr8B7JlVj1wJQaz26xPVZ/w
         rtXA==
X-Forwarded-Encrypted: i=1; AL+hErHU+Apk+cLJTBYECgL5AwKcRs2pwjAm1ewhm+V5AM+SeLSoLEFhULf1AJkFcCOOf6x6HdGYHf6WYK1EBrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZSnpLRKtACpO5Lk01vXrpFnxLrVF8oKW3IAJ7fZPka430q0uB
	tsAaSPw6plE3D0b6PlhlAwuVX9iG8eM4UFa3TUQbx9OoIo518r6z46Q5OA+faNWbJ7Q=
X-Gm-Gg: AZFdTZdcdmPBfNQYaCdCvLDtSwofeCObDNi0P1bO8dm6mUSr6wDCTQCyifiicASjbcX
	YpJ6YXLI0knv8UejCt7Y4ECg7s3PdMfcs3vhh1B59hPEbE6kzLoeFfk0ftD3wfyLE9R9jSUuVfG
	R5eX3UAW30w1KcYe8HtxMo9FTLmHQ3bouRugG3xbTG8jSrMxydEl3Ue9HHC+RPM2+HPMs+aRinY
	BmR05Nvjyyylcd5Z368jB2MDLvoiu6LOOeID1mG4eZRtRXwru3mbryP6Wy0Xz17Jo+wsrB87Exk
	GE8OKpsMeFAOSDV1mOOOFPHNiTqce+ANIDonAN9qZbrZCf04txPqESmJtGP8LMUWAMey/pxPtgO
	lzh7qReEDp80+RgvborTOg/dPRmFQpI/F4wfJ8bSpA3afZSs2nM0qPJ/AKLuowrCVaQbI7DRkz5
	nzBveAqWwau1YZhBiIFR2RAw3Yu49GDjBn2uj73YvqtTPc0Lwzz/zKdQkdJ07pJFR4/pmZ2Efj4
	mJqUijuy96e8jJfkBPdPgaKX4HRkdPdy/rp3NaQNGekVU/2Qet02BWokc4729mDNSGAnz/tbqOV
	4nc13rtL/GzxC6EbebKlTn0ODQmqA/2GVNlxOtiNaVgZNYIYa5AySxRDDqxZcUkc9z0BU61IKPs
	wKlcWkfZlKezxJOCIPNFdkEeb5eytbVu+JfytJA==
X-Received: by 2002:a17:90b:4ccb:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b41c7b67femr2721462a91.3.1795175039135;
        Fri, 20 Nov 2026 03:43:59 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d2253d0sm1846124a91.3.2026.11.20.03.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:58 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] scsi: mvumi: bound the values the firmware supplies
Date: Fri, 20 Nov 2026 20:43:54 +0900
Message-ID: <20261120114354.3072420-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
References: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
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
